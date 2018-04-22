[#ftl]
/*******************************************************************************
*
* E M B E D D E D   W I Z A R D   P R O J E C T
*
*                                                Copyright (c) TARA Systems GmbH
*                                    written by Paul Banach and Manfred Schweyer
*
********************************************************************************
*
* This software is delivered "as is" and shows the usage of other software
* components. It is provided as an example software which is intended to be
* modified and extended according to particular requirements.
*
* TARA Systems hereby disclaims all warranties and conditions with regard to the
* software, including all implied warranties and conditions of merchantability
* and non-infringement of any third party IPR or other rights which may result
* from the use or the inability to use the software.
*
********************************************************************************
*
* DESCRIPTION:
*   This file is part of the interface (glue layer) between an Embedded Wizard
*   generated UI application and the board support package (BSP) of a dedicated
*   target.
*   This template is responsible to initialize the display hardware of the board
*   and to provide the necessary access to update the display content.
*
*******************************************************************************/

#include "${FamilyName?lower_case}xx_hal.h"

#include <string.h>

#include "ewrte.h"
#include "ewgfx.h"
#include "ewextgfx.h"
#include "ewgfxdefs.h"

#include "ew_bsp_display.h"
#include "ew_bsp_clock.h"

#if EW_USE_FREE_RTOS == 1

  #include "cmsis_os.h"

  static osSemaphoreId        LcdUpdateSemaphoreId = 0;

#endif

#define LAYER_INDEX           0

extern LTDC_HandleTypeDef            hltdc;
extern LTDC_LayerCfgTypeDef          pLayerCfg;

#if EW_USE_DOUBLE_BUFFER == 1

  static volatile uint32_t    CurrentFramebuffer = 0;
  static volatile uint32_t    PendingFramebuffer = 0;

#else

  static volatile int         CurrentLine = -1;
  static volatile int         PendingLine = -1;

#endif




/*******************************************************************************
* FUNCTION:
*   EwBspConfigDisplay
*
* DESCRIPTION:
*   Configures the display hardware.
*
* ARGUMENTS:
*   aWidth   - Width of the framebuffer in pixel.
*   aHeight  - Height of the framebuffer in pixel.
*   aAddress - Startaddress of the framebuffer.
*
* RETURN VALUE:
*   None
*
*******************************************************************************/
void EwBspConfigDisplay( int aWidth, int aHeight, void* aAddress )
{
  /* Initialize given framebuffer */
  if ( aAddress )
    memset( aAddress, 0, aWidth * aHeight * FRAME_BUFFER_DEPTH );

  #if EW_USE_FREE_RTOS == 1

    /* Create the LCD update semaphore */
    osSemaphoreDef( LcdUpdateSemaphore );
    LcdUpdateSemaphoreId = osSemaphoreCreate( osSemaphore( LcdUpdateSemaphore ), 1 );

  #endif

  #if EW_USE_FREE_RTOS == 1

    /* initially take the LcdUpdate token for the first LCD update */
    osSemaphoreWait( LcdUpdateSemaphoreId , 1000 );

  #endif
}


/*******************************************************************************
* FUNCTION:
*   EwBspWaitForDisplayCompletion
*
* DESCRIPTION:
*   The function EwBspWaitForDisplayCompletion returns as soon as the LCD update
*   has been completed.
*
* ARGUMENTS:
*   None
*
* RETURN VALUE:
*   None
*
*******************************************************************************/
#if EW_USE_DOUBLE_BUFFER == 1
static void EwBspWaitForDisplayCompletion( void )
{
  register uint32_t pendingBuffer = PendingFramebuffer;
  if ( CurrentFramebuffer == pendingBuffer )
    return;

  CPU_LOAD_SET_IDLE();

  #if EW_USE_FREE_RTOS == 1

    osSemaphoreWait( LcdUpdateSemaphoreId , 1000 );
    CurrentFramebuffer = pendingBuffer;

  #else

  while( CurrentFramebuffer != pendingBuffer )
    ;

  #endif

  CPU_LOAD_SET_ACTIVE();
}
#endif


/*******************************************************************************
* FUNCTION:
*   EwBspSyncOnDisplayLine
*
* DESCRIPTION:
*   The function EwBspSyncOnDisplayLine returns as soon as the LTDC is updating
*   the requested line number.
*
* ARGUMENTS:
*   aLine - Number of the display line to be reached by LTDC
*
* RETURN VALUE:
*   None
*
*******************************************************************************/
#if EW_USE_DOUBLE_BUFFER == 0
void EwBspSyncOnDisplayLine( int aLine )
{
  /* either take line 0 or add the vertical back porch */
  if ( aLine <= 0 )
    aLine = 0;
  else
    aLine = aLine + LtdcHandle.Init.AccumulatedVBP;

  CurrentLine = -1;
  PendingLine = aLine;

  CPU_LOAD_SET_IDLE();

  /* program line number of next field */
  HAL_LTDC_ProgramLineEvent( &hltdc, aLine );

  #if EW_USE_FREE_RTOS == 1

    osSemaphoreWait( LcdUpdateSemaphoreId , 1000 );

  #else

    while( aLine != CurrentLine )
      ;

  #endif

  CPU_LOAD_SET_ACTIVE();
}
#endif


/*******************************************************************************
* FUNCTION:
*   HAL_LTDC_LineEventCallback
*
* DESCRIPTION:
*   Interrupt service routine for V-sync.
*
* ARGUMENTS:
*   aLtdc - Specifies the pins connected EXTI line
*
* RETURN VALUE:
*   None
*
*******************************************************************************/
void HAL_LTDC_LineEventCallback( LTDC_HandleTypeDef* aLtdc )
{
#if EW_USE_DOUBLE_BUFFER == 1

  register uint32_t pendingBuffer = PendingFramebuffer;
  if ( CurrentFramebuffer != pendingBuffer )
  {
    /* change address within layer configuration structure */
    pLayerCfg.FBStartAdress = pendingBuffer;

    /* change layer configuration */
    if ( HAL_LTDC_ConfigLayer( &hltdc, &pLayerCfg, LAYER_INDEX ) != HAL_OK )
      EwPrint( "HAL_LTDC_LineEventCallback: Could not change layer configuration!\n" );

    #if EW_USE_FREE_RTOS == 1

      osSemaphoreRelease( LcdUpdateSemaphoreId );

    #else

      /* save new address */
      CurrentFramebuffer = pendingBuffer;

    #endif
  }

  /* program next V-sync */
  HAL_LTDC_ProgramLineEvent( aLtdc, 0 );

#else

  /* update current line number */
  CurrentLine = PendingLine;

  #if EW_USE_FREE_RTOS == 1

    osSemaphoreRelease( LcdUpdateSemaphoreId );

  #endif

#endif
}


/*******************************************************************************
* FUNCTION:
*   EwBspSetFramebufferAddress
*
* DESCRIPTION:
*   The function EwBspSetFramebufferAddress is called from the Graphics Engine
*   in order to change the currently active framebuffer address. If the display
*   is running in a double-buffering mode, the function is called after each
*   screen update.
*   Changing the framebuffer address should be synchronized with V-sync.
*   In case of double-buffering, the function has to wait and return after
*   the V-sync was detected.
*
* ARGUMENTS:
*   aAddress - New address of the framebuffer to be shown on the display.
*
* RETURN VALUE:
*   None
*
*******************************************************************************/
void EwBspSetFramebufferAddress( unsigned long aAddress )
{
#if EW_USE_DOUBLE_BUFFER == 1

  /* set pending framebuffer address to be used on next V-sync */
  PendingFramebuffer = (uint32_t)aAddress;

  /* now, the function has to wait until the pending back-buffer is visible -
     otherwise the currently visible frontbuffer may be overwritten with next
     scene. */
  EwBspWaitForDisplayCompletion();

#else

  /* change address within layer configuration structure */
  pLayerCfg.FBStartAdress = (uint32_t)aAddress;

  /* change layer configuration */
  if ( HAL_LTDC_ConfigLayer( &hltdc, &pLayerCfg, LAYER_INDEX ) != HAL_OK )
    EwPrint( "EwBspSetFramebufferAddress: Could not change layer configuration!\n" );

#endif
}


/*******************************************************************************
* FUNCTION:
*   EwBspSetFramebufferClut
*
* DESCRIPTION:
*   The function EwBspSetFramebufferClut is called from the Graphics Engine
*   in order to update the hardware CLUT of the current framebuffer.
*   The function is only called when the color format of the framebuffer is
*   Index8 or LumA44.
*
* ARGUMENTS:
*   aClut - Pointer to a color lookup table with 256 enries.
*
* RETURN VALUE:
*   None
*
*******************************************************************************/
void EwBspSetFramebufferClut( unsigned long* aClut )
{
  if ( HAL_LTDC_ConfigCLUT( &hltdc, (uint32_t*)aClut, 256, LAYER_INDEX ) != HAL_OK )
    EwPrint( "EwBspSetFramebufferClut: Could not configure layer CLUT!\n" );
  if ( HAL_LTDC_EnableCLUT( &hltdc, LAYER_INDEX ) != HAL_OK )
    EwPrint( "EwBspSetFramebufferClut: Could not enable layer CLUT!\n" );
}


/* msy */