@echo off
setlocal enabledelayedexpansion

set out=%~dp0output
set crx=bookmarks-on-new-tab
set log="%~dpn0.log"

echo -------------------------------------------------->%log%
echo.>>%log%

echo crx2 (bat vs. sh):>>%log%
echo.>>%log%

call :run_fc ".bat.crx2" ".sh.crx2"

echo.>>%log%
echo -------------------------------------------------->>%log%
echo.>>%log%

echo crx3 (bat vs. sh):>>%log%
echo.>>%log%

call :run_fc ".bat.crx3" ".sh.crx3"

echo.>>%log%
echo -------------------------------------------------->>%log%
echo.>>%log%

echo crx2 vs. crx3:>>%log%
echo.>>%log%

call :run_fc ".bat.crx2" ".sh.crx3"

echo.>>%log%
echo -------------------------------------------------->>%log%

goto :done

:run_fc
  set f1="%out%\%crx%%~1"
  set f2="%out%\%crx%%~2"
  set o1=
  set o2=
  for /f "usebackq tokens=* delims=" %%a in (`fc /b %f1% %f2%`) do if not defined o1 (set o1=%%a) else (set o2=%%a)
  echo !o1!>>%log%
  echo !o2!>>%log%
  goto :eof

:done
endlocal
