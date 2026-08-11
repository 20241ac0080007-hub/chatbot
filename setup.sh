#!/bin/bash

# 🤖 Script de Inicialização do Agente IA Web

echo "════════════════════════════════════════"
echo "  🤖 AGENTE IA - INICIALIZAÇÃO WEB"
echo "════════════════════════════════════════"
echo ""

# Cores para output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 1. Verificar Node.js
echo -e "${BLUE}✓ Verificando Node.js...${NC}"
if ! command -v node &> /dev/null; then
    echo -e "${RED}✗ Node.js não está instalado!${NC}"
    echo "  Baixe em: https://nodejs.org/"
    exit 1
fi
echo -e "${GREEN}✓ Node.js encontrado:$(node -v)${NC}"
echo ""

# 2. Instalar dependências do backend
echo -e "${BLUE}✓ Instalando dependências do backend...${NC}"
cd backend
npm install
if [ $? -ne 0 ]; then
    echo -e "${RED}✗ Erro ao instalar dependências!${NC}"
    exit 1
fi
cd ..
echo -e "${GREEN}✓ Backend pronto!${NC}"
echo ""

# 3. Informações finais
echo "════════════════════════════════════════"
echo -e "${GREEN}✓ INSTALAÇÃO CONCLUÍDA!${NC}"
echo "════════════════════════════════════════"
echo ""
echo -e "${YELLOW}PRÓXIMOS PASSOS:${NC}"
echo ""
echo "1️⃣  ABRA UM TERMINAL E INICIE O BACKEND:"
echo -e "   ${BLUE}cd backend && npm start${NC}"
echo ""
echo "2️⃣  ABRA OUTRO TERMINAL E INICIE O FRONTEND:"
echo -e "   ${BLUE}cd frontend && python -m http.server 8000${NC}"
echo "   (ou abra frontend/index.html no navegador)"
echo ""
echo "3️⃣  ACESSE NO NAVEGADOR:"
echo -e "   ${BLUE}http://localhost:8000${NC}"
echo ""
echo -e "${YELLOW}ATALHOS ÚTEIS:${NC}"
echo "  🌙 Clique o botão de tema no canto superior direito"
echo "  ⌨️  Ctrl+Enter para enviar pergunta"
echo "  🗑️  Ctrl+Shift+L para limpar histórico"
echo ""
echo -e "${YELLOW}DOCUMENTAÇÃO:${NC}"
echo "  📖 Leia WEB_README.md para detalhes completos"
echo ""
