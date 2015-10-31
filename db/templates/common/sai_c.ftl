[#ftl]
/**
  ******************************************************************************
  * File Name          : ${name}.c
  * Date               : ${date}
  * Description        : This file provides code for the configuration
  *                      of the ${name} instances.
  ******************************************************************************
  *
  * COPYRIGHT(c) ${year} STMicroelectronics
  *
  * Redistribution and use in source and binary forms, with or without modification,
  * are permitted provided that the following conditions are met:
  *   1. Redistributions of source code must retain the above copyright notice,
  *      this list of conditions and the following disclaimer.
  *   2. Redistributions in binary form must reproduce the above copyright notice,
  *      this list of conditions and the following disclaimer in the documentation
  *      and/or other materials provided with the distribution.
  *   3. Neither the name of STMicroelectronics nor the names of its contributors
  *      may be used to endorse or promote products derived from this software
  *      without specific prior written permission.
  *
  * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
  * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
  * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
  * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
  * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  *
  ******************************************************************************
  */
[#list IPdatas as IP]  
[#assign ipvar = IP]
/* Includes ------------------------------------------------------------------*/
#include "${name}.h"
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

[#if useGpio]
#include "gpio.h"
[/#if]
[#if useDma]
#include "DMA.h"
[/#if]
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
      [#if dmaconfig.dmaHandel?size > 1] [#-- if more than one dma handler--]
#t#t/* Several peripheral DMA handle pointers point to the same DMA handle.
#t#t   Be aware that there is only one stream to perform all the requested DMAs. */
                            [#list dmaconfig.dmaHandel as dmaH]
#t#t__HAL_LINKDMA(${instHandler},${dmaH},hdma_${dmaconfig.dmaRequestName?lower_case});
                            [/#list]
                        [#else] [#-- if one dma handler--]
#t#t__HAL_LINKDMA(${instHandler},[#if dmaconfig.dmaHandel??]${dmaconfig.dmaHandel}[#else]hdma${prefix}[/#if],hdma_${dmaconfig.dmaRequestName?lower_case});#n
                        [/#if]   [#-- if more than one dma handler--]        [/#list] [#-- list dmaService as dmaconfig --]
[/#if]
[#if serviceName=="dmaB" && dmaServiceB??]
 [#assign instanceIndex =""]
    [#list dmaServiceB as dmaconfig] 
     [@common.generateConfigModelCode configModel=dmaconfig inst=ipName  nTab=tabN index=""/]
        [#assign dmaCurrentRequest = dmaconfig.dmaRequestName?lower_case]
        [#assign prefixList = dmaCurrentRequest?split("_")]
        [#list prefixList as p][#assign prefix= p][/#list]
        
       [#if dmaconfig.dmaHandel?size > 1] [#-- if more than one dma handler--]
#t#t/* Several peripheral DMA handle pointers point to the same DMA handle.
#t#t   Be aware that there is only one stream to perform all the requested DMAs. */
                            [#list dmaconfig.dmaHandel as dmaH]
#t#t__HAL_LINKDMA(${instHandler},${dmaH},hdma_${dmaconfig.dmaRequestName?lower_case});
                            [/#list]
                        [#else] [#-- if one dma handler--]
#t#t__HAL_LINKDMA(${instHandler},[#if dmaconfig.dmaHandel??]${dmaconfig.dmaHandel}[#else]hdma${prefix}[/#if],hdma_${dmaconfig.dmaRequestName?lower_case});#n
                        [/#if]   [#-- if more than one dma handler--]           [/#list] [#-- list dmaService as dmaconfig --]
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
[#if gpioExistA]
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
[#if dmaconfig.dmaHandel?size > 1] [#-- if more than one dma handler--]
                            [#list dmaconfig.dmaHandel as dmaH]
[#compress]                              #t#tHAL_DMA_DeInit(${instHandler}->${dmaH});[/#compress]
                            [/#list]
                        [#else] [#-- if one dma handler--]
[#compress]                            #t#tHAL_DMA_DeInit(${instHandler}->${ipdmahandler});[/#compress]
                        [/#if]   [#-- if more than one dma handler--]        [/#list] [#-- list dmaService as dmaconfig --]
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
[#if dmaconfig.dmaHandel?size > 1] [#-- if more than one dma handler--]
                            [#list dmaconfig.dmaHandel as dmaH]
[#compress]                              #t#tHAL_DMA_DeInit(${instHandler}->${dmaH});[/#compress]
                            [/#list]
                        [#else] [#-- if one dma handler--]
[#compress]                            #t#tHAL_DMA_DeInit(${instHandler}->${ipdmahandler});[/#compress]
                        [/#if]   [#-- if more than one dma handler--]    [/#list] [#-- list dmaService as dmaconfig --]
[/#if][#--if service.dmaB??--]
[/#if]
[/#if]
#t#t}
[/#if]
    [#if serviceType=="Init"]     
        [#if nvicExist]
            [#if initService.nvic??&&initService.nvic?size>0]#n#t#t/* Peripheral interrupt init*/
                [#list initService.nvic as initVector]
                    #t#tHAL_NVIC_SetPriority(${initVector.vector}, ${initVector.preemptionPriority}, ${initVector.subPriority});
                    #t#tHAL_NVIC_EnableIRQ(${initVector.vector});
                [/#list]
            [/#if]
        [/#if]
    [#else] [#-- else serviceType = DeInit --]
            [#if initService.nvic??]
                [#list initService.nvic as initVector]
                    #t#tHAL_NVIC_DisableIRQ(${initVector.vector});
                [/#list]
            [/#if]
       [/#if]
[/#macro]
[#-- End macro add service code --]


[#assign initServicesList = {"test0":"test1"}]
[#-- Section1: Create the void mx_<IpInstance>_<HalMode>_init() function for each ip instance --]
[#compress]
[#-- Global variables --]
[#if IP.variables??]
[#list IP.variables as variable]
${variable.value} ${variable.name};
[/#list]
[#-- Add global dma Handler --]
[#list IP.configModelList as instanceData]
    [#if instanceData.dmaHandel??]
        [#list instanceData.dmaHandel as dHandle]
            ${dHandle};
        [/#list]
    [/#if]
[/#list]
[/#if]
[#-- Global variables --]#n
[#list IP.configModelList as instanceData]
     [#assign instName = instanceData.instanceName]
        [#assign halMode= instanceData.halMode]
        /* ${instName} init function */
        [#if halMode!=name]void MX_${instName}_${halMode}_Init(void)[#else]void MX_${instName}_Init(void)[/#if]
{
#n
        [#-- assign ipInstanceIndex = instName?replace(name,"")--]
        [#assign args = ""]
        [#assign listOfLocalVariables =""]
        [#assign resultList =""]
 	[#list instanceData.configs as config]
            [@common.getLocalVariable configModel1=config listOfLocalVariables=listOfLocalVariables resultList=resultList/]
            [#assign listOfLocalVariables =resultList]

        [/#list]
        [#--list instanceData.configs as config--]
            [#if instanceData.instIndex??][@common.generateConfigModelCode configModel=instanceData inst=instName  nTab=1 index=instanceData.instIndex/][#else][@common.generateConfigModelCode configModel=instanceData inst=instName  nTab=1 index=""/][/#if]
        [#--list--]
#n}
  
[/#list]
[/#compress]

[#-- Section2: Msp Init --]
[#if ipvar.initCallBacks??]
[#compress]
[#list ipvar.initCallBacks.entrySet() as entry]
[#assign instanceList = entry.value]
[#assign mode=entry.key?replace("_MspInit","")?replace("_BspInit","")?replace("HAL_","")]

[#assign ipHandler = "h" + mode?lower_case]


[#-- #nvoid HAL_${mode}_MspInit(${mode}_HandleTypeDef* h${mode?lower_case}){--] 
#nvoid ${entry.key}(${mode}_HandleTypeDef* h${mode?lower_case})
{
#n
[#-- Search for static variables Start--]
[#list instanceList as inst]

     [#assign services = getInitServiceMode(inst)]
[#if services.dma??]
     [#assign dmaService=services.dma]   
    [#if dmaService?? && dmaService?size!=0]
    [#list dmaService as dmaRequest]
        [#list dmaRequest.methods as method]	
		[#if method.status=="OK" && method.arguments??]
                    [#list method.arguments as fargument]
                        [#if fargument.genericType == "struct" && fargument.context??]
                            [#if fargument.context=="global"]
[#--tstatic ${fargument.typeName} ${fargument.name}_${dmaRequest.dmaRequestName?lower_case};--]
                            [/#if]
                        [/#if]
                    [/#list]
                [/#if]
         [/#list]

     [/#list] [#-- list dmaService as dmaRequest --]
     [/#if]   [#-- if dmaService?? && dmaService.size!=0 --]
[/#if]
[/#list]

[#assign words = instanceList]
[#-- declare Variable GPIO_InitTypeDef once --]
       [#assign v = ""]
[#list words as inst] [#-- loop on ip instances datas --] 
 [#assign services = getInitServiceMode(inst)]
 [#if services.gpioA??][#assign service=services.gpioA]
        [#list service.variables as variable] [#-- variables declaration --]
            [#if v?contains(variable.name)]
            [#-- no matches--]
            [#else]
#t${variable.value} ${variable.name};
                [#assign v = v + " "+ variable.name/]	
            [/#if]	
        [/#list]  
[#else][#if services.gpioB??][#assign service=services.gpioB]
        [#list service.variables as variable] [#-- variables declaration --]
            [#if v?contains(variable.name)]
            [#-- no matches--]
            [#else]
#t${variable.value} ${variable.name};
                [#assign v = v + " "+ variable.name/]	
            [/#if]	
        [/#list]  
[/#if][/#if]
[/#list]
[#-- --]
    [#if words[0]??]
    [@generateServiceCode ipName=words[0] serviceType="Init" modeName=mode instHandler=ipHandler tabN=2/] 
    [/#if]
}
[/#list]
[/#compress]
[/#if]
[#-- Section2:End --]


[#if ipvar.deInitCallBacks??]
[#compress]
[#list ipvar.deInitCallBacks.entrySet() as entry]
[#assign instanceList = entry.value]
[#assign mode=entry.key?replace("_MspDeInit","")?replace("_BspDeInit","")?replace("HAL_","")]
[#assign ipHandler = "h" + mode?lower_case]

#nvoid ${entry.key}(${mode}_HandleTypeDef* h${mode?lower_case})
[#assign words = instanceList]
{
#n
[#if words?size > 1] [#-- Check if there is more than one ip instance--]
 [#assign deInitService = getDeInitServiceMode(words[0])]    
[@generateServiceCode ipName=words[0] serviceType="DeInit" modeName=mode instHandler=ipHandler tabN=2/] 
#t}
  [#assign i = 0]
    [#list words as inst]
        [#if i>0]
#telse if(h${mode?lower_case}->Instance==${words[i]})
#t{    
[#@generateServiceCode ipName=words[i] serviceType="DeInit" modeName=mode instHandler=ipHandler tabN=2/] 
#t}
        [/#if]
        [#assign i = i + 1]
    [/#list]
[#else]
    [#-- only one ip instance ${instanceList}--]
[#if words[0]??]
[@generateServiceCode ipName=words[0] serviceType="DeInit" modeName=mode instHandler=ipHandler tabN=2/] 
[/#if]
}
[/#if]
[/#list]
[/#compress]
[/#if]
[#-- Section3: End --]
[/#list]


/**
  * @}
  */

/**
  * @}
  */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/