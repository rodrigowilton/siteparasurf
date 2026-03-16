#!/bin/bash
# =============================================
# Deploy Landing — Instituto ParaSurf
# Domínio: parasurf.streetonline.com.br
# Porta: 3016
# =============================================
set -e

echo "🏄 Deploy Landing Page ParaSurf..."

# 1. Instalar dependências
echo "📦 Instalando serve..."
npm install

# 2. Copiar para pasta de produção
echo "📁 Copiando arquivos..."
sudo mkdir -p /var/www/parasurf-landing
sudo cp index.html /var/www/parasurf-landing/
sudo cp package.json /var/www/parasurf-landing/
cd /var/www/parasurf-landing && sudo npm install --production

# 3. Criar logs PM2
sudo mkdir -p /var/log/pm2

# 4. Configurar Nginx
echo "⚙️  Configurando Nginx..."
sudo cp nginx/parasurf-landing.conf /etc/nginx/sites-available/parasurf-landing
sudo ln -sf /etc/nginx/sites-available/parasurf-landing /etc/nginx/sites-enabled/parasurf-landing
sudo nginx -t && sudo systemctl reload nginx

# 5. Iniciar com PM2
echo "🚀 Iniciando PM2..."
pm2 delete parasurf-landing 2>/dev/null || true
pm2 start pm2/ecosystem.config.js
pm2 save

echo ""
echo "✅ Landing page no ar!"
echo "🌐 http://parasurf.streetonline.com.br"
echo "🔧 Local: http://localhost:3016"
echo ""
echo "👉 Para HTTPS:"
echo "   sudo certbot --nginx -d parasurf.streetonline.com.br"
echo ""
echo "📞 Suporte: +55 27 98866-8868"
