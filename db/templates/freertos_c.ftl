[#ftl]
/**
  ******************************************************************************
  * File Name          : freertos.c
  * Date               : ${date}
  * Description        : Code for freertos applications
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

[#compress]
[#assign inMain = 0]
[#assign useNewHandle = 0]

[#list SWIPdatas as SWIP]
    [#if SWIP.variables??]
    	[#list SWIP.variables as variable]	
	      [#if variable.name=="HALCompliant"]
	         [#assign inMain = 1]
	      [/#if]   
	    [/#list]
    [/#if]
[/#list]

[#list SWIPdatas as SWIP]
    [#if SWIP.defines??]     
	  [#list SWIP.defines as definition]
	    [#if definition.name=="configENABLE_BACKWARD_COMPATIBILITY"]
	      [#if definition.value=="0"]
	        [#assign useNewHandle = 1]
          [/#if]   
	    [/#if]
	  [/#list]
    [/#if]
[/#list]

/* Includes ------------------------------------------------------------------*/
#include "FreeRTOS.h"
#include "task.h"
[/#compress]

[#if inMain == 0]
[@common.optinclude name="Src/rtos_inc.tmp"/][#--include freertos includes --]
[/#if]

/* USER CODE BEGIN Includes */     

/* USER CODE END Includes */

[#compress]
/* Variables -----------------------------------------------------------------*/
[#if inMain == 0]
[@common.optinclude name="Src/rtos_vars.tmp"/]
[/#if]
#n/* USER CODE BEGIN Variables */
#n
#n/* USER CODE END Variables */
#n     
/* Function prototypes -------------------------------------------------------*/
[#if inMain == 0]
[@common.optinclude name="Src/rtos_pfp.tmp"/]
#n
 [#list SWIPdatas as SWIP]
  [#if SWIP.variables??]
	[#list SWIP.variables as variable]
	  [#if variable.name=="MiddlewareInUse"]
	  [#assign s = variable.valueList]
	  [#assign index = 0] 
        [#list s as i] 
          [#if index == 0]
            [#assign mw = i]
          [/#if]
          [#assign index = index + 1]
        [/#list]
extern void MX_${mw}_Init(void);
	  [/#if]
    [/#list]
  [/#if]
 [/#list]
void MX_FREERTOS_Init(void);  /* (MISRA C 2004 rule 8.1) */
[/#if]


#n
#n/* USER CODE BEGIN FunctionPrototypes */
#n   
#n/* USER CODE END FunctionPrototypes */
         
/* Hook prototypes */
[#list SWIPdatas as SWIP]
    [#if SWIP.defines??]
     [#list SWIP.defines as definition]
        [#if definition.name=="configGENERATE_RUN_TIME_STATS"]
          [#if definition.value=="1"]
void configureTimerForRunTimeStats(void);
unsigned long getRunTimeCounterValue(void);          
          [/#if]
        [/#if]
        [#if definition.name=="configUSE_IDLE_HOOK"]
          [#if definition.value=="1"]
void vApplicationIdleHook(void);       
          [/#if]
        [/#if]
        [#if definition.name=="configUSE_TICK_HOOK"]
          [#if definition.value=="1"]
void vApplicationTickHook(void);       
          [/#if]
        [/#if]      
        [#if definition.name=="configCHECK_FOR_STACK_OVERFLOW"]
          [#if definition.value !="0"]
            [#if useNewHandle==0]
void vApplicationStackOverflowHook(xTaskHandle xTask, signed char *pcTaskName);  
            [#else]
void vApplicationStackOverflowHook(TaskHandle_t xTask, signed char *pcTaskName); 
            [/#if]     
          [/#if]
        [/#if]
        [#if definition.name=="configUSE_MALLOC_FAILED_HOOK"]
          [#if definition.value=="1"]
void vApplicationMallocFailedHook(void);       
          [/#if]
        [/#if]             
     [/#list]
 [/#if]
[/#list]

[#list SWIPdatas as SWIP]
    [#if SWIP.defines??]     
	  [#list SWIP.defines as definition]	
	    [#if definition.name=="configGENERATE_RUN_TIME_STATS"]
	      [#if definition.value=="1"]
#n
/* USER CODE BEGIN 1 */
/* Functions needed when configGENERATE_RUN_TIME_STATS is on */
void configureTimerForRunTimeStats(void) 
{
#n    
}

#nunsigned long getRunTimeCounterValue(void) 
{
    return 0;
}  
/* USER CODE END 1 */
	      [/#if]
	    [/#if]
		    
		[#if definition.name=="configUSE_IDLE_HOOK"]
	      [#if definition.value=="1"]
#n
/* USER CODE BEGIN 2 */
void vApplicationIdleHook( void ) 
{
#t    /* vApplicationIdleHook() will only be called if configUSE_IDLE_HOOK is set
#t    to 1 in FreeRTOSConfig.h.  It will be called on each iteration of the idle
#t    task.  It is essential that code added to this hook function never attempts
#t    to block in any way (for example, call xQueueReceive() with a block time
#t    specified, or call vTaskDelay()).  If the application makes use of the
#t    vTaskDelete() API function (as this demo application does) then it is also
#t    important that vApplicationIdleHook() is permitted to return to its calling
#t    function, because it is the responsibility of the idle task to clean up
#t    memory allocated by the kernel to any task that has since been deleted. */
}
/* USER CODE END 2 */  
	      [/#if]
	    [/#if]  

	    [#if definition.name=="configUSE_TICK_HOOK"]
	      [#if definition.value=="1"]
#n/* USER CODE BEGIN 3 */
void vApplicationTickHook( void ) 
{
#t    /* This function will be called by each tick interrupt if
#t    configUSE_TICK_HOOK is set to 1 in FreeRTOSConfig.h.  User code can be
#t    added here, but the tick hook is called from an interrupt context, so
#t    code must not attempt to block, and only the interrupt safe FreeRTOS API
#t    functions can be used (those that end in FromISR()). */ 
}
 /* USER CODE END 3 */ 	      
	      [/#if]
	    [/#if]
	        
	    [#if definition.name=="configCHECK_FOR_STACK_OVERFLOW"]
	      [#if definition.value !="0"]
#n/* USER CODE BEGIN 4 */
[#if useNewHandle==0]
void vApplicationStackOverflowHook(xTaskHandle xTask, signed char *pcTaskName)
[#else]
void vApplicationStackOverflowHook(TaskHandle_t xTask, signed char *pcTaskName)
[/#if]
{
#t    /* Run time stack overflow checking is performed if
#t    configCHECK_FOR_STACK_OVERFLOW is defined to 1 or 2. This hook function is
#t    called if a stack overflow is detected. */ 
}
 /* USER CODE END 4 */ 
	      [/#if]
	    [/#if]
	    
	    [#if definition.name=="configUSE_MALLOC_FAILED_HOOK"]
	      [#if definition.value=="1"]
#n/* USER CODE BEGIN 5 */
void vApplicationMallocFailedHook(void) 
{
#t    /* vApplicationMallocFailedHook() will only be called if
#t    configUSE_MALLOC_FAILED_HOOK is set to 1 in FreeRTOSConfig.h.  It is a hook
#t    function that will get called if a call to pvPortMalloc() fails.
#t    pvPortMalloc() is called internally by the kernel whenever a task, queue,
#t    timer or semaphore is created.  It is also called by various parts of the
#t    demo application.  If heap_1.c or heap_2.c are used, then the size of the
#t    heap available to pvPortMalloc() is defined by configTOTAL_HEAP_SIZE in
#t    FreeRTOSConfig.h, and the xPortGetFreeHeapSize() API function can be used
#t    to query the size of free heap space that remains (although it does not
#t    provide information on how the remaining heap might be fragmented). */
}
/* USER CODE END 5 */
	      [/#if]
	    [/#if]
	    
	  [/#list]
	 [/#if]
[/#list]
[/#compress]

[#if inMain == 0]
#n
/* Init FreeRTOS */

void MX_FREERTOS_Init(void) {
#t/* USER CODE BEGIN Init */
#t     
#t/* USER CODE END Init */
[@common.optinclude name="Src/rtos_HalInit.tmp"/]
}
[@common.optinclude name="Src/rtos_threads.tmp"/]
[@common.optinclude name="Src/rtos_user_threads.tmp"/] 
[/#if]   

/* USER CODE BEGIN Application */
     
/* USER CODE END Application */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
