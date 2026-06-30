# Integrar Katu Mirim 2.0 na plataforma Rendeia

Passo a passo (5 minutos) para usar a família Katu dentro da
[Rendeia](https://github.com/rendeia/arandu_nano).

## 1. Tenha a Rendeia instalada

Se ainda não tem, baixe o pacote pronto:
<https://github.com/rendeia/arandu_nano/releases/latest>

Extraia. Você vai ter uma pasta com `IA_Portatil.vbs`, `chat.html`, `llamafile.exe` etc.

## 2. Baixe o `.gguf` do Katu Mirim 2.0

- **Repo:** [unsloth/DeepSeek-R1-Distill-Qwen-1.5B-GGUF](https://huggingface.co/unsloth/DeepSeek-R1-Distill-Qwen-1.5B-GGUF)
- **Arquivo:** `DeepSeek-R1-Distill-Qwen-1.5B-Q4_K_M.gguf` (~1 GB)

Coloque o `.gguf` na **raiz da Rendeia** (mesma pasta do `IA_Portatil.vbs`).

## 3. Copie o lançador deste repo

Copie o arquivo [`Usar_Katu_Mirim.bat`](Usar_Katu_Mirim.bat) deste repositório
para a **raiz da Rendeia** (junto dos outros `Usar_*.bat`).

## 4. Adicione o Katu ao mapa de nomes da Rendeia

Abra `chat.html` da Rendeia num editor de texto. Procure por:

```js
const NOMES_MODELO={
  "Qwen_Qwen3-1.7B-Q4_K_M.gguf":"Arandu Mirim 1.1",
  ...
};
```

Adicione uma linha **dentro** do `{ }`:

```js
  "DeepSeek-R1-Distill-Qwen-1.5B-Q4_K_M.gguf":"Katu Mirim 2.0",
```

Salve o arquivo.

## 5. Use

1. Duplo clique em **`Usar_Katu_Mirim.bat`** (raiz da Rendeia) — alterna o
   modelo ativo.
2. Duplo clique em **`Desligar_IA.bat`** — encerra o servidor atual.
3. Duplo clique em **`IA_Portatil.vbs`** — sobe o Katu Mirim 2.0.

> 💡 Em **Configurações** do chat, ative o **"Modo pensador"** para ver o
> raciocínio do Katu num bloco "💭 Pensamento" colapsável.

## Voltar para o Arandu Mirim 1.1

A qualquer momento: duplo clique em **`Usar_Nano_1.1.bat`** (na raiz da
Rendeia), depois `Desligar_IA.bat` e `IA_Portatil.vbs`.
