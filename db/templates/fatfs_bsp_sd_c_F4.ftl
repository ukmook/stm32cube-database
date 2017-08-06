[#ftl]
/**
 ******************************************************************************
  * @file    bsp_driver_sd.c for F4 (based on stm324x9i_eval_sd.c)
  * @brief   This file includes a generic uSD card driver.
  ******************************************************************************
[@common.optinclude name="Src/license.tmp"/][#--include License text --]
  ******************************************************************************
  */
[#if SWIPdatas??]
[#list SWIPdatas as SWIP]  
[#if SWIP.defines??]
 [#list SWIP.defines as definition] 
  [#if definition.name="SD_MODE"]                 
   [#if definition.value="1"]
    [#assign bits=1]
   [/#if]
   [#if definition.value="4"]
#define BUS_4BITS 1
    [#assign bits=4]
   [/#if]
  [/#if]
 [/#list]
[/#if]
[/#list]
[/#if]
/* USER CODE BEGIN 0 */
/* Includes ------------------------------------------------------------------*/
#include "bsp_driver_sd.h"

/* Extern variables ---------------------------------------------------------*/ 
  
extern SD_HandleTypeDef hsd;
extern HAL_SD_CardInfoTypedef SDCardInfo; 


/**
  * @brief  Initializes the SD card device.
  * @retval SD status
  */
uint8_t BSP_SD_Init(void)
{
  uint8_t sd_state = MSD_OK;
  /* Check if the SD card is plugged in the slot */
  if (BSP_SD_IsDetected() != SD_PRESENT)
  {
    return MSD_ERROR;
  }
  /* HAL SD initialization */
  sd_state = HAL_SD_Init(&hsd, &SDCardInfo);
#ifdef BUS_4BITS
  /* Configure SD Bus width */
  if (sd_state == MSD_OK)
  {
    /* Enable wide operation */
    if (HAL_SD_WideBusOperation_Config(&hsd, SDIO_BUS_WIDE_4B) != SD_OK)
    {
      sd_state = MSD_ERROR;
    }
    else
    {
      sd_state = MSD_OK;
    }
  }
#endif
  return sd_state;
}


/**
  * @brief  Configures Interrupt mode for SD detection pin.
  * @retval Returns 0 in success otherwise 1. 
  */
uint8_t BSP_SD_ITConfig(void)
{  
  /* TBI: add user code here depending on the hardware configuration used */
  
  return (uint8_t)0;
}

/** @brief  SD detect IT treatment
  */
void BSP_SD_DetectIT(void)
{
  /* TBI: add user code here depending on the hardware configuration used */
}


/** @brief  SD detect IT detection callback
  */
__weak void BSP_SD_DetectCallback(void)
{
  /* NOTE: This function Should not be modified, when the callback is needed,
     the BSP_SD_DetectCallback could be implemented in the user file
  */ 
}

/**
  * @brief  Reads block(s) from a specified address in an SD card, in polling mode.
  * @param  pData: Pointer to the buffer that will contain the data to transmit
  * @param  ReadAddr: Address from where data is to be read  
  * @param  BlockSize: SD card data block size, that should be 512
  * @param  NumOfBlocks: Number of SD blocks to read 
  * @retval SD status
  */
uint8_t BSP_SD_ReadBlocks(uint32_t *pData, uint64_t ReadAddr, uint32_t BlockSize, uint32_t NumOfBlocks)
{
  uint8_t sd_state;
  if(HAL_SD_ReadBlocks(&hsd, pData, ReadAddr, BlockSize, NumOfBlocks) != SD_OK)
  {
    sd_state = MSD_ERROR;
  }
  else
  {
    sd_state = MSD_OK;
  }
  return sd_state;  
}

/**
  * @brief  Writes block(s) to a specified address in an SD card, in polling mode. 
  * @param  pData: Pointer to the buffer that will contain the data to transmit
  * @param  WriteAddr: Address from where data is to be written  
  * @param  BlockSize: SD card data block size, that should be 512
  * @param  NumOfBlocks: Number of SD blocks to write
  * @retval SD status
  */
uint8_t BSP_SD_WriteBlocks(uint32_t *pData, uint64_t WriteAddr, uint32_t BlockSize, uint32_t NumOfBlocks)
{
  uint8_t sd_state;
  if(HAL_SD_WriteBlocks(&hsd, pData, WriteAddr, BlockSize, NumOfBlocks) != SD_OK)  
  {
    sd_state = MSD_ERROR;
  }
  else
  {
    sd_state = MSD_OK;
  }
  return sd_state;  
}

/**
  * @brief  Reads block(s) from a specified address in an SD card, in DMA mode.
  * @param  pData: Pointer to the buffer that will contain the data to transmit
  * @param  ReadAddr: Address from where data is to be read  
  * @param  BlockSize: SD card data block size, that should be 512
  * @param  NumOfBlocks: Number of SD blocks to read 
  * @retval SD status
  */
uint8_t BSP_SD_ReadBlocks_DMA(uint32_t *pData, uint64_t ReadAddr, uint32_t BlockSize, uint32_t NumOfBlocks)
{
  uint8_t sd_state = MSD_OK;
  
  /* Read block(s) in DMA transfer mode */
  if(HAL_SD_ReadBlocks_DMA(&hsd, pData, ReadAddr, BlockSize, NumOfBlocks) != SD_OK)  
  {
    sd_state = MSD_ERROR;
  }
  
  /* Wait until transfer is complete */
  if(sd_state == MSD_OK)
  {
    if(HAL_SD_CheckReadOperation(&hsd, (uint32_t)SD_DATATIMEOUT) != SD_OK)  
    {
      sd_state = MSD_ERROR;
    }
    else
    {
      sd_state = MSD_OK;
    }
  }
  
  return sd_state; 
}

/**
  * @brief  Writes block(s) to a specified address in an SD card, in DMA mode.
  * @param  pData: Pointer to the buffer that will contain the data to transmit
  * @param  WriteAddr: Address from where data is to be written  
  * @param  BlockSize: SD card data block size, that should be 512
  * @param  NumOfBlocks: Number of SD blocks to write 
  * @retval SD status
  */
uint8_t BSP_SD_WriteBlocks_DMA(uint32_t *pData, uint64_t WriteAddr, uint32_t BlockSize, uint32_t NumOfBlocks)
{
  uint8_t sd_state = MSD_OK;
  
  /* Write block(s) in DMA transfer mode */
  if(HAL_SD_WriteBlocks_DMA(&hsd, pData, WriteAddr, BlockSize, NumOfBlocks) != SD_OK)  
  {
    sd_state = MSD_ERROR;
  }
  
  /* Wait until transfer is complete */
  if(sd_state == MSD_OK)
  {
    if(HAL_SD_CheckWriteOperation(&hsd, (uint32_t)SD_DATATIMEOUT) != SD_OK)  
    {
      sd_state = MSD_ERROR;
    }
    else
    {
      sd_state = MSD_OK;
    }
  }
  
  return sd_state; 
}

/**
  * @brief  Erases the specified memory area of the given SD card. 
  * @param  StartAddr: Start byte address
  * @param  EndAddr: End byte address
  * @retval SD status
  */
uint8_t BSP_SD_Erase(uint64_t StartAddr, uint64_t EndAddr)
{
  uint8_t sd_state;
  if(HAL_SD_Erase(&hsd, StartAddr, EndAddr) != SD_OK)  
  {
    sd_state = MSD_ERROR;
  }
  else
  {
    sd_state = MSD_OK;
  }
  return sd_state;
}

/**
  * @brief  Handles SD card interrupt request.
  */
void BSP_SD_IRQHandler(void)
{
  HAL_SD_IRQHandler(&hsd);
}

/**
  * @brief  Handles SD DMA Tx transfer interrupt request.
  */
void BSP_SD_DMA_Tx_IRQHandler(void)
{
  HAL_DMA_IRQHandler(hsd.hdmatx); 
}

/**
  * @brief  Handles SD DMA Rx transfer interrupt request.
  */
void BSP_SD_DMA_Rx_IRQHandler(void)
{
  HAL_DMA_IRQHandler(hsd.hdmarx);
}

/**
  * @brief  Gets the current SD card data status.
  * @retval Data transfer state.
  *          This value can be one of the following values:
  *            @arg  SD_TRANSFER_OK: No data transfer is acting
  *            @arg  SD_TRANSFER_BUSY: Data transfer is acting
  *            @arg  SD_TRANSFER_ERROR: Data transfer error 
  */
HAL_SD_TransferStateTypedef BSP_SD_GetStatus(void)
{
  return(HAL_SD_GetStatus(&hsd));
}

/**
  * @brief  Get SD information about specific SD card.
  * @param  CardInfo: Pointer to HAL_SD_CardInfoTypedef structure
  */
void BSP_SD_GetCardInfo(HAL_SD_CardInfoTypedef* CardInfo)
{
  /* Get SD card Information */
  HAL_SD_Get_CardInfo(&hsd, CardInfo);
}
/* USER CODE END 0 */

/**
 * @brief  Detects if SD card is correctly plugged in the memory slot or not.
 * @retval Returns if SD is detected or not
 */
uint8_t BSP_SD_IsDetected(void)
{
  __IO uint8_t status = SD_PRESENT;

  [#if Platform??]
  if (BSP_PlatformIsDetected() == 0x0) {
    status = SD_NOT_PRESENT;
  }
  [#else]
  /* USER CODE BEGIN 1 */
  /* user code can be inserted here */
  /* USER CODE END 1 */    	
  [/#if]

  return status;
}

/* USER CODE BEGIN AdditionalCode */
/* user code can be inserted here */
/* USER CODE END AdditionalCode */


/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
