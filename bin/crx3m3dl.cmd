@echo off

set product_version=88.0.4324.104
set acceptformat=crx3

call "%~dp0.\crxdl.cmd" "%~1" "%~2" "%~3" "%~4" "%~5" "%~6" "%product_version%" "%acceptformat%"
