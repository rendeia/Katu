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
> voltada a **raciocínio, análise e resolução de problemas**. Diferente da família
> Arandu (que roda em CPU pelo llamafile), o Katu usa **WebLLM + WebGPU** e roda
> **direto na sua iGPU/GPU**, sem processo de servidor.

## ⚡ O que muda em relação ao Arandu

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

### 3. Clique em "Carregar modelo"
- **Primeira vez:** o navegador baixa o modelo do Hugging Face (**≈ 2 GB, uma vez só**). Você precisa de internet **nessa** carga.
- **Depois:** fica no cache do navegador. **Offline pra sempre**, mesmo que você tire a internet.

Pronto — chat pronto pra usar. Se você pedir "pense passo a passo", o raciocínio pode aparecer num bloco **💭 Pensamento** colapsável.

Para encerrar: feche a janela do lançador (`Ctrl+C` no terminal).

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

**Total: ~6,4 MB de código.** O modelo (~2 GB) fica no cache do browser, não no disco do projeto.

## 🧠 Modelos da família Katu

| Tier | Modelo | Base | Status |
|---|---|---|---|
| **Mirim** (pequeno) | Katu Mirim 2.0 | [mlc-ai/Llama-3.2-3B-Instruct-q4f16_1-MLC](https://huggingface.co/mlc-ai/Llama-3.2-3B-Instruct-q4f16_1-MLC) | ✅ disponível |
| **Eté** (médio) | Katu Eté 2.x | modelo ~3B com raciocínio (a definir) | 🔜 planejado |
| **Guaçu** (grande) | Katu Guaçu 2.x | modelo ~7B com raciocínio (a definir) | 🔜 planejado |

## 🎯 Quando usar Katu em vez de Arandu?

| Você quer… | Use |
|---|---|
| Conversa do dia-a-dia, resumos, redação, tradução | **Arandu Mirim 1.1** (rápido em CPU) |
| Resolver problema passo a passo (matemática, lógica) | **Katu Mirim 2.0** (raciocina) |
| Analisar/comparar/cruzar informações | **Katu Mirim 2.0** |
| Explicar "por quê" / depurar situação | **Katu Mirim 2.0** |
| Máquina antiga sem WebGPU | **Arandu Mirim 1.1** |

## 🔒 Privacidade

- **100% local após a 1ª carga.** Você só toca a internet para baixar o modelo uma vez do Hugging Face.
- **Nenhuma pergunta sai do seu navegador.** Toda a inferência acontece na sua iGPU/GPU.
- Sem telemetria, sem tracking.
- Para "esquecer" o modelo: limpe os dados do site em Configurações do navegador → Privacidade.

## 🧪 Honestidade técnica

- O **Llama-3.2-3B-Instruct** é um modelo instruct competente, mas **não tem
  `<think>` nativo** como um R1 Distill teria. O bloco "💭 Pensamento"
  colapsável no chat só aparece quando o modelo produz `<think>...</think>` —
  aqui isso acontece só se você **pedir explicitamente** "pense passo a passo
  antes de responder".
- **Por que não o R1 Distill 1.5B?** A MLC (fornecedora dos modelos WebLLM)
  **removeu o DeepSeek-R1-Distill-Qwen-1.5B** do pré-compilado v0.2.84 por
  problema de correção reportado. Trocamos para Llama-3.2-3B (oficialmente
  suportado, sem risco de saída errada). Voltaremos ao R1 quando a MLC
  reincluir com fix ou quando houver equivalente.
- **pt-BR é decente**, mas o Arandu Mirim 1.1 (com imatrix pt-BR) é melhor em
  português puro. O Katu compensa em **análise / raciocínio** e velocidade na
  iGPU.
- A **primeira geração** de tokens depois de carregar é ~2s mais lenta
  (compilação de shaders WebGPU). Depois, fluído.
- Modelo fica em **VRAM enquanto a aba estiver aberta**. Fechar a aba libera.
  Não tem "sleep-idle" como o llamafile.

## 🛣️ Próximas evoluções

- **Persistir histórico** de conversas em `localStorage`
- **Fine-tune próprio** em corpus pt-BR de raciocínio
- **Katu Eté 2.x** — versão média (~3B) quando aparecer modelo compatível com MLC
- **Modo memória** semelhante ao da Rendeia (perfil + itens sob demanda)
- **PWA** (Progressive Web App) — instalar como app

## 📜 Licença e créditos

| Componente | Autor | Licença |
|---|---|---|
| **Llama-3.2-3B-Instruct** (modelo atual) | Meta | Llama 3.2 Community License |
| **WebLLM / MLC-LLM** (motor) | MLC.ai / CMU / Shanghai Jiao Tong | Apache-2.0 |
| **Katu** (este repo) | celionormando | Apache-2.0 |

> **Sobre a licença do Llama:** a Llama 3.2 Community License permite uso
> comercial e redistribuição com atribuição. O modelo é servido do repo
> [mlc-ai/Llama-3.2-3B-Instruct-q4f16_1-MLC](https://huggingface.co/mlc-ai/Llama-3.2-3B-Instruct-q4f16_1-MLC)
> — este projeto apenas linka; nada é redistribuído aqui.

Código deste repositório: **Apache-2.0** (ver `LICENSE`).

---

<p align="center"><sub>Família <strong>Katu</strong> · parte da <strong><a href="https://github.com/rendeia/arandu_nano">Rendeia</a></strong> — famílias de IA portátil, uma para cada trabalho</sub></p>
