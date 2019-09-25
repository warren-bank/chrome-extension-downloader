@echo off

set product_version=61.0.3163.100
set acceptformat=crx2

call "%~dp0.\crxdl.cmd" "%~1" "%~2" "%~3" "%~4" "%~5" "%~6" "%product_version%" "%acceptformat%"
