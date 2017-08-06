[#ftl]
/**
 ******************************************************************************
  * @file    user_diskio.c
  * @brief   This file includes a diskio driver skeleton to be completed by the user.
  ******************************************************************************
[@common.optinclude name="Src/license.tmp"/][#--include License text --]
  ******************************************************************************
  */

#ifdef USE_OBSOLETE_USER_CODE_SECTION_0
/* 
 * Warning: the user section 0 is no more in use (starting from CubeMx version 4.16.0)
 * To be suppressed in the future. 
 * Kept to ensure backward compatibility with previous CubeMx versions when 
 * migrating projects. 
 * User code previously added there should be copied in the new user sections before 
 * the section contents can be deleted.
 */
/* USER CODE BEGIN 0 */
/* USER CODE END 0 */
#endif

[#-- SWIPdatas is a list of SWIPconfigModel --]  
[#list SWIPdatas as SWIP]  
[#assign NEW_DISKIO_API = "0"]
 [#if SWIP.defines??]
	[#list SWIP.defines as definition]	
      [#if definition.name=="NEW_DISKIO_API"]
	      [#assign NEW_DISKIO_API = definition.value]
	  [/#if]
	[/#list]
 [/#if]
[/#list]  

/* USER CODE BEGIN DECL */

/* Includes ------------------------------------------------------------------*/
#include <string.h>
#include "ff_gen_drv.h"

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/


/* Private variables ---------------------------------------------------------*/
/* Disk status */
static volatile DSTATUS Stat = STA_NOINIT;

/* USER CODE END DECL */

/* Private function prototypes -----------------------------------------------*/
[#if NEW_DISKIO_API=="2"]         [#-- Aligned with R0.11 --]  
DSTATUS USER_initialize (BYTE pdrv);
DSTATUS USER_status (BYTE pdrv);
DRESULT USER_read (BYTE pdrv, BYTE *buff, DWORD sector, UINT count);
#if _USE_WRITE == 1
  DRESULT USER_write (BYTE pdrv, const BYTE *buff, DWORD sector, UINT count);  
#endif /* _USE_WRITE == 1 */
#if _USE_IOCTL == 1
  DRESULT USER_ioctl (BYTE pdrv, BYTE cmd, void *buff);
#endif /* _USE_IOCTL == 1 */
[/#if]

[#if NEW_DISKIO_API=="1"]         [#-- Aligned with R0.10b --]  
DSTATUS USER_initialize (void);
DSTATUS USER_status (void);
DRESULT USER_read (BYTE*, DWORD, UINT);
#if _USE_WRITE == 1
  DRESULT USER_write (const BYTE*, DWORD, UINT);
#endif /* _USE_WRITE == 1 */
#if _USE_IOCTL == 1
  DRESULT USER_ioctl (BYTE, void*);
#endif /* _USE_IOCTL == 1 */
[/#if]

[#if NEW_DISKIO_API=="0"]         [#-- Aligned with R0.10 --]  
DSTATUS USER_initialize (void);
DSTATUS USER_status (void);
DRESULT USER_read (BYTE*, DWORD, BYTE);
#if _USE_WRITE == 1
  DRESULT USER_write (const BYTE*, DWORD, BYTE);
#endif /* _USE_WRITE == 1 */
#if _USE_IOCTL == 1
  DRESULT USER_ioctl (BYTE, void*);
#endif /* _USE_IOCTL == 1 */
[/#if]
 
Diskio_drvTypeDef  USER_Driver =
{
  USER_initialize,
  USER_status,
  USER_read, 
#if  _USE_WRITE
  USER_write,
#endif  /* _USE_WRITE == 1 */  
#if  _USE_IOCTL == 1
  USER_ioctl,
#endif /* _USE_IOCTL == 1 */
};

/* Private functions ---------------------------------------------------------*/

[#if NEW_DISKIO_API=="2"]         [#-- Aligned with R0.11 --]
/**
  * @brief  Initializes a Drive
  * @param  pdrv: Physical drive number (0..)
  * @retval DSTATUS: Operation status
  */
DSTATUS USER_initialize (
	BYTE pdrv           /* Physical drive nmuber to identify the drive */
)
[#else]
/**
  * @brief  Initializes a Drive
  * @param  None
  * @retval DSTATUS: Operation status
  */
DSTATUS USER_initialize(void)
[/#if]
{
  /* USER CODE BEGIN INIT */
    Stat = STA_NOINIT;
    return Stat;
  /* USER CODE END INIT */
}


[#if NEW_DISKIO_API=="2"]         [#-- Aligned with R0.11 --]  
/**
  * @brief  Gets Disk Status 
  * @param  pdrv: Physical drive number (0..)
  * @retval DSTATUS: Operation status
  */
DSTATUS USER_status (
	BYTE pdrv       /* Physical drive nmuber to identify the drive */
)
[#else]
/**
  * @brief  Gets Disk Status
  * @param  None
  * @retval DSTATUS: Operation status
  */
DSTATUS USER_status(void)
[/#if]
{
  /* USER CODE BEGIN STATUS */
    Stat = STA_NOINIT;
    return Stat;
  /* USER CODE END STATUS */
}


[#if NEW_DISKIO_API=="2"]
/**
  * @brief  Reads Sector(s) 
  * @param  pdrv: Physical drive number (0..)
  * @param  *buff: Data buffer to store read data
  * @param  sector: Sector address (LBA)
  * @param  count: Number of sectors to read (1..128)
  * @retval DRESULT: Operation result
  */
DRESULT USER_read (
	BYTE pdrv,      /* Physical drive nmuber to identify the drive */
	BYTE *buff,     /* Data buffer to store read data */
	DWORD sector,   /* Sector address in LBA */
	UINT count      /* Number of sectors to read */
)
[/#if]
[#if NEW_DISKIO_API=="1"]
/**
  * @brief  Reads Sector(s)
  * @param  *buff: Data buffer to store read data
  * @param  sector: Sector address (LBA)
  * @param  count: Number of sectors to read (1..128)
  * @retval DRESULT: Operation result
  */
DRESULT USER_read(BYTE *buff, DWORD sector, UINT count)
[/#if]
[#if NEW_DISKIO_API=="0"]
/**
  * @brief  Reads Sector(s)
  * @param  *buff: Data buffer to store read data
  * @param  sector: Sector address (LBA)
  * @param  count: Number of sectors to read (1..128)
  * @retval DRESULT: Operation result
  */
DRESULT USER_read(BYTE *buff, DWORD sector, BYTE count)
[/#if]
{
  /* USER CODE BEGIN READ */
    return RES_OK;
  /* USER CODE END READ */
}


[#if NEW_DISKIO_API=="2"]
/**
  * @brief  Writes Sector(s)  
  * @param  pdrv: Physical drive number (0..)
  * @param  *buff: Data to be written
  * @param  sector: Sector address (LBA)
  * @param  count: Number of sectors to write (1..128)
  * @retval DRESULT: Operation result
  */
#if _USE_WRITE == 1
DRESULT USER_write (
	BYTE pdrv,          /* Physical drive nmuber to identify the drive */
	const BYTE *buff,   /* Data to be written */
	DWORD sector,       /* Sector address in LBA */
	UINT count          /* Number of sectors to write */
)
[/#if]
[#if NEW_DISKIO_API=="1"]
/**
  * @brief  Writes Sector(s)
  * @param  *buff: Data to be written
  * @param  sector: Sector address (LBA)
  * @param  count: Number of sectors to write (1..128)
  * @retval DRESULT: Operation result
  */
#if _USE_WRITE == 1
DRESULT USER_write(const BYTE *buff, DWORD sector, UINT count)
[/#if]
[#if NEW_DISKIO_API=="0"]
/**
  * @brief  Writes Sector(s)
  * @param  *buff: Data to be written
  * @param  sector: Sector address (LBA)
  * @param  count: Number of sectors to write (1..128)
  * @retval DRESULT: Operation result
  */
#if _USE_WRITE == 1
DRESULT USER_write(const BYTE *buff, DWORD sector, BYTE count)
[/#if]
{ 
  /* USER CODE BEGIN WRITE */
  /* USER CODE HERE */
    return RES_OK;
  /* USER CODE END WRITE */
}
#endif /* _USE_WRITE == 1 */

[#if NEW_DISKIO_API=="2"]
/**
  * @brief  I/O control operation  
  * @param  pdrv: Physical drive number (0..)
  * @param  cmd: Control code
  * @param  *buff: Buffer to send/receive control data
  * @retval DRESULT: Operation result
  */
#if _USE_IOCTL == 1
DRESULT USER_ioctl (
	BYTE pdrv,      /* Physical drive nmuber (0..) */
	BYTE cmd,       /* Control code */
	void *buff      /* Buffer to send/receive control data */
)
[#else]
/**
  * @brief  I/O control operation
  * @param  cmd: Control code
  * @param  *buff: Buffer to send/receive control data
  * @retval DRESULT: Operation result
  */
#if _USE_IOCTL == 1
DRESULT USER_ioctl(BYTE cmd, void *buff)
[/#if]
{
  /* USER CODE BEGIN IOCTL */
    DRESULT res = RES_ERROR;
    return res;
  /* USER CODE END IOCTL */
}
#endif /* _USE_IOCTL == 1 */



/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/