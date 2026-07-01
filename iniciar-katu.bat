@echo off
REM ============================================================
REM  Katu Mirim 2.0 - lancador local (Windows)
REM
REM  Por que precisa deste .bat em vez de abrir o index.html direto?
REM  Ao abrir o index.html por file://, o Chrome/Edge bloqueiam o
REM  import de modulos ES (./vendor/webllm/web-llm.js) por CORS.
REM  A solucao e' servir os arquivos por http://localhost.
REM
REM  Este .bat sobe um mini-servidor Node (nada e instalado),
REM  abre o navegador padrao em http://localhost:8078 e fica
REM  rodando ate voce fechar esta janela.
REM
REM  Pre-requisito: Node.js instalado no PC (node --version).
REM  Se voce ainda nao tem, baixe em https://nodejs.org
REM ============================================================
cd /d "%~dp0"

where node >nul 2>&1
if errorlevel 1 (
  echo.
  echo Node.js nao encontrado.
  echo Baixe e instale em: https://nodejs.org  ^(versao LTS^)
  echo Depois rode este .bat de novo.
  pause
  exit /b 1
)

REM Abre o navegador padrao (o servidor abaixo servira o index.html)
start "" "http://localhost:8078"

REM Servidor HTTP minimo em Node — serve os arquivos deste diretorio
REM com os cabecalhos COOP/COEP que o WebLLM/WebGPU precisam.
node -e "const http=require('http'),fs=require('fs'),p=require('path');const root=process.cwd();http.createServer((q,s)=>{let u=decodeURIComponent(q.url.split('?')[0]);if(u==='/'||u==='')u='/index.html';const f=p.join(root,u);fs.stat(f,(er,st)=>{if(er||!st.isFile()){s.writeHead(404);return s.end('nao encontrado');}fs.readFile(f,(e,d)=>{if(e){s.writeHead(500);return s.end('erro');}const ext=p.extname(f).toLowerCase();const ct={'.html':'text/html; charset=utf-8','.js':'text/javascript; charset=utf-8','.mjs':'text/javascript; charset=utf-8','.css':'text/css; charset=utf-8','.wasm':'application/wasm','.json':'application/json','.svg':'image/svg+xml','.png':'image/png','.jpg':'image/jpeg','.ico':'image/x-icon'}[ext]||'application/octet-stream';s.writeHead(200,{'Content-Type':ct,'Cross-Origin-Opener-Policy':'same-origin','Cross-Origin-Embedder-Policy':'require-corp','Cross-Origin-Resource-Policy':'cross-origin','Cache-Control':'no-cache'});s.end(d);});});}).listen(8078,()=>console.log('Katu servindo em http://localhost:8078  (Ctrl+C para encerrar)'));"
