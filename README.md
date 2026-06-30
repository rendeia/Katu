<h1 align="center">🧠 Katu</h1>

<p align="center">
  <strong>Família G2 da <a href="https://github.com/rendeia/arandu_nano">Rendeia</a> — modelos de raciocínio em CPU, portáteis.</strong><br>
  Pensam antes de responder. Mesma RAM do Arandu Mirim 1.1.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/licença-Apache--2.0-blue" alt="Licença Apache-2.0">
  <img src="https://img.shields.io/badge/familia-G2%20Raciocínio-purple" alt="G2 Raciocínio">
  <img src="https://img.shields.io/badge/CPU-only-success" alt="CPU-only">
  <img src="https://img.shields.io/badge/RAM-~1.2%20GB-success" alt="RAM">
</p>

> **Katu** vem do tupi-guarani e significa **bom / justo / correto** — uma família
> de modelos que **pensam antes de responder**, gerando um bloco interno de
> raciocínio (`<think>...</think>`) antes da resposta final. Voltada a tarefas que
> precisam de análise: matemática, lógica, depuração passo a passo, cruzamento
> de dados.

## Modelos da família

| Tier | Modelo | Base | RAM | Status |
|---|---|---|---|---|
| **Mirim** (pequeno) | **Katu Mirim 2.0** | DeepSeek-R1-Distill-Qwen-1.5B | ~1,2 GB | ✅ disponível |
| **Eté** (médio) | Katu Eté 2.x | a definir (~3–4B com raciocínio) | ~2,5 GB | 🔜 planejado |
| **Guaçu** (grande) | Katu Guaçu 2.x | a definir (~7B com raciocínio) | ~4,5 GB | 🔜 planejado |

## Como usar (com a plataforma Rendeia)

Esta família roda **dentro da plataforma Rendeia** ([rendeia/arandu_nano](https://github.com/rendeia/arandu_nano)) — não é um produto autônomo. Siga 3 passos:

### 1. Tenha a plataforma Rendeia instalada
Se ainda não tem, baixe e descompacte:
<https://github.com/rendeia/arandu_nano/releases/latest>

### 2. Baixe o `.gguf` do Katu Mirim 2.0 (~1 GB)
Do Hugging Face:
👉 [unsloth/DeepSeek-R1-Distill-Qwen-1.5B-GGUF](https://huggingface.co/unsloth/DeepSeek-R1-Distill-Qwen-1.5B-GGUF) — escolha `DeepSeek-R1-Distill-Qwen-1.5B-Q4_K_M.gguf`

Coloque na **raiz** da pasta Rendeia (mesmo lugar do `IA_Portatil.vbs`).

### 3. Copie o lançador e o mapa para a plataforma
Os dois arquivos abaixo precisam ir para a raiz da plataforma:

- **[`Usar_Katu_Mirim.bat`](Usar_Katu_Mirim.bat)** — define o `.gguf` do Katu como ativo
- **[`integrar-rendeia.md`](integrar-rendeia.md)** — passo a passo da integração (1 edição em `chat.html` adicionando o Katu ao `NOMES_MODELO`)

Pronto. Duplo clique no `.bat`, depois reabra com `Iniciar_Arandu.vbs`.

> 💡 **Combo recomendado:** em Configurações, ative o **"Modo pensador"** antes
> de testar. Assim você vê o raciocínio do Katu num bloco "💭 Pensamento"
> colapsável (já implementado na Rendeia).

## Quando usar Katu Mirim em vez do Arandu Mirim?

| Você quer… | Use |
|---|---|
| Conversa do dia-a-dia, resumos, redação, tradução | **Arandu Mirim 1.1** (mais rápido) |
| Resolver um problema passo a passo (matemática, lógica) | **Katu Mirim 2.0** |
| Analisar/cruzar várias informações | **Katu Mirim 2.0** |
| Explicação "por quê" / depuração | **Katu Mirim 2.0** |
| Resposta instantânea | **Arandu Mirim 1.1** |

Os dois **coexistem** — você alterna pelos `.bat` na raiz da plataforma.

## Honestidade técnica

- Katu Mirim 2.0 é **destilação** do DeepSeek R1 em Qwen-1.5B — não é fine-tune próprio (ainda).
- O Distill não tem imatrix pt-BR (planejado).
- **pt-BR é decente, mas inferior ao Arandu Mirim 1.1** (que tem imatrix pt-BR). O Katu brilha em **raciocínio**, especialmente em inglês/matemática/código.
- Por gerar tokens de raciocínio antes da resposta, é **~2-3x mais lento** que o Arandu Mirim 1.1 em respostas curtas.

## Próximas evoluções (família Katu)

- **Imatrix pt-BR para Katu Mirim 2.0** — adaptar [`regenerar_nano_1.2.ps1`](https://github.com/rendeia/arandu_nano/blob/main/treino/imatrix/regenerar_nano_1.2.ps1) da plataforma
- **Katu Eté 2.x** — versão ~3B com raciocínio mais robusto (se cabível em CPU+USB)
- **Dataset pt-BR de raciocínio** — para fine-tune próprio
- **Notebook de fine-tune** — adaptar do `treino/` da plataforma

## Licença e créditos

| Componente | Autor | Licença |
|---|---|---|
| **DeepSeek R1 Distill Qwen 1.5B** (base) | DeepSeek-AI | MIT |
| **Qwen 1.5B** (base da base) | Alibaba Cloud | Apache-2.0 |
| **Rendeia** (plataforma) | celionormando | Apache-2.0 |

Código deste repositório: **Apache-2.0**.

---

<p align="center"><sub>Família <strong>Katu</strong> · parte da <strong><a href="https://github.com/rendeia/arandu_nano">Rendeia</a></strong> — IA portátil em CPU, offline, no pendrive</sub></p>
