# DeepSeek-R1
<!-- markdownlint-disable first-line-h1 -->
<!-- markdownlint-disable html -->
<!-- markdownlint-disable no-duplicate-header -->

<div align="center">
 <img src="https://github.com/deepseek-ai/DeepSeek-V2/blob/main/figures/logo.svg?raw=true" width="60%"alt="DeepSeek-V3" />
</div> 
<hr> 
<div align="center" style="line-height: 1;"> 
  <a href="https://www.deepseek.com/" target="_blank" style="margin: 2px;"> 
    <img alt="Página inicial" src="https://github.com/deepseek-ai/DeepSeek-V2/blob/main/figures/badge.svg?raw=true" style="display: inline-block; vertical-align: middle;"/>
    </a> 
    <a href="https://chat.deepseek.com/" target="_blank" style="margin: 2px;"> 
      <img alt="Chat" src="https://img.shields.io/badge/🤖%20Chat-DeepSeek%20R1-536af5?color=536af5&logoColor=white" style="display: inline-block; vertical-align: middle;"/> 
    </a> 
    <a href="https://huggingface.co/deepseek-ai" target="_blank" style="margin: 2px;"> 
      <img alt="Hugging Face" src="https://img.shields.io/badge/%F0%9F%A4%97%20Hugging%20Face-DeepSeek%20AI-ffc107?color=ffc107&logoColor=white" style="display: inline-block; vertical-align: middle;"/> 
    </a> 
</div>

<div align="center" style="line-height: 1;"> 
  <a href="https://discord.gg/Tc7c45Zzu5" target="_blank" style="margin: 2px;"> 
    <img alt="Discord" src="https://img.shields.io/badge/Discord-DeepSeek%20AI-7289da?logo=discord&logoColor=white&color=7289da" style="display: inline-block; vertical-align: middle;"/> 
  </a> 
  <a href="https://github.com/deepseek-ai/DeepSeek-V2/blob/main/figures/qr.jpeg?raw=true" target="_blank" style="margin: 2px;"> 
  <img alt="Wechat" src="https://img.shields.io/badge/WeChat-DeepSeek%20AI-brightgreen?logo=wechat&logoColor=white" style="display: inline-block; vertical-align: middle;"/> 
  </a> 
  <a href="https://twitter.com/deepseek_ai" target="_blank" style="margin: 2px;"> 
  <img alt="Twitter Follow" src="https://img.shields.io/badge/Twitter-deepseek_ai-white?logo=x&logoColor=white" style="display: inline-block; vertical-align: middle;"/> 
  </a> 
</div>

<div align="center" style="line-height: 1;"> <a href="https://github.com/deepseek-ai/DeepSeek-R1/blob/main/LICENSE" style="margin: 2px;"> 
  <img alt="Licença" src="https://img.shields.io/badge/Licença-MIT-f5de53?&color=f5de53" style="display: inline-block; vertical-align: middle;"/> 
    </a> 
</div>

<p align="center"> 
  <a href="https://github.com/deepseek-ai/DeepSeek-R1/blob/main/DeepSeek_R1.pdf"><b>Link do Artigo</b>👁️</a>
</p>

<p align="center"> 
  <b> Inglês </b> | <b><a href="https://github.com/deepseek-ai/DeepSeek-R1/blob/main/i18n/README_pt-BR.md">Português</a></b> 
</p>


## 1. Introdução

Apresentamos nossos modelos de raciocínio de primeira geração, DeepSeek-R1-Zero e DeepSeek-R1.
DeepSeek-R1-Zero, um modelo treinado por meio de aprendizado por reforço em larga escala (RL) sem ajuste fino supervisionado (SFT) como uma etapa preliminar, demonstrou desempenho notável em raciocínio.
Com RL, o DeepSeek-R1-Zero emergiu naturalmente com diversos comportamentos de raciocínio poderosos e interessantes.
No entanto, o DeepSeek-R1-Zero enfrenta desafios como repetição interminável, baixa legibilidade e mistura de idiomas. Para resolver esses problemas e aprimorar ainda mais o desempenho do raciocínio,
introduzimos o DeepSeek-R1, que incorpora dados de cold-start antes do RL.
O DeepSeek-R1 alcança desempenho comparável ao OpenAI-o1 em tarefas de matemática, código e raciocínio.
Para apoiar a comunidade de pesquisa, disponibilizamos o código-fonte do DeepSeek-R1-Zero, DeepSeek-R1 e seis modelos densos destilados do DeepSeek-R1 com base em Llama e Qwen. O DeepSeek-R1-Distill-Qwen-32B supera o OpenAI-o1-mini em vários benchmarks, alcançando novos resultados state-of-the-art para modelos densos.

**NOTA: Antes de executar os modelos da série DeepSeek-R1 localmente, recomendamos a leitura da seção [Recomendações de Uso](#usage-recommendations).**

<p align="center"> 
  <img width="80%" src="figures/benchmark.jpg"> 
</p>

## 2. Resumo do Modelo

---

**Pós-Treinamento: Aprendizado por Reforço em Larga Escala no Modelo Base**

- Aplicamos diretamente o aprendizado por reforço (RL) ao modelo base sem depender do ajuste fino supervisionado (SFT) como uma etapa preliminar. Essa abordagem permite que o modelo explore a cadeia de pensamento (CoT) para resolver problemas complexos, resultando no desenvolvimento do DeepSeek-R1-Zero. O DeepSeek-R1-Zero demonstra capacidades como autoverificação, reflexão e geração de longas CoTs, marcando um marco significativo para a comunidade de pesquisa. Notavelmente, é a primeira pesquisa aberta a validar que as capacidades de raciocínio de LLMs podem ser incentivadas puramente por meio de RL, sem a necessidade de SFT. Esse avanço abre caminho para futuros progressos nessa área.

- Introduzimos nosso pipeline para desenvolver o DeepSeek-R1. O pipeline incorpora dois estágios de RL com o objetivo de descobrir padrões de raciocínio aprimorados e alinhar-se com as preferências humanas, bem como dois estágios de SFT que servem como a semente para as capacidades de raciocínio e não raciocínio do modelo.
Acreditamos que o pipeline beneficiará a indústria ao criar modelos melhores.

---

**Destilação: Modelos Menores Também Podem Ser Poderosos**

- Demonstramos que os padrões de raciocínio de modelos maiores podem ser destilados em modelos menores, resultando em um desempenho melhor em comparação com os padrões de raciocínio descobertos por meio de RL em modelos pequenos. O código-fonte aberto do DeepSeek-R1, bem como sua API, beneficiará a comunidade de pesquisa para destilar modelos menores melhores no futuro.
- Usando os dados de raciocínio gerados pelo DeepSeek-R1, ajustamos finamente vários modelos densos que são amplamente usados na comunidade de pesquisa. Os resultados da avaliação demonstram que os modelos densos menores destilados têm um desempenho excepcional em benchmarks. Disponibilizamos à comunidade checkpoints destilados de 1.5B, 7B, 8B, 14B, 32B e 70B com base nas séries Qwen2.5 e Llama3.

## 3. Download dos Modelos

### Modelos DeepSeek-R1

<div align="center">

| **Modelo** | **#Total de Parâmetros** | **#Parâmetros Ativados** | **Comprimento do Contexto** | **Download** |
| :------------: | :------------: | :------------: | :------------: | :------------: |
| DeepSeek-R1-Zero | 671B | 37B | 128K   | [🤗 HuggingFace](https://huggingface.co/deepseek-ai/DeepSeek-R1-Zero)   |
| DeepSeek-R1   | 671B | 37B |  128K   | [🤗 HuggingFace](https://huggingface.co/deepseek-ai/DeepSeek-R1)   |

</div>

DeepSeek-R1-Zero e DeepSeek-R1 são treinados com base no DeepSeek-V3-Base.
Para mais detalhes sobre a arquitetura do modelo, consulte o repositório [DeepSeek-V3](https://github.com/deepseek-ai/DeepSeek-V3).

### Modelos DeepSeek-R1-Distill

<div align="center">

| **Modelo** | **Modelo Base** | **Download** |
| :------------: | :------------: | :------------: |
| DeepSeek-R1-Distill-Qwen-1.5B  | [Qwen2.5-Math-1.5B](https://huggingface.co/Qwen/Qwen2.5-Math-1.5B) | [🤗 HuggingFace](https://huggingface.co/deepseek-ai/DeepSeek-R1-Distill-Qwen-1.5B)   |
| DeepSeek-R1-Distill-Qwen-7B  | [Qwen2.5-Math-7B](https://huggingface.co/Qwen/Qwen2.5-Math-7B) | [🤗 HuggingFace](https://huggingface.co/deepseek-ai/DeepSeek-R1-Distill-Qwen-7B)   |
| DeepSeek-R1-Distill-Llama-8B  | [Llama-3.1-8B](https://huggingface.co/meta-llama/Llama-3.1-8B) | [🤗 HuggingFace](https://huggingface.co/deepseek-ai/DeepSeek-R1-Distill-Llama-8B)   |
| DeepSeek-R1-Distill-Qwen-14B   | [Qwen2.5-14B](https://huggingface.co/Qwen/Qwen2.5-14B) | [🤗 HuggingFace](https://huggingface.co/deepseek-ai/DeepSeek-R1-Distill-Qwen-14B)   |
|DeepSeek-R1-Distill-Qwen-32B  | [Qwen2.5-32B](https://huggingface.co/Qwen/Qwen2.5-32B) | [🤗 HuggingFace](https://huggingface.co/deepseek-ai/DeepSeek-R1-Distill-Qwen-32B)   |
| DeepSeek-R1-Distill-Llama-70B  | [Llama-3.3-70B-Instruct](https://huggingface.co/meta-llama/Llama-3.3-70B-Instruct) | [🤗 HuggingFace](https://huggingface.co/deepseek-ai/DeepSeek-R1-Distill-Llama-70B)   |

</div>

Os modelos DeepSeek-R1-Distill são ajustados com base em modelos de código aberto, utilizando amostras geradas pelo DeepSeek-R1.
Fizemos pequenas alterações em suas configurações e tokenizadores. Por favor, use nossas configurações para executar esses modelos.

## 4. Resultados da Avaliação

### Avaliação do DeepSeek-R1
 Para todos os nossos modelos, o comprimento máximo de geração é definido como 32.768 tokens. Para benchmarks que exigem amostragem, usamos uma temperatura de $0,6, um valor top-p de $0,95 e geramos 64 respostas por consulta para estimar pass@1.
<div align="center">


| Categoria | Benchmark (Métrica) | Claude-3.5-Sonnet-1022 | GPT-4o 0513 | DeepSeek V3 | OpenAI o1-mini | OpenAI o1-1217 | DeepSeek R1 |
|----------|-------------------|----------------------|------------|--------------|----------------|------------|--------------|
| | Arquitetura | - | - | MoE | - | - | MoE |
| | # Parâmetros Ativados | - | - | 37B | - | - | 37B |
| | # Total de Parâmetros | - | - | 671B | - | - | 671B |
| Inglês | MMLU (Pass@1) | 88.3 | 87.2 | 88.5 | 85.2 | **91.8** | 90.8 |
| | MMLU-Redux (EM) | 88.9 | 88.0 | 89.1 | 86.7 | - | **92.9** |
| | MMLU-Pro (EM) | 78.0 | 72.6 | 75.9 | 80.3 | - | **84.0** |
| | DROP (3-shot F1) | 88.3 | 83.7 | 91.6 | 83.9 | 90.2 | **92.2** |
| | IF-Eval (Prompt Strict) | **86.5** | 84.3 | 86.1 | 84.8 | - | 83.3 |
| | GPQA-Diamond (Pass@1) | 65.0 | 49.9 | 59.1 | 60.0 | **75.7** | 71.5 |
| | SimpleQA (Correto) | 28.4 | 38.2 | 24.9 | 7.0 | **47.0** | 30.1 |
| | FRAMES (Acc.) | 72.5 | 80.5 | 73.3 | 76.9 | - | **82.5** |
| | AlpacaEval2.0 (LC-winrate) | 52.0 | 51.1 | 70.0 | 57.8 | - | **87.6** |
| | ArenaHard (GPT-4-1106) | 85.2 | 80.4 | 85.5 | 92.0 | - | **92.3** |
| Código | LiveCodeBench (Pass@1-COT) | 33.8 | 34.2 | - | 53.8 | 63.4 | **65.9** |
| | Codeforces (Percentile) | 20.3 | 23.6 | 58.7 | 93.4 | **96.6** | 96.3 |
| | Codeforces (Rating) | 717 | 759 | 1134 | 1820 | **2061** | 2029 |
| | SWE Verified (Resolvido) | **50.8** | 38.8 | 42.0 | 41.6 | 48.9 | 49.2 |
| | Aider-Polyglot (Acc.) | 45.3 | 16.0 | 49.6 | 32.9 | **61.7** | 53.3 |
| Math | AIME 2024 (Pass@1) | 16.0 | 9.3 | 39.2 | 63.6 | 79.2 | **79.8** |
| | MATH-500 (Pass@1) | 78.3 | 74.6 | 90.2 | 90.0 | 96.4 | **97.3** |
| | CNMO 2024 (Pass@1) | 13.1 | 10.8 | 43.2 | 67.6 | - | **78.8** |
| Chinese | CLUEWSC (EM) | 85.4 | 87.9 | 90.9 | 89.9 | - | **92.8** |
| | C-Eval (EM) | 76.7 | 76.0 | 86.5 | 68.9 | - | **91.8** |
| | C-SimpleQA (Correto) | 55.4 | 58.7 | **68.0** | 40.3 | - | 63.7 |

</div>


### Avaliação dos Modelos Destilados


<div align="center">

| Modelo                                    | AIME 2024 pass@1 | AIME 2024 cons@64 | MATH-500 pass@1 | GPQA Diamond pass@1 | LiveCodeBench pass@1 | CodeForces rating |
|------------------------------------------|------------------|-------------------|-----------------|----------------------|----------------------|-------------------|
| GPT-4o-0513                          | 9.3              | 13.4              | 74.6            | 49.9                 | 32.9                 | 759               |
| Claude-3.5-Sonnet-1022             | 16.0             | 26.7                 | 78.3            | 65.0                 | 38.9                 | 717               |
| o1-mini                              | 63.6             | 80.0              | 90.0            | 60.0                 | 53.8                 | **1820**          |
| QwQ-32B-Preview                              | 44.0             | 60.0                 | 90.6            | 54.5               | 41.9                 | 1316              |
| DeepSeek-R1-Distill-Qwen-1.5B       | 28.9             | 52.7              | 83.9            | 33.8                 | 16.9                 | 954               |
| DeepSeek-R1-Distill-Qwen-7B          | 55.5             | 83.3              | 92.8            | 49.1                 | 37.6                 | 1189              |
| DeepSeek-R1-Distill-Qwen-14B         | 69.7             | 80.0              | 93.9            | 59.1                 | 53.1                 | 1481              |
| DeepSeek-R1-Distill-Qwen-32B        | **72.6**         | 83.3              | 94.3            | 62.1                 | 57.2                 | 1691              |
| DeepSeek-R1-Distill-Llama-8B         | 50.4             | 80.0              | 89.1            | 49.0                 | 39.6                 | 1205              |
| DeepSeek-R1-Distill-Llama-70B        | 70.0             | **86.7**          | **94.5**        | **65.2**             | **57.5**             | 1633              |

</div>


## 5. Site de Chat e Plataforma de API
Você pode conversar com o DeepSeek-R1 no site oficial da DeepSeek: [chat.deepseek.com](https://chat.deepseek.com), e ativar o botão "DeepThink".

Também fornecemos uma API compatível com OpenAI na Plataforma DeepSeek: [platform.deepseek.com](https://platform.deepseek.com/)

## 6. Como Executar Localmente

### Modelos DeepSeek-R1

Visite o repositório [DeepSeek-V3](https://github.com/deepseek-ai/DeepSeek-V3) para mais informações sobre como executar o DeepSeek-R1 localmente.

***NOTA: O suporte direto ao Hugging Face's Transformers ainda não está disponível.***

### Modelos DeepSeek-R1-Distill

Os modelos DeepSeek-R1-Distill podem ser utilizados da mesma forma que os modelos Qwen ou Llama.

Por exemplo, você pode facilmente iniciar um serviço usando [vLLM](https://github.com/vllm-project/vllm):

```shell
vllm serve deepseek-ai/DeepSeek-R1-Distill-Qwen-32B --tensor-parallel-size 2 --max-model-len 32768 --enforce-eager
```

Você também pode facilmente iniciar um serviço usando [SGLang](https://github.com/sgl-project/sglang)

```bash
python3 -m sglang.launch_server --model deepseek-ai/DeepSeek-R1-Distill-Qwen-32B --trust-remote-code --tp 2
```

### Recomendações de Uso

**Recomendamos seguir as seguintes configurações ao utilizar os modelos da série DeepSeek-R1, incluindo benchmarks, para alcançar o desempenho esperado:**

1. Defina a temperatura na faixa de 0,5-0,7 (0,6 é recomendado) para evitar repetições intermináveis ou saídas incoerentes.
2. **Evite adicionar um prompt de sistema; todas as instruções devem estar contidas no prompt do usuário.**
3. Para problemas matemáticos, é aconselhável incluir uma diretiva em seu prompt, como: "Por favor, raciocine passo a passo e coloque sua resposta final dentro de \boxed{}."
4. Ao avaliar o desempenho do modelo, é recomendável realizar vários testes e calcular a média dos resultados.

Além disso, observamos que os modelos da série DeepSeek-R1 tendem a ignorar o padrão de pensamento (ou seja, emitir "<think>\n\n</think>") ao responder a certas consultas, o que pode afetar negativamente o desempenho do modelo.
**Para garantir que o modelo se envolva em um raciocínio completo, recomendamos forçar o modelo a iniciar sua resposta com "<think>\n" no início de cada saída.**

## 7. Licença
Este repositório de código e os pesos dos modelos são licenciados sob a [MIT License](https://github.com/deepseek-ai/DeepSeek-R1/blob/main/LICENSE).
A série DeepSeek-R1 suporta uso comercial, permitindo modificações e obras derivadas, incluindo, mas não se limitando a, destilação para treinar outros LLMs. Observe que:
- DeepSeek-R1-Distill-Qwen-1.5B, DeepSeek-R1-Distill-Qwen-7B, DeepSeek-R1-Distill-Qwen-14B e DeepSeek-R1-Distill-Qwen-32B são derivados da [Qwen-2.5 series](https://github.com/QwenLM/Qwen2.5), que é originalmente licenciada sob a [Apache 2.0 License](https://huggingface.co/Qwen/Qwen2.5-1.5B/blob/main/LICENSE), e agora ajustados com 800 mil amostras curadas com o DeepSeek-R1.
- DeepSeek-R1-Distill-Llama-8B é derivado do Llama3.1-8B-Base e é originalmente licenciado sob a [llama3.1 license](https://huggingface.co/meta-llama/Llama-3.1-8B/blob/main/LICENSE).
- DeepSeek-R1-Distill-Llama-70B é derivado do Llama3.3-70B-Instruct e é originalmente licenciado sob a [llama3.3 license](https://huggingface.co/meta-llama/Llama-3.3-70B-Instruct/blob/main/LICENSE).

### 8. Citação
```
@misc{deepseekai2025deepseekr1incentivizingreasoningcapability,
      title={DeepSeek-R1: Incentivizing Reasoning Capability in LLMs via Reinforcement Learning}, 
      author={DeepSeek-AI and Daya Guo and Dejian Yang and Haowei Zhang and Junxiao Song and Ruoyu Zhang and Runxin Xu and Qihao Zhu and Shirong Ma and Peiyi Wang and Xiao Bi and Xiaokang Zhang and Xingkai Yu and Yu Wu and Z. F. Wu and Zhibin Gou and Zhihong Shao and Zhuoshu Li and Ziyi Gao and Aixin Liu and Bing Xue and Bingxuan Wang and Bochao Wu and Bei Feng and Chengda Lu and Chenggang Zhao and Chengqi Deng and Chenyu Zhang and Chong Ruan and Damai Dai and Deli Chen and Dongjie Ji and Erhang Li and Fangyun Lin and Fucong Dai and Fuli Luo and Guangbo Hao and Guanting Chen and Guowei Li and H. Zhang and Han Bao and Hanwei Xu and Haocheng Wang and Honghui Ding and Huajian Xin and Huazuo Gao and Hui Qu and Hui Li and Jianzhong Guo and Jiashi Li and Jiawei Wang and Jingchang Chen and Jingyang Yuan and Junjie Qiu and Junlong Li and J. L. Cai and Jiaqi Ni and Jian Liang and Jin Chen and Kai Dong and Kai Hu and Kaige Gao and Kang Guan and Kexin Huang and Kuai Yu and Lean Wang and Lecong Zhang and Liang Zhao and Litong Wang and Liyue Zhang and Lei Xu and Leyi Xia and Mingchuan Zhang and Minghua Zhang and Minghui Tang and Meng Li and Miaojun Wang and Mingming Li and Ning Tian and Panpan Huang and Peng Zhang and Qiancheng Wang and Qinyu Chen and Qiushi Du and Ruiqi Ge and Ruisong Zhang and Ruizhe Pan and Runji Wang and R. J. Chen and R. L. Jin and Ruyi Chen and Shanghao Lu and Shangyan Zhou and Shanhuang Chen and Shengfeng Ye and Shiyu Wang and Shuiping Yu and Shunfeng Zhou and Shuting Pan and S. S. Li and Shuang Zhou and Shaoqing Wu and Shengfeng Ye and Tao Yun and Tian Pei and Tianyu Sun and T. Wang and Wangding Zeng and Wanjia Zhao and Wen Liu and Wenfeng Liang and Wenjun Gao and Wenqin Yu and Wentao Zhang and W. L. Xiao and Wei An and Xiaodong Liu and Xiaohan Wang and Xiaokang Chen and Xiaotao Nie and Xin Cheng and Xin Liu and Xin Xie and Xingchao Liu and Xinyu Yang and Xinyuan Li and Xuecheng Su and Xuheng Lin and X. Q. Li and Xiangyue Jin and Xiaojin Shen and Xiaosha Chen and Xiaowen Sun and Xiaoxiang Wang and Xinnan Song and Xinyi Zhou and Xianzu Wang and Xinxia Shan and Y. K. Li and Y. Q. Wang and Y. X. Wei and Yang Zhang and Yanhong Xu and Yao Li and Yao Zhao and Yaofeng Sun and Yaohui Wang and Yi Yu and Yichao Zhang and Yifan Shi and Yiliang Xiong and Ying He and Yishi Piao and Yisong Wang and Yixuan Tan and Yiyang Ma and Yiyuan Liu and Yongqiang Guo and Yuan Ou and Yuduan Wang and Yue Gong and Yuheng Zou and Yujia He and Yunfan Xiong and Yuxiang Luo and Yuxiang You and Yuxuan Liu and Yuyang Zhou and Y. X. Zhu and Yanhong Xu and Yanping Huang and Yaohui Li and Yi Zheng and Yuchen Zhu and Yunxian Ma and Ying Tang and Yukun Zha and Yuting Yan and Z. Z. Ren and Zehui Ren and Zhangli Sha and Zhe Fu and Zhean Xu and Zhenda Xie and Zhengyan Zhang and Zhewen Hao and Zhicheng Ma and Zhigang Yan and Zhiyu Wu and Zihui Gu and Zijia Zhu and Zijun Liu and Zilin Li and Ziwei Xie and Ziyang Song and Zizheng Pan and Zhen Huang and Zhipeng Xu and Zhongyu Zhang and Zhen Zhang},
      year={2025},
      eprint={2501.12948},
      archivePrefix={arXiv},
      primaryClass={cs.CL},
      url={https://arxiv.org/abs/2501.12948}, 
}

```

## 9. Contato
Se você tiver alguma dúvida, por favor, abra uma issue ou entre em contato conosco em [service@deepseek.com](service@deepseek.com).
