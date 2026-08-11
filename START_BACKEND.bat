@echo off
REM Inicia Agente IA automaticamente no Windows

title Agente IA - Iniciando...

echo.
echo ════════════════════════════════════════════
echo   🤖 AGENTE IA - AUTO START
echo ════════════════════════════════════════════
echo.

REM Verificar Node.js
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo ❌ Node.js não instalado!
    echo    Baixe em: https://nodejs.org
    pause
    exit /b 1
)

REM Verificar Python
where python >nul 2>nul
if %errorlevel% neq 0 (
    echo ❌ Python não instalado!
    echo    Baixe em: https://python.org
    pause
    exit /b 1
)

echo ✅ Dependências encontradas
echo.

REM Frontend
cd backend

REM Verificar node_modules
if not exist "node_modules" (
    echo 📦 Instalando dependências...
    call npm install
    if %errorlevel% neq 0 (
        echo ❌ Falha em npm install
        pause
        exit /b 1
    )
)

echo.
echo ════════════════════════════════════════════
echo   ✅ TUDO PRONTO!
echo ════════════════════════════════════════════
echo.
echo 1️⃣  TERMINAL BACKEND (este)
echo    Iniciando servidor...
echo.

npm start

REM Se chegar aqui, servidor parou
pause
