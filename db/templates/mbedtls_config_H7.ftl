[#ftl]
/** 
  *
  *  Portions COPYRIGHT 2017 STMicroelectronics
  *  Copyright (C) 2006-2015, ARM Limited, All Rights Reserved
  *
  ******************************************************************************
  * @file    mbedTLS/SSL_Client/Inc/mbedtls_config.h
  * @author  MCD Application Team
  * @version V1.0.0RC3
  * @date    17-April-2017
  * @brief   the mbedtls custom config header file.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; COPYRIGHT(c) 2017 STMicroelectronics</center></h2>
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
#ifndef MBEDTLS_CONFIG_H
#define MBEDTLS_CONFIG_H

#if defined(_MSC_VER) && !defined(_CRT_SECURE_NO_DEPRECATE)
#define _CRT_SECURE_NO_DEPRECATE 1
#endif

/**
 * \name SECTION: System support
 *
 * This section sets system specific settings.
 * \{
 */

/**
 * \def MBEDTLS_HAVE_ASM
 *
 * The compiler has support for asm().
 *
 * Requires support for asm() in compiler.
 *
 * Used in:
 *      library/timing.c
 *      library/padlock.c
 *      include/mbedtls/bn_mul.h
 *
 * Comment to disable the use of assembly code.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_HAVE_ASM"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_HAVE_ASM
				[#else]
					[#lt]#define MBEDTLS_HAVE_ASM
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_HAVE_SSE2
 *
 * CPU supports SSE2 instruction set.
 *
 * Uncomment if the CPU supports SSE2 (IA-32 specific).
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_HAVE_SSE2"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_HAVE_SSE2
				[#else]
					[#lt]#define MBEDTLS_HAVE_SSE2
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_HAVE_TIME
 *
 * System has time.h and time().
 * The time does not need to be correct, only time differences are used,
 * by contrast with MBEDTLS_HAVE_TIME_DATE
 *
 * Defining MBEDTLS_HAVE_TIME allows you to specify MBEDTLS_PLATFORM_TIME_ALT,
 * MBEDTLS_PLATFORM_TIME_MACRO, MBEDTLS_PLATFORM_TIME_TYPE_MACRO and
 * MBEDTLS_PLATFORM_STD_TIME.
 *
 * Comment if your system does not support time functions
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_HAVE_TIME"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_HAVE_TIME
				[#else]
					[#lt]#define MBEDTLS_HAVE_TIME
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_HAVE_TIME_DATE
 *
 * System has time.h and time(), gmtime() and the clock is correct.
 * The time needs to be correct (not necesarily very accurate, but at least
 * the date should be correct). This is used to verify the validity period of
 * X.509 certificates.
 *
 * Comment if your system does not have a correct clock.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_HAVE_TIME_DATE"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_HAVE_TIME_DATE
				[#else]
					[#lt]#define MBEDTLS_HAVE_TIME_DATE
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_PLATFORM_MEMORY
 *
 * Enable the memory allocation layer.
 *
 * By default mbed TLS uses the system-provided calloc() and free().
 * This allows different allocators (self-implemented or provided) to be
 * provided to the platform abstraction layer.
 *
 * Enabling MBEDTLS_PLATFORM_MEMORY without the
 * MBEDTLS_PLATFORM_{FREE,CALLOC}_MACROs will provide
 * "mbedtls_platform_set_calloc_free()" allowing you to set an alternative calloc() and
 * free() function pointer at runtime.
 *
 * Enabling MBEDTLS_PLATFORM_MEMORY and specifying
 * MBEDTLS_PLATFORM_{CALLOC,FREE}_MACROs will allow you to specify the
 * alternate function at compile time.
 *
 * Requires: MBEDTLS_PLATFORM_C
 *
 * Enable this layer to allow use of alternative memory allocators.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_PLATFORM_MEMORY"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_PLATFORM_MEMORY
				[#else]
					[#lt]#define MBEDTLS_PLATFORM_MEMORY
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_PLATFORM_NO_STD_FUNCTIONS
 *
 * Do not assign standard functions in the platform layer (e.g. calloc() to
 * MBEDTLS_PLATFORM_STD_CALLOC and printf() to MBEDTLS_PLATFORM_STD_PRINTF)
 *
 * This makes sure there are no linking errors on platforms that do not support
 * these functions. You will HAVE to provide alternatives, either at runtime
 * via the platform_set_xxx() functions or at compile time by setting
 * the MBEDTLS_PLATFORM_STD_XXX defines, or enabling a
 * MBEDTLS_PLATFORM_XXX_MACRO.
 *
 * Requires: MBEDTLS_PLATFORM_C
 *
 * Uncomment to prevent default assignment of standard functions in the
 * platform layer.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_PLATFORM_NO_STD_FUNCTIONS"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_PLATFORM_NO_STD_FUNCTIONS
				[#else]
					[#lt]#define MBEDTLS_PLATFORM_NO_STD_FUNCTIONS
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_PLATFORM_EXIT_ALT
 *
 * MBEDTLS_PLATFORM_XXX_ALT: Uncomment a macro to let mbed TLS support the
 * function in the platform abstraction layer.
 *
 * application: In case you uncomment MBEDTLS_PLATFORM_PRINTF_ALT, mbed TLS will
 * provide a function "mbedtls_platform_set_printf()" that allows you to set an
 * alternative printf function pointer.
 *
 * All these define require MBEDTLS_PLATFORM_C to be defined!
 *
 * \note MBEDTLS_PLATFORM_SNPRINTF_ALT is required on Windows;
 * it will be enabled automatically by check_config.h
 *
 * \warning MBEDTLS_PLATFORM_XXX_ALT cannot be defined at the same time as
 * MBEDTLS_PLATFORM_XXX_MACRO!
 *
 * Requires: MBEDTLS_PLATFORM_TIME_ALT requires MBEDTLS_HAVE_TIME
 *
 * Uncomment a macro to enable alternate implementation of specific base
 * platform function
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_PLATFORM_EXIT_ALT"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_PLATFORM_EXIT_ALT
				[#else]
					[#lt]#define MBEDTLS_PLATFORM_EXIT_ALT
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_PLATFORM_TIME_ALT"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_PLATFORM_TIME_ALT
				[#else]
					[#lt]#define MBEDTLS_PLATFORM_TIME_ALT
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_PLATFORM_FPRINTF_ALT"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_PLATFORM_FPRINTF_ALT
				[#else]
					[#lt]#define MBEDTLS_PLATFORM_FPRINTF_ALT
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_PLATFORM_PRINTF_ALT"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_PLATFORM_PRINTF_ALT
				[#else]
					[#lt]#define MBEDTLS_PLATFORM_PRINTF_ALT
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_PLATFORM_SNPRINTF_ALT"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_PLATFORM_SNPRINTF_ALT
				[#else]
					[#lt]#define MBEDTLS_PLATFORM_SNPRINTF_ALT
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_PLATFORM_NV_SEED_ALT"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_PLATFORM_NV_SEED_ALT
				[#else]
					[#lt]#define MBEDTLS_PLATFORM_NV_SEED_ALT
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_DEPRECATED_WARNING
 *
 * Mark deprecated functions so that they generate a warning if used.
 * Functions deprecated in one version will usually be removed in the next
 * version. You can enable this to help you prepare the transition to a new
 * major version by making sure your code is not using these functions.
 *
 * This only works with GCC and Clang. With other compilers, you may want to
 * use MBEDTLS_DEPRECATED_REMOVED
 *
 * Uncomment to get warnings on using deprecated functions.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_DEPRECATED_WARNING"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_DEPRECATED_WARNING
				[#else]
					[#lt]#define MBEDTLS_DEPRECATED_WARNING
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_DEPRECATED_REMOVED
 *
 * Remove deprecated functions so that they generate an error if used.
 * Functions deprecated in one version will usually be removed in the next
 * version. You can enable this to help you prepare the transition to a new
 * major version by making sure your code is not using these functions.
 *
 * Uncomment to get errors on using deprecated functions.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_DEPRECATED_REMOVED"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_DEPRECATED_REMOVED
				[#else]
					[#lt]#define MBEDTLS_DEPRECATED_REMOVED
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/* \} name SECTION: System support */

/**
 * \name SECTION: mbed TLS feature support
 *
 * This section sets support for features that are or are not needed
 * within the modules that are enabled.
 * \{
 */

/**
 * \def MBEDTLS_TIMING_ALT
 *
 * Uncomment to provide your own alternate implementation for mbedtls_timing_hardclock(),
 * mbedtls_timing_get_timer(), mbedtls_set_alarm(), mbedtls_set/get_delay()
 *
 * Only works if you have MBEDTLS_TIMING_C enabled.
 *
 * You will need to provide a header "timing_alt.h" and an implementation at
 * compile time.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_TIMING_ALT"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_TIMING_ALT
				[#else]
					[#lt]#define MBEDTLS_TIMING_ALT
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_AES_ALT
 *
 * MBEDTLS__MODULE_NAME__ALT: Uncomment a macro to let mbed TLS use your
 * alternate core implementation of a symmetric crypto or hash module (e.g.
 * platform specific assembly optimized implementations). Keep in mind that
 * the function prototypes should remain the same.
 *
 * This replaces the whole module. If you only want to replace one of the
 * functions, use one of the MBEDTLS__FUNCTION_NAME__ALT flags.
 *
 * application: In case you uncomment MBEDTLS_AES_ALT, mbed TLS will no longer
 * provide the "struct mbedtls_aes_context" definition and omit the base function
 * declarations and implementations. "aes_alt.h" will be included from
 * "aes.h" to include the new function definitions.
 *
 * Uncomment a macro to enable alternate implementation of the corresponding
 * module.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_AES_ALT"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_AES_ALT
				[#else]
					[#lt]#define MBEDTLS_AES_ALT
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_ARC4_ALT"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_ARC4_ALT
				[#else]
					[#lt]#define MBEDTLS_ARC4_ALT
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_BLOWFISH_ALT"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_BLOWFISH_ALT
				[#else]
					[#lt]#define MBEDTLS_BLOWFISH_ALT
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_CAMELLIA_ALT"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_CAMELLIA_ALT
				[#else]
					[#lt]#define MBEDTLS_CAMELLIA_ALT
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_DES_ALT"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_DES_ALT
				[#else]
					[#lt]#define MBEDTLS_DES_ALT
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_XTEA_ALT"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_XTEA_ALT
				[#else]
					[#lt]#define MBEDTLS_XTEA_ALT
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_MD2_ALT"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_MD2_ALT
				[#else]
					[#lt]#define MBEDTLS_MD2_ALT
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_MD4_ALT"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_MD4_ALT
				[#else]
					[#lt]#define MBEDTLS_MD4_ALT
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_MD5_ALT"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_MD5_ALT
				[#else]
					[#lt]#define MBEDTLS_MD5_ALT
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_RIPEMD160_ALT"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_RIPEMD160_ALT
				[#else]
					[#lt]#define MBEDTLS_RIPEMD160_ALT
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_SHA1_ALT"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_SHA1_ALT
				[#else]
					[#lt]#define MBEDTLS_SHA1_ALT
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_SHA256_ALT"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_SHA256_ALT
				[#else]
					[#lt]#define MBEDTLS_SHA256_ALT
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_SHA512_ALT"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_SHA512_ALT
				[#else]
					[#lt]#define MBEDTLS_SHA512_ALT
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_MD2_PROCESS_ALT
 *
 * MBEDTLS__FUNCTION_NAME__ALT: Uncomment a macro to let mbed TLS use you
 * alternate core implementation of symmetric crypto or hash function. Keep in
 * mind that function prototypes should remain the same.
 *
 * This replaces only one function. The header file from mbed TLS is still
 * used, in contrast to the MBEDTLS__MODULE_NAME__ALT flags.
 *
 * application: In case you uncomment MBEDTLS_SHA256_PROCESS_ALT, mbed TLS will
 * no longer provide the mbedtls_sha1_process() function, but it will still provide
 * the other function (using your mbedtls_sha1_process() function) and the definition
 * of mbedtls_sha1_context, so your implementation of mbedtls_sha1_process must be compatible
 * with this definition.
 *
 * Note: if you use the AES_xxx_ALT macros, then is is recommended to also set
 * MBEDTLS_AES_ROM_TABLES in order to help the linker garbage-collect the AES
 * tables.
 *
 * Uncomment a macro to enable alternate implementation of the corresponding
 * function.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_MD2_PROCESS_ALT"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_MD2_PROCESS_ALT
				[#else]
					[#lt]#define MBEDTLS_MD2_PROCESS_ALT
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_MD4_PROCESS_ALT"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_MD4_PROCESS_ALT
				[#else]
					[#lt]#define MBEDTLS_MD4_PROCESS_ALT
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_MD5_PROCESS_ALT"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_MD5_PROCESS_ALT
				[#else]
					[#lt]#define MBEDTLS_MD5_PROCESS_ALT
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_RIPEMD160_PROCESS_ALT"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_RIPEMD160_PROCESS_ALT
				[#else]
					[#lt]#define MBEDTLS_RIPEMD160_PROCESS_ALT
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_SHA1_PROCESS_ALT"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_SHA1_PROCESS_ALT
				[#else]
					[#lt]#define MBEDTLS_SHA1_PROCESS_ALT
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_SHA256_PROCESS_ALT"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_SHA256_PROCESS_ALT
				[#else]
					[#lt]#define MBEDTLS_SHA256_PROCESS_ALT
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_SHA512_PROCESS_ALT"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_SHA512_PROCESS_ALT
				[#else]
					[#lt]#define MBEDTLS_SHA512_PROCESS_ALT
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_DES_SETKEY_ALT"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_DES_SETKEY_ALT
				[#else]
					[#lt]#define MBEDTLS_DES_SETKEY_ALT
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_DES_CRYPT_ECB_ALT"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_DES_CRYPT_ECB_ALT
				[#else]
					[#lt]#define MBEDTLS_DES_CRYPT_ECB_ALT
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_DES3_CRYPT_ECB_ALT"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_DES3_CRYPT_ECB_ALT
				[#else]
					[#lt]#define MBEDTLS_DES3_CRYPT_ECB_ALT
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_AES_SETKEY_ENC_ALT"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_AES_SETKEY_ENC_ALT
				[#else]
					[#lt]#define MBEDTLS_AES_SETKEY_ENC_ALT
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_AES_SETKEY_DEC_ALT"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_AES_SETKEY_DEC_ALT
				[#else]
					[#lt]#define MBEDTLS_AES_SETKEY_DEC_ALT
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_AES_ENCRYPT_ALT"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_AES_ENCRYPT_ALT
				[#else]
					[#lt]#define MBEDTLS_AES_ENCRYPT_ALT
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_AES_DECRYPT_ALT"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_AES_DECRYPT_ALT
				[#else]
					[#lt]#define MBEDTLS_AES_DECRYPT_ALT
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_TEST_NULL_ENTROPY
 *
 * Enables testing and use of mbed TLS without any configured entropy sources.
 * This permits use of the library on platforms before an entropy source has
 * been integrated (see for application the MBEDTLS_ENTROPY_HARDWARE_ALT or the
 * MBEDTLS_ENTROPY_NV_SEED switches).
 *
 * WARNING! This switch MUST be disabled in production builds, and is suitable
 * only for development.
 * Enabling the switch negates any security provided by the library.
 *
 * Requires MBEDTLS_ENTROPY_C, MBEDTLS_NO_DEFAULT_ENTROPY_SOURCES
 *
 */
 
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_TEST_NULL_ENTROPY"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_TEST_NULL_ENTROPY
				[#else]
					[#lt]#define MBEDTLS_TEST_NULL_ENTROPY
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_ENTROPY_HARDWARE_ALT
 *
 * Uncomment this macro to let mbed TLS use your own implementation of a
 * hardware entropy collector.
 *
 * Your function must be called \c mbedtls_hardware_poll(), have the same
 * prototype as declared in entropy_poll.h, and accept NULL as first argument.
 *
 * Uncomment to use your own hardware entropy collector.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_ENTROPY_HARDWARE_ALT"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_ENTROPY_HARDWARE_ALT
				[#else]
					[#lt]#define MBEDTLS_ENTROPY_HARDWARE_ALT
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_AES_ROM_TABLES
 *
 * Store the AES tables in ROM.
 *
 * Uncomment this macro to store the AES tables in ROM.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_AES_ROM_TABLES"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_AES_ROM_TABLES
				[#else]
					[#lt]#define MBEDTLS_AES_ROM_TABLES
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_CAMELLIA_SMALL_MEMORY
 *
 * Use less ROM for the Camellia implementation (saves about 768 bytes).
 *
 * Uncomment this macro to use less memory for Camellia.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_CAMELLIA_SMALL_MEMORY"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_CAMELLIA_SMALL_MEMORY
				[#else]
					[#lt]#define MBEDTLS_CAMELLIA_SMALL_MEMORY
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_CIPHER_MODE_CBC
 *
 * Enable Cipher Block Chaining mode (CBC) for symmetric ciphers.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_CIPHER_MODE_CBC"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_CIPHER_MODE_CBC
				[#else]
					[#lt]#define MBEDTLS_CIPHER_MODE_CBC
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_CIPHER_MODE_CFB
 *
 * Enable Cipher Feedback mode (CFB) for symmetric ciphers.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_CIPHER_MODE_CFB"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_CIPHER_MODE_CFB
				[#else]
					[#lt]#define MBEDTLS_CIPHER_MODE_CFB
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_CIPHER_MODE_CTR
 *
 * Enable Counter Block Cipher mode (CTR) for symmetric ciphers.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_CIPHER_MODE_CTR"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_CIPHER_MODE_CTR
				[#else]
					[#lt]#define MBEDTLS_CIPHER_MODE_CTR
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_CIPHER_NULL_CIPHER
 *
 * Enable NULL cipher.
 * Warning: Only do so when you know what you are doing. This allows for
 * encryption or channels without any security!
 *
 * Requires MBEDTLS_ENABLE_WEAK_CIPHERSUITES as well to enable
 * the following ciphersuites:
 *      MBEDTLS_TLS_ECDH_ECDSA_WITH_NULL_SHA
 *      MBEDTLS_TLS_ECDH_RSA_WITH_NULL_SHA
 *      MBEDTLS_TLS_ECDHE_ECDSA_WITH_NULL_SHA
 *      MBEDTLS_TLS_ECDHE_RSA_WITH_NULL_SHA
 *      MBEDTLS_TLS_ECDHE_PSK_WITH_NULL_SHA384
 *      MBEDTLS_TLS_ECDHE_PSK_WITH_NULL_SHA256
 *      MBEDTLS_TLS_ECDHE_PSK_WITH_NULL_SHA
 *      MBEDTLS_TLS_DHE_PSK_WITH_NULL_SHA384
 *      MBEDTLS_TLS_DHE_PSK_WITH_NULL_SHA256
 *      MBEDTLS_TLS_DHE_PSK_WITH_NULL_SHA
 *      MBEDTLS_TLS_RSA_WITH_NULL_SHA256
 *      MBEDTLS_TLS_RSA_WITH_NULL_SHA
 *      MBEDTLS_TLS_RSA_WITH_NULL_MD5
 *      MBEDTLS_TLS_RSA_PSK_WITH_NULL_SHA384
 *      MBEDTLS_TLS_RSA_PSK_WITH_NULL_SHA256
 *      MBEDTLS_TLS_RSA_PSK_WITH_NULL_SHA
 *      MBEDTLS_TLS_PSK_WITH_NULL_SHA384
 *      MBEDTLS_TLS_PSK_WITH_NULL_SHA256
 *      MBEDTLS_TLS_PSK_WITH_NULL_SHA
 *
 * Uncomment this macro to enable the NULL cipher and ciphersuites
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_CIPHER_NULL_CIPHER"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_CIPHER_NULL_CIPHER
				[#else]
					[#lt]#define MBEDTLS_CIPHER_NULL_CIPHER
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_CIPHER_PADDING_PKCS7
 *
 * MBEDTLS_CIPHER_PADDING_XXX: Uncomment or comment macros to add support for
 * specific padding modes in the cipher layer with cipher modes that support
 * padding (e.g. CBC)
 *
 * If you disable all padding modes, only full blocks can be used with CBC.
 *
 * Enable padding modes in the cipher layer.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_CIPHER_PADDING_PKCS7"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_CIPHER_PADDING_PKCS7
				[#else]
					[#lt]#define MBEDTLS_CIPHER_PADDING_PKCS7
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_CIPHER_PADDING_ONE_AND_ZEROS"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_CIPHER_PADDING_ONE_AND_ZEROS
				[#else]
					[#lt]#define MBEDTLS_CIPHER_PADDING_ONE_AND_ZEROS
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_CIPHER_PADDING_ZEROS_AND_LEN"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_CIPHER_PADDING_ZEROS_AND_LEN
				[#else]
					[#lt]#define MBEDTLS_CIPHER_PADDING_ZEROS_AND_LEN
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_CIPHER_PADDING_ZEROS"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_CIPHER_PADDING_ZEROS
				[#else]
					[#lt]#define MBEDTLS_CIPHER_PADDING_ZEROS
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_ENABLE_WEAK_CIPHERSUITES
 *
 * Enable weak ciphersuites in SSL / TLS.
 * Warning: Only do so when you know what you are doing. This allows for
 * channels with virtually no security at all!
 *
 * This enables the following ciphersuites:
 *      MBEDTLS_TLS_RSA_WITH_DES_CBC_SHA
 *      MBEDTLS_TLS_DHE_RSA_WITH_DES_CBC_SHA
 *
 * Uncomment this macro to enable weak ciphersuites
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_ENABLE_WEAK_CIPHERSUITES"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_ENABLE_WEAK_CIPHERSUITES
				[#else]
					[#lt]#define MBEDTLS_ENABLE_WEAK_CIPHERSUITES
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_REMOVE_ARC4_CIPHERSUITES
 *
 * Remove RC4 ciphersuites by default in SSL / TLS.
 * This flag removes the ciphersuites based on RC4 from the default list as
 * returned by mbedtls_ssl_list_ciphersuites(). However, it is still possible to
 * enable (some of) them with mbedtls_ssl_conf_ciphersuites() by including them
 * explicitly.
 *
 * Uncomment this macro to remove RC4 ciphersuites by default.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_REMOVE_ARC4_CIPHERSUITES"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_REMOVE_ARC4_CIPHERSUITES
				[#else]
					[#lt]#define MBEDTLS_REMOVE_ARC4_CIPHERSUITES
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_ECP_DP_SECP192R1_ENABLED
 *
 * MBEDTLS_ECP_XXXX_ENABLED: Enables specific curves within the Elliptic Curve
 * module.  By default all supported curves are enabled.
 *
 * Comment macros to disable the curve and functions for it
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_ECP_DP_SECP192R1_ENABLED"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_ECP_DP_SECP192R1_ENABLED
				[#else]
					[#lt]#define MBEDTLS_ECP_DP_SECP192R1_ENABLED
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_ECP_DP_SECP224R1_ENABLED"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_ECP_DP_SECP224R1_ENABLED
				[#else]
					[#lt]#define MBEDTLS_ECP_DP_SECP224R1_ENABLED
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_ECP_DP_SECP256R1_ENABLED"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_ECP_DP_SECP256R1_ENABLED
				[#else]
					[#lt]#define MBEDTLS_ECP_DP_SECP256R1_ENABLED
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_ECP_DP_SECP384R1_ENABLED"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_ECP_DP_SECP384R1_ENABLED
				[#else]
					[#lt]#define MBEDTLS_ECP_DP_SECP384R1_ENABLED
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_ECP_DP_SECP521R1_ENABLED"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_ECP_DP_SECP521R1_ENABLED
				[#else]
					[#lt]#define MBEDTLS_ECP_DP_SECP521R1_ENABLED
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_ECP_DP_SECP192K1_ENABLED"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_ECP_DP_SECP192K1_ENABLED
				[#else]
					[#lt]#define MBEDTLS_ECP_DP_SECP192K1_ENABLED
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_ECP_DP_SECP224K1_ENABLED"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_ECP_DP_SECP224K1_ENABLED
				[#else]
					[#lt]#define MBEDTLS_ECP_DP_SECP224K1_ENABLED
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_ECP_DP_SECP256K1_ENABLED"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_ECP_DP_SECP256K1_ENABLED
				[#else]
					[#lt]#define MBEDTLS_ECP_DP_SECP256K1_ENABLED
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_ECP_DP_BP256R1_ENABLED"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_ECP_DP_BP256R1_ENABLED
				[#else]
					[#lt]#define MBEDTLS_ECP_DP_BP256R1_ENABLED
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_ECP_DP_BP384R1_ENABLED"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_ECP_DP_BP384R1_ENABLED
				[#else]
					[#lt]#define MBEDTLS_ECP_DP_BP384R1_ENABLED
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_ECP_DP_BP512R1_ENABLED"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_ECP_DP_BP512R1_ENABLED
				[#else]
					[#lt]#define MBEDTLS_ECP_DP_BP512R1_ENABLED
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_ECP_DP_CURVE25519_ENABLED"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_ECP_DP_CURVE25519_ENABLED
				[#else]
					[#lt]#define MBEDTLS_ECP_DP_CURVE25519_ENABLED
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_ECP_NIST_OPTIM
 *
 * Enable specific 'modulo p' routines for each NIST prime.
 * Depending on the prime and architecture, makes operations 4 to 8 times
 * faster on the corresponding curve.
 *
 * Comment this macro to disable NIST curves optimisation.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_ECP_NIST_OPTIM"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_ECP_NIST_OPTIM
				[#else]
					[#lt]#define MBEDTLS_ECP_NIST_OPTIM
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_ECDSA_DETERMINISTIC
 *
 * Enable deterministic ECDSA (RFC 6979).
 * Standard ECDSA is "fragile" in the sense that lack of entropy when signing
 * may result in a compromise of the long-term signing key. This is avoided by
 * the deterministic variant.
 *
 * Requires: MBEDTLS_HMAC_DRBG_C
 *
 * Comment this macro to disable deterministic ECDSA.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_ECDSA_DETERMINISTIC"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_ECDSA_DETERMINISTIC
				[#else]
					[#lt]#define MBEDTLS_ECDSA_DETERMINISTIC
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_KEY_EXCHANGE_PSK_ENABLED
 *
 * Enable the PSK based ciphersuite modes in SSL / TLS.
 *
 * This enables the following ciphersuites (if other requisites are
 * enabled as well):
 *      MBEDTLS_TLS_PSK_WITH_AES_256_GCM_SHA384
 *      MBEDTLS_TLS_PSK_WITH_AES_256_CBC_SHA384
 *      MBEDTLS_TLS_PSK_WITH_AES_256_CBC_SHA
 *      MBEDTLS_TLS_PSK_WITH_CAMELLIA_256_GCM_SHA384
 *      MBEDTLS_TLS_PSK_WITH_CAMELLIA_256_CBC_SHA384
 *      MBEDTLS_TLS_PSK_WITH_AES_128_GCM_SHA256
 *      MBEDTLS_TLS_PSK_WITH_AES_128_CBC_SHA256
 *      MBEDTLS_TLS_PSK_WITH_AES_128_CBC_SHA
 *      MBEDTLS_TLS_PSK_WITH_CAMELLIA_128_GCM_SHA256
 *      MBEDTLS_TLS_PSK_WITH_CAMELLIA_128_CBC_SHA256
 *      MBEDTLS_TLS_PSK_WITH_3DES_EDE_CBC_SHA
 *      MBEDTLS_TLS_PSK_WITH_RC4_128_SHA
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_KEY_EXCHANGE_PSK_ENABLED"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_KEY_EXCHANGE_PSK_ENABLED
				[#else]
					[#lt]#define MBEDTLS_KEY_EXCHANGE_PSK_ENABLED
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_KEY_EXCHANGE_DHE_PSK_ENABLED
 *
 * Enable the DHE-PSK based ciphersuite modes in SSL / TLS.
 *
 * Requires: MBEDTLS_DHM_C
 *
 * This enables the following ciphersuites (if other requisites are
 * enabled as well):
 *      MBEDTLS_TLS_DHE_PSK_WITH_AES_256_GCM_SHA384
 *      MBEDTLS_TLS_DHE_PSK_WITH_AES_256_CBC_SHA384
 *      MBEDTLS_TLS_DHE_PSK_WITH_AES_256_CBC_SHA
 *      MBEDTLS_TLS_DHE_PSK_WITH_CAMELLIA_256_GCM_SHA384
 *      MBEDTLS_TLS_DHE_PSK_WITH_CAMELLIA_256_CBC_SHA384
 *      MBEDTLS_TLS_DHE_PSK_WITH_AES_128_GCM_SHA256
 *      MBEDTLS_TLS_DHE_PSK_WITH_AES_128_CBC_SHA256
 *      MBEDTLS_TLS_DHE_PSK_WITH_AES_128_CBC_SHA
 *      MBEDTLS_TLS_DHE_PSK_WITH_CAMELLIA_128_GCM_SHA256
 *      MBEDTLS_TLS_DHE_PSK_WITH_CAMELLIA_128_CBC_SHA256
 *      MBEDTLS_TLS_DHE_PSK_WITH_3DES_EDE_CBC_SHA
 *      MBEDTLS_TLS_DHE_PSK_WITH_RC4_128_SHA
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_KEY_EXCHANGE_DHE_PSK_ENABLED"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_KEY_EXCHANGE_DHE_PSK_ENABLED
				[#else]
					[#lt]#define MBEDTLS_KEY_EXCHANGE_DHE_PSK_ENABLED
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_KEY_EXCHANGE_ECDHE_PSK_ENABLED
 *
 * Enable the ECDHE-PSK based ciphersuite modes in SSL / TLS.
 *
 * Requires: MBEDTLS_ECDH_C
 *
 * This enables the following ciphersuites (if other requisites are
 * enabled as well):
 *      MBEDTLS_TLS_ECDHE_PSK_WITH_AES_256_CBC_SHA384
 *      MBEDTLS_TLS_ECDHE_PSK_WITH_AES_256_CBC_SHA
 *      MBEDTLS_TLS_ECDHE_PSK_WITH_CAMELLIA_256_CBC_SHA384
 *      MBEDTLS_TLS_ECDHE_PSK_WITH_AES_128_CBC_SHA256
 *      MBEDTLS_TLS_ECDHE_PSK_WITH_AES_128_CBC_SHA
 *      MBEDTLS_TLS_ECDHE_PSK_WITH_CAMELLIA_128_CBC_SHA256
 *      MBEDTLS_TLS_ECDHE_PSK_WITH_3DES_EDE_CBC_SHA
 *      MBEDTLS_TLS_ECDHE_PSK_WITH_RC4_128_SHA
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_KEY_EXCHANGE_ECDHE_PSK_ENABLED"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_KEY_EXCHANGE_ECDHE_PSK_ENABLED
				[#else]
					[#lt]#define MBEDTLS_KEY_EXCHANGE_ECDHE_PSK_ENABLED
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_KEY_EXCHANGE_RSA_PSK_ENABLED
 *
 * Enable the RSA-PSK based ciphersuite modes in SSL / TLS.
 *
 * Requires: MBEDTLS_RSA_C, MBEDTLS_PKCS1_V15,
 *           MBEDTLS_X509_CRT_PARSE_C
 *
 * This enables the following ciphersuites (if other requisites are
 * enabled as well):
 *      MBEDTLS_TLS_RSA_PSK_WITH_AES_256_GCM_SHA384
 *      MBEDTLS_TLS_RSA_PSK_WITH_AES_256_CBC_SHA384
 *      MBEDTLS_TLS_RSA_PSK_WITH_AES_256_CBC_SHA
 *      MBEDTLS_TLS_RSA_PSK_WITH_CAMELLIA_256_GCM_SHA384
 *      MBEDTLS_TLS_RSA_PSK_WITH_CAMELLIA_256_CBC_SHA384
 *      MBEDTLS_TLS_RSA_PSK_WITH_AES_128_GCM_SHA256
 *      MBEDTLS_TLS_RSA_PSK_WITH_AES_128_CBC_SHA256
 *      MBEDTLS_TLS_RSA_PSK_WITH_AES_128_CBC_SHA
 *      MBEDTLS_TLS_RSA_PSK_WITH_CAMELLIA_128_GCM_SHA256
 *      MBEDTLS_TLS_RSA_PSK_WITH_CAMELLIA_128_CBC_SHA256
 *      MBEDTLS_TLS_RSA_PSK_WITH_3DES_EDE_CBC_SHA
 *      MBEDTLS_TLS_RSA_PSK_WITH_RC4_128_SHA
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_KEY_EXCHANGE_RSA_PSK_ENABLED"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_KEY_EXCHANGE_RSA_PSK_ENABLED
				[#else]
					[#lt]#define MBEDTLS_KEY_EXCHANGE_RSA_PSK_ENABLED
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_KEY_EXCHANGE_RSA_ENABLED
 *
 * Enable the RSA-only based ciphersuite modes in SSL / TLS.
 *
 * Requires: MBEDTLS_RSA_C, MBEDTLS_PKCS1_V15,
 *           MBEDTLS_X509_CRT_PARSE_C
 *
 * This enables the following ciphersuites (if other requisites are
 * enabled as well):
 *      MBEDTLS_TLS_RSA_WITH_AES_256_GCM_SHA384
 *      MBEDTLS_TLS_RSA_WITH_AES_256_CBC_SHA256
 *      MBEDTLS_TLS_RSA_WITH_AES_256_CBC_SHA
 *      MBEDTLS_TLS_RSA_WITH_CAMELLIA_256_GCM_SHA384
 *      MBEDTLS_TLS_RSA_WITH_CAMELLIA_256_CBC_SHA256
 *      MBEDTLS_TLS_RSA_WITH_CAMELLIA_256_CBC_SHA
 *      MBEDTLS_TLS_RSA_WITH_AES_128_GCM_SHA256
 *      MBEDTLS_TLS_RSA_WITH_AES_128_CBC_SHA256
 *      MBEDTLS_TLS_RSA_WITH_AES_128_CBC_SHA
 *      MBEDTLS_TLS_RSA_WITH_CAMELLIA_128_GCM_SHA256
 *      MBEDTLS_TLS_RSA_WITH_CAMELLIA_128_CBC_SHA256
 *      MBEDTLS_TLS_RSA_WITH_CAMELLIA_128_CBC_SHA
 *      MBEDTLS_TLS_RSA_WITH_3DES_EDE_CBC_SHA
 *      MBEDTLS_TLS_RSA_WITH_RC4_128_SHA
 *      MBEDTLS_TLS_RSA_WITH_RC4_128_MD5
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_KEY_EXCHANGE_RSA_ENABLED"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_KEY_EXCHANGE_RSA_ENABLED
				[#else]
					[#lt]#define MBEDTLS_KEY_EXCHANGE_RSA_ENABLED
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_KEY_EXCHANGE_DHE_RSA_ENABLED
 *
 * Enable the DHE-RSA based ciphersuite modes in SSL / TLS.
 *
 * Requires: MBEDTLS_DHM_C, MBEDTLS_RSA_C, MBEDTLS_PKCS1_V15,
 *           MBEDTLS_X509_CRT_PARSE_C
 *
 * This enables the following ciphersuites (if other requisites are
 * enabled as well):
 *      MBEDTLS_TLS_DHE_RSA_WITH_AES_256_GCM_SHA384
 *      MBEDTLS_TLS_DHE_RSA_WITH_AES_256_CBC_SHA256
 *      MBEDTLS_TLS_DHE_RSA_WITH_AES_256_CBC_SHA
 *      MBEDTLS_TLS_DHE_RSA_WITH_CAMELLIA_256_GCM_SHA384
 *      MBEDTLS_TLS_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA256
 *      MBEDTLS_TLS_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA
 *      MBEDTLS_TLS_DHE_RSA_WITH_AES_128_GCM_SHA256
 *      MBEDTLS_TLS_DHE_RSA_WITH_AES_128_CBC_SHA256
 *      MBEDTLS_TLS_DHE_RSA_WITH_AES_128_CBC_SHA
 *      MBEDTLS_TLS_DHE_RSA_WITH_CAMELLIA_128_GCM_SHA256
 *      MBEDTLS_TLS_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA256
 *      MBEDTLS_TLS_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA
 *      MBEDTLS_TLS_DHE_RSA_WITH_3DES_EDE_CBC_SHA
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_KEY_EXCHANGE_DHE_RSA_ENABLED"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_KEY_EXCHANGE_DHE_RSA_ENABLED
				[#else]
					[#lt]#define MBEDTLS_KEY_EXCHANGE_DHE_RSA_ENABLED
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_KEY_EXCHANGE_ECDHE_RSA_ENABLED
 *
 * Enable the ECDHE-RSA based ciphersuite modes in SSL / TLS.
 *
 * Requires: MBEDTLS_ECDH_C, MBEDTLS_RSA_C, MBEDTLS_PKCS1_V15,
 *           MBEDTLS_X509_CRT_PARSE_C
 *
 * This enables the following ciphersuites (if other requisites are
 * enabled as well):
 *      MBEDTLS_TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 *      MBEDTLS_TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384
 *      MBEDTLS_TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA
 *      MBEDTLS_TLS_ECDHE_RSA_WITH_CAMELLIA_256_GCM_SHA384
 *      MBEDTLS_TLS_ECDHE_RSA_WITH_CAMELLIA_256_CBC_SHA384
 *      MBEDTLS_TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 *      MBEDTLS_TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256
 *      MBEDTLS_TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA
 *      MBEDTLS_TLS_ECDHE_RSA_WITH_CAMELLIA_128_GCM_SHA256
 *      MBEDTLS_TLS_ECDHE_RSA_WITH_CAMELLIA_128_CBC_SHA256
 *      MBEDTLS_TLS_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA
 *      MBEDTLS_TLS_ECDHE_RSA_WITH_RC4_128_SHA
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_KEY_EXCHANGE_ECDHE_RSA_ENABLED"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_KEY_EXCHANGE_ECDHE_RSA_ENABLED
				[#else]
					[#lt]#define MBEDTLS_KEY_EXCHANGE_ECDHE_RSA_ENABLED
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_KEY_EXCHANGE_ECDHE_ECDSA_ENABLED
 *
 * Enable the ECDHE-ECDSA based ciphersuite modes in SSL / TLS.
 *
 * Requires: MBEDTLS_ECDH_C, MBEDTLS_ECDSA_C, MBEDTLS_X509_CRT_PARSE_C,
 *
 * This enables the following ciphersuites (if other requisites are
 * enabled as well):
 *      MBEDTLS_TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384
 *      MBEDTLS_TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384
 *      MBEDTLS_TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA
 *      MBEDTLS_TLS_ECDHE_ECDSA_WITH_CAMELLIA_256_GCM_SHA384
 *      MBEDTLS_TLS_ECDHE_ECDSA_WITH_CAMELLIA_256_CBC_SHA384
 *      MBEDTLS_TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256
 *      MBEDTLS_TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256
 *      MBEDTLS_TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA
 *      MBEDTLS_TLS_ECDHE_ECDSA_WITH_CAMELLIA_128_GCM_SHA256
 *      MBEDTLS_TLS_ECDHE_ECDSA_WITH_CAMELLIA_128_CBC_SHA256
 *      MBEDTLS_TLS_ECDHE_ECDSA_WITH_3DES_EDE_CBC_SHA
 *      MBEDTLS_TLS_ECDHE_ECDSA_WITH_RC4_128_SHA
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_KEY_EXCHANGE_ECDHE_ECDSA_ENABLED"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_KEY_EXCHANGE_ECDHE_ECDSA_ENABLED
				[#else]
					[#lt]#define MBEDTLS_KEY_EXCHANGE_ECDHE_ECDSA_ENABLED
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_KEY_EXCHANGE_ECDH_ECDSA_ENABLED
 *
 * Enable the ECDH-ECDSA based ciphersuite modes in SSL / TLS.
 *
 * Requires: MBEDTLS_ECDH_C, MBEDTLS_X509_CRT_PARSE_C
 *
 * This enables the following ciphersuites (if other requisites are
 * enabled as well):
 *      MBEDTLS_TLS_ECDH_ECDSA_WITH_RC4_128_SHA
 *      MBEDTLS_TLS_ECDH_ECDSA_WITH_3DES_EDE_CBC_SHA
 *      MBEDTLS_TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA
 *      MBEDTLS_TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA
 *      MBEDTLS_TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA256
 *      MBEDTLS_TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA384
 *      MBEDTLS_TLS_ECDH_ECDSA_WITH_AES_128_GCM_SHA256
 *      MBEDTLS_TLS_ECDH_ECDSA_WITH_AES_256_GCM_SHA384
 *      MBEDTLS_TLS_ECDH_ECDSA_WITH_CAMELLIA_128_CBC_SHA256
 *      MBEDTLS_TLS_ECDH_ECDSA_WITH_CAMELLIA_256_CBC_SHA384
 *      MBEDTLS_TLS_ECDH_ECDSA_WITH_CAMELLIA_128_GCM_SHA256
 *      MBEDTLS_TLS_ECDH_ECDSA_WITH_CAMELLIA_256_GCM_SHA384
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_KEY_EXCHANGE_ECDH_ECDSA_ENABLED"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_KEY_EXCHANGE_ECDH_ECDSA_ENABLED
				[#else]
					[#lt]#define MBEDTLS_KEY_EXCHANGE_ECDH_ECDSA_ENABLED
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_KEY_EXCHANGE_ECDH_RSA_ENABLED
 *
 * Enable the ECDH-RSA based ciphersuite modes in SSL / TLS.
 *
 * Requires: MBEDTLS_ECDH_C, MBEDTLS_X509_CRT_PARSE_C
 *
 * This enables the following ciphersuites (if other requisites are
 * enabled as well):
 *      MBEDTLS_TLS_ECDH_RSA_WITH_RC4_128_SHA
 *      MBEDTLS_TLS_ECDH_RSA_WITH_3DES_EDE_CBC_SHA
 *      MBEDTLS_TLS_ECDH_RSA_WITH_AES_128_CBC_SHA
 *      MBEDTLS_TLS_ECDH_RSA_WITH_AES_256_CBC_SHA
 *      MBEDTLS_TLS_ECDH_RSA_WITH_AES_128_CBC_SHA256
 *      MBEDTLS_TLS_ECDH_RSA_WITH_AES_256_CBC_SHA384
 *      MBEDTLS_TLS_ECDH_RSA_WITH_AES_128_GCM_SHA256
 *      MBEDTLS_TLS_ECDH_RSA_WITH_AES_256_GCM_SHA384
 *      MBEDTLS_TLS_ECDH_RSA_WITH_CAMELLIA_128_CBC_SHA256
 *      MBEDTLS_TLS_ECDH_RSA_WITH_CAMELLIA_256_CBC_SHA384
 *      MBEDTLS_TLS_ECDH_RSA_WITH_CAMELLIA_128_GCM_SHA256
 *      MBEDTLS_TLS_ECDH_RSA_WITH_CAMELLIA_256_GCM_SHA384
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_KEY_EXCHANGE_ECDH_RSA_ENABLED"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_KEY_EXCHANGE_ECDH_RSA_ENABLED
				[#else]
					[#lt]#define MBEDTLS_KEY_EXCHANGE_ECDH_RSA_ENABLED
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_KEY_EXCHANGE_ECJPAKE_ENABLED
 *
 * Enable the ECJPAKE based ciphersuite modes in SSL / TLS.
 *
 * \warning This is currently experimental. EC J-PAKE support is based on the
 * Thread v1.0.0 specification; incompatible changes to the specification
 * might still happen. For this reason, this is disabled by default.
 *
 * Requires: MBEDTLS_ECJPAKE_C
 *           MBEDTLS_SHA256_C
 *           MBEDTLS_ECP_DP_SECP256R1_ENABLED
 *
 * This enables the following ciphersuites (if other requisites are
 * enabled as well):
 *      MBEDTLS_TLS_ECJPAKE_WITH_AES_128_CCM_8
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_KEY_EXCHANGE_ECJPAKE_ENABLED"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_KEY_EXCHANGE_ECJPAKE_ENABLED
				[#else]
					[#lt]#define MBEDTLS_KEY_EXCHANGE_ECJPAKE_ENABLED
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_PK_PARSE_EC_EXTENDED
 *
 * Enhance support for reading EC keys using variants of SEC1 not allowed by
 * RFC 5915 and RFC 5480.
 *
 * Currently this means parsing the SpecifiedECDomain choice of EC
 * parameters (only known groups are supported, not arbitrary domains, to
 * avoid validation issues).
 *
 * Disable if you only need to support RFC 5915 + 5480 key formats.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_PK_PARSE_EC_EXTENDED"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_PK_PARSE_EC_EXTENDED
				[#else]
					[#lt]#define MBEDTLS_PK_PARSE_EC_EXTENDED
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_ERROR_STRERROR_DUMMY
 *
 * Enable a dummy error function to make use of mbedtls_strerror() in
 * third party libraries easier when MBEDTLS_ERROR_C is disabled
 * (no effect when MBEDTLS_ERROR_C is enabled).
 *
 * You can safely disable this if MBEDTLS_ERROR_C is enabled, or if you're
 * not using mbedtls_strerror() or error_strerror() in your application.
 *
 * Disable if you run into name conflicts and want to really remove the
 * mbedtls_strerror()
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_ERROR_STRERROR_DUMMY"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_ERROR_STRERROR_DUMMY
				[#else]
					[#lt]#define MBEDTLS_ERROR_STRERROR_DUMMY
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_GENPRIME
 *
 * Enable the prime-number generation code.
 *
 * Requires: MBEDTLS_BIGNUM_C
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_GENPRIME"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_GENPRIME
				[#else]
					[#lt]#define MBEDTLS_GENPRIME
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_FS_IO
 *
 * Enable functions that use the filesystem.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_FS_IO"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_FS_IO
				[#else]
					[#lt]#define MBEDTLS_FS_IO
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_NO_DEFAULT_ENTROPY_SOURCES
 *
 * Do not add default entropy sources. These are the platform specific,
 * mbedtls_timing_hardclock and HAVEGE based poll functions.
 *
 * This is useful to have more control over the added entropy sources in an
 * application.
 *
 * Uncomment this macro to prevent loading of default entropy functions.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_NO_DEFAULT_ENTROPY_SOURCES"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_NO_DEFAULT_ENTROPY_SOURCES
				[#else]
					[#lt]#define MBEDTLS_NO_DEFAULT_ENTROPY_SOURCES
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_NO_PLATFORM_ENTROPY
 *
 * Do not use built-in platform entropy functions.
 * This is useful if your platform does not support
 * standards like the /dev/urandom or Windows CryptoAPI.
 *
 * Uncomment this macro to disable the built-in platform entropy functions.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_NO_PLATFORM_ENTROPY"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_NO_PLATFORM_ENTROPY
				[#else]
					[#lt]#define MBEDTLS_NO_PLATFORM_ENTROPY
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
/**
 * \def MBEDTLS_ENTROPY_FORCE_SHA256
 *
 * Force the entropy accumulator to use a SHA-256 accumulator instead of the
 * default SHA-512 based one (if both are available).
 *
 * Requires: MBEDTLS_SHA256_C
 *
 * On 32-bit systems SHA-256 can be much faster than SHA-512. Use this option
 * if you have performance concerns.
 *
 * This option is only useful if both MBEDTLS_SHA256_C and
 * MBEDTLS_SHA512_C are defined. Otherwise the available hash module is used.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_ENTROPY_FORCE_SHA256"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_ENTROPY_FORCE_SHA256
				[#else]
					[#lt]#define MBEDTLS_ENTROPY_FORCE_SHA256
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_ENTROPY_NV_SEED
 *
 * Enable the non-volatile (NV) seed file-based entropy source.
 * (Also enables the NV seed read/write functions in the platform layer)
 *
 * This is crucial (if not required) on systems that do not have a
 * cryptographic entropy source (in hardware or kernel) available.
 *
 * Requires: MBEDTLS_ENTROPY_C, MBEDTLS_PLATFORM_C
 *
 * \note The read/write functions that are used by the entropy source are
 *       determined in the platform layer, and can be modified at runtime and/or
 *       compile-time depending on the flags (MBEDTLS_PLATFORM_NV_SEED_*) used.
 *
 * \note If you use the default implementation functions that read a seedfile
 *       with regular fopen(), please make sure you make a seedfile with the
 *       proper name (defined in MBEDTLS_PLATFORM_STD_NV_SEED_FILE) and at
 *       least MBEDTLS_ENTROPY_BLOCK_SIZE bytes in size that can be read from
 *       and written to or you will get an entropy source error! The default
 *       implementation will only use the first MBEDTLS_ENTROPY_BLOCK_SIZE
 *       bytes from the file.
 *
 * \note The entropy collector will write to the seed file before entropy is
 *       given to an external source, to update it.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_ENTROPY_NV_SEED"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_ENTROPY_NV_SEED
				[#else]
					[#lt]#define MBEDTLS_ENTROPY_NV_SEED
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_MEMORY_DEBUG
 *
 * Enable debugging of buffer allocator memory issues. Automatically prints
 * (to stderr) all (fatal) messages on memory allocation issues. Enables
 * function for 'debug output' of allocated memory.
 *
 * Requires: MBEDTLS_MEMORY_BUFFER_ALLOC_C
 *
 * Uncomment this macro to let the buffer allocator print out error messages.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_MEMORY_DEBUG"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_MEMORY_DEBUG
				[#else]
					[#lt]#define MBEDTLS_MEMORY_DEBUG
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_MEMORY_BACKTRACE
 *
 * Include backtrace information with each allocated block.
 *
 * Requires: MBEDTLS_MEMORY_BUFFER_ALLOC_C
 *           GLIBC-compatible backtrace() an backtrace_symbols() support
 *
 * Uncomment this macro to include backtrace information
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_MEMORY_BACKTRACE"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_MEMORY_BACKTRACE
				[#else]
					[#lt]#define MBEDTLS_MEMORY_BACKTRACE
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_PK_RSA_ALT_SUPPORT
 *
 * Support external private RSA keys (eg from a HSM) in the PK layer.
 *
 * Comment this macro to disable support for external private RSA keys.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_PK_RSA_ALT_SUPPORT"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_PK_RSA_ALT_SUPPORT
				[#else]
					[#lt]#define MBEDTLS_PK_RSA_ALT_SUPPORT
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_PKCS1_V15
 *
 * Enable support for PKCS#1 v1.5 encoding.
 *
 * Requires: MBEDTLS_RSA_C
 *
 * This enables support for PKCS#1 v1.5 operations.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_PKCS1_V15"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_PKCS1_V15
				[#else]
					[#lt]#define MBEDTLS_PKCS1_V15
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_PKCS1_V21
 *
 * Enable support for PKCS#1 v2.1 encoding.
 *
 * Requires: MBEDTLS_MD_C, MBEDTLS_RSA_C
 *
 * This enables support for RSAES-OAEP and RSASSA-PSS operations.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_PKCS1_V21"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_PKCS1_V21
				[#else]
					[#lt]#define MBEDTLS_PKCS1_V21
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_RSA_NO_CRT
 *
 * Do not use the Chinese Remainder Theorem for the RSA private operation.
 *
 * Uncomment this macro to disable the use of CRT in RSA.
 *
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_RSA_NO_CRT"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_RSA_NO_CRT
				[#else]
					[#lt]#define MBEDTLS_RSA_NO_CRT
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_SELF_TEST
 *
 * Enable the checkup functions (*_self_test).
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_SELF_TEST"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_SELF_TEST
				[#else]
					[#lt]#define MBEDTLS_SELF_TEST
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_SHA256_SMALLER
 *
 * Enable an implementation of SHA-256 that has lower ROM footprint but also
 * lower performance.
 *
 * The default implementation is meant to be a reasonnable compromise between
 * performance and size. This version optimizes more aggressively for size at
 * the expense of performance. Eg on Cortex-M4 it reduces the size of
 * mbedtls_sha256_process() from ~2KB to ~0.5KB for a performance hit of about
 * 30%.
 *
 * Uncomment to enable the smaller implementation of SHA256.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_SHA256_SMALLER"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_SHA256_SMALLER
				[#else]
					[#lt]#define MBEDTLS_SHA256_SMALLER
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_SSL_ALL_ALERT_MESSAGES
 *
 * Enable sending of alert messages in case of encountered errors as per RFC.
 * If you choose not to send the alert messages, mbed TLS can still communicate
 * with other servers, only debugging of failures is harder.
 *
 * The advantage of not sending alert messages, is that no information is given
 * about reasons for failures thus preventing adversaries of gaining intel.
 *
 * Enable sending of all alert messages
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_SSL_ALL_ALERT_MESSAGES"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_SSL_ALL_ALERT_MESSAGES
				[#else]
					[#lt]#define MBEDTLS_SSL_ALL_ALERT_MESSAGES
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_SSL_DEBUG_ALL
 *
 * Enable the debug messages in SSL module for all issues.
 * Debug messages have been disabled in some places to prevent timing
 * attacks due to (unbalanced) debugging function calls.
 *
 * If you need all error reporting you should enable this during debugging,
 * but remove this for production servers that should log as well.
 *
 * Uncomment this macro to report all debug messages on errors introducing
 * a timing side-channel.
 *
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_SSL_DEBUG_ALL"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_SSL_DEBUG_ALL
				[#else]
					[#lt]#define MBEDTLS_SSL_DEBUG_ALL
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/** \def MBEDTLS_SSL_ENCRYPT_THEN_MAC
 *
 * Enable support for Encrypt-then-MAC, RFC 7366.
 *
 * This allows peers that both support it to use a more robust protection for
 * ciphersuites using CBC, providing deep resistance against timing attacks
 * on the padding or underlying cipher.
 *
 * This only affects CBC ciphersuites, and is useless if none is defined.
 *
 * Requires: MBEDTLS_SSL_PROTO_TLS1    or
 *           MBEDTLS_SSL_PROTO_TLS1_1  or
 *           MBEDTLS_SSL_PROTO_TLS1_2
 *
 * Comment this macro to disable support for Encrypt-then-MAC
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_SSL_ENCRYPT_THEN_MAC"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_SSL_ENCRYPT_THEN_MAC
				[#else]
					[#lt]#define MBEDTLS_SSL_ENCRYPT_THEN_MAC
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/** \def MBEDTLS_SSL_EXTENDED_MASTER_SECRET
 *
 * Enable support for Extended Master Secret, aka Session Hash
 * (draft-ietf-tls-session-hash-02).
 *
 * This was introduced as "the proper fix" to the Triple Handshake familiy of
 * attacks, but it is recommended to always use it (even if you disable
 * renegotiation), since it actually fixes a more fundamental issue in the
 * original SSL/TLS design, and has implications beyond Triple Handshake.
 *
 * Requires: MBEDTLS_SSL_PROTO_TLS1    or
 *           MBEDTLS_SSL_PROTO_TLS1_1  or
 *           MBEDTLS_SSL_PROTO_TLS1_2
 *
 * Comment this macro to disable support for Extended Master Secret.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_SSL_EXTENDED_MASTER_SECRET"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_SSL_EXTENDED_MASTER_SECRET
				[#else]
					[#lt]#define MBEDTLS_SSL_EXTENDED_MASTER_SECRET
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_SSL_FALLBACK_SCSV
 *
 * Enable support for FALLBACK_SCSV (draft-ietf-tls-downgrade-scsv-00).
 *
 * For servers, it is recommended to always enable this, unless you support
 * only one version of TLS, or know for sure that none of your clients
 * implements a fallback strategy.
 *
 * For clients, you only need this if you're using a fallback strategy, which
 * is not recommended in the first place, unless you absolutely need it to
 * interoperate with buggy (version-intolerant) servers.
 *
 * Comment this macro to disable support for FALLBACK_SCSV
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_SSL_FALLBACK_SCSV"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_SSL_FALLBACK_SCSV
				[#else]
					[#lt]#define MBEDTLS_SSL_FALLBACK_SCSV
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_SSL_HW_RECORD_ACCEL
 *
 * Enable hooking functions in SSL module for hardware acceleration of
 * individual records.
 *
 * Uncomment this macro to enable hooking functions.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_SSL_HW_RECORD_ACCEL"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_SSL_HW_RECORD_ACCEL
				[#else]
					[#lt]#define MBEDTLS_SSL_HW_RECORD_ACCEL
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_SSL_CBC_RECORD_SPLITTING
 *
 * Enable 1/n-1 record splitting for CBC mode in SSLv3 and TLS 1.0.
 *
 * This is a countermeasure to the BEAST attack, which also minimizes the risk
 * of interoperability issues compared to sending 0-length records.
 *
 * Comment this macro to disable 1/n-1 record splitting.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_SSL_CBC_RECORD_SPLITTING"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_SSL_CBC_RECORD_SPLITTING
				[#else]
					[#lt]#define MBEDTLS_SSL_CBC_RECORD_SPLITTING
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_SSL_RENEGOTIATION
 *
 * Disable support for TLS renegotiation.
 *
 * The two main uses of renegotiation are (1) refresh keys on long-lived
 * connections and (2) client authentication after the initial handshake.
 * If you don't need renegotiation, it's probably better to disable it, since
 * it has been associated with security issues in the past and is easy to
 * misuse/misunderstand.
 *
 * Comment this to disable support for renegotiation.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_SSL_RENEGOTIATION"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_SSL_RENEGOTIATION
				[#else]
					[#lt]#define MBEDTLS_SSL_RENEGOTIATION
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_SSL_SRV_SUPPORT_SSLV2_CLIENT_HELLO
 *
 * Enable support for receiving and parsing SSLv2 Client Hello messages for the
 * SSL Server module (MBEDTLS_SSL_SRV_C).
 *
 * Uncomment this macro to enable support for SSLv2 Client Hello messages.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_SSL_SRV_SUPPORT_SSLV2_CLIENT_HELLO"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_SSL_SRV_SUPPORT_SSLV2_CLIENT_HELLO
				[#else]
					[#lt]#define MBEDTLS_SSL_SRV_SUPPORT_SSLV2_CLIENT_HELLO
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_SSL_SRV_RESPECT_CLIENT_PREFERENCE
 *
 * Pick the ciphersuite according to the client's preferences rather than ours
 * in the SSL Server module (MBEDTLS_SSL_SRV_C).
 *
 * Uncomment this macro to respect client's ciphersuite order
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_SSL_SRV_RESPECT_CLIENT_PREFERENCE"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_SSL_SRV_RESPECT_CLIENT_PREFERENCE
				[#else]
					[#lt]#define MBEDTLS_SSL_SRV_RESPECT_CLIENT_PREFERENCE
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_SSL_MAX_FRAGMENT_LENGTH
 *
 * Enable support for RFC 6066 max_fragment_length extension in SSL.
 *
 * Comment this macro to disable support for the max_fragment_length extension
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_SSL_MAX_FRAGMENT_LENGTH"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_SSL_MAX_FRAGMENT_LENGTH
				[#else]
					[#lt]#define MBEDTLS_SSL_MAX_FRAGMENT_LENGTH
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_SSL_PROTO_SSL3
 *
 * Enable support for SSL 3.0.
 *
 * Requires: MBEDTLS_MD5_C
 *           MBEDTLS_SHA1_C
 *
 * Comment this macro to disable support for SSL 3.0
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_SSL_PROTO_SSL3"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_SSL_PROTO_SSL3
				[#else]
					[#lt]#define MBEDTLS_SSL_PROTO_SSL3
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_SSL_PROTO_TLS1
 *
 * Enable support for TLS 1.0.
 *
 * Requires: MBEDTLS_MD5_C
 *           MBEDTLS_SHA1_C
 *
 * Comment this macro to disable support for TLS 1.0
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_SSL_PROTO_TLS1"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_SSL_PROTO_TLS1
				[#else]
					[#lt]#define MBEDTLS_SSL_PROTO_TLS1
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_SSL_PROTO_TLS1_1
 *
 * Enable support for TLS 1.1 (and DTLS 1.0 if DTLS is enabled).
 *
 * Requires: MBEDTLS_MD5_C
 *           MBEDTLS_SHA1_C
 *
 * Comment this macro to disable support for TLS 1.1 / DTLS 1.0
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_SSL_PROTO_TLS1_1"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_SSL_PROTO_TLS1_1
				[#else]
					[#lt]#define MBEDTLS_SSL_PROTO_TLS1_1
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_SSL_PROTO_TLS1_2
 *
 * Enable support for TLS 1.2 (and DTLS 1.2 if DTLS is enabled).
 *
 * Requires: MBEDTLS_SHA1_C or MBEDTLS_SHA256_C or MBEDTLS_SHA512_C
 *           (Depends on ciphersuites)
 *
 * Comment this macro to disable support for TLS 1.2 / DTLS 1.2
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_SSL_PROTO_TLS1_2"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_SSL_PROTO_TLS1_2
				[#else]
					[#lt]#define MBEDTLS_SSL_PROTO_TLS1_2
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_SSL_PROTO_DTLS
 *
 * Enable support for DTLS (all available versions).
 *
 * Enable this and MBEDTLS_SSL_PROTO_TLS1_1 to enable DTLS 1.0,
 * and/or this and MBEDTLS_SSL_PROTO_TLS1_2 to enable DTLS 1.2.
 *
 * Requires: MBEDTLS_SSL_PROTO_TLS1_1
 *        or MBEDTLS_SSL_PROTO_TLS1_2
 *
 * Comment this macro to disable support for DTLS
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_SSL_PROTO_DTLS"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_SSL_PROTO_DTLS
				[#else]
					[#lt]#define MBEDTLS_SSL_PROTO_DTLS
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_SSL_ALPN
 *
 * Enable support for RFC 7301 Application Layer Protocol Negotiation.
 *
 * Comment this macro to disable support for ALPN.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_SSL_ALPN"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_SSL_ALPN
				[#else]
					[#lt]#define MBEDTLS_SSL_ALPN
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_SSL_DTLS_ANTI_REPLAY
 *
 * Enable support for the anti-replay mechanism in DTLS.
 *
 * Requires: MBEDTLS_SSL_TLS_C
 *           MBEDTLS_SSL_PROTO_DTLS
 *
 * \warning Disabling this is often a security risk!
 * See mbedtls_ssl_conf_dtls_anti_replay() for details.
 *
 * Comment this to disable anti-replay in DTLS.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_SSL_DTLS_ANTI_REPLAY"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_SSL_DTLS_ANTI_REPLAY
				[#else]
					[#lt]#define MBEDTLS_SSL_DTLS_ANTI_REPLAY
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_SSL_DTLS_HELLO_VERIFY
 *
 * Enable support for HelloVerifyRequest on DTLS servers.
 *
 * This feature is highly recommended to prevent DTLS servers being used as
 * amplifiers in DoS attacks against other hosts. It should always be enabled
 * unless you know for sure amplification cannot be a problem in the
 * environment in which your server operates.
 *
 * \warning Disabling this can ba a security risk! (see above)
 *
 * Requires: MBEDTLS_SSL_PROTO_DTLS
 *
 * Comment this to disable support for HelloVerifyRequest.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_SSL_DTLS_HELLO_VERIFY"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_SSL_DTLS_HELLO_VERIFY
				[#else]
					[#lt]#define MBEDTLS_SSL_DTLS_HELLO_VERIFY
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_SSL_DTLS_CLIENT_PORT_REUSE
 *
 * Enable server-side support for clients that reconnect from the same port.
 *
 * Some clients unexpectedly close the connection and try to reconnect using the
 * same source port. This needs special support from the server to handle the
 * new connection securely, as described in section 4.2.8 of RFC 6347. This
 * flag enables that support.
 *
 * Requires: MBEDTLS_SSL_DTLS_HELLO_VERIFY
 *
 * Comment this to disable support for clients reusing the source port.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_SSL_DTLS_CLIENT_PORT_REUSE"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_SSL_DTLS_CLIENT_PORT_REUSE
				[#else]
					[#lt]#define MBEDTLS_SSL_DTLS_CLIENT_PORT_REUSE
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_SSL_DTLS_BADMAC_LIMIT
 *
 * Enable support for a limit of records with bad MAC.
 *
 * See mbedtls_ssl_conf_dtls_badmac_limit().
 *
 * Requires: MBEDTLS_SSL_PROTO_DTLS
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_SSL_DTLS_BADMAC_LIMIT"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_SSL_DTLS_BADMAC_LIMIT
				[#else]
					[#lt]#define MBEDTLS_SSL_DTLS_BADMAC_LIMIT
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_SSL_SESSION_TICKETS
 *
 * Enable support for RFC 5077 session tickets in SSL.
 * Client-side, provides full support for session tickets (maintainance of a
 * session store remains the responsibility of the application, though).
 * Server-side, you also need to provide callbacks for writing and parsing
 * tickets, including authenticated encryption and key management. application
 * callbacks are provided by MBEDTLS_SSL_TICKET_C.
 *
 * Comment this macro to disable support for SSL session tickets
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_SSL_SESSION_TICKETS"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_SSL_SESSION_TICKETS
				[#else]
					[#lt]#define MBEDTLS_SSL_SESSION_TICKETS
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_SSL_EXPORT_KEYS
 *
 * Enable support for exporting key block and master secret.
 * This is required for certain users of TLS, e.g. EAP-TLS.
 *
 * Comment this macro to disable support for key export
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_SSL_EXPORT_KEYS"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_SSL_EXPORT_KEYS
				[#else]
					[#lt]#define MBEDTLS_SSL_EXPORT_KEYS
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_SSL_SERVER_NAME_INDICATION
 *
 * Enable support for RFC 6066 server name indication (SNI) in SSL.
 *
 * Requires: MBEDTLS_X509_CRT_PARSE_C
 *
 * Comment this macro to disable support for server name indication in SSL
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_SSL_SERVER_NAME_INDICATION"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_SSL_SERVER_NAME_INDICATION
				[#else]
					[#lt]#define MBEDTLS_SSL_SERVER_NAME_INDICATION
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_SSL_TRUNCATED_HMAC
 *
 * Enable support for RFC 6066 truncated HMAC in SSL.
 *
 * Comment this macro to disable support for truncated HMAC in SSL
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_SSL_TRUNCATED_HMAC"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_SSL_TRUNCATED_HMAC
				[#else]
					[#lt]#define MBEDTLS_SSL_TRUNCATED_HMAC
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_THREADING_ALT
 *
 * Provide your own alternate threading implementation.
 *
 * Requires: MBEDTLS_THREADING_C
 *
 * Uncomment this to allow your own alternate threading implementation.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_THREADING_ALT"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_THREADING_ALT
				[#else]
					[#lt]#define MBEDTLS_THREADING_ALT
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_THREADING_PTHREAD
 *
 * Enable the pthread wrapper layer for the threading layer.
 *
 * Requires: MBEDTLS_THREADING_C
 *
 * Uncomment this to enable pthread mutexes.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_THREADING_PTHREAD"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_THREADING_PTHREAD
				[#else]
					[#lt]#define MBEDTLS_THREADING_PTHREAD
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_VERSION_FEATURES
 *
 * Allow run-time checking of compile-time enabled features. Thus allowing users
 * to check at run-time if the library is for instance compiled with threading
 * support via mbedtls_version_check_feature().
 *
 * Requires: MBEDTLS_VERSION_C
 *
 * Comment this to disable run-time checking and save ROM space
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_VERSION_FEATURES"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_VERSION_FEATURES
				[#else]
					[#lt]#define MBEDTLS_VERSION_FEATURES
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_X509_ALLOW_EXTENSIONS_NON_V3
 *
 * If set, the X509 parser will not break-off when parsing an X509 certificate
 * and encountering an extension in a v1 or v2 certificate.
 *
 * Uncomment to prevent an error.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_X509_ALLOW_EXTENSIONS_NON_V3"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_X509_ALLOW_EXTENSIONS_NON_V3
				[#else]
					[#lt]#define MBEDTLS_X509_ALLOW_EXTENSIONS_NON_V3
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_X509_ALLOW_UNSUPPORTED_CRITICAL_EXTENSION
 *
 * If set, the X509 parser will not break-off when parsing an X509 certificate
 * and encountering an unknown critical extension.
 *
 * \warning Depending on your PKI use, enabling this can be a security risk!
 *
 * Uncomment to prevent an error.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_X509_ALLOW_UNSUPPORTED_CRITICAL_EXTENSION"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_X509_ALLOW_UNSUPPORTED_CRITICAL_EXTENSION
				[#else]
					[#lt]#define MBEDTLS_X509_ALLOW_UNSUPPORTED_CRITICAL_EXTENSION
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_X509_CHECK_KEY_USAGE
 *
 * Enable verification of the keyUsage extension (CA and leaf certificates).
 *
 * Disabling this avoids problems with mis-issued and/or misused
 * (intermediate) CA and leaf certificates.
 *
 * \warning Depending on your PKI use, disabling this can be a security risk!
 *
 * Comment to skip keyUsage checking for both CA and leaf certificates.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_X509_CHECK_KEY_USAGE"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_X509_CHECK_KEY_USAGE
				[#else]
					[#lt]#define MBEDTLS_X509_CHECK_KEY_USAGE
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_X509_CHECK_EXTENDED_KEY_USAGE
 *
 * Enable verification of the extendedKeyUsage extension (leaf certificates).
 *
 * Disabling this avoids problems with mis-issued and/or misused certificates.
 *
 * \warning Depending on your PKI use, disabling this can be a security risk!
 *
 * Comment to skip extendedKeyUsage checking for certificates.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_X509_CHECK_EXTENDED_KEY_USAGE"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_X509_CHECK_EXTENDED_KEY_USAGE
				[#else]
					[#lt]#define MBEDTLS_X509_CHECK_EXTENDED_KEY_USAGE
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_X509_RSASSA_PSS_SUPPORT
 *
 * Enable parsing and verification of X.509 certificates, CRLs and CSRS
 * signed with RSASSA-PSS (aka PKCS#1 v2.1).
 *
 * Comment this macro to disallow using RSASSA-PSS in certificates.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_X509_RSASSA_PSS_SUPPORT"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_X509_RSASSA_PSS_SUPPORT
				[#else]
					[#lt]#define MBEDTLS_X509_RSASSA_PSS_SUPPORT
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_ZLIB_SUPPORT
 *
 * If set, the SSL/TLS module uses ZLIB to support compression and
 * decompression of packet data.
 *
 * \warning TLS-level compression MAY REDUCE SECURITY! See for application the
 * CRIME attack. Before enabling this option, you should examine with care if
 * CRIME or similar exploits may be a applicable to your use case.
 *
 * \note Currently compression can't be used with DTLS.
 *
 * Used in: library/ssl_tls.c
 *          library/ssl_cli.c
 *          library/ssl_srv.c
 *
 * This feature requires zlib library and headers to be present.
 *
 * Uncomment to enable use of ZLIB
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_ZLIB_SUPPORT"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_ZLIB_SUPPORT
				[#else]
					[#lt]#define MBEDTLS_ZLIB_SUPPORT
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]
/* \} name SECTION: mbed TLS feature support */

/**
 * \name SECTION: mbed TLS modules
 *
 * This section enables or disables entire modules in mbed TLS
 * \{
 */

/**
 * \def MBEDTLS_AESNI_C
 *
 * Enable AES-NI support on x86-64.
 *
 * Module:  library/aesni.c
 * Caller:  library/aes.c
 *
 * Requires: MBEDTLS_HAVE_ASM
 *
 * This modules adds support for the AES-NI instructions on x86-64
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_AESNI_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_AESNI_C
				[#else]
					[#lt]#define MBEDTLS_AESNI_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_AES_C
 *
 * Enable the AES block cipher.
 *
 * Module:  library/aes.c
 * Caller:  library/ssl_tls.c
 *          library/pem.c
 *          library/ctr_drbg.c
 *
 * This module enables the following ciphersuites (if other requisites are
 * enabled as well):
 *      MBEDTLS_TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA
 *      MBEDTLS_TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA
 *      MBEDTLS_TLS_ECDH_RSA_WITH_AES_128_CBC_SHA
 *      MBEDTLS_TLS_ECDH_RSA_WITH_AES_256_CBC_SHA
 *      MBEDTLS_TLS_ECDH_ECDSA_WITH_AES_128_CBC_SHA256
 *      MBEDTLS_TLS_ECDH_ECDSA_WITH_AES_256_CBC_SHA384
 *      MBEDTLS_TLS_ECDH_RSA_WITH_AES_128_CBC_SHA256
 *      MBEDTLS_TLS_ECDH_RSA_WITH_AES_256_CBC_SHA384
 *      MBEDTLS_TLS_ECDH_ECDSA_WITH_AES_128_GCM_SHA256
 *      MBEDTLS_TLS_ECDH_ECDSA_WITH_AES_256_GCM_SHA384
 *      MBEDTLS_TLS_ECDH_RSA_WITH_AES_128_GCM_SHA256
 *      MBEDTLS_TLS_ECDH_RSA_WITH_AES_256_GCM_SHA384
 *      MBEDTLS_TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384
 *      MBEDTLS_TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 *      MBEDTLS_TLS_DHE_RSA_WITH_AES_256_GCM_SHA384
 *      MBEDTLS_TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA384
 *      MBEDTLS_TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384
 *      MBEDTLS_TLS_DHE_RSA_WITH_AES_256_CBC_SHA256
 *      MBEDTLS_TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA
 *      MBEDTLS_TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA
 *      MBEDTLS_TLS_DHE_RSA_WITH_AES_256_CBC_SHA
 *      MBEDTLS_TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256
 *      MBEDTLS_TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 *      MBEDTLS_TLS_DHE_RSA_WITH_AES_128_GCM_SHA256
 *      MBEDTLS_TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256
 *      MBEDTLS_TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256
 *      MBEDTLS_TLS_DHE_RSA_WITH_AES_128_CBC_SHA256
 *      MBEDTLS_TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA
 *      MBEDTLS_TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA
 *      MBEDTLS_TLS_DHE_RSA_WITH_AES_128_CBC_SHA
 *      MBEDTLS_TLS_DHE_PSK_WITH_AES_256_GCM_SHA384
 *      MBEDTLS_TLS_ECDHE_PSK_WITH_AES_256_CBC_SHA384
 *      MBEDTLS_TLS_DHE_PSK_WITH_AES_256_CBC_SHA384
 *      MBEDTLS_TLS_ECDHE_PSK_WITH_AES_256_CBC_SHA
 *      MBEDTLS_TLS_DHE_PSK_WITH_AES_256_CBC_SHA
 *      MBEDTLS_TLS_DHE_PSK_WITH_AES_128_GCM_SHA256
 *      MBEDTLS_TLS_ECDHE_PSK_WITH_AES_128_CBC_SHA256
 *      MBEDTLS_TLS_DHE_PSK_WITH_AES_128_CBC_SHA256
 *      MBEDTLS_TLS_ECDHE_PSK_WITH_AES_128_CBC_SHA
 *      MBEDTLS_TLS_DHE_PSK_WITH_AES_128_CBC_SHA
 *      MBEDTLS_TLS_RSA_WITH_AES_256_GCM_SHA384
 *      MBEDTLS_TLS_RSA_WITH_AES_256_CBC_SHA256
 *      MBEDTLS_TLS_RSA_WITH_AES_256_CBC_SHA
 *      MBEDTLS_TLS_RSA_WITH_AES_128_GCM_SHA256
 *      MBEDTLS_TLS_RSA_WITH_AES_128_CBC_SHA256
 *      MBEDTLS_TLS_RSA_WITH_AES_128_CBC_SHA
 *      MBEDTLS_TLS_RSA_PSK_WITH_AES_256_GCM_SHA384
 *      MBEDTLS_TLS_RSA_PSK_WITH_AES_256_CBC_SHA384
 *      MBEDTLS_TLS_RSA_PSK_WITH_AES_256_CBC_SHA
 *      MBEDTLS_TLS_RSA_PSK_WITH_AES_128_GCM_SHA256
 *      MBEDTLS_TLS_RSA_PSK_WITH_AES_128_CBC_SHA256
 *      MBEDTLS_TLS_RSA_PSK_WITH_AES_128_CBC_SHA
 *      MBEDTLS_TLS_PSK_WITH_AES_256_GCM_SHA384
 *      MBEDTLS_TLS_PSK_WITH_AES_256_CBC_SHA384
 *      MBEDTLS_TLS_PSK_WITH_AES_256_CBC_SHA
 *      MBEDTLS_TLS_PSK_WITH_AES_128_GCM_SHA256
 *      MBEDTLS_TLS_PSK_WITH_AES_128_CBC_SHA256
 *      MBEDTLS_TLS_PSK_WITH_AES_128_CBC_SHA
 *
 * PEM_PARSE uses AES for decrypting encrypted keys.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_AES_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_AES_C
				[#else]
					[#lt]#define MBEDTLS_AES_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_ARC4_C
 *
 * Enable the ARCFOUR stream cipher.
 *
 * Module:  library/arc4.c
 * Caller:  library/ssl_tls.c
 *
 * This module enables the following ciphersuites (if other requisites are
 * enabled as well):
 *      MBEDTLS_TLS_ECDH_ECDSA_WITH_RC4_128_SHA
 *      MBEDTLS_TLS_ECDH_RSA_WITH_RC4_128_SHA
 *      MBEDTLS_TLS_ECDHE_ECDSA_WITH_RC4_128_SHA
 *      MBEDTLS_TLS_ECDHE_RSA_WITH_RC4_128_SHA
 *      MBEDTLS_TLS_ECDHE_PSK_WITH_RC4_128_SHA
 *      MBEDTLS_TLS_DHE_PSK_WITH_RC4_128_SHA
 *      MBEDTLS_TLS_RSA_WITH_RC4_128_SHA
 *      MBEDTLS_TLS_RSA_WITH_RC4_128_MD5
 *      MBEDTLS_TLS_RSA_PSK_WITH_RC4_128_SHA
 *      MBEDTLS_TLS_PSK_WITH_RC4_128_SHA
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_ARC4_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_ARC4_C
				[#else]
					[#lt]#define MBEDTLS_ARC4_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_ASN1_PARSE_C
 *
 * Enable the generic ASN1 parser.
 *
 * Module:  library/asn1.c
 * Caller:  library/x509.c
 *          library/dhm.c
 *          library/pkcs12.c
 *          library/pkcs5.c
 *          library/pkparse.c
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_ASN1_PARSE_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_ASN1_PARSE_C
				[#else]
					[#lt]#define MBEDTLS_ASN1_PARSE_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_ASN1_WRITE_C
 *
 * Enable the generic ASN1 writer.
 *
 * Module:  library/asn1write.c
 * Caller:  library/ecdsa.c
 *          library/pkwrite.c
 *          library/x509_create.c
 *          library/x509write_crt.c
 *          library/mbedtls_x509write_csr.c
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_ASN1_WRITE_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_ASN1_WRITE_C
				[#else]
					[#lt]#define MBEDTLS_ASN1_WRITE_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_BASE64_C
 *
 * Enable the Base64 module.
 *
 * Module:  library/base64.c
 * Caller:  library/pem.c
 *
 * This module is required for PEM support (required by X.509).
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_BASE64_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_BASE64_C
				[#else]
					[#lt]#define MBEDTLS_BASE64_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_BIGNUM_C
 *
 * Enable the multi-precision integer library.
 *
 * Module:  library/bignum.c
 * Caller:  library/dhm.c
 *          library/ecp.c
 *          library/ecdsa.c
 *          library/rsa.c
 *          library/ssl_tls.c
 *
 * This module is required for RSA, DHM and ECC (ECDH, ECDSA) support.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_BIGNUM_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_BIGNUM_C
				[#else]
					[#lt]#define MBEDTLS_BIGNUM_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_BLOWFISH_C
 *
 * Enable the Blowfish block cipher.
 *
 * Module:  library/blowfish.c
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_BLOWFISH_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_BLOWFISH_C
				[#else]
					[#lt]#define MBEDTLS_BLOWFISH_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_CAMELLIA_C
 *
 * Enable the Camellia block cipher.
 *
 * Module:  library/camellia.c
 * Caller:  library/ssl_tls.c
 *
 * This module enables the following ciphersuites (if other requisites are
 * enabled as well):
 *      MBEDTLS_TLS_ECDH_ECDSA_WITH_CAMELLIA_128_CBC_SHA256
 *      MBEDTLS_TLS_ECDH_ECDSA_WITH_CAMELLIA_256_CBC_SHA384
 *      MBEDTLS_TLS_ECDH_RSA_WITH_CAMELLIA_128_CBC_SHA256
 *      MBEDTLS_TLS_ECDH_RSA_WITH_CAMELLIA_256_CBC_SHA384
 *      MBEDTLS_TLS_ECDH_ECDSA_WITH_CAMELLIA_128_GCM_SHA256
 *      MBEDTLS_TLS_ECDH_ECDSA_WITH_CAMELLIA_256_GCM_SHA384
 *      MBEDTLS_TLS_ECDH_RSA_WITH_CAMELLIA_128_GCM_SHA256
 *      MBEDTLS_TLS_ECDH_RSA_WITH_CAMELLIA_256_GCM_SHA384
 *      MBEDTLS_TLS_ECDHE_ECDSA_WITH_CAMELLIA_256_GCM_SHA384
 *      MBEDTLS_TLS_ECDHE_RSA_WITH_CAMELLIA_256_GCM_SHA384
 *      MBEDTLS_TLS_DHE_RSA_WITH_CAMELLIA_256_GCM_SHA384
 *      MBEDTLS_TLS_ECDHE_ECDSA_WITH_CAMELLIA_256_CBC_SHA384
 *      MBEDTLS_TLS_ECDHE_RSA_WITH_CAMELLIA_256_CBC_SHA384
 *      MBEDTLS_TLS_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA256
 *      MBEDTLS_TLS_DHE_RSA_WITH_CAMELLIA_256_CBC_SHA
 *      MBEDTLS_TLS_ECDHE_ECDSA_WITH_CAMELLIA_128_GCM_SHA256
 *      MBEDTLS_TLS_ECDHE_RSA_WITH_CAMELLIA_128_GCM_SHA256
 *      MBEDTLS_TLS_DHE_RSA_WITH_CAMELLIA_128_GCM_SHA256
 *      MBEDTLS_TLS_ECDHE_ECDSA_WITH_CAMELLIA_128_CBC_SHA256
 *      MBEDTLS_TLS_ECDHE_RSA_WITH_CAMELLIA_128_CBC_SHA256
 *      MBEDTLS_TLS_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA256
 *      MBEDTLS_TLS_DHE_RSA_WITH_CAMELLIA_128_CBC_SHA
 *      MBEDTLS_TLS_DHE_PSK_WITH_CAMELLIA_256_GCM_SHA384
 *      MBEDTLS_TLS_ECDHE_PSK_WITH_CAMELLIA_256_CBC_SHA384
 *      MBEDTLS_TLS_DHE_PSK_WITH_CAMELLIA_256_CBC_SHA384
 *      MBEDTLS_TLS_DHE_PSK_WITH_CAMELLIA_128_GCM_SHA256
 *      MBEDTLS_TLS_DHE_PSK_WITH_CAMELLIA_128_CBC_SHA256
 *      MBEDTLS_TLS_ECDHE_PSK_WITH_CAMELLIA_128_CBC_SHA256
 *      MBEDTLS_TLS_RSA_WITH_CAMELLIA_256_GCM_SHA384
 *      MBEDTLS_TLS_RSA_WITH_CAMELLIA_256_CBC_SHA256
 *      MBEDTLS_TLS_RSA_WITH_CAMELLIA_256_CBC_SHA
 *      MBEDTLS_TLS_RSA_WITH_CAMELLIA_128_GCM_SHA256
 *      MBEDTLS_TLS_RSA_WITH_CAMELLIA_128_CBC_SHA256
 *      MBEDTLS_TLS_RSA_WITH_CAMELLIA_128_CBC_SHA
 *      MBEDTLS_TLS_RSA_PSK_WITH_CAMELLIA_256_GCM_SHA384
 *      MBEDTLS_TLS_RSA_PSK_WITH_CAMELLIA_256_CBC_SHA384
 *      MBEDTLS_TLS_RSA_PSK_WITH_CAMELLIA_128_GCM_SHA256
 *      MBEDTLS_TLS_RSA_PSK_WITH_CAMELLIA_128_CBC_SHA256
 *      MBEDTLS_TLS_PSK_WITH_CAMELLIA_256_GCM_SHA384
 *      MBEDTLS_TLS_PSK_WITH_CAMELLIA_256_CBC_SHA384
 *      MBEDTLS_TLS_PSK_WITH_CAMELLIA_128_GCM_SHA256
 *      MBEDTLS_TLS_PSK_WITH_CAMELLIA_128_CBC_SHA256
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_CAMELLIA_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_CAMELLIA_C
				[#else]
					[#lt]#define MBEDTLS_CAMELLIA_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_CCM_C
 *
 * Enable the Counter with CBC-MAC (CCM) mode for 128-bit block cipher.
 *
 * Module:  library/ccm.c
 *
 * Requires: MBEDTLS_AES_C or MBEDTLS_CAMELLIA_C
 *
 * This module enables the AES-CCM ciphersuites, if other requisites are
 * enabled as well.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_CCM_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_CCM_C
				[#else]
					[#lt]#define MBEDTLS_CCM_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_CERTS_C
 *
 * Enable the test certificates.
 *
 * Module:  library/certs.c
 * Caller:
 *
 * This module is used for testing (ssl_client/server).
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_CERTS_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_CERTS_C
				[#else]
					[#lt]#define MBEDTLS_CERTS_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_CIPHER_C
 *
 * Enable the generic cipher layer.
 *
 * Module:  library/cipher.c
 * Caller:  library/ssl_tls.c
 *
 * Uncomment to enable generic cipher wrappers.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_CIPHER_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_CIPHER_C
				[#else]
					[#lt]#define MBEDTLS_CIPHER_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_CMAC_C
 *
 * Enable the CMAC (Cipher-based Message Authentication Code) mode for block
 * ciphers.
 *
 * Module:  library/cmac.c
 *
 * Requires: MBEDTLS_AES_C or MBEDTLS_DES_C
 *
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_CMAC_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_CMAC_C
				[#else]
					[#lt]#define MBEDTLS_CMAC_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_CTR_DRBG_C
 *
 * Enable the CTR_DRBG AES-256-based random generator.
 *
 * Module:  library/ctr_drbg.c
 * Caller:
 *
 * Requires: MBEDTLS_AES_C
 *
 * This module provides the CTR_DRBG AES-256 random number generator.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_CTR_DRBG_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_CTR_DRBG_C
				[#else]
					[#lt]#define MBEDTLS_CTR_DRBG_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_DEBUG_C
 *
 * Enable the debug functions.
 *
 * Module:  library/debug.c
 * Caller:  library/ssl_cli.c
 *          library/ssl_srv.c
 *          library/ssl_tls.c
 *
 * This module provides debugging functions.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_DEBUG_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_DEBUG_C
				[#else]
					[#lt]#define MBEDTLS_DEBUG_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_DES_C
 *
 * Enable the DES block cipher.
 *
 * Module:  library/des.c
 * Caller:  library/pem.c
 *          library/ssl_tls.c
 *
 * This module enables the following ciphersuites (if other requisites are
 * enabled as well):
 *      MBEDTLS_TLS_ECDH_ECDSA_WITH_3DES_EDE_CBC_SHA
 *      MBEDTLS_TLS_ECDH_RSA_WITH_3DES_EDE_CBC_SHA
 *      MBEDTLS_TLS_ECDHE_ECDSA_WITH_3DES_EDE_CBC_SHA
 *      MBEDTLS_TLS_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA
 *      MBEDTLS_TLS_DHE_RSA_WITH_3DES_EDE_CBC_SHA
 *      MBEDTLS_TLS_ECDHE_PSK_WITH_3DES_EDE_CBC_SHA
 *      MBEDTLS_TLS_DHE_PSK_WITH_3DES_EDE_CBC_SHA
 *      MBEDTLS_TLS_RSA_WITH_3DES_EDE_CBC_SHA
 *      MBEDTLS_TLS_RSA_PSK_WITH_3DES_EDE_CBC_SHA
 *      MBEDTLS_TLS_PSK_WITH_3DES_EDE_CBC_SHA
 *
 * PEM_PARSE uses DES/3DES for decrypting encrypted keys.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_DES_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_DES_C
				[#else]
					[#lt]#define MBEDTLS_DES_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_DHM_C
 *
 * Enable the Diffie-Hellman-Merkle module.
 *
 * Module:  library/dhm.c
 * Caller:  library/ssl_cli.c
 *          library/ssl_srv.c
 *
 * This module is used by the following key exchanges:
 *      DHE-RSA, DHE-PSK
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_DHM_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_DHM_C
				[#else]
					[#lt]#define MBEDTLS_DHM_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_ECDH_C
 *
 * Enable the elliptic curve Diffie-Hellman library.
 *
 * Module:  library/ecdh.c
 * Caller:  library/ssl_cli.c
 *          library/ssl_srv.c
 *
 * This module is used by the following key exchanges:
 *      ECDHE-ECDSA, ECDHE-RSA, DHE-PSK
 *
 * Requires: MBEDTLS_ECP_C
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_ECDH_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_ECDH_C
				[#else]
					[#lt]#define MBEDTLS_ECDH_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_ECDSA_C
 *
 * Enable the elliptic curve DSA library.
 *
 * Module:  library/ecdsa.c
 * Caller:
 *
 * This module is used by the following key exchanges:
 *      ECDHE-ECDSA
 *
 * Requires: MBEDTLS_ECP_C, MBEDTLS_ASN1_WRITE_C, MBEDTLS_ASN1_PARSE_C
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_ECDSA_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_ECDSA_C
				[#else]
					[#lt]#define MBEDTLS_ECDSA_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_ECJPAKE_C
 *
 * Enable the elliptic curve J-PAKE library.
 *
 * \warning This is currently experimental. EC J-PAKE support is based on the
 * Thread v1.0.0 specification; incompatible changes to the specification
 * might still happen. For this reason, this is disabled by default.
 *
 * Module:  library/ecjpake.c
 * Caller:
 *
 * This module is used by the following key exchanges:
 *      ECJPAKE
 *
 * Requires: MBEDTLS_ECP_C, MBEDTLS_MD_C
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_ECJPAKE_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_ECJPAKE_C
				[#else]
					[#lt]#define MBEDTLS_ECJPAKE_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_ECP_C
 *
 * Enable the elliptic curve over GF(p) library.
 *
 * Module:  library/ecp.c
 * Caller:  library/ecdh.c
 *          library/ecdsa.c
 *          library/ecjpake.c
 *
 * Requires: MBEDTLS_BIGNUM_C and at least one MBEDTLS_ECP_DP_XXX_ENABLED
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_ECP_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_ECP_C
				[#else]
					[#lt]#define MBEDTLS_ECP_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_ENTROPY_C
 *
 * Enable the platform-specific entropy code.
 *
 * Module:  library/entropy.c
 * Caller:
 *
 * Requires: MBEDTLS_SHA512_C or MBEDTLS_SHA256_C
 *
 * This module provides a generic entropy pool
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_ENTROPY_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_ENTROPY_C
				[#else]
					[#lt]#define MBEDTLS_ENTROPY_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_ERROR_C
 *
 * Enable error code to error string conversion.
 *
 * Module:  library/error.c
 * Caller:
 *
 * This module enables mbedtls_strerror().
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_ERROR_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_ERROR_C
				[#else]
					[#lt]#define MBEDTLS_ERROR_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_GCM_C
 *
 * Enable the Galois/Counter Mode (GCM) for AES.
 *
 * Module:  library/gcm.c
 *
 * Requires: MBEDTLS_AES_C or MBEDTLS_CAMELLIA_C
 *
 * This module enables the AES-GCM and CAMELLIA-GCM ciphersuites, if other
 * requisites are enabled as well.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_GCM_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_GCM_C
				[#else]
					[#lt]#define MBEDTLS_GCM_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_HAVEGE_C
 *
 * Enable the HAVEGE random generator.
 *
 * Warning: the HAVEGE random generator is not suitable for virtualized
 *          environments
 *
 * Warning: the HAVEGE random generator is dependent on timing and specific
 *          processor traits. It is therefore not advised to use HAVEGE as
 *          your applications primary random generator or primary entropy pool
 *          input. As a secondary input to your entropy pool, it IS able add
 *          the (limited) extra entropy it provides.
 *
 * Module:  library/havege.c
 * Caller:
 *
 * Requires: MBEDTLS_TIMING_C
 *
 * Uncomment to enable the HAVEGE random generator.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_HAVEGE_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_HAVEGE_C
				[#else]
					[#lt]#define MBEDTLS_HAVEGE_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_HMAC_DRBG_C
 *
 * Enable the HMAC_DRBG random generator.
 *
 * Module:  library/hmac_drbg.c
 * Caller:
 *
 * Requires: MBEDTLS_MD_C
 *
 * Uncomment to enable the HMAC_DRBG random number geerator.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_HMAC_DRBG_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_HMAC_DRBG_C
				[#else]
					[#lt]#define MBEDTLS_HMAC_DRBG_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_MD_C
 *
 * Enable the generic message digest layer.
 *
 * Module:  library/mbedtls_md.c
 * Caller:
 *
 * Uncomment to enable generic message digest wrappers.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_MD_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_MD_C
				[#else]
					[#lt]#define MBEDTLS_MD_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_MD2_C
 *
 * Enable the MD2 hash algorithm.
 *
 * Module:  library/mbedtls_md2.c
 * Caller:
 *
 * Uncomment to enable support for (rare) MD2-signed X.509 certs.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_MD2_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_MD2_C
				[#else]
					[#lt]#define MBEDTLS_MD2_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_MD4_C
 *
 * Enable the MD4 hash algorithm.
 *
 * Module:  library/mbedtls_md4.c
 * Caller:
 *
 * Uncomment to enable support for (rare) MD4-signed X.509 certs.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_MD4_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_MD4_C
				[#else]
					[#lt]#define MBEDTLS_MD4_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_MD5_C
 *
 * Enable the MD5 hash algorithm.
 *
 * Module:  library/mbedtls_md5.c
 * Caller:  library/mbedtls_md.c
 *          library/pem.c
 *          library/ssl_tls.c
 *
 * This module is required for SSL/TLS and X.509.
 * PEM_PARSE uses MD5 for decrypting encrypted keys.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_MD5_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_MD5_C
				[#else]
					[#lt]#define MBEDTLS_MD5_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_MEMORY_BUFFER_ALLOC_C
 *
 * Enable the buffer allocator implementation that makes use of a (stack)
 * based buffer to 'allocate' dynamic memory. (replaces calloc() and free()
 * calls)
 *
 * Module:  library/memory_buffer_alloc.c
 *
 * Requires: MBEDTLS_PLATFORM_C
 *           MBEDTLS_PLATFORM_MEMORY (to use it within mbed TLS)
 *
 * Enable this module to enable the buffer memory allocator.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_MEMORY_BUFFER_ALLOC_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_MEMORY_BUFFER_ALLOC_C
				[#else]
					[#lt]#define MBEDTLS_MEMORY_BUFFER_ALLOC_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_NET_C
 *
 * Enable the TCP and UDP over IPv6/IPv4 networking routines.
 *
 * \note This module only works on POSIX/Unix (including Linux, BSD and OS X)
 * and Windows. For other platforms, you'll want to disable it, and write your
 * own networking callbacks to be passed to \c mbedtls_ssl_set_bio().
 *
 * \note See also our Knowledge Base article about porting to a new
 * environment:
 * https://tls.mbed.org/kb/how-to/how-do-i-port-mbed-tls-to-a-new-environment-OS
 *
 * Module:  library/net_sockets.c
 *
 * This module provides networking routines.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_NET_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_NET_C
				[#else]
					[#lt]#define MBEDTLS_NET_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_OID_C
 *
 * Enable the OID database.
 *
 * Module:  library/oid.c
 * Caller:  library/asn1write.c
 *          library/pkcs5.c
 *          library/pkparse.c
 *          library/pkwrite.c
 *          library/rsa.c
 *          library/x509.c
 *          library/x509_create.c
 *          library/mbedtls_x509_crl.c
 *          library/mbedtls_x509_crt.c
 *          library/mbedtls_x509_csr.c
 *          library/x509write_crt.c
 *          library/mbedtls_x509write_csr.c
 *
 * This modules translates between OIDs and internal values.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_OID_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_OID_C
				[#else]
					[#lt]#define MBEDTLS_OID_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_PADLOCK_C
 *
 * Enable VIA Padlock support on x86.
 *
 * Module:  library/padlock.c
 * Caller:  library/aes.c
 *
 * Requires: MBEDTLS_HAVE_ASM
 *
 * This modules adds support for the VIA PadLock on x86.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_PADLOCK_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_PADLOCK_C
				[#else]
					[#lt]#define MBEDTLS_PADLOCK_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_PEM_PARSE_C
 *
 * Enable PEM decoding / parsing.
 *
 * Module:  library/pem.c
 * Caller:  library/dhm.c
 *          library/pkparse.c
 *          library/mbedtls_x509_crl.c
 *          library/mbedtls_x509_crt.c
 *          library/mbedtls_x509_csr.c
 *
 * Requires: MBEDTLS_BASE64_C
 *
 * This modules adds support for decoding / parsing PEM files.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_PEM_PARSE_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_PEM_PARSE_C
				[#else]
					[#lt]#define MBEDTLS_PEM_PARSE_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_PEM_WRITE_C
 *
 * Enable PEM encoding / writing.
 *
 * Module:  library/pem.c
 * Caller:  library/pkwrite.c
 *          library/x509write_crt.c
 *          library/mbedtls_x509write_csr.c
 *
 * Requires: MBEDTLS_BASE64_C
 *
 * This modules adds support for encoding / writing PEM files.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_PEM_WRITE_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_PEM_WRITE_C
				[#else]
					[#lt]#define MBEDTLS_PEM_WRITE_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_PK_C
 *
 * Enable the generic public (asymetric) key layer.
 *
 * Module:  library/pk.c
 * Caller:  library/ssl_tls.c
 *          library/ssl_cli.c
 *          library/ssl_srv.c
 *
 * Requires: MBEDTLS_RSA_C or MBEDTLS_ECP_C
 *
 * Uncomment to enable generic public key wrappers.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_PK_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_PK_C
				[#else]
					[#lt]#define MBEDTLS_PK_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_PK_PARSE_C
 *
 * Enable the generic public (asymetric) key parser.
 *
 * Module:  library/pkparse.c
 * Caller:  library/mbedtls_x509_crt.c
 *          library/mbedtls_x509_csr.c
 *
 * Requires: MBEDTLS_PK_C
 *
 * Uncomment to enable generic public key parse functions.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_PK_PARSE_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_PK_PARSE_C
				[#else]
					[#lt]#define MBEDTLS_PK_PARSE_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_PK_WRITE_C
 *
 * Enable the generic public (asymetric) key writer.
 *
 * Module:  library/pkwrite.c
 * Caller:  library/x509write.c
 *
 * Requires: MBEDTLS_PK_C
 *
 * Uncomment to enable generic public key write functions.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_PK_WRITE_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_PK_WRITE_C
				[#else]
					[#lt]#define MBEDTLS_PK_WRITE_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_PKCS5_C
 *
 * Enable PKCS#5 functions.
 *
 * Module:  library/pkcs5.c
 *
 * Requires: MBEDTLS_MD_C
 *
 * This module adds support for the PKCS#5 functions.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_PKCS5_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_PKCS5_C
				[#else]
					[#lt]#define MBEDTLS_PKCS5_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_PKCS11_C
 *
 * Enable wrapper for PKCS#11 smartcard support.
 *
 * Module:  library/pkcs11.c
 * Caller:  library/pk.c
 *
 * Requires: MBEDTLS_PK_C
 *
 * This module enables SSL/TLS PKCS #11 smartcard support.
 * Requires the presence of the PKCS#11 helper library (libpkcs11-helper)
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_PKCS11_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_PKCS11_C
				[#else]
					[#lt]#define MBEDTLS_PKCS11_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_PKCS12_C
 *
 * Enable PKCS#12 PBE functions.
 * Adds algorithms for parsing PKCS#8 encrypted private keys
 *
 * Module:  library/pkcs12.c
 * Caller:  library/pkparse.c
 *
 * Requires: MBEDTLS_ASN1_PARSE_C, MBEDTLS_CIPHER_C, MBEDTLS_MD_C
 * Can use:  MBEDTLS_ARC4_C
 *
 * This module enables PKCS#12 functions.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_PKCS12_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_PKCS12_C
				[#else]
					[#lt]#define MBEDTLS_PKCS12_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_PLATFORM_C
 *
 * Enable the platform abstraction layer that allows you to re-assign
 * functions like calloc(), free(), snprintf(), printf(), fprintf(), exit().
 *
 * Enabling MBEDTLS_PLATFORM_C enables to use of MBEDTLS_PLATFORM_XXX_ALT
 * or MBEDTLS_PLATFORM_XXX_MACRO directives, allowing the functions mentioned
 * above to be specified at runtime or compile time respectively.
 *
 * \note This abstraction layer must be enabled on Windows (including MSYS2)
 * as other module rely on it for a fixed snprintf implementation.
 *
 * Module:  library/platform.c
 * Caller:  Most other .c files
 *
 * This module enables abstraction of common (libc) functions.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_PLATFORM_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_PLATFORM_C
				[#else]
					[#lt]#define MBEDTLS_PLATFORM_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_RIPEMD160_C
 *
 * Enable the RIPEMD-160 hash algorithm.
 *
 * Module:  library/mbedtls_ripemd160.c
 * Caller:  library/mbedtls_md.c
 *
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_RIPEMD160_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_RIPEMD160_C
				[#else]
					[#lt]#define MBEDTLS_RIPEMD160_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_RSA_C
 *
 * Enable the RSA public-key cryptosystem.
 *
 * Module:  library/rsa.c
 * Caller:  library/ssl_cli.c
 *          library/ssl_srv.c
 *          library/ssl_tls.c
 *          library/x509.c
 *
 * This module is used by the following key exchanges:
 *      RSA, DHE-RSA, ECDHE-RSA, RSA-PSK
 *
 * Requires: MBEDTLS_BIGNUM_C, MBEDTLS_OID_C
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_RSA_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_RSA_C
				[#else]
					[#lt]#define MBEDTLS_RSA_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_SHA1_C
 *
 * Enable the SHA1 cryptographic hash algorithm.
 *
 * Module:  library/mbedtls_sha1.c
 * Caller:  library/mbedtls_md.c
 *          library/ssl_cli.c
 *          library/ssl_srv.c
 *          library/ssl_tls.c
 *          library/x509write_crt.c
 *
 * This module is required for SSL/TLS and SHA1-signed certificates.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_SHA1_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_SHA1_C
				[#else]
					[#lt]#define MBEDTLS_SHA1_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_SHA256_C
 *
 * Enable the SHA-224 and SHA-256 cryptographic hash algorithms.
 *
 * Module:  library/mbedtls_sha256.c
 * Caller:  library/entropy.c
 *          library/mbedtls_md.c
 *          library/ssl_cli.c
 *          library/ssl_srv.c
 *          library/ssl_tls.c
 *
 * This module adds support for SHA-224 and SHA-256.
 * This module is required for the SSL/TLS 1.2 PRF function.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_SHA256_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_SHA256_C
				[#else]
					[#lt]#define MBEDTLS_SHA256_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_SHA512_C
 *
 * Enable the SHA-384 and SHA-512 cryptographic hash algorithms.
 *
 * Module:  library/mbedtls_sha512.c
 * Caller:  library/entropy.c
 *          library/mbedtls_md.c
 *          library/ssl_cli.c
 *          library/ssl_srv.c
 *
 * This module adds support for SHA-384 and SHA-512.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_SHA512_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_SHA512_C
				[#else]
					[#lt]#define MBEDTLS_SHA512_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_SSL_CACHE_C
 *
 * Enable simple SSL cache implementation.
 *
 * Module:  library/ssl_cache.c
 * Caller:
 *
 * Requires: MBEDTLS_SSL_CACHE_C
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_SSL_CACHE_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_SSL_CACHE_C
				[#else]
					[#lt]#define MBEDTLS_SSL_CACHE_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_SSL_COOKIE_C
 *
 * Enable basic implementation of DTLS cookies for hello verification.
 *
 * Module:  library/ssl_cookie.c
 * Caller:
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_SSL_COOKIE_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_SSL_COOKIE_C
				[#else]
					[#lt]#define MBEDTLS_SSL_COOKIE_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_SSL_TICKET_C
 *
 * Enable an implementation of TLS server-side callbacks for session tickets.
 *
 * Module:  library/ssl_ticket.c
 * Caller:
 *
 * Requires: MBEDTLS_CIPHER_C
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_SSL_TICKET_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_SSL_TICKET_C
				[#else]
					[#lt]#define MBEDTLS_SSL_TICKET_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_SSL_CLI_C
 *
 * Enable the SSL/TLS client code.
 *
 * Module:  library/ssl_cli.c
 * Caller:
 *
 * Requires: MBEDTLS_SSL_TLS_C
 *
 * This module is required for SSL/TLS client support.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_SSL_CLI_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_SSL_CLI_C
				[#else]
					[#lt]#define MBEDTLS_SSL_CLI_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_SSL_SRV_C
 *
 * Enable the SSL/TLS server code.
 *
 * Module:  library/ssl_srv.c
 * Caller:
 *
 * Requires: MBEDTLS_SSL_TLS_C
 *
 * This module is required for SSL/TLS server support.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_SSL_SRV_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_SSL_SRV_C
				[#else]
					[#lt]#define MBEDTLS_SSL_SRV_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_SSL_TLS_C
 *
 * Enable the generic SSL/TLS code.
 *
 * Module:  library/ssl_tls.c
 * Caller:  library/ssl_cli.c
 *          library/ssl_srv.c
 *
 * Requires: MBEDTLS_CIPHER_C, MBEDTLS_MD_C
 *           and at least one of the MBEDTLS_SSL_PROTO_XXX defines
 *
 * This module is required for SSL/TLS.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_SSL_TLS_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_SSL_TLS_C
				[#else]
					[#lt]#define MBEDTLS_SSL_TLS_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_THREADING_C
 *
 * Enable the threading abstraction layer.
 * By default mbed TLS assumes it is used in a non-threaded environment or that
 * contexts are not shared between threads. If you do intend to use contexts
 * between threads, you will need to enable this layer to prevent race
 * conditions. See also our Knowledge Base article about threading:
 * https://tls.mbed.org/kb/development/thread-safety-and-multi-threading
 *
 * Module:  library/threading.c
 *
 * This allows different threading implementations (self-implemented or
 * provided).
 *
 * You will have to enable either MBEDTLS_THREADING_ALT or
 * MBEDTLS_THREADING_PTHREAD.
 *
 * Enable this layer to allow use of mutexes within mbed TLS
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_THREADING_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_THREADING_C
				[#else]
					[#lt]#define MBEDTLS_THREADING_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_TIMING_C
 *
 * Enable the semi-portable timing interface.
 *
 * \note The provided implementation only works on POSIX/Unix (including Linux,
 * BSD and OS X) and Windows. On other platforms, you can either disable that
 * module and provide your own implementations of the callbacks needed by
 * \c mbedtls_ssl_set_timer_cb() for DTLS, or leave it enabled and provide
 * your own implementation of the whole module by setting
 * \c MBEDTLS_TIMING_ALT in the current file.
 *
 * \note See also our Knowledge Base article about porting to a new
 * environment:
 * https://tls.mbed.org/kb/how-to/how-do-i-port-mbed-tls-to-a-new-environment-OS
 *
 * Module:  library/timing.c
 * Caller:  library/havege.c
 *
 * This module is used by the HAVEGE random number generator.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_TIMING_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_TIMING_C
				[#else]
					[#lt]#define MBEDTLS_TIMING_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_VERSION_C
 *
 * Enable run-time version information.
 *
 * Module:  library/version.c
 *
 * This module provides run-time version information.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_VERSION_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_VERSION_C
				[#else]
					[#lt]#define MBEDTLS_VERSION_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_X509_USE_C
 *
 * Enable X.509 core for using certificates.
 *
 * Module:  library/x509.c
 * Caller:  library/mbedtls_x509_crl.c
 *          library/mbedtls_x509_crt.c
 *          library/mbedtls_x509_csr.c
 *
 * Requires: MBEDTLS_ASN1_PARSE_C, MBEDTLS_BIGNUM_C, MBEDTLS_OID_C,
 *           MBEDTLS_PK_PARSE_C
 *
 * This module is required for the X.509 parsing modules.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_X509_USE_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_X509_USE_C
				[#else]
					[#lt]#define MBEDTLS_X509_USE_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_X509_CRT_PARSE_C
 *
 * Enable X.509 certificate parsing.
 *
 * Module:  library/mbedtls_x509_crt.c
 * Caller:  library/ssl_cli.c
 *          library/ssl_srv.c
 *          library/ssl_tls.c
 *
 * Requires: MBEDTLS_X509_USE_C
 *
 * This module is required for X.509 certificate parsing.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_X509_CRT_PARSE_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_X509_CRT_PARSE_C
				[#else]
					[#lt]#define MBEDTLS_X509_CRT_PARSE_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_X509_CRL_PARSE_C
 *
 * Enable X.509 CRL parsing.
 *
 * Module:  library/mbedtls_x509_crl.c
 * Caller:  library/mbedtls_x509_crt.c
 *
 * Requires: MBEDTLS_X509_USE_C
 *
 * This module is required for X.509 CRL parsing.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_X509_CRL_PARSE_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_X509_CRL_PARSE_C
				[#else]
					[#lt]#define MBEDTLS_X509_CRL_PARSE_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_X509_CSR_PARSE_C
 *
 * Enable X.509 Certificate Signing Request (CSR) parsing.
 *
 * Module:  library/mbedtls_x509_csr.c
 * Caller:  library/x509_crt_write.c
 *
 * Requires: MBEDTLS_X509_USE_C
 *
 * This module is used for reading X.509 certificate request.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_X509_CSR_PARSE_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_X509_CSR_PARSE_C
				[#else]
					[#lt]#define MBEDTLS_X509_CSR_PARSE_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_X509_CREATE_C
 *
 * Enable X.509 core for creating certificates.
 *
 * Module:  library/x509_create.c
 *
 * Requires: MBEDTLS_BIGNUM_C, MBEDTLS_OID_C, MBEDTLS_PK_WRITE_C
 *
 * This module is the basis for creating X.509 certificates and CSRs.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_X509_CREATE_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_X509_CREATE_C
				[#else]
					[#lt]#define MBEDTLS_X509_CREATE_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_X509_CRT_WRITE_C
 *
 * Enable creating X.509 certificates.
 *
 * Module:  library/x509_crt_write.c
 *
 * Requires: MBEDTLS_X509_CREATE_C
 *
 * This module is required for X.509 certificate creation.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_X509_CRT_WRITE_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_X509_CRT_WRITE_C
				[#else]
					[#lt]#define MBEDTLS_X509_CRT_WRITE_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_X509_CSR_WRITE_C
 *
 * Enable creating X.509 Certificate Signing Requests (CSR).
 *
 * Module:  library/x509_csr_write.c
 *
 * Requires: MBEDTLS_X509_CREATE_C
 *
 * This module is required for X.509 certificate request writing.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_X509_CSR_WRITE_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_X509_CSR_WRITE_C
				[#else]
					[#lt]#define MBEDTLS_X509_CSR_WRITE_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * \def MBEDTLS_XTEA_C
 *
 * Enable the XTEA block cipher.
 *
 * Module:  library/xtea.c
 * Caller:
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as definition]
			[#if definition.name="MBEDTLS_XTEA_C"]
				[#if definition.value="0"]
					[#lt]//#define MBEDTLS_XTEA_C
				[#else]
					[#lt]#define MBEDTLS_XTEA_C
				[/#if]
			[/#if]
		[/#list]
	[/#if]
[/#list]

/* \} name SECTION: mbed TLS modules */

/**
 * \name SECTION: Module configuration options
 *
 * This section allows for the setting of module specific sizes and
 * configuration options. The default values are already present in the
 * relevant header files and should suffice for the regular use cases.
 *
 * Our advice is to enable options and change their values here
 * only if you have a good reason and know the consequences.
 *
 * Please check the respective header file for documentation on these
 * parameters (to prevent duplicate documentation).
 * \{
 */

/* MPI / BIGNUM options */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_MPI_WINDOW_SIZE_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_MPI_WINDOW_SIZE"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_MPI_WINDOW_SIZE            6 /**< Maximum windows size used. */
						[#else]
							[#lt]#define MBEDTLS_MPI_WINDOW_SIZE            ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_MPI_MAX_SIZE_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_MPI_MAX_SIZE"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_MPI_MAX_SIZE            1024 /**< Maximum number of bytes for usable MPIs. */
						[#else]
							[#lt]#define MBEDTLS_MPI_MAX_SIZE            ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]

/* CTR_DRBG options */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_CTR_DRBG_ENTROPY_LEN_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_CTR_DRBG_ENTROPY_LEN"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_CTR_DRBG_ENTROPY_LEN               48 /**< Amount of entropy used per seed by default (48 with SHA-512, 32 with SHA-256) */
						[#else]
							[#lt]#define MBEDTLS_CTR_DRBG_ENTROPY_LEN               ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_CTR_DRBG_RESEED_INTERVAL_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_CTR_DRBG_RESEED_INTERVAL"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_CTR_DRBG_RESEED_INTERVAL        10000 /**< Interval before reseed is performed by default */
						[#else]
							[#lt]#define MBEDTLS_CTR_DRBG_RESEED_INTERVAL        ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_CTR_DRBG_MAX_INPUT_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_CTR_DRBG_MAX_INPUT"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_CTR_DRBG_MAX_INPUT                256 /**< Maximum number of additional input bytes */
						[#else]
							[#lt]#define MBEDTLS_CTR_DRBG_MAX_INPUT                ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_CTR_DRBG_MAX_REQUEST_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_CTR_DRBG_MAX_REQUEST"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_CTR_DRBG_MAX_REQUEST             1024 /**< Maximum number of requested bytes per call */
						[#else]
							[#lt]#define MBEDTLS_CTR_DRBG_MAX_REQUEST             ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_CTR_DRBG_MAX_SEED_INPUT_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_CTR_DRBG_MAX_SEED_INPUT"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_CTR_DRBG_MAX_SEED_INPUT           384 /**< Maximum size of (re)seed buffer */
						[#else]
							[#lt]#define MBEDTLS_CTR_DRBG_MAX_SEED_INPUT           ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]

/* HMAC_DRBG options */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_HMAC_DRBG_RESEED_INTERVAL_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_HMAC_DRBG_RESEED_INTERVAL"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_HMAC_DRBG_RESEED_INTERVAL   10000 /**< Interval before reseed is performed by default */
						[#else]
							[#lt]#define MBEDTLS_HMAC_DRBG_RESEED_INTERVAL   ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_HMAC_DRBG_MAX_INPUT_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_HMAC_DRBG_MAX_INPUT"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_HMAC_DRBG_MAX_INPUT           256 /**< Maximum number of additional input bytes */
						[#else]
							[#lt]#define MBEDTLS_HMAC_DRBG_MAX_INPUT           ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_HMAC_DRBG_MAX_REQUEST_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_HMAC_DRBG_MAX_REQUEST"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_HMAC_DRBG_MAX_REQUEST        1024 /**< Maximum number of requested bytes per call */
						[#else]
							[#lt]#define MBEDTLS_HMAC_DRBG_MAX_REQUEST        ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_HMAC_DRBG_MAX_SEED_INPUT_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_HMAC_DRBG_MAX_SEED_INPUT"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_HMAC_DRBG_MAX_SEED_INPUT      384 /**< Maximum size of (re)seed buffer */
						[#else]
							[#lt]#define MBEDTLS_HMAC_DRBG_MAX_SEED_INPUT      ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]

/* ECP options */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_ECP_MAX_BITS_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_ECP_MAX_BITS"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_ECP_MAX_BITS             521 /**< Maximum bit size of groups */
						[#else]
							[#lt]#define MBEDTLS_ECP_MAX_BITS             ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_ECP_WINDOW_SIZE_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_ECP_WINDOW_SIZE"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_ECP_WINDOW_SIZE            6 /**< Maximum window size used */
						[#else]
							[#lt]#define MBEDTLS_ECP_WINDOW_SIZE            ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_ECP_FIXED_POINT_OPTIM_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_ECP_FIXED_POINT_OPTIM"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_ECP_FIXED_POINT_OPTIM      1 /**< Enable fixed-point speed-up */
						[#else]
							[#lt]#define MBEDTLS_ECP_FIXED_POINT_OPTIM      ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]

/* Entropy options */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_ENTROPY_MAX_SOURCES_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_ENTROPY_MAX_SOURCES"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_ENTROPY_MAX_SOURCES                20 /**< Maximum number of sources supported */
						[#else]
							[#lt]#define MBEDTLS_ENTROPY_MAX_SOURCES                ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_ENTROPY_MAX_GATHER_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_ENTROPY_MAX_GATHER"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_ENTROPY_MAX_GATHER                128 /**< Maximum amount requested from entropy sources */
						[#else]
							[#lt]#define MBEDTLS_ENTROPY_MAX_GATHER                ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_ENTROPY_MIN_HARDWARE_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_ENTROPY_MIN_HARDWARE"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_ENTROPY_MIN_HARDWARE               32 /**< Default minimum number of bytes required for the hardware entropy source mbedtls_hardware_poll() before entropy is released */
						[#else]
							[#lt]#define MBEDTLS_ENTROPY_MIN_HARDWARE               ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]

/* Memory buffer allocator options */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_MEMORY_ALIGN_MULTIPLE_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_MEMORY_ALIGN_MULTIPLE"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_MEMORY_ALIGN_MULTIPLE      4 /**< Align on multiples of this value */
						[#else]
							[#lt]#define MBEDTLS_MEMORY_ALIGN_MULTIPLE      ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]

/* Platform options */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_PLATFORM_STD_MEM_HDR_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_PLATFORM_STD_MEM_HDR"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_PLATFORM_STD_MEM_HDR   <stdlib.h> /**< Header to include if MBEDTLS_PLATFORM_NO_STD_FUNCTIONS is defined. Don't define if no header is needed. */
						[#else]
							[#lt]#define MBEDTLS_PLATFORM_STD_MEM_HDR   ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_PLATFORM_STD_CALLOC_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_PLATFORM_STD_CALLOC"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_PLATFORM_STD_CALLOC        calloc /**< Default allocator to use, can be undefined */
						[#else]
							[#lt]#define MBEDTLS_PLATFORM_STD_CALLOC        ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_PLATFORM_STD_FREE_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_PLATFORM_STD_FREE"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_PLATFORM_STD_FREE            free /**< Default free to use, can be undefined */
						[#else]
							[#lt]#define MBEDTLS_PLATFORM_STD_FREE            ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_PLATFORM_STD_EXIT_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_PLATFORM_STD_EXIT"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_PLATFORM_STD_EXIT            exit /**< Default exit to use, can be undefined */
						[#else]
							[#lt]#define MBEDTLS_PLATFORM_STD_EXIT            ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_PLATFORM_STD_TIME_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_PLATFORM_STD_TIME"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_PLATFORM_STD_TIME            time /**< Default time to use, can be undefined. MBEDTLS_HAVE_TIME must be enabled */
						[#else]
							[#lt]#define MBEDTLS_PLATFORM_STD_TIME            ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_PLATFORM_STD_FPRINTF_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_PLATFORM_STD_FPRINTF"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_PLATFORM_STD_FPRINTF      fprintf /**< Default fprintf to use, can be undefined */
						[#else]
							[#lt]#define MBEDTLS_PLATFORM_STD_FPRINTF      ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_PLATFORM_STD_PRINTF_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_PLATFORM_STD_PRINTF"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_PLATFORM_STD_PRINTF        printf /**< Default printf to use, can be undefined */
						[#else]
							[#lt]#define MBEDTLS_PLATFORM_STD_PRINTF        ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]
/* Note: your snprintf must correclty zero-terminate the buffer! */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_PLATFORM_STD_SNPRINTF_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_PLATFORM_STD_SNPRINTF"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_PLATFORM_STD_SNPRINTF    snprintf /**< Default snprintf to use, can be undefined */
						[#else]
							[#lt]#define MBEDTLS_PLATFORM_STD_SNPRINTF    ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_PLATFORM_STD_EXIT_SUCCESS_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_PLATFORM_STD_EXIT_SUCCESS"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_PLATFORM_STD_EXIT_SUCCESS       0 /**< Default exit value to use, can be undefined */
						[#else]
							[#lt]#define MBEDTLS_PLATFORM_STD_EXIT_SUCCESS       ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_PLATFORM_STD_EXIT_FAILURE_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_PLATFORM_STD_EXIT_FAILURE"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_PLATFORM_STD_EXIT_FAILURE       1 /**< Default exit value to use, can be undefined */
						[#else]
							[#lt]#define MBEDTLS_PLATFORM_STD_EXIT_FAILURE       ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_PLATFORM_STD_NV_SEED_READ_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_PLATFORM_STD_NV_SEED_READ"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_PLATFORM_STD_NV_SEED_READ   mbedtls_platform_std_nv_seed_read /**< Default nv_seed_read function to use, can be undefined */
						[#else]
							[#lt]#define MBEDTLS_PLATFORM_STD_NV_SEED_READ   ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_PLATFORM_STD_NV_SEED_WRITE_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_PLATFORM_STD_NV_SEED_WRITE"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_PLATFORM_STD_NV_SEED_WRITE  mbedtls_platform_std_nv_seed_write /**< Default nv_seed_write function to use, can be undefined */
						[#else]
							[#lt]#define MBEDTLS_PLATFORM_STD_NV_SEED_WRITE  ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_PLATFORM_STD_NV_SEED_FILE_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_PLATFORM_STD_NV_SEED_FILE"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_PLATFORM_STD_NV_SEED_FILE  "seedfile" /**< Seed file to read/write with default implementation */
						[#else]
							[#lt]#define MBEDTLS_PLATFORM_STD_NV_SEED_FILE  ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]

/* To Use Function Macros MBEDTLS_PLATFORM_C must be enabled */
/* MBEDTLS_PLATFORM_XXX_MACRO and MBEDTLS_PLATFORM_XXX_ALT cannot both be defined */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_PLATFORM_CALLOC_MACRO_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_PLATFORM_CALLOC_MACRO"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_PLATFORM_CALLOC_MACRO        calloc /**< Default allocator macro to use, can be undefined */
						[#else]
							[#lt]#define MBEDTLS_PLATFORM_CALLOC_MACRO        ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_PLATFORM_FREE_MACRO_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_PLATFORM_FREE_MACRO"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_PLATFORM_FREE_MACRO            free /**< Default free macro to use, can be undefined */
						[#else]
							[#lt]#define MBEDTLS_PLATFORM_FREE_MACRO            ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_PLATFORM_EXIT_MACRO_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_PLATFORM_EXIT_MACRO"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_PLATFORM_EXIT_MACRO            exit /**< Default exit macro to use, can be undefined */
						[#else]
							[#lt]#define MBEDTLS_PLATFORM_EXIT_MACRO            ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_PLATFORM_TIME_MACRO_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_PLATFORM_TIME_MACRO"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_PLATFORM_TIME_MACRO            time /**< Default time macro to use, can be undefined. MBEDTLS_HAVE_TIME must be enabled */
						[#else]
							[#lt]#define MBEDTLS_PLATFORM_TIME_MACRO            ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_PLATFORM_TIME_TYPE_MACRO_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_PLATFORM_TIME_TYPE_MACRO"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_PLATFORM_TIME_TYPE_MACRO       time_t /**< Default time macro to use, can be undefined. MBEDTLS_HAVE_TIME must be enabled */
						[#else]
							[#lt]#define MBEDTLS_PLATFORM_TIME_TYPE_MACRO       ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_PLATFORM_FPRINTF_MACRO_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_PLATFORM_FPRINTF_MACRO"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_PLATFORM_FPRINTF_MACRO      fprintf /**< Default fprintf macro to use, can be undefined */
						[#else]
							[#lt]#define MBEDTLS_PLATFORM_FPRINTF_MACRO      ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_PLATFORM_PRINTF_MACRO_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_PLATFORM_PRINTF_MACRO"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_PLATFORM_PRINTF_MACRO        printf /**< Default printf macro to use, can be undefined */
						[#else]
							[#lt]#define MBEDTLS_PLATFORM_PRINTF_MACRO        ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]
/* Note: your snprintf must correclty zero-terminate the buffer! */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_PLATFORM_SNPRINTF_MACRO_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_PLATFORM_SNPRINTF_MACRO"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_PLATFORM_SNPRINTF_MACRO    snprintf /**< Default snprintf macro to use, can be undefined */
						[#else]
							[#lt]#define MBEDTLS_PLATFORM_SNPRINTF_MACRO    ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_PLATFORM_NV_SEED_READ_MACRO_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_PLATFORM_NV_SEED_READ_MACRO"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_PLATFORM_NV_SEED_READ_MACRO   mbedtls_platform_std_nv_seed_read /**< Default nv_seed_read function to use, can be undefined */
						[#else]
							[#lt]#define MBEDTLS_PLATFORM_NV_SEED_READ_MACRO   ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_PLATFORM_NV_SEED_WRITE_MACRO_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_PLATFORM_NV_SEED_WRITE_MACRO"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_PLATFORM_NV_SEED_WRITE_MACRO  mbedtls_platform_std_nv_seed_write /**< Default nv_seed_write function to use, can be undefined */
						[#else]
							[#lt]#define MBEDTLS_PLATFORM_NV_SEED_WRITE_MACRO  ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]

/* SSL Cache options */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_SSL_CACHE_DEFAULT_TIMEOUT_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_SSL_CACHE_DEFAULT_TIMEOUT"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_SSL_CACHE_DEFAULT_TIMEOUT       86400 /**< 1 day  */
						[#else]
							[#lt]#define MBEDTLS_SSL_CACHE_DEFAULT_TIMEOUT       ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_SSL_CACHE_DEFAULT_MAX_ENTRIES_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_SSL_CACHE_DEFAULT_MAX_ENTRIES"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_SSL_CACHE_DEFAULT_MAX_ENTRIES      50 /**< Maximum entries in cache */
						[#else]
							[#lt]#define MBEDTLS_SSL_CACHE_DEFAULT_MAX_ENTRIES      ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]

/* SSL options */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_SSL_MAX_CONTENT_LEN_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_SSL_MAX_CONTENT_LEN"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_SSL_MAX_CONTENT_LEN             16384 /**< Maxium fragment length in bytes, determines the size of each of the two internal I/O buffers */
						[#else]
							[#lt]#define MBEDTLS_SSL_MAX_CONTENT_LEN             ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_SSL_DEFAULT_TICKET_LIFETIME_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_SSL_DEFAULT_TICKET_LIFETIME"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_SSL_DEFAULT_TICKET_LIFETIME     86400 /**< Lifetime of session tickets (if enabled) */
						[#else]
							[#lt]#define MBEDTLS_SSL_DEFAULT_TICKET_LIFETIME     ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_PSK_MAX_LEN_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_PSK_MAX_LEN"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_PSK_MAX_LEN               32 /**< Max size of TLS pre-shared keys, in bytes (default 256 bits) */
						[#else]
							[#lt]#define MBEDTLS_PSK_MAX_LEN               ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_SSL_COOKIE_TIMEOUT_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_SSL_COOKIE_TIMEOUT"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_SSL_COOKIE_TIMEOUT        60 /**< Default expiration delay of DTLS cookies, in seconds if HAVE_TIME, or in number of cookies issued */
						[#else]
							[#lt]#define MBEDTLS_SSL_COOKIE_TIMEOUT        ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]

/**
 * Complete list of ciphersuites to use, in order of preference.
 *
 * \warning No dependency checking is done on that field! This option can only
 * be used to restrict the set of available ciphersuites. It is your
 * responsibility to make sure the needed modules are active.
 *
 * Use this to save a few hundred bytes of ROM (default ordering of all
 * available ciphersuites) and a few to a few hundred bytes of RAM.
 *
 * The value below is only an application, not the default.
 */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_SSL_CIPHERSUITES_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_SSL_CIPHERSUITES"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_SSL_CIPHERSUITES MBEDTLS_TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384,MBEDTLS_TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256
						[#else]
							[#lt]#define MBEDTLS_SSL_CIPHERSUITES ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]

/* X509 options */
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_X509_MAX_INTERMEDIATE_CA_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_X509_MAX_INTERMEDIATE_CA"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_X509_MAX_INTERMEDIATE_CA   8   /**< Maximum number of intermediate CAs in a verification chain. */
						[#else]
							[#lt]#define MBEDTLS_X509_MAX_INTERMEDIATE_CA   ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]
[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="MBEDTLS_X509_MAX_FILE_PATH_LEN_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="MBEDTLS_X509_MAX_FILE_PATH_LEN"]
						[#if enableFlag.value="0"]
							[#lt]//#define MBEDTLS_X509_MAX_FILE_PATH_LEN     512 /**< Maximum length of a path/filename string in bytes including the null terminator character ('\0'). */
						[#else]
							[#lt]#define MBEDTLS_X509_MAX_FILE_PATH_LEN     ${definition.value}
						[/#if]
					[/#if]
				[/#list]			
			[/#if]
		[/#list]
	[/#if]
[/#list]

/* \} name SECTION: Customisation configuration options */

/* Target and application specific configurations */

[#list SWIPdatas as SWIP]
	[#if SWIP.defines??]
		[#list SWIP.defines as enableFlag]
			[#if enableFlag.name="YOTTA_CFG_MBEDTLS_TARGET_CONFIG_FILE_ENABLE"]
				[#list SWIP.defines as definition]
					[#if definition.name="YOTTA_CFG_MBEDTLS_TARGET_CONFIG_FILE"]
						[#if enableFlag.value="0"]
							[#lt]//#define YOTTA_CFG_MBEDTLS_TARGET_CONFIG_FILE "mbedtls/target_config.h"
						[#else]
							[#lt]#define YOTTA_CFG_MBEDTLS_TARGET_CONFIG_FILE "mbedtls/target_config.h"
						[/#if]
					[/#if]
				[/#list]
			[/#if]
		[/#list]
	[/#if]
[/#list]

#if defined(TARGET_LIKE_MBED) && defined(YOTTA_CFG_MBEDTLS_TARGET_CONFIG_FILE)
    #include YOTTA_CFG_MBEDTLS_TARGET_CONFIG_FILE
#endif

/*
 * Allow user to override any previous default.
 *
 * Use two macro names for that, as:
 * - with yotta the prefix YOTTA_CFG_ is forced
 * - without yotta is looks weird to have a YOTTA prefix.
 */
#if defined(YOTTA_CFG_MBEDTLS_USER_CONFIG_FILE)
    #include YOTTA_CFG_MBEDTLS_USER_CONFIG_FILE
#elif defined(MBEDTLS_USER_CONFIG_FILE)
    #include MBEDTLS_USER_CONFIG_FILE
#endif

#include "mbedtls/check_config.h"

#endif /* MBEDTLS_CONFIG_H */