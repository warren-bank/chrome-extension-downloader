@echo off
setlocal enabledelayedexpansion

set chrome_extension_id=%~1
set output_filepath=%~2

if not defined output_filepath (
  set output_filepath=%cd%\%chrome_extension_id%.crx
)

set crx_download_url="https://clients2.google.com/service/update2/crx?response=redirect&prodversion=38.0&x=id%%3D!chrome_extension_id!%%26installsource%%3Dondemand%%26uc"

wget --no-check-certificate --no-iri -O "!output_filepath!" !crx_download_url!

endlocal
