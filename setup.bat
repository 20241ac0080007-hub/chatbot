@echo off
REM 🤖 Script de Inicialização do Agente IA Web (Windows)

setlocal enabledelayedexpansion

title Agente IA - Inicializacao

echo.
echo ════════════════════════════════════════
echo   🤖 AGENTE IA - INICIALIZAÇÃO WEB
echo ════════════════════════════════════════
echo.

REM Verificar Node.js
echo ✓ Verificando Node.js...
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo ✗ Node.js não está instalado!
    echo   Baixe em: https://nodejs.org/
    pause
    exit /b 1
)

for /f "tokens=*" %%i in ('node -v') do set node_version=%%i
echo ✓ Node.js encontrado: %node_version%
echo.

REM Instalar dependências do backend
echo ✓ Instalando dependências do backend...
cd backend
call npm install
if %errorlevel% neq 0 (
    echo ✗ Erro ao instalar dependências!
    pause
    exit /b 1
)
cd ..
echo ✓ Backend pronto!
echo.

REM Informações finais
echo ════════════════════════════════════════
echo ✓ INSTALAÇÃO CONCLUÍDA!
echo ════════════════════════════════════════
echo.
echo PRÓXIMOS PASSOS:
echo.
echo 1️⃣  ABRA UM TERMINAL E INICIE O BACKEND:
echo    cd backend ^&^& npm start
echo.
echo 2️⃣  ABRA OUTRO TERMINAL E INICIE O FRONTEND:
echo    cd frontend ^&^& python -m http.server 8000
echo    (ou abra frontend/index.html no navegador)
echo.
echo 3️⃣  ACESSE NO NAVEGADOR:
echo    http://localhost:8000
echo.
echo ATALHOS ÚTEIS:
echo   🌙 Clique o botão de tema no canto superior direito
echo   ⌨️  Ctrl+Enter para enviar pergunta
echo   🗑️  Ctrl+Shift+L para limpar histórico
echo.
echo DOCUMENTAÇÃO:
echo   📖 Leia WEB_README.md para detalhes completos
echo.
pause
