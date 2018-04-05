@echo off
setlocal enabledelayedexpansion

set chrome_extension_id=%~1
set output_filepath=%~2

if not defined chrome_extension_id (
  echo error: ID of CRX is required
  exit /B 1
)

if not defined output_filepath (
  set output_filepath=%cd%\%chrome_extension_id%.crx
)

rem :: valid values of "os"          = ['mac','win','android','cros','openbsd','Linux']
rem :: valid values of "arch"        = ['arm','x86-64','x86-32']
rem :: valid values of "prod"        = ['chromecrx','chromiumcrx']
rem ::                                   => Source: http://cs.chromium.org/file:omaha_query_params.cc%20GetProdIdString
rem ::                                      Omitting this value is allowed, but add it just in case.
rem :: valid values of "prodchannel" = ['unknown']
rem ::                                   => Channel is "unknown" on Chromium on ArchLinux, so using "unknown" will probably be fine for everyone.
rem :: valid values of "prodversion" >= '31.0.1609.0'
rem ::                                   => older versions receive a 204 response
set default_platform_os=
set default_platform_arch=
set default_product_id=chromecrx
set default_product_channel=unknown
set default_product_version=61.0.3163.100

set platform_os=%~3
set platform_arch=%~4
set product_id=%~5
set product_channel=%~6
set product_version=%~7

if not defined platform_os     set platform_os=%default_platform_os%
if not defined platform_arch   set platform_arch=%default_platform_arch%
if not defined product_id      set product_id=%default_product_id%
if not defined product_channel set product_channel=%default_product_channel%
if not defined product_version set product_version=%default_product_version%

if not defined platform_os     set platform_os=win
if not defined platform_arch (
  if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set platform_arch=x86-64) else (set platform_arch=x86-32)
)

set crx_download_url="https://clients2.google.com/service/update2/crx?response=redirect
set crx_download_url=%crx_download_url%&os=!platform_os!
set crx_download_url=%crx_download_url%&arch=!platform_arch!
set crx_download_url=%crx_download_url%&nacl_arch=!platform_arch!
set crx_download_url=%crx_download_url%&prod=!product_id!
set crx_download_url=%crx_download_url%&prodchannel=!product_channel!
set crx_download_url=%crx_download_url%&prodversion=!product_version!
set crx_download_url=%crx_download_url%&x=id%%3D!chrome_extension_id!%%26uc"

set wget_opts=--no-check-certificate --no-iri
set wget_opts=%wget_opts% --referer="https://chrome.google.com/webstore/detail/!chrome_extension_id!?hl=en"
set wget_opts=%wget_opts% --user-agent="Mozilla/5.0 Chrome/!product_version!"

wget %wget_opts% -O "!output_filepath!" !crx_download_url!

endlocal
