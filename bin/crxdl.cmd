@echo off
setlocal enabledelayedexpansion

set chrome_extension_id=%~1
set output_filepath=%~2

if not defined output_filepath (
  set output_filepath=%cd%\%chrome_extension_id%.crx
)

set crx_download_url="https://clients2.google.com/service/update2/crx?response=redirect&prodversion=38.0&x=id%%3D!chrome_extension_id!%%26installsource%%3Dondemand%%26uc"

set wget_opts=--no-check-certificate --no-iri
set wget_opts=%wget_opts% --referer="https://chrome.google.com/webstore/detail/!chrome_extension_id!?hl=en"
set wget_opts=%wget_opts% --user-agent="Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.106 Safari/537.36"

wget %wget_opts% -O "!output_filepath!" !crx_download_url!

endlocal
