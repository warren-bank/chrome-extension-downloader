@echo off
setlocal enabledelayedexpansion

set chrome_extension_id=%~1
set output_filepath=%~2

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
set platform_os=
set platform_arch=
set product_id=chromecrx
set product_channel=unknown
set product_version=61.0.3163.100

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
