[#ftl]
[#list IPdatas as IP]
[#assign ipvar = IP]
[#assign useGpio = false]
[#assign useDma = false]
[#assign useNvic = false]
[#-- extract hal mode list used by all instances of the ip --]
[#assign halModeList= ""]
[#if ipvar.ipName=="FMC"||ipvar.ipName=="FSMC"]
  [#if ipvar.variables??]
    [#list ipvar.variables as variable]
      [#if !halModeList?contains(variable.value?replace("_HandleTypeDef",""))]
        [#assign halModeList = halModeList + " " + variable.value?replace("_HandleTypeDef","")]
      [/#if]
    [/#list]
  [/#if]
[#else]
  [#list ipvar.instances.entrySet() as entry]
    [#if halModeList?contains(entry.value)]
    [#else]
      [#assign halModeList = halModeList + " " +entry.value]
    [/#if]
  [/#list]
[/#if]
[#-- End extract hal mode list used by all instances of the ip --]

[#-- Function getInitServiceMode --]
[#function getInitServiceMode(ipname1)]
  [#assign initServicesList = ""]
  [#list ipvar.configModelList as instanceData]
    [#if instanceData.instanceName==ipname1]
      [#if instanceData.initServices??]
        [#return instanceData.initServices]
      [/#if]
    [/#if]
  [/#list]
  [#return initServicesList]
[/#function]
[#-- End Function getInitServiceMode --]

[#-- Function getDeInitServiceMode --]
[#function getDeInitServiceMode(ipname2)]
  [#assign deInitServicesList = ""]
  [#list ipvar.configModelList as instanceData]
    [#if instanceData.instanceName==ipname2]
      [#if instanceData.deInitServices??]
        [#return instanceData.deInitServices]
      [/#if]
    [/#if]
  [/#list]
  [#return deInitServicesList]
[/#function]
[#-- End Function getDeInitServiceMode --]

[#-- macro getLocalVariable of a config Start--]
[#macro getLocalVariable configModel1 listOfLocalVariables resultList]
[#--/* getLocalVariable ${configModel1.name} "${listOfLocalVariables}" "${resultList}" */--]
  [#if configModel1.methods??] 
    [#assign methodList1 = configModel1.methods]
  [#else]
    [#assign methodList1 = configModel1.libMethod]
  [/#if]
  [#assign myListOfLocalVariables = listOfLocalVariables]
  [#list methodList1 as method][#-- list methodList1 --]
    [#list method.arguments as argument][#-- list method.arguments --]
      [#if argument.genericType == "struct"][#-- if struct --]
        [#if argument.context??][#-- if argument.context?? --]
          [#if argument.context!="global"&&argument.status!="WARNING"] [#-- if !global --]
            [#assign ll= myListOfLocalVariables?split(" ")]
            [#assign exist=false]
            [#list ll as var]
              [#if var==argument.name]
                [#assign exist=true]
              [/#if]
            [/#list]
            [#if !exist]  [#-- if exist --]
              [#if argument.status!="NULL"]
                    #t${argument.typeName} ${argument.name};
                [#if myListOfLocalVariables != ""]
                  [#assign myListOfLocalVariables = myListOfLocalVariables + " " + argument.name]
                [#else]
                  [#assign myListOfLocalVariables = argument.name]
                [/#if]
                [#assign resultList = myListOfLocalVariables]
                [#--/* myListOfLocalVariables="${myListOfLocalVariables}" */--]
              [/#if]
            [/#if][#-- if exist --]
          [/#if][#-- if global --]
        [#else][#-- if context?? --]
          [#if argument.status!="NULL"]
                #t${argument.typeName} ${argument.name};
          [/#if]
        [/#if][#-- if argument.context?? --]

        [#-- Array type --]
        [#list argument.argument as subArg] [#-- list subArg --]
          [#if subArg.genericType=="Array"] [#-- if genericType == "Array" --]
                    ${subArg.typeName} ${subArg.name}[${subArg.arraySize}] ; 
          [/#if] [#-- if genericType == "Array" --]
          [#if subArg.genericType =="struct"]
            [#list subArg.argument as subArg1] [#-- list subArg1 --]
              [#if subArg1.genericType=="Array"] [#-- if genericType == "Array" --]
                           #t ${subArg1.typeName} ${subArg1.name}[${subArg1.arraySize}] ; 
              [/#if] [#-- if genericType == "Array" --]
            [/#list]
          [/#if]
        [/#list] [#-- list subArg --]
      [/#if][#-- if struct --]
    [/#list][#-- list method.arguments --]
  [/#list][#-- list methodList1 --]
[/#macro]
[#-- macro getLocalVariable of a config End--]

[#-- macro generateConfigModelCode --]
[#macro generateConfigModelCode configModel inst nTab]
  [#if configModel.methods??][#-- if the pin configuration contains a list of LibMethods--]
    [#assign methodList = configModel.methods]
  [#else]
    [#assign methodList = configModel.libMethod]
  [/#if]
  [#assign writeConfigComments=false]
  [#list methodList as method]
    [#if method.status=="OK"]
      [#assign writeConfigComments=true]
    [/#if]
  [/#list]
  [#if writeConfigComments]
    [#if configModel.comments??]#t/** ${configModel.comments}#n#t*/[/#if]
  [/#if]
  [#list methodList as method]
    [#assign args = ""]
    [#if method.status=="OK"]
      [#if method.arguments??]
        [#assign funcArgNum = 0][#--add comment before struct init--]
        [#list method.arguments as fargument]
          [#assign funcArgNum = funcArgNum+1][#--add comment before struct init--]
          [#compress]
          [#if fargument.addressOf]
            [#assign adr = "&"]
          [#else]
            [#assign adr = ""]
          [/#if]
          [/#compress]
          [#if fargument.genericType == "struct"]
            [#if (funcArgNum>1)][#if nTab==2]#t#t[#else]#t[/#if]/* ${fargument.name} */[/#if][#--add comment before struct init--]
            [#if fargument.context??]
              [#if fargument.context=="global"]
                [#if configModel.ipName=="DMA"]
                  [#assign instanceIndex = "_"+ configModel.instanceName?lower_case]
                [#else]
                  [#assign instanceIndex = inst?replace(configModel.ipName,"")]
                [/#if]
              [/#if]
            [/#if]
            [#if instanceIndex??&&fargument.context=="global"]
              [#if fargument.status!="WARNING"]
                [#assign arg = "" + adr + fargument.name + instanceIndex]
              [#else]
                [#assign arg = "NULL"]
              [/#if]
            [#elseif fargument.status=="NULL"]
              [#assign arg = "NULL"]
            [#else]
              [#assign arg = "" + adr + fargument.name]
            [/#if]
            [#if (!method.name?contains("Init")&&fargument.context=="global")]
            [#else]
              [#list fargument.argument as argument]
                [#if argument.genericType != "struct"]
                  [#if argument.mandatory]
                    [#if argument.value??]
                      [#if instanceIndex??&&fargument.context=="global"]
                        [#assign argValue=argument.value?replace("$Index",instanceIndex)]
                      [#else]
                        [#assign argValue=argument.value]
                      [/#if][#-- if global --]
                      [#if argument.genericType=="Array"][#-- if genericType=Array --]
                        [#assign valList = argument1.value?split(argument1.arraySeparator)]
                        [#assign i = 0]
                        [#list valList as val]
                          #t${argument1.name}[${i}] = ${val};
                          [#assign i = i+1]
                        [/#list]
                        [#assign argValue="&"+argument1.name]
                      [/#if] [#-- if genericType=Array --]
                      [#if argument.value!="" && argument.value!="N/A"]
                        [#if nTab==2]#t#t[#else]#t[/#if][#if instanceIndex??&&fargument.context=="global"]${fargument.name}${instanceIndex}[#else]${fargument.name}[/#if].${argument.name} = ${argValue};
                      [#else]
                        [#if nTab==2]#t#t[#else]#t[/#if]//[#if instanceIndex??&&fargument.context=="global"]${fargument.name}${instanceIndex}[#else]${fargument.name}[/#if].${argument.name} = [#if argument.value!="N/A"]${argValue}[/#if];
                      [/#if]
                    [/#if]
                  [#else] [#-- else argument.mandatory--]
                    [#if fargument.name!="GPIO_InitStruct"]
                      [#if argument.name=="Instance"][#-- if argument=Instance--]
                        [#if nTab==2]#t#t[#else]#t[/#if][#if instanceIndex??&&fargument.context=="global"]${fargument.name}${instanceIndex}[#else]${fargument.name}[/#if].${argument.name} = ${inst};
                      [#else]
                        [#if argument.status=="KO"]
                          [#if nTab==2]#t#t[#else]#t[/#if][#if instanceIndex??&&fargument.context=="global"]//${fargument.name}${instanceIndex}[#else]${fargument.name}[/#if].${argument.name} = ${argument.value};
                        [/#if]
                        [#if argument.value??]
                          [#if argument.value!="N/A"][#if nTab==2]#t#t[#else]#t[/#if][#if instanceIndex??&&fargument.context=="global"]${fargument.name}${instanceIndex}[#else]${fargument.name}[/#if].${argument.name} = ${argument.value};[/#if]
                        [/#if]
                      [/#if][#-- if argument=Instance--]
                    [/#if]
                  [/#if][#-- if argument.mandatory--]
                  
                [#else][#--if argument.genericType != "struct"--]
                  [#assign subArgNum = 0][#--add comment before struct init--]
                  [#list argument.argument as argument1]
                    [#assign subArgNum = subArgNum+1][#--add comment before struct init--]
                    [#if (subArgNum==1)][#if nTab==2]#t#t[#else]#t[/#if]/* ${fargument.name}.${argument.name} */[/#if][#--add comment before struct init--]
                    [#if argument1.value??]
                      [#assign argValue=argument1.value]
                    [#else]
                      [#assign argValue=""]
                    [/#if]
                    [#if argument1.mandatory]
                      [#if argument1.value??]
                        [#if instanceIndex??&&fargument.context=="global"]
                          [#assign argValue=argument1.value?replace("$Index",instanceIndex)]
                        [#else]
                          [#assign argValue=argument1.value]
                        [/#if]
                        [#if argument1.genericType=="Array"][#-- if genericType=Array --] 
                          [#assign valList = argument1.value?split(":")]     
                          [#assign i = 0]                                  
                          [#list valList as val] 
                                            #t${argument1.name}[${i}] = ${val};
                            [#assign i = i+1]
                          [/#list]
                          [#assign argValue="&"+argument1.name+"[0]"]
                        [/#if] [#-- if genericType=Array --]
                        [#if nTab==2]#t#t[#else]#t[/#if][#if instanceIndex??&&fargument.context=="global"]${fargument.name}${instanceIndex}[#else]${fargument.name}[/#if].${argument.name}.${argument1.name} = ${argValue};
                      [/#if]
                    [#else] [#-- !argument.mandatory --]
                      [#if argument1.status=="KO"]
                        [#if nTab==2]#t#t[#else]#t[/#if][#if instanceIndex??&&fargument.context=="global"]//${fargument.name}${instanceIndex}[#else]${fargument.name}[/#if].${argument.name}.${argument1.name} = ${argValue};
                      [/#if]
                      [#if argument1.status=="OK"]
                        [#if nTab==2]#t#t[#else]#t[/#if][#if instanceIndex??&&fargument.context=="global"]${fargument.name}${instanceIndex}[#else]${fargument.name}[/#if].${argument.name}.${argument1.name} = ${argValue};
                      [/#if]
                    [/#if][#-- if argument.mandatory --]
                                
                  [/#list]
                [/#if][#--if argument.genericType != "struct"--]
              [/#list][#-- list  fargument.argument as argument--]
            [/#if][#-- if (!method.name?contains("Init")&&fargument.context=="global")--]

          [#else][#--if fargument.genericType == "struct"--]
            [#assign arg = ""]
            [#if fargument.status=="OK" && fargument.value??]
              [#assign arg = "" + adr + fargument.value]
            [/#if]
          [/#if][#--if fargument.genericType == "struct"--]
          [#if args == "" && arg!=""]
            [#assign args = args + arg]
          [#else]
            [#if arg!=""]
              [#assign args = args + ', ' + arg]
            [/#if]
          [/#if]
        [/#list][#--list method.arguments as fargument--]
        #n[#if nTab==2]#t#t[#else]#t[/#if]${method.name}(${args});#n[#--add blank line before function call--]
		  [#else][#--if method.arguments??--]
        #n[#if nTab==2]#t#t[#else]#t[/#if]${method.name}();#n[#--add blank line before function call--]
      [/#if][#--if method.arguments??--]
    [/#if][#--if method.status=="OK"--]
    [#if method.status=="KO"]
		  [#if nTab==2]#t#t[#else]#t[/#if]//!!! ${method.name} is commented because some parameters are missing
      [#if method.arguments??]
        [#assign funcArgNum = 0][#--add comment before struct init--]
        [#list method.arguments as fargument]
          [#assign funcArgNum = funcArgNum+1][#--add comment before struct init--]
          [#if fargument.addressOf]
            [#assign adr = "&"][#else ]
            [#assign adr = ""]
          [/#if]
          [#if fargument.genericType == "struct"]
            [#if (funcArgNum>1)][#if nTab==2]#t#t[#else]#t[/#if]/* ${fargument.name} */#n[/#if][#--add comment before struct init--]
            [#assign arg = "" + adr + fargument.name]
            [#if fargument.context??]
              [#if fargument.context=="global"]
                [#if configModel.ipName=="DMA"]
                  [#assign instanceIndex = "_"+ configModel.instanceName?lower_case]
                [#else]
                  [#assign instanceIndex = inst?replace(configModel.ipName,"")]
                [/#if]
              [/#if]
            [/#if]
            [#if instanceIndex??&&fargument.context=="global"]
              [#assign arg = "" + adr + fargument.name + instanceIndex]
            [#else]
              [#assign arg = "" + adr + fargument.name]
            [/#if]
            [#if (!method.name?contains("Init")&&fargument.context=="global")]
            [#else]
              [#list fargument.argument as argument]
                [#if argument.genericType != "struct"]
                  [#if argument.mandatory && argument.value??]
                    [#if instanceIndex??&&fargument.context=="global"]
                      [#assign argValue=argument.value?replace("$Index",instanceIndex)]
                    [#else]
                      [#assign argValue=argument.value]
                    [/#if]
                    [#if nTab==2]#t#t[#else]#t[/#if]//[#if instanceIndex??&&fargument.context=="global"]${fargument.name}${instanceIndex}[#else]${fargument.name}[/#if].${argument.name} = ${argValue};
                  [#else]
                    [#if argument.name=="Instance"]
                      [#if nTab==2]#t#t[#else]#t[/#if]//[#if instanceIndex??&&fargument.context=="global"]${fargument.name}${instanceIndex}[#else]${fargument.name}[/#if].${argument.name} = ${inst};
                    [/#if]
                  [/#if]
                [#else]
                  [#assign subArgNum = 0][#--add comment before struct init--]
                  [#list argument.argument as argument1]
                    [#assign subArgNum = subArgNum+1][#--add comment before struct init--]
                    [#if (subArgNum==1)][#if nTab==2]#t#t[#else]#t[/#if]/* ${fargument.name}.${argument.name} */[/#if][#--add comment before struct init--]
                    [#if argument1.mandatory]
                      [#if instanceIndex??&&fargument.context=="global"]
                        [#assign argValue=argument1.value?replace("$Index",instanceIndex)]
                      [#else][#assign argValue=argument1.value]
                      [/#if]
                      [#if nTab==2]#t#t[#else]#t[/#if]//[#if instanceIndex??&&fargument.context=="global"]${fargument.name}${instanceIndex}[#else]${fargument.name}[/#if].${argument.name}.${argument1.name} = ${argValue};
                    [/#if]
                  [/#list]
                [/#if]
              [/#list]
            [/#if]
          [#else]
            [#assign arg = "" + adr + fargument.value]
          [/#if]
          [#if args == ""]
            [#assign args = args + arg ]
          [#else]
            [#assign args = args + ', ' + arg]
          [/#if]
        [/#list]
        #n[#if nTab==2]#t#t[#else]#t[/#if]//${method.name}(${args});#n[#--add blank line before function call--]
      [#else]
        #n[#if nTab==2]#t#t[#else]#t[/#if]${method.name}();#n[#--add blank line before function call--]
      [/#if]
    [/#if][#--if method.status=="KO"--]
  [/#list][#--list methodList as method--]

  [#assign instanceIndex = ""]
  [#-- else there is no LibMethod to call--]
[/#macro]
[#-- End macro generateConfigModelCode --]

[#-- macro generateConfigCode --]
[#macro generateConfigCode ipName type serviceName instHandler tabN]
  [#if type=="Init"]
    [#assign service = getInitServiceMode(ipName)]
  [#else]
    [#assign service = getDeInitServiceMode(ipName)]
  [/#if]
  [#if serviceName=="gpio"]
    [#if service.gpio??]
      [#assign gpioService = service.gpio]
    [#else]
      [#assign gpioService = ""]
    [/#if]
  [/#if]
  [#if serviceName=="dma" && service.dma??]
    [#assign dmaService = service.dma]
  [/#if]
   
  [#if serviceName=="gpio"]
    [#assign instanceIndex =""]
    [@generateConfigModelCode configModel=gpioService inst=ipName nTab=tabN/]
  [/#if]
  [#if serviceName=="dma" && dmaService??]
    [#assign instanceIndex =""]
    [#list dmaService as dmaconfig] 
      [@generateConfigModelCode configModel=dmaconfig inst=ipName  nTab=tabN/]
      [#assign dmaCurrentRequest = dmaconfig.instanceName?lower_case]
      [#assign prefixList = dmaCurrentRequest?split("_")]
      [#list prefixList as p]
        [#assign prefix= p]
      [/#list]
        
#t__HAL_LINKDMA(${instHandler},[#if dmaconfig.dmaHandel??]${dmaconfig.dmaHandel}[#else]hdma${prefix}[/#if],hdma_${dmaconfig.instanceName?lower_case});#n
    [/#list] [#-- list dmaService as dmaconfig --]
  [/#if]
[/#macro]
[#-- End macro generateConfigCode --]
[#-- function: getHalMode(ipInstanceName) --]
[#function getHalMode ipname]
  [#list ipvar.instances.entrySet() as entry]
    [#if entry.key==ipname]
            ${entry.value}
    [/#if]
    [#return entry.value]
  [/#list]
[/#function]
[#-- End function: getHalMode(ipInstanceName) --]

[#-- function: getDmaHandler(currentipname) --]
[#function getDmaHandler currentipname]
  [#assign result=""]
  [#list ipvar.configModelList as instanceData]
    [#if instanceData.instanceName==currentipname]
      [#if instanceData.dmaHandel??]
        [#assign result=instanceData.dmaHandel]
      [/#if]
    [/#if]
  [/#list] 
  [#return result]   
[/#function]
[#-- End function: getDmaHandler(currentipname) --]

[#-- macro generate service code for MspInit/MspDeInit Start--]
[#macro generateServiceCode ipName serviceType modeName instHandler tabN]
  [#if serviceType=="Init"]
    [#assign initService = getInitServiceMode(ipName)]
  [#else]
    [#assign initService = getDeInitServiceMode(ipName)]
  [/#if]
  [#assign gpioExist = false]
  [#assign dmaExist = false]
  [#assign nvicExist = false]
  [#if initService?? && initService.entrySet??]
    [#list initService.entrySet() as entry]
      [#if entry.key=="dma"]
        [#assign dmaExist = true]
      [/#if]
      [#if entry.key=="nvic"]
        [#assign nvicExist = true]
      [/#if]
      [#if entry.key=="gpio"]
        [#assign gpioExist = true]
      [/#if]            
    [/#list]
  [/#if]    
    #t/* Peripheral clock enable */
  [#if serviceType=="Init"] 
    [#if initService.clock??]
      [#list initService.clock?split(';') as clock]
        #t#${clock}(); 
      [/#list]
    [#else]
         #t__${ipName}_CLK_ENABLE();
    [/#if]
  [#else]           
         #t__${ipName}_CLK_DISABLE();   
  [/#if]
  [#if gpioExist]
#t[@generateConfigCode ipName=ipName type=serviceType serviceName="gpio" instHandler=instHandler tabN=tabN/]
  [/#if]
  [#if serviceType=="Init"]
    [#if dmaExist]#n#t#t/* Peripheral DMA init*/
#t[@generateConfigCode ipName=ipName type=serviceType serviceName="dma" instHandler=instHandler tabN=tabN/]
    [/#if]
    [#if nvicExist]
        [#if initService.nvic??]
            [#assign irqNum = 0]
            [#list initService.nvic as initVector]
                [#assign irqNum = irqNum+1]
                [#if irqNum==1]#t/* Peripheral interrupt Init */[/#if]
                [#-- #t#t/* Sets the priority grouping field */ To be done later--]
                [#-- #t#tHAL_NVIC_SetPriorityGrouping(${initVector.group});  To be done later--]
                #tHAL_NVIC_SetPriority(${initVector.vector}, ${initVector.preemptionPriority}, ${initVector.subPriority});
                #tHAL_NVIC_EnableIRQ(${initVector.vector});
            [/#list]
        [/#if]
    [/#if]
  [#else] [#-- else serviceType = DeInit --]
    [#if dmaExist]#n#t#t/* Peripheral DMA DeInit */
    
      [#assign service = getInitServiceMode(ipName)]
      [#assign dmaservice =service.dma]
      [#if dmaservice??]
        [#list dmaservice as dmaconfig]
          [#assign dmaCurrentRequest = dmaconfig.instanceName?lower_case]
          [#assign prefixList = dmaCurrentRequest?split("_")]
          [#list prefixList as p][#assign prefix= p][/#list]
          [#assign ipdmahandler1 = "hdma" + prefix]
          [#-- [#if getDmaHandler(ipName)!=""][#assign ipdmahandler = getDmaHandler(ipName)][#else][#assign ipdmahandler = ipdmahandler1][/#if]--]
          [#if dmaconfig.dmaHandel??]
            [#assign ipdmahandler = dmaconfig.dmaHandel]
          [#else]
            [#assign ipdmahandler = ipdmahandler1]
          [/#if]
        #t   #tHAL_DMA_DeInit(${instHandler}->${ipdmahandler});
        [/#list] [#-- list dmaService as dmaconfig --]
      [/#if]

    [/#if] [#-- if DMA exist --]
    [#-- DeInit NVIC if DeInit --]
    [#if nvicExist]
          [#if initService.nvic??]
              [#assign irqNum = 0]
              [#list initService.nvic as initVector]
                  [#assign irqNum = irqNum+1]
                  [#if irqNum==1]#t/* Peripheral interrupt DeInit */[/#if]
                  #tHAL_NVIC_DisableIRQ(${initVector.vector});
              [/#list]
          [/#if]
    [/#if]
  [/#if]
[/#macro]
[#-- End macro add service code --]


[#-- Section1: Create the void MX_<IpInstance>_<HalMode>_init() function for each ip instance --]
[#compress]
[#list IP.configModelList as instanceData]
  [#assign instName = instanceData.instanceName]
  [#assign halMode= instanceData.halMode]
/* ${instName} initialization function */
  [#if ipvar.ipName=="FMC"||ipvar.ipName=="FSMC"]
void MX_${instName}_Init(void)
  [#else]
    [#if halMode!=name]void MX_${instName}_${halMode}_Init(void)[#else]void MX_${instName}_Init(void)[/#if]
  [/#if]
{
  [#assign args = ""]
  [#assign listOfLocalVariables=""]
  [#assign resultList=""]
 	[#list instanceData.configs as config]
    [@getLocalVariable configModel1=config listOfLocalVariables=listOfLocalVariables resultList=resultList/]
    [#assign listOfLocalVariables=resultList]
  [/#list]
  [#if listOfLocalVariables!=""]#n[/#if]
  [#list instanceData.configs as config]
    [@generateConfigModelCode configModel=config inst=instName nTab=1/]
  [/#list]
}
[/#list]
[/#compress]
[/#list]