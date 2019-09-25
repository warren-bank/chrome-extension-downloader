@echo off

set out=%~dp0output
set log="%~dpn0.log"

echo -------------------------------------------------->%log%
echo.>>%log%

echo crx2 (bat vs. sh):>>%log%
echo.>>%log%

fc /b "%out%\bookmarks-on-new-tab.bat.crx2" "%out%\bookmarks-on-new-tab.sh.crx2" >>%log%

echo -------------------------------------------------->>%log%
echo.>>%log%

echo crx3 (bat vs. sh):>>%log%
echo.>>%log%

fc /b "%out%\bookmarks-on-new-tab.bat.crx3" "%out%\bookmarks-on-new-tab.sh.crx3" >>%log%

echo -------------------------------------------------->>%log%
echo.>>%log%

echo crx2 vs. crx3:>>%log%
echo.>>%log%

fc /b "%out%\bookmarks-on-new-tab.bat.crx2" "%out%\bookmarks-on-new-tab.sh.crx3" >>%log%

echo -------------------------------------------------->>%log%
echo.>>%log%
