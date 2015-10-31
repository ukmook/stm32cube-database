[#ftl]
[#list IPdatas as IP]  
[#assign ipvar = IP]
[#assign useGpio = false]
[#assign useDma = false]
[#assign useNvic = false]


[#-- extract hal mode list used by all instances of the ip --]
[#assign halModeList= ""]
[#list ipvar.instances.entrySet() as entry]
        [#if halModeList?contains(entry.value)]
        [#else]
            [#assign halModeList = halModeList + " " +entry.value]
        [/#if]
[/#list]
[#-- End extract hal mode list used by all instances of the ip --]

[#-- Define includes --]
[#list IP.configModelList as instanceData]
[#if instanceData.initServices??]
    [#if instanceData.initServices.gpioA?? || instanceData.initServices.gpioB??]
        [#assign useGpio = true]
    [/#if]
    [#if instanceData.initServices.dmaA??||instanceData.initServices.dmaB??]
        [#assign useDma = true]
    [/#if]
    [#if instanceData.initServices.nvicA??||instanceData.initServices.nvicB??]
        [#assign useNvic = true]
    [/#if]
  [/#if]
[/#list]
[#-- End Define includes --]

[#-- Function getInitServiceMode --]
[#function getInitServiceMode(ipname1)]
    [#-- assign initServicesList = {"test0":"test1"}--]
    [#assign initServicesList = ""]
    [#list ipvar.configModelList as instanceData]
        [#if instanceData.instanceName==ipname1]
            [#assign initServicesList = {"test0":"test1"}]
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
    [#-- assign initServicesList = {"test0":"test1"}--]
    [#assign deInitServicesList = ""]
    [#list ipvar.configModelList as instanceData]
        [#if instanceData.instanceName==ipname2]
            [#assign deInitServicesList = {"test0":"test1"}]
            [#if instanceData.deInitServices??]
                [#return instanceData.deInitServices]
            [/#if]
        [/#if]
    [/#list]
   [#return deInitServicesList]
[/#function]
[#-- End Function getDeInitServiceMode --]

[#-- macro generateConfigCode --]
[#macro generateConfigCode ipName type serviceName instHandler tabN]
[#if type=="Init"]
 [#assign service = getInitServiceMode(ipName)]
[#else]
 [#assign service = getDeInitServiceMode(ipName)]
[/#if]
[#if serviceName=="gpioA"]
    [#if service.gpioA??][#assign gpioServiceA = service.gpioA][#else][#assign gpioServiceA = ""][/#if]
[/#if]
[#if serviceName=="gpioB"]
    [#if service.gpioB??][#assign gpioServiceB = service.gpioB][#else][#assign gpioServiceB = ""][/#if]
[/#if]

[#if serviceName=="dmaA" && service.dmaA??]
[#assign dmaServiceA = service.dmaA]
[/#if]
[#if serviceName=="dmaB" && service.dmaB??]
[#assign dmaServiceB = service.dmaB]
[/#if]   
[#if serviceName=="gpioA"]
 [#assign instanceIndex =""]
    [@common.generateConfigModelCode configModel=gpioServiceA inst=ipName nTab=tabN index=""/]
[/#if]
[#if serviceName=="gpioB"]
 [#assign instanceIndex =""]
    [@common.generateConfigModelCode configModel=gpioServiceB inst=ipName nTab=tabN index=""/]
[/#if]
[#if serviceName=="dmaA" && dmaServiceA??]
 [#assign instanceIndex =""]
    [#list dmaServiceA as dmaconfig] 
     [@common.generateConfigModelCode configModel=dmaconfig inst=ipName  nTab=tabN index=""/]
        [#assign dmaCurrentRequest = dmaconfig.dmaRequestName?lower_case]
        [#assign prefixList = dmaCurrentRequest?split("_")]
        [#list prefixList as p][#assign prefix= p][/#list]
        
#t__HAL_LINKDMA(${instHandler},[#if dmaconfig.dmaHandel??]${dmaconfig.dmaHandel}[#else]hdma${prefix}[/#if],hdma_${dmaconfig.dmaRequestName?lower_case});#n
    [/#list] [#-- list dmaService as dmaconfig --]
[/#if]
[#if serviceName=="dmaB" && dmaServiceB??]
 [#assign instanceIndex =""]
    [#list dmaServiceB as dmaconfig] 
     [@common.generateConfigModelCode configModel=dmaconfig inst=ipName  nTab=tabN index=""/]
        [#assign dmaCurrentRequest = dmaconfig.dmaRequestName?lower_case]
        [#assign prefixList = dmaCurrentRequest?split("_")]
        [#list prefixList as p][#assign prefix= p][/#list]
        
#t__HAL_LINKDMA(${instHandler},[#if dmaconfig.dmaHandel??]${dmaconfig.dmaHandel}[#else]hdma${prefix}[/#if],hdma_${dmaconfig.dmaRequestName?lower_case});#n
    [/#list] [#-- list dmaService as dmaconfig --]
[/#if]
[/#macro]
[#-- End macro generateConfigCode --]

/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

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
            [#if instanceData.dmaHandel??] [#assign result=instanceData.dmaHandel][/#if]
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
[#assign gpioExistA = false]
        [#assign dmaExistA = false]
        [#assign nvicExistA = false]
[#assign gpioExistB = false]
        [#assign dmaExistB = false]
        [#assign nvicExistB = false]
        [#if initService?? && initService.entrySet??]
        [#list initService.entrySet() as entry]
            [#if entry.key=="dma"]
            [#assign dmaExist = true]
            [/#if]
            [#if entry.key=="dmaA"]
            [#assign dmaExistA = true]
            [/#if]
            [#if entry.key=="dmaB"]
            [#assign dmaExistB = true]
            [/#if]
            [#if entry.key=="nvic"]
            [#assign nvicExist = true]
            [/#if]
[#if entry.key=="nvicA"]
            [#assign nvicExistA = true]
            [/#if]
[#if entry.key=="nvicB"]
            [#assign nvicExistB = true]
            [/#if]
            [#if entry.key=="gpioA"]
            [#assign gpioExistA = true]
            [/#if]
            [#if entry.key=="gpioB"]
            [#assign gpioExistB = true]
            [/#if]            
        [/#list]
        [/#if]    
    
    [#if serviceType=="Init"] #t#t/* Peripheral clock enable */
           [#if initService.clock??]
            [#list initService.clock?split(';') as clock]
               #t#t ${clock}(); 
            [/#list]
            [#else]
         #t#t__${ipName}_CLK_ENABLE();
           [/#if]
    [#else]           
        [#if (gpioExistA?? && !gpioExistB??)||(!gpioExistA?? && gpioExistB??)]#t#t/* Peripheral clock disable */ #n #t#t__${ipName}_CLK_DISABLE(); [#--  we should not disable the SAI clock if there are 2 blocks--] [/#if]
    [/#if]
    [#if gpioExistA??]
#t#tif(hsai->Instance==SAI1_Block_A)
#t#t{
#t#t[@generateConfigCode ipName=ipName type=serviceType serviceName="gpioA" instHandler=instHandler tabN=tabN/]

[#if dmaExistA &&  serviceType=="Init"]#n#t#t/* Peripheral DMA init*/
#t#t[@generateConfigCode ipName=ipName type=serviceType serviceName="dmaA" instHandler=instHandler tabN=tabN/]
[#else]
    [#if dmaExistA]
        [#assign service = getInitServiceMode(ipName)]
        [#assign dmaserviceA =service.dmaA]
        [#list dmaserviceA as dmaconfig]
            [#assign dmaCurrentRequest = dmaconfig.dmaRequestName?lower_case]
            [#assign prefixList = dmaCurrentRequest?split("_")]
            [#list prefixList as p][#assign prefix= p][/#list]
            [#assign ipdmahandler1 = "hdma" + prefix]
             [#-- [#if getDmaHandler(ipName)!=""][#assign ipdmahandler = getDmaHandler(ipName)][#else][#assign ipdmahandler = ipdmahandler1][/#if]--]
               [#if dmaconfig.dmaHandel??][#assign ipdmahandler = dmaconfig.dmaHandel][#else][#assign ipdmahandler = ipdmahandler1][/#if]
            #t#tHAL_DMA_DeInit(${instHandler}->${ipdmahandler});
        [/#list] [#-- list dmaService as dmaconfig --]
    [/#if]
 [/#if]
#t#t}	
[/#if]
[#if gpioExistB]
#t#tif(hsai->Instance==SAI1_Block_B)
#t#t{
#t#t[@generateConfigCode ipName=ipName type=serviceType serviceName="gpioB" instHandler=instHandler tabN=tabN/]	
[#if dmaExistB?? && serviceType=="Init"]#n#t#t/* Peripheral DMA init*/
#t#t[@generateConfigCode ipName=ipName type=serviceType serviceName="dmaB" instHandler=instHandler tabN=tabN/]
[#else]
[#if dmaExistB]
[#assign service = getInitServiceMode(ipName)]
[#if service.dmaB??]
    [#assign dmaserviceB =service.dmaB]
    [#list dmaserviceB as dmaconfig]
        [#assign dmaCurrentRequest = dmaconfig.dmaRequestName?lower_case]
        [#assign prefixList = dmaCurrentRequest?split("_")]
        [#list prefixList as p][#assign prefix= p][/#list]
        [#assign ipdmahandler1 = "hdma" + prefix]
         [#-- [#if getDmaHandler(ipName)!=""][#assign ipdmahandler = getDmaHandler(ipName)][#else][#assign ipdmahandler = ipdmahandler1][/#if]--]
           [#if dmaconfig.dmaHandel??][#assign ipdmahandler = dmaconfig.dmaHandel][#else][#assign ipdmahandler = ipdmahandler1][/#if]
#t#t#tHAL_DMA_DeInit(${instHandler}->${ipdmahandler});
    [/#list] [#-- list dmaService as dmaconfig --]
[/#if][#--if service.dmaB??--]
[/#if]
[/#if]
#t#t}
[/#if]
    [#if serviceType=="Init"]     
        [#if nvicExist]#n#t#t/* Peripheral interrupt init*/
            [#if initService.nvic??]
                [#list initService.nvic as initVector]
                    [#-- #t#t/* Sets the priority grouping field */ To be done later--]
                    [#-- #t#tHAL_NVIC_SetPriorityGrouping(${initVector.group});  To be done later--]
                    [#-- #t#tHAL_NVIC_SetPriority(${initVector.vector}, ${initVector.vector}, ${initVector.vector}, ${initVector.vector});--]
                    #t#tHAL_NVIC_EnableIRQ(${initVector.vector});
                [/#list]
            [/#if]
        [/#if]
    [#else] [#-- else serviceType = DeInit --]
            [#if initService.nvic??]
                [#list initService.nvic as initVector]
                    [#-- #t#t/* Sets the priority grouping field */ To be done later--]
                    [#-- #t#tHAL_NVIC_SetPriorityGrouping(${initVector.group});  To be done later--]
                    [#-- #t#tHAL_NVIC_SetPriority(${initVector.vector}, ${initVector.vector}, ${initVector.vector}, ${initVector.vector});--]
                    #t#tHAL_NVIC_DisableIRQ(${initVector.vector});
                [/#list]
            [/#if]
       [/#if]
[/#macro]
[#-- End macro add service code --]


[#assign initServicesList = {"test0":"test1"}]
[#-- Section1: Create the void mx_<IpInstance>_<HalMode>_init() function for each ip instance --]
[#compress]
[#list IP.configModelList as instanceData]
     [#assign instName = instanceData.instanceName]
        [#assign halMode= instanceData.halMode]
        /* ${instName} init function */
        [#if halMode!=name]void MX_${instName}_${halMode}_Init(void)[#else]void MX_${instName}_Init(void)[/#if]
{
        [#-- assign ipInstanceIndex = instName?replace(name,"")--]
        [#assign args = ""]
        [#assign listOfLocalVariables =""]
        [#assign resultList =""]
 	[#list instanceData.configs as config]
            [@common.getLocalVariable configModel1=config listOfLocalVariables=listOfLocalVariables resultList=resultList/]
            [#assign listOfLocalVariables =resultList]

        [/#list]
        [#list instanceData.configs as config]
            [#if instanceData.instIndex??][@common.generateConfigModelCode configModel=config inst=instName  nTab=1 index=instanceData.instIndex/][#else][@common.generateConfigModelCode configModel=config inst=instName  nTab=1 index=""/][/#if]
        [/#list]
#n}
  
[/#list]
[/#compress]
[/#list]