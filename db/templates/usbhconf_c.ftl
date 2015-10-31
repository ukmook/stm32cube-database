[#ftl]
/**
  ******************************************************************************
  * @file            : ${name}
  * @date            : ${date} 
  * @version         : ${version}
 [#-- * @packageVersion  : ${fwVersion} --]
  * @brief           : This file implements the board support package for the USB host library
  ******************************************************************************
  * COPYRIGHT(c) ${year} STMicroelectronics
  *
  * Redistribution and use in source and binary forms, with or without modification,
  * are permitted provided that the following conditions are met:
  * 1. Redistributions of source code must retain the above copyright notice,
  * this list of conditions and the following disclaimer.
  * 2. Redistributions in binary form must reproduce the above copyright notice,
  * this list of conditions and the following disclaimer in the documentation
  * and/or other materials provided with the distribution.
  * 3. Neither the name of STMicroelectronics nor the names of its contributors
  * may be used to endorse or promote products derived from this software
  * without specific prior written permission.
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
/* Includes ------------------------------------------------------------------*/
[#if SWIncludes??]
[#list SWIncludes as include]
#include "${include}"
[/#list]
[/#if]
#include "usbh_core.h"
[#assign handleNameFS = ""]
[#assign handleNameHS = ""]
[#assign instanceNb = 0]
[#assign includeMspDone = 0] 

[#list SWIPdatas as SWIP]  
[#compress]
[#-- Section2: Create global Variables for each middle ware instance --] 
[#-- Global variables --]
[#if SWIP.variables??]
	[#list SWIP.variables as variable]
		[#-- extern ${variable.type} --][#if variable.value??][#--${variable.value}; --]
		[#if variable.value?contains("FS")][#assign handleNameFS = "FS"][/#if]
		[#if variable.value?contains("HS")][#assign handleNameHS = "HS"][/#if]
		[/#if]
	[/#list]
[/#if]
[#-- Global variables --]
[/#compress]
[/#list]

[#if handleNameFS == "FS"]
[#include "Src/usb_otg_fs_vars.tmp"]
[/#if]
[#if handleNameHS == "HS"]
[#include "Src/usb_otg_hs_vars.tmp"]
[/#if]

/*******************************************************************************
                       LL Driver Callbacks (HCD -> USB Host Library)
*******************************************************************************/
/* MSP Init */
[#if handleNameFS == "FS"]
[#if includeMspDone == 0]
[#assign includeMspDone = 1]
[#include "Src/usb_otg_fs_Msp.tmp"]
[/#if]
[/#if]
[#if handleNameHS == "HS"]
[#if includeMspDone == 0]
[#assign includeMspDone = 1]
[#include "Src/usb_otg_hs_Msp.tmp"]
[/#if]
[/#if]

/**
  * @brief  SOF callback.
  * @param  hhcd: HCD handle
  * @retval None
  */
void HAL_HCD_SOF_Callback(HCD_HandleTypeDef *hhcd)
{
#tUSBH_LL_IncTimer (hhcd->pData);
}

/**
  * @brief  SOF callback.
  * @param  hhcd: HCD handle
  * @retval None
  */
void HAL_HCD_Connect_Callback(HCD_HandleTypeDef *hhcd)
{
#tUSBH_LL_Connect(hhcd->pData);
}

/**
  * @brief  SOF callback.
  * @param  hhcd: HCD handle
  * @retval None
  */
void HAL_HCD_Disconnect_Callback(HCD_HandleTypeDef *hhcd)
{
#tUSBH_LL_Disconnect(hhcd->pData);
} 


/**
  * @brief  Notify URB state change callback.
  * @param  hhcd: HCD handle
  * @retval None
  */
void HAL_HCD_HC_NotifyURBChange_Callback(HCD_HandleTypeDef *hhcd, uint8_t chnum, HCD_URBStateTypeDef urb_state)
{
#t/* To be used with OS to sync URB state with the global state machine */
#if (USBH_USE_OS == 1)   
#tUSBH_LL_NotifyURBChange(hhcd->pData);
#endif 
}
/*******************************************************************************
                       LL Driver Interface (USB Host Library --> HCD)
*******************************************************************************/
/**
  * @brief  USBH_LL_Init 
  *         Initialize the HOST portion of the driver.
  * @param  phost: Selected device
  * @param  base_address: OTG base address
  * @retval Status
  */
USBH_StatusTypeDef  USBH_LL_Init (USBH_HandleTypeDef *phost)
{
#t/* Init USB_IP */
[#if handleNameFS == "FS"]
#tif (phost->id == HOST_FS) {
[#include "Src/usb_otg_fs_HalInit.tmp"]
#t/* Link The driver to the stack */
#thhcd_USB_OTG_FS.pData = phost;
#tphost->pData = &hhcd_USB_OTG_FS;
#tUSBH_LL_SetTimer (phost, HAL_HCD_GetCurrentFrame(&hhcd_USB_OTG_FS));
#t}
[/#if]
[#if handleNameHS == "HS"]
#tif (phost->id == HOST_HS) {
[#include "Src/usb_otg_hs_HalInit.tmp"]
#t/* Link The driver to the stack */
#thhcd_USB_OTG_HS.pData = phost;
#tphost->pData = &hhcd_USB_OTG_HS;
#tUSBH_LL_SetTimer (phost, HAL_HCD_GetCurrentFrame(&hhcd_USB_OTG_HS));
#t}
[/#if]  
  return USBH_OK;
}

/**
  * @brief   
  * @param  
  * @param  
  * @retval Status
  */
USBH_StatusTypeDef  USBH_LL_DeInit (USBH_HandleTypeDef *phost)
{
  HAL_HCD_DeInit(phost->pData);
  return USBH_OK; 
}

/**
  * @brief   
  * @param  
  * @param  
  * @retval Status
  */
USBH_StatusTypeDef  USBH_LL_Start(USBH_HandleTypeDef *phost)
{
  HAL_HCD_Start(phost->pData);
  return USBH_OK; 
}

/**
  * @brief   
  * @param  
  * @param  
  * @retval Status
  */
USBH_StatusTypeDef  USBH_LL_Stop (USBH_HandleTypeDef *phost)
{
  HAL_HCD_Stop(phost->pData);
  return USBH_OK; 
}

/**
  * @brief   
  * @param  
  * @param  
  * @retval Status
  */
USBH_SpeedTypeDef USBH_LL_GetSpeed  (USBH_HandleTypeDef *phost)
{
  USBH_SpeedTypeDef speed = USBH_SPEED_FULL;
    
  switch (HAL_HCD_GetCurrentSpeed(phost->pData))
  {
  case 0 : 
    speed = USBH_SPEED_HIGH;
    break;
    
  case 1 : 
    speed = USBH_SPEED_FULL;    
    break;
    
  case 2 : 
    speed = USBH_SPEED_LOW;    
    break;
	
  default:  
   speed = USBH_SPEED_FULL;    
    break;  
  }
  return  speed;
}

/**
  * @brief   
  * @param  
  * @param  
  * @retval Status
  */
USBH_StatusTypeDef USBH_LL_ResetPort (USBH_HandleTypeDef *phost) 
{
  HAL_HCD_ResetPort(phost->pData);
  return USBH_OK; 
}

/**
  * @brief   
  * @param  
  * @param  
  * @retval Status
  */
uint32_t USBH_LL_GetLastXferSize  (USBH_HandleTypeDef *phost, uint8_t pipe)  
{
  return HAL_HCD_HC_GetXferCount(phost->pData, pipe);
}

/**
  * @brief   
  * @param  
  * @param  
  * @retval Status
  */
USBH_StatusTypeDef   USBH_LL_OpenPipe    (USBH_HandleTypeDef *phost, 
                                      uint8_t pipe_num,
                                      uint8_t epnum,                                      
                                      uint8_t dev_address,
                                      uint8_t speed,
                                      uint8_t ep_type,
                                      uint16_t mps)
{
  HAL_HCD_HC_Init(phost->pData,
                  pipe_num,
                  epnum,
                  dev_address,
                  speed,
                  ep_type,
                  mps);
  return USBH_OK; 
}

/**
  * @brief   
  * @param  
  * @param  
  * @retval Status
  */
USBH_StatusTypeDef   USBH_LL_ClosePipe   (USBH_HandleTypeDef *phost, uint8_t pipe)   
{
  HAL_HCD_HC_Halt(phost->pData, pipe);
  return USBH_OK; 
}

/**
  * @brief   
  * @param  
  * @param  
  * @retval Status
  */

USBH_StatusTypeDef   USBH_LL_SubmitURB  (USBH_HandleTypeDef *phost, 
                                            uint8_t pipe, 
                                            uint8_t direction ,
                                            uint8_t ep_type,  
                                            uint8_t token, 
                                            uint8_t* pbuff, 
                                            uint16_t length,
                                            uint8_t do_ping ) 
{
  HAL_HCD_HC_SubmitRequest (phost->pData,
                            pipe, 
                            direction ,
                            ep_type,  
                            token, 
                            pbuff, 
                            length,
                            do_ping);
  return USBH_OK;   
}

/**
  * @brief   
  * @param  
  * @param  
  * @retval Status
  */
USBH_URBStateTypeDef  USBH_LL_GetURBState (USBH_HandleTypeDef *phost, uint8_t pipe) 
{
  return (USBH_URBStateTypeDef)HAL_HCD_HC_GetURBState (phost->pData, pipe);
}

/**
  * @brief   
  * @param  
  * @param  
  * @retval Status
  */
USBH_StatusTypeDef  USBH_LL_DriverVBUS (USBH_HandleTypeDef *phost, uint8_t state)
{ 
 /* USER CODE BEGIN 0 */ 
 /* USER CODE END 0 */
  if(state == 0)
  {
    /* Drive high Charge pump */
    /* USER CODE BEGIN 1 */ 
    /* ToDo: Add IOE driver control */
    /* USER CODE END 1 */ 
  }
  else
  {
    /* Drive low Charge pump */
    /* USER CODE BEGIN 2 */
    /* ToDo: Add IOE driver control */
    /* USER CODE END 2 */
  }

  HAL_Delay(200);
  return USBH_OK;  
}

/**
  * @brief  USBH_LL_SetToggle 
  *         Initialize the HOST portion of the driver.
  * @param  phost: Selected device
  * @param  base_address: OTG base address
  * @retval Status
  */
USBH_StatusTypeDef   USBH_LL_SetToggle   (USBH_HandleTypeDef *phost, uint8_t pipe, uint8_t toggle)   
{
  HCD_HandleTypeDef *pHandle;
  pHandle = phost->pData;
  
  if(pHandle->hc[pipe].ep_is_in)
  {
    pHandle->hc[pipe].toggle_in = toggle;
  }
  else
  {
    pHandle->hc[pipe].toggle_out = toggle;
  }
  
  return USBH_OK; 
}

/**
  * @brief  USBH_LL_GetToggle 
  *         Initialize the HOST portion of the driver.
  * @param  phost: Selected device
  * @param  base_address: OTG base address
  * @retval Status
  */
uint8_t  USBH_LL_GetToggle   (USBH_HandleTypeDef *phost, uint8_t pipe)   
{
  uint8_t toggle = 0;
  HCD_HandleTypeDef *pHandle;
  pHandle = phost->pData; 
  
  if(pHandle->hc[pipe].ep_is_in)
  {
    toggle = pHandle->hc[pipe].toggle_in;
  }
  else
  {
    toggle = pHandle->hc[pipe].toggle_out;
  }
  return toggle; 
}

/**
  * @brief   
  * @param  
  * @param  
  * @retval Status
  */
void  USBH_Delay (uint32_t Delay)
{
  HAL_Delay(Delay);  
}
/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/