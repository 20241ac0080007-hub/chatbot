@echo off
REM Inicia Frontend em novo terminal

cd frontend

echo.
echo ════════════════════════════════════════════
echo   🎨 FRONTEND - INICIANDO
echo ════════════════════════════════════════════
echo.
echo 📍 Abrindo: http://localhost:8000
echo.

python -m http.server 8000

pause
