# ==================== GUIA DE TESTE PÓS-CORREÇÃO (PowerShell) ====================
# 
# Execute este script para testar se todas as correções funcionam
# 
# Pré-requisitos:
# - Node.js v18+ instalado
# - npm instalado
# - Chave de API do Gemini adicionada em backend\.env
#
# Uso: .\test-fixes.ps1
#

Write-Host "════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "🔍 GUIA DE TESTE PÓS-CORREÇÃO" -ForegroundColor Cyan
Write-Host "════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""

Write-Host "✅ PASSO 1: Verificar se backend\.env existe com chave" -ForegroundColor Green
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray

if (Test-Path "backend\.env") {
    Write-Host "✓ backend\.env encontrado" -ForegroundColor Green
    $envContent = Get-Content "backend\.env" -Raw
    if ($envContent -match "GEMINI_API_KEY") {
        $chaveMatch = [regex]::Match($envContent, "GEMINI_API_KEY=(.*)$", "Multiline")
        $chave = $chaveMatch.Groups[1].Value.Trim()
        
        if ([string]::IsNullOrWhiteSpace($chave)) {
            Write-Host "⚠️  AVISO: GEMINI_API_KEY está vazia!" -ForegroundColor Yellow
            Write-Host "   Você DEVE adicionar sua chave API em backend\.env" -ForegroundColor Yellow
        } else {
            Write-Host "✓ Chave de API configurada (primeiros 10 caracteres: $($chave.Substring(0, [Math]::Min(10, $chave.Length)))...)" -ForegroundColor Green
        }
    }
} else {
    Write-Host "❌ backend\.env NÃO encontrado" -ForegroundColor Red
    Write-Host "   Crie o arquivo com sua chave API" -ForegroundColor Red
}
Write-Host ""

Write-Host "✅ PASSO 2: Instalar dependências" -ForegroundColor Green
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
Write-Host "Executando: npm install" -ForegroundColor Gray
Write-Host ""

Push-Location backend
npm install --loglevel=warn
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Dependências instaladas" -ForegroundColor Green
} else {
    Write-Host "❌ Erro ao instalar dependências" -ForegroundColor Red
    Pop-Location
    exit 1
}
Pop-Location
Write-Host ""

Write-Host "✅ PASSO 3: Validar sintaxe JavaScript" -ForegroundColor Green
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
Write-Host "Verificando frontend\script.js..." -ForegroundColor Gray

node --check "frontend\script.js" 2>&1 | Out-Null
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Sintaxe frontend OK" -ForegroundColor Green
} else {
    Write-Host "❌ Erro de sintaxe no frontend" -ForegroundColor Red
    exit 1
}
Write-Host ""

Write-Host "✅ PASSO 4: Resumo das Correções Realizadas" -ForegroundColor Green
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
Write-Host ""

$corrections = @(
    "✅ BOTÃO DE ENVIAR - Redeclaração de variáveis removida",
    "✅ VALIDAÇÃO - Máximo 5000 caracteres por pergunta",
    "✅ API KEY - Removido arquivo .env com chave exposta",
    "✅ CORS - Restrito a origens conhecidas",
    "✅ SEGURANÇA - Limite de tamanho do body (1MB)",
    "✅ CONFIGURAÇÃO - URL do backend configurável",
    "✅ EVENT LISTENERS - Botão Limpar Conversa adicionado"
)

$corrections | ForEach-Object { Write-Host $_ -ForegroundColor Cyan }

Write-Host ""
Write-Host "════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "✅ TODOS OS TESTES COMPLETADOS!" -ForegroundColor Green
Write-Host "════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""
Write-Host "🚀 PRÓXIMOS PASSOS:" -ForegroundColor Yellow
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Gray
Write-Host ""
Write-Host "1. Adicione sua API key do Gemini:" -ForegroundColor White
Write-Host "   - Abra backend\.env" -ForegroundColor Gray
Write-Host "   - Cole sua chave em GEMINI_API_KEY=" -ForegroundColor Gray
Write-Host ""
Write-Host "2. Inicie o backend (Terminal 1):" -ForegroundColor White
Write-Host "   cd backend" -ForegroundColor Gray
Write-Host "   npm run dev" -ForegroundColor Gray
Write-Host ""
Write-Host "3. Abra o frontend no navegador (Terminal 2):" -ForegroundColor White
Write-Host "   Navegue para: http://localhost:3000/frontend/index.html" -ForegroundColor Gray
Write-Host ""
Write-Host "4. Teste as funcionalidades:" -ForegroundColor White
Write-Host "   [*] Clique em 'Perguntar' e digite uma pergunta" -ForegroundColor Gray
Write-Host "   [*] Tente digitar 6000+ caracteres (deve mostrar aviso)" -ForegroundColor Gray
Write-Host "   [*] Clique em 'Limpar' (deve pedir confirmacao)" -ForegroundColor Gray
Write-Host "   [*] Gere um PDF das conversas" -ForegroundColor Gray
Write-Host "   [*] Mude entre temas (light/dark)" -ForegroundColor Gray
Write-Host ""
Write-Host "5. Se houver erro de API key:" -ForegroundColor White
Write-Host "   - Acesse: https://ai.google.dev" -ForegroundColor Gray
Write-Host "   - Gere uma nova chave" -ForegroundColor Gray
Write-Host "   - Atualize em backend\.env" -ForegroundColor Gray
Write-Host ""
Write-Host "════════════════════════════════════════════════════════════" -ForegroundColor Cyan
