<h1 align="center">🧠 Katu</h1>

<p align="center">
  <strong>Família G2 da <a href="https://github.com/rendeia/arandu_nano">Rendeia</a> — IA de raciocínio que roda direto no navegador via WebGPU.</strong><br>
  Zero servidor. Zero <code>.exe</code>. Sem instalar. O modelo vive no cache do seu navegador.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/licença-Apache--2.0-blue" alt="Licença Apache-2.0">
  <img src="https://img.shields.io/badge/família-G2%20Raciocínio-purple" alt="G2 Raciocínio">
  <img src="https://img.shields.io/badge/motor-WebLLM%20%2B%20WebGPU-brightgreen" alt="WebLLM">
  <img src="https://img.shields.io/badge/CPU-livre-success" alt="CPU livre">
  <img src="https://img.shields.io/badge/tamanho%20do%20app-6.4%20MB-blue" alt="Tamanho">
</p>

> **Katu** vem do tupi-guarani e significa **bom / justo / correto** — uma família
> voltada a **raciocínio, análise e resolução de problemas**.

### 🚀 Experimente sem instalar nada

👉 **[huggingface.co/spaces/rendeia/katu](https://huggingface.co/spaces/rendeia/katu)** —
abre no navegador, carrega o modelo sozinho, zero setup.

## 🔁 Duas edições da Katu

O eixo é o mesmo (**raciocínio**); muda o motor e a forma de entrega:

| Edição | Motor | Modelo | Onde / para quê |
|---|---|---|---|
| **WebGPU / browser** (este repo) | WebLLM + WebGPU (iGPU/GPU) | Llama-3.2-1B, padrão — 3B/Hermes trocáveis (MLC) | abrir 1 HTML, zero instalação — **demo/vitrine** |
| **CPU / pendrive** — *Katu Mirim 2.1* | llamafile → CPU | **Qwen3-1.7B em modo pensante** | dentro da plataforma [Rendeia/Arandu](https://github.com/rendeia/Arandu) — **uso real em pt-BR** |

A edição **CPU/pendrive (2.1)** roda no **mesmo hardware-alvo** da Rendeia (CPU, sem GPU) e tem **pt-BR bem melhor** — é a recomendada para português. A **WebGPU** brilha como demo "experimente no navegador", mas exige GPU + navegador moderno (não roda no alvo com a iGPU bloqueada).

> **Honestidade:** a Katu 2.1 (CPU) **não tem pesos próprios** — é o **Qwen3-1.7B base** rodando em *modo pensante* (`<think>`) com o system prompt do Katu. O raciocínio vem do thinking nativo do Qwen3, não de um fine-tune. Testamos o DeepSeek-R1-Distill-1.5B e **descartamos** (raciocina, mas o pt-BR sai quebrado). Um Katu com fine-tune de raciocínio pt-BR fica como evolução futura.

### Como usar a edição CPU (Katu Mirim 2.1)
1. Tenha a plataforma **[Rendeia/Arandu](https://github.com/rendeia/Arandu)** montada (llamafile + `chat.html`).
2. Faça uma **cópia** do `Qwen_Qwen3-1.7B-Q4_K_M.gguf` chamada `Katu-Qwen3-1.7B-Q4_K_M.gguf` na pasta.
3. Rode **`Usar_Katu_Mirim.bat`** → `Desligar_IA.bat` → abra pelo `IA_Portatil.vbs`.
4. O chat mostra o bloco **💭 Pensamento** sozinho — o Qwen3 pensa antes de responder.

## ⚡ WebGPU × Arandu (edição browser)

|  | **Arandu** (G1) na Rendeia | **Katu** (G2) — este repo |
|---|---|---|
| Motor | llamafile → CPU | WebLLM → **WebGPU (iGPU/GPU)** |
| Formato do modelo | GGUF | MLC (pré-compilado) |
| Processos | 2 (servidor + browser) | **1 (só o browser)** |
| Instalação | descompactar + rodar `.exe` | **abrir 1 HTML** |
| Portabilidade | pendrive completo (~1,5 GB) | **~6 MB de código** + modelo no cache do browser |
| Ideal para | conversa do dia-a-dia, resumos, tradução | **raciocínio** (matemática, lógica, análise) |
| RAM/CPU | ~1,2 GB RAM, todos os núcleos ocupados | RAM baixa, **CPU livre**, iGPU faz o trabalho |

Coexistem — use cada uma para o que ela faz melhor.

## 🚀 Como usar (3 passos)

### 1. Baixe este repo
```sh
git clone https://github.com/rendeia/Katu.git
```
Ou baixe o `.zip` em [Releases](https://github.com/rendeia/Katu/releases) e extraia.

### 2. Rode o lançador
- **Windows:** duplo clique em **`iniciar-katu.bat`**
- **Linux / macOS:** `chmod +x iniciar-katu.sh && ./iniciar-katu.sh`

> ⚠️ **Por que não abrir o `index.html` direto?** O Chrome/Edge bloqueiam o `import`
> de módulos ES em `file://` por CORS. Os lançadores sobem um mini-servidor Node
> em `http://localhost:8078` (nada é instalado — só é preciso ter o
> [Node.js](https://nodejs.org) no PC).

### 3. Pronto — carrega sozinho
- O app já abre carregando o **Llama-3.2-1B** automaticamente, sem precisar clicar em nada.
- **Primeira vez:** o navegador baixa o modelo do Hugging Face (**≈ 0,8 GB, uma vez só**). Você precisa de internet **nessa** carga.
- **Depois:** fica no cache do navegador. **Offline pra sempre**, mesmo que você tire a internet.
- Quer trocar de modelo (3B, mais qualidade; ou Hermes-3, mais raciocínio)? Tem um seletor
  ao lado da caixa de pergunta — troca a qualquer momento, sem recarregar a página.

Para encerrar: feche a janela do lançador (`Ctrl+C` no terminal).

## 🧪 O que o Katu sabe fazer

- **Raciocínio passo a passo** — modo tutor (ligado por padrão) faz o modelo pensar dentro
  de um bloco **💭 Pensamento** colapsável antes de responder.
- **Cálculo exato** — para aritmética, porcentagem, conversão, datas, o modelo escreve
  código JavaScript num bloco **🧮 Cálculo**, executado num Web Worker isolado (sem acesso
  a rede ou DOM), e usa o resultado real na resposta em vez de "chutar" de cabeça.
- **Modo deliberar** (opt-in, ~3-4x mais lento) — gera 3 rascunhos em temperaturas
  diferentes e sintetiza a melhor resposta final, mostrando as tentativas num bloco
  **🗳️ Deliberação** transparente.
- **Memória semântica** (opt-in) — guarda cada troca como embedding no IndexedDB do
  navegador e busca por similaridade as lembranças mais relevantes de conversas passadas
  antes de responder, mostradas num bloco **🧠**.
- **Constelação pulsante** — em vez de um indicador genérico de "digitando", cada token
  acende um ponto que forma uma figura relacionada a palavras-chave do seu prompt
  (matemática vira polígono, natureza vira flor, código vira circuito, história vira
  espiral, arte/música vira onda).

## 🖥️ Requisitos

- **Navegador com WebGPU:**
  - ✅ Edge / Chrome 113+ (nativo)
  - ✅ Safari 26+
  - 🟡 Firefox: ative em `about:config` → `dom.webgpu.enabled`
- **iGPU ou GPU** com driver atualizado
  - Intel: 11ª gen+ (Tiger Lake, Iris Xe) — testado, funciona muito bem
  - AMD: Zen2+ ou RDNA
  - NVIDIA: qualquer GPU recente
  - Apple: M1/M2/M3/M4
- **RAM:** ~4 GB livres (o modelo carrega na VRAM da iGPU, que compartilha memória do sistema)
- **Disco:** ~2 GB de cache do browser para o modelo

Sem WebGPU? Use o **Arandu Mirim 1.1** na plataforma [Rendeia](https://github.com/rendeia/arandu_nano) — ele roda em CPU e é mais leve.

## 📦 O que tem neste repo

```
Katu/
├── index.html            ← app único (interface + carrega o WebLLM)
├── iniciar-katu.bat      ← lançador Windows (sobe servidor local)
├── iniciar-katu.sh       ← lançador Linux/macOS
├── vendor/webllm/
│   ├── web-llm.js        ← motor MLC / WebLLM (empacotado offline)
│   └── LICENSE           ← Apache-2.0 do WebLLM
├── README.md
├── LICENSE               ← Apache-2.0
└── .gitignore
```

**Total: ~6,4 MB de código.** O modelo (~0,8-2 GB, conforme o escolhido) fica no cache do
browser, não no disco do projeto.

## 🧠 Modelos da família Katu

| Tier | Modelo | Base | Edição | Status |
|---|---|---|---|---|
| **Mirim** | **Katu Mirim 2.1** | Qwen3-1.7B (modo pensante) | **CPU/pendrive** (Rendeia) | ✅ recomendada p/ pt-BR |
| **Mirim** | Katu Mirim 2.0 | [Llama-3.2-1B](https://huggingface.co/mlc-ai/Llama-3.2-1B-Instruct-q4f16_1-MLC) (padrão) · [3B](https://huggingface.co/mlc-ai/Llama-3.2-3B-Instruct-q4f16_1-MLC) · [Hermes-3](https://huggingface.co/mlc-ai/Hermes-3-Llama-3.2-3B-q4f16_1-MLC) (MLC) | WebGPU/browser | ✅ demo — trocável no app |
| **Eté** (médio) | Katu Eté 2.x | modelo ~3B com raciocínio (a definir) | — | 🔜 planejado |
| **Guaçu** (grande) | Katu Guaçu 2.x | modelo ~7B com raciocínio (a definir) | — | 🔜 planejado |

## 🎯 Quando usar Katu em vez de Arandu?

| Você quer… | Use |
|---|---|
| Conversa do dia-a-dia, resumos, redação, tradução | **Arandu Mirim 1.2** (rápido em CPU) |
| Resolver problema passo a passo (matemática, lógica), em pt-BR | **Katu Mirim 2.1** (CPU, raciocina em português) |
| Analisar/comparar/cruzar informações | **Katu Mirim 2.1** (CPU) ou **2.0** (WebGPU) |
| Demo de raciocínio no navegador, sem instalar | **Katu Mirim 2.0** (WebGPU) |
| Máquina sem WebGPU (ex.: iGPU bloqueada) | **Katu Mirim 2.1** (CPU) ou **Arandu Mirim 1.2** |

## 🔒 Privacidade

- **100% local após a 1ª carga.** Você só toca a internet para baixar o modelo uma vez do Hugging Face.
- **Nenhuma pergunta sai do seu navegador.** Toda a inferência acontece na sua iGPU/GPU.
- Sem telemetria, sem tracking.
- Para "esquecer" o modelo: limpe os dados do site em Configurações do navegador → Privacidade.

## 🧪 Honestidade técnica

- Nenhum dos modelos (**Llama-3.2-1B/3B**, **Hermes-3-Llama-3.2-3B**) tem
  `<think>` nativo como um R1 Distill teria. O **modo tutor** (ligado por
  padrão) contorna isso injetando a instrução de pensar passo a passo no
  prompt de sistema — o bloco "💭 Pensamento" aparece porque foi pedido, não
  por um reasoning nativo do modelo.
- **Por que não o R1 Distill 1.5B?** A MLC (fornecedora dos modelos WebLLM)
  **removeu o DeepSeek-R1-Distill-Qwen-1.5B** do pré-compilado v0.2.84 por
  problema de correção reportado. Voltaremos ao R1 quando a MLC reincluir
  com fix ou quando houver equivalente.
- **pt-BR é decente**, mas o Katu Mirim 2.1 (CPU/pendrive, com imatrix pt-BR
  no Arandu) é melhor em português puro. O Katu 2.0 compensa em
  **análise / raciocínio** e velocidade na iGPU.
- O bloco **🧮 Cálculo** resolve a maior parte dos erros de aritmética, mas o
  modelo (1B/3B) ainda pode escrever código com pequenos deslizes — por
  exemplo, usar vírgula como separador decimal (hábito de pt-BR) dentro do
  JavaScript, o que quebra a execução. Quando isso acontece, o erro aparece
  no próprio bloco (não trava o app) e o modelo tenta de novo.
- A **primeira geração** de tokens depois de carregar é ~2s mais lenta
  (compilação de shaders WebGPU). Depois, fluído.
- Modelo fica em **VRAM enquanto a aba estiver aberta**. Fechar a aba libera.
  Não tem "sleep-idle" como o llamafile.

## 🛣️ Próximas evoluções

- **Fine-tune próprio** em corpus pt-BR de raciocínio
- **Katu Eté 2.x** — versão média (~3B) quando aparecer modelo compatível com MLC
- **PWA** (Progressive Web App) — instalar como app

## 📜 Licença e créditos

| Componente | Autor | Licença |
|---|---|---|
| **Llama-3.2-1B/3B-Instruct** (padrão/opcional) | Meta | Llama 3.2 Community License |
| **Hermes-3-Llama-3.2-3B** (opcional) | NousResearch | Llama 3.2 Community License |
| **WebLLM / MLC-LLM** (motor) | MLC.ai / CMU / Shanghai Jiao Tong | Apache-2.0 |
| **Katu** (este repo) | celionormando | Apache-2.0 |

> **Sobre a licença do Llama:** a Llama 3.2 Community License permite uso
> comercial e redistribuição com atribuição. Os modelos são servidos direto do
> Hugging Face ([mlc-ai/Llama-3.2-1B-Instruct-q4f16_1-MLC](https://huggingface.co/mlc-ai/Llama-3.2-1B-Instruct-q4f16_1-MLC)
> e variantes) — este projeto apenas linka; nada é redistribuído aqui.

Código deste repositório: **Apache-2.0** (ver `LICENSE`).

---

<p align="center"><sub>Família <strong>Katu</strong> · parte da <strong><a href="https://github.com/rendeia/arandu_nano">Rendeia</a></strong> — famílias de IA portátil, uma para cada trabalho</sub></p>
