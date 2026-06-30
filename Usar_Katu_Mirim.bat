@echo off
REM ============================================================
REM  Katu Mirim 2.0  (Familia G2 da Rendeia - Raciocinio)
REM
REM  Modelo: DeepSeek-R1-Distill-Qwen-1.5B
REM  Foco:   pensar antes de responder (matematica, logica, analise)
REM  RAM:    ~1.2 GB (mesmo porte do Arandu Mirim 1.1)
REM  Voz:    /no_think NAO se aplica (modelo nao e Qwen3) - vai sempre
REM          gerar <think>...</think>. Combine com "Modo pensador" em
REM          Configuracoes para ver o raciocinio no chat (colapsavel).
REM
REM  Este .bat deve estar na RAIZ da plataforma Rendeia (mesmo lugar
REM  do IA_Portatil.vbs). O .gguf tambem deve estar na raiz.
REM  Veja integrar-rendeia.md neste repo para o passo a passo.
REM
REM  Por que e mais LENTO que o Arandu Mirim:
REM  - Antes de responder, escreve um bloco de raciocinio interno.
REM  - Ideal para problemas dificeis; para conversa do dia-a-dia
REM    prefira o Arandu Mirim 1.1 (Usar_Nano_1.1.bat na plataforma).
REM ============================================================
cd /d "%~dp0"
if not exist "DeepSeek-R1-Distill-Qwen-1.5B-Q4_K_M.gguf" (
  echo Arquivo DeepSeek-R1-Distill-Qwen-1.5B-Q4_K_M.gguf nao encontrado.
  echo.
  echo Baixe em:
  echo   https://huggingface.co/unsloth/DeepSeek-R1-Distill-Qwen-1.5B-GGUF
  echo Coloque o arquivo Q4_K_M na raiz da plataforma Rendeia (mesmo lugar deste .bat).
  pause
  exit /b 1
)
echo DeepSeek-R1-Distill-Qwen-1.5B-Q4_K_M.gguf> modelo.txt
echo Modelo ativo agora: Katu Mirim 2.0 (raciocinio destilado).
echo Feche a IA (Desligar_IA.bat) e abra de novo para aplicar.
timeout /t 3 /nobreak >nul
