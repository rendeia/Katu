#!/usr/bin/env sh
# ============================================================
#  Katu Mirim 2.0 - lançador local (Linux/macOS)
#  Sobe um servidor Node mínimo em http://localhost:8078 e
#  abre o navegador. Precisa de Node.js instalado.
# ============================================================
set -eu
cd "$(dirname "$0")"

if ! command -v node >/dev/null 2>&1; then
  echo "Node.js não encontrado. Instale em https://nodejs.org (LTS)."
  exit 1
fi

# Abre o navegador padrão
URL="http://localhost:8078"
( sleep 1
  if command -v xdg-open >/dev/null 2>&1; then xdg-open "$URL"
  elif command -v open >/dev/null 2>&1; then open "$URL"
  else echo "Abra no navegador: $URL"
  fi
) &

# Servidor HTTP mínimo com cabeçalhos COOP/COEP (obrigatórios pro WebLLM)
exec node -e "const http=require('http'),fs=require('fs'),p=require('path');const root=process.cwd();http.createServer((q,s)=>{let u=decodeURIComponent(q.url.split('?')[0]);if(u==='/'||u==='')u='/index.html';const f=p.join(root,u);fs.stat(f,(er,st)=>{if(er||!st.isFile()){s.writeHead(404);return s.end('nao encontrado');}fs.readFile(f,(e,d)=>{if(e){s.writeHead(500);return s.end('erro');}const ext=p.extname(f).toLowerCase();const ct={'.html':'text/html; charset=utf-8','.js':'text/javascript; charset=utf-8','.mjs':'text/javascript; charset=utf-8','.css':'text/css; charset=utf-8','.wasm':'application/wasm','.json':'application/json','.svg':'image/svg+xml','.png':'image/png','.jpg':'image/jpeg','.ico':'image/x-icon'}[ext]||'application/octet-stream';s.writeHead(200,{'Content-Type':ct,'Cross-Origin-Opener-Policy':'same-origin','Cross-Origin-Embedder-Policy':'require-corp','Cross-Origin-Resource-Policy':'cross-origin','Cache-Control':'no-cache'});s.end(d);});});}).listen(8078,()=>console.log('Katu servindo em http://localhost:8078  (Ctrl+C para encerrar)'));"
