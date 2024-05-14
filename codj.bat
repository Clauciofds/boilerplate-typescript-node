@echo off
rem Aguarda 2 segundos para garantir que o arquivo tsconfig.json seja totalmente criado
rem timeout /t 2 /nobreak >nul

setlocal enabledelayedexpansion

set "TSConfig=tsconfig.json"
set "TempFile=%TSConfig%.tmp"

set "LineNumber=0"

rem Encontra a linha onde está a opção "outDir"
(for /f "tokens=*" %%a in (%TSConfig%) do (
    set /a "LineNumber+=1"
    set "line=%%a"
    if !LineNumber! equ 12 (
    	set "line=!line:"target": "es2016"="target": "ES2022"!"
    )
    if !LineNumber! equ 53 (
        set "line=!line:// "outDir": "./"="outDir": "./javascript"!"
    )
    echo !line!
)) > %TempFile%

rem Move o arquivo temporário para o arquivo original
move /y %TempFile% %TSConfig%

echo Alteracao concluida com sucesso
