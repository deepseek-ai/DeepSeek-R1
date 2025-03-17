 # DeepSeek-R1 (中文稿）
<!-- markdownlint-disable first-line-h1 -->
<!-- markdownlint-disable html -->
<!-- markdownlint-disable no-duplicate-header -->

<div align="center">
  <img src="https://github.com/deepseek-ai/DeepSeek-V2/blob/main/figures/logo.svg?raw=true" width="60%" alt="DeepSeek-R1" />
</div>
<hr>
<div align="center" style="line-height: 1;">
  <a href="https://www.deepseek.com/" target="_blank"><img alt="Homepage"
    src="https://github.com/deepseek-ai/DeepSeek-V2/blob/main/figures/badge.svg?raw=true"/></a>
  <a href="https://chat.deepseek.com/" target="_blank"><img alt="Chat"
    src="https://img.shields.io/badge/🤖%20Chat-DeepSeek%20R1-536af5?color=536af5&logoColor=white"/></a>
  <a href="https://huggingface.co/deepseek-ai" target="_blank"><img alt="Hugging Face"
    src="https://img.shields.io/badge/%F0%9F%A4%97%20Hugging%20Face-DeepSeek%20AI-ffc107?color=ffc107&logoColor=white"/></a>
  <br>
  <a href="https://discord.gg/Tc7c45Zzu5" target="_blank"><img alt="Discord"
    src="https://img.shields.io/badge/Discord-DeepSeek%20AI-7289da?logo=discord&logoColor=white&color=7289da"/></a>
  <a href="https://github.com/deepseek-ai/DeepSeek-V2/blob/main/figures/qr.jpeg?raw=true" target="_blank"><img alt="WeChat"
    src="https://img.shields.io/badge/WeChat-DeepSeek%20AI-brightgreen?logo=wechat&logoColor=white"/></a>
  <a href="https://twitter.com/deepseek_ai" target="_blank"><img alt="Twitter Follow"
    src="https://img.shields.io/badge/Twitter-deepseek_ai-white?logo=x&logoColor=white"/></a>
  <br>
  <a href="https://github.com/deepseek-ai/DeepSeek-R1/blob/main/LICENSE"><img alt="License"
    src="https://img.shields.io/badge/License-MIT-f5de53?&color=f5de53"/></a>
  <br>
  <a href="https://github.com/deepseek-ai/DeepSeek-R1/blob/main/DeepSeek_R1.pdf"><b>官网论文链接</b>👁️</a>
</div>

## 1. 介绍

我们推出了第一代推理模型DeepSeek-R1-Zero和DeepSeek-R1。其中，DeepSeek-R1-Zero是一种无需有监督微调（SFT）作为前置步骤，直接通过大规模强化学习（RL）训练而成的模型，在推理任务中展现了卓越性能。通过强化学习机制，DeepSeek-R1-Zero自然涌现出诸多强大而有趣的推理行为特征。然而该模型也面临着无限重复生成、生成结果可读性差以及混合使用多种语言的问题。为解决这些技术挑战并进一步提升推理性能，我们推出了在强化学习前引入冷启动数据训练的DeepSeek-R1模型。该模型在数学、编码和推理任务中的性能已与OpenAI-o1相当。
为支持学术研究社区，我们开源了DeepSeek-R1-Zero、DeepSeek-R1以及基于Llama和Qwen架构的六款蒸馏模型。其中DeepSeek-R1-Distill-Qwen-32B在多项基准测试中超越OpenAI-o1-mini，为稠密模型领域树立了新的性能标杆。

**注意： 在本地运行 DeepSeek-R1 系列模型前，我们强烈建议您先查阅使用建议部分。**

<p align="center">
  <img width="80%" src="figures/benchmark.jpg">
</p>

## 2. 模型总览

---

**后训练阶段：基于基础模型的大规模强化学习**

-  我们直接对基础模型应用强化学习（RL），无需依赖有监督微调（SFT）作为前置步骤。该方法使模型能够探索思维链（CoT）以解决复杂问题，最终训练出DeepSeek-R1-Zero。该模型展现出自我验证、反思及生成长思维链等能力，标志着研究领域的重要突破。值得关注的是，这是首个通过纯强化学习（无需SFT）验证大语言模型推理能力可被激励的开创性研究，为未来相关领域的探索开辟了新方向。

-   我们直接对基础模型应用强化学习（RL），无需依赖有监督微调（SFT）作为前置步骤。该方法使模型能够探索思维链（CoT）以解决复杂问题，最终训练出DeepSeek-R1-Zero。该模型展现出自我验证、反思及生成长思维链等能力，标志着研究领域的重要突破。值得关注的是，这是首个通过纯强化学习（无需SFT）验证大语言模型推理能力可被激励的开创性研究，为未来相关领域的探索开辟了新方向。 

---

**模型蒸馏阶段：小模型也能拥有强大能力**

-  我们验证了大模型的推理模式可以通过蒸馏迁移至小模型，其效果显著优于直接在小模型上进行强化学习探索的推理模式。开源的DeepSeek-R1及其API服务将为研究社区未来构建更优质的小模型提供重要支持。 
-  我们验证了大模型的推理模式可以通过蒸馏迁移至小模型，其效果显著优于直接在小模型上进行强化学习探索的推理模式。开源的DeepSeek-R1及其API服务将为研究社区未来构建更优质的小模型提供重要支持。

## 3. 模型下载

### DeepSeek-R1 模型

<div align="center">

| **模型 ** | **#总参数量** | **#激活参数量** | **上下文长度** | **下载链接** |
| :------------: | :------------: | :------------: | :------------: | :------------: |
| DeepSeek-R1-Zero | 671B | 37B | 128K   | [🤗 HuggingFace](https://huggingface.co/deepseek-ai/DeepSeek-R1-Zero)   |
| DeepSeek-R1   | 671B | 37B |  128K   | [🤗 HuggingFace](https://huggingface.co/deepseek-ai/DeepSeek-R1)   |

</div>

DeepSeek-R1-Zero 和 DeepSeek-R1 是基于 DeepSeek-V3-Base 训练而成。
有关模型架构的更多详细信息，请参考 DeepSeek-V3 [DeepSeek-V3](https://github.com/deepseek-ai/DeepSeek-V3) 仓库。

### DeepSeek-R1-蒸馏模型

<div align="center">

| **模型** | **基础模型** | **下载链接** |
| :------------: | :------------: | :------------: |
| DeepSeek-R1-Distill-Qwen-1.5B  | [Qwen2.5-Math-1.5B](https://huggingface.co/Qwen/Qwen2.5-Math-1.5B) | [🤗 HuggingFace](https://huggingface.co/deepseek-ai/DeepSeek-R1-Distill-Qwen-1.5B)   |
| DeepSeek-R1-Distill-Qwen-7B  | [Qwen2.5-Math-7B](https://huggingface.co/Qwen/Qwen2.5-Math-7B) | [🤗 HuggingFace](https://huggingface.co/deepseek-ai/DeepSeek-R1-Distill-Qwen-7B)   |
| DeepSeek-R1-Distill-Llama-8B  | [Llama-3.1-8B](https://huggingface.co/meta-llama/Llama-3.1-8B) | [🤗 HuggingFace](https://huggingface.co/deepseek-ai/DeepSeek-R1-Distill-Llama-8B)   |
| DeepSeek-R1-Distill-Qwen-14B   | [Qwen2.5-14B](https://huggingface.co/Qwen/Qwen2.5-14B) | [🤗 HuggingFace](https://huggingface.co/deepseek-ai/DeepSeek-R1-Distill-Qwen-14B)   |
|DeepSeek-R1-Distill-Qwen-32B  | [Qwen2.5-32B](https://huggingface.co/Qwen/Qwen2.5-32B) | [🤗 HuggingFace](https://huggingface.co/deepseek-ai/DeepSeek-R1-Distill-Qwen-32B)   |
| DeepSeek-R1-Distill-Llama-70B  | [Llama-3.3-70B-Instruct](https://huggingface.co/meta-llama/Llama-3.3-70B-Instruct) | [🤗 HuggingFace](https://huggingface.co/deepseek-ai/DeepSeek-R1-Distill-Llama-70B)   |

</div>

DeepSeek-R1-Distill 模型是基于开源模型，使用 DeepSeek-R1 生成的样本进行微调的。
我们对其配置和分词器进行了轻微调整，请使用我们的设置来运行这些模型。

## 4. 评估结果

### DeepSeek-R1 评估
 对于所有模型，最大生成长度设置为 32,768 个 token。对于需要采样的基准测试，我们使用温度为 0.6，top-p 值为 0.95，并为每个查询生成 64 个响应以估算 pass@1。
<div align="center">


| 类别 | 基准测试（指标） | Claude-3.5-Sonnet-1022 | GPT-4o 0513 | DeepSeek V3 | OpenAI o1-mini | OpenAI o1-1217 | DeepSeek R1 |
|----------|-------------------|----------------------|------------|--------------|----------------|------------|--------------|
| | Architecture | - | - | MoE | - | - | MoE |
| | # Activated Params | - | - | 37B | - | - | 37B |
| | # Total Params | - | - | 671B | - | - | 671B |
| English | MMLU (Pass@1) | 88.3 | 87.2 | 88.5 | 85.2 | **91.8** | 90.8 |
| | MMLU-Redux (EM) | 88.9 | 88.0 | 89.1 | 86.7 | - | **92.9** |
| | MMLU-Pro (EM) | 78.0 | 72.6 | 75.9 | 80.3 | - | **84.0** |
| | DROP (3-shot F1) | 88.3 | 83.7 | 91.6 | 83.9 | 90.2 | **92.2** |
| | IF-Eval (Prompt Strict) | **86.5** | 84.3 | 86.1 | 84.8 | - | 83.3 |
| | GPQA-Diamond (Pass@1) | 65.0 | 49.9 | 59.1 | 60.0 | **75.7** | 71.5 |
| | SimpleQA (Correct) | 28.4 | 38.2 | 24.9 | 7.0 | **47.0** | 30.1 |
| | FRAMES (Acc.) | 72.5 | 80.5 | 73.3 | 76.9 | - | **82.5** |
| | AlpacaEval2.0 (LC-winrate) | 52.0 | 51.1 | 70.0 | 57.8 | - | **87.6** |
| | ArenaHard (GPT-4-1106) | 85.2 | 80.4 | 85.5 | 92.0 | - | **92.3** |
| Code | LiveCodeBench (Pass@1-COT) | 33.8 | 34.2 | - | 53.8 | 63.4 | **65.9** |
| | Codeforces (Percentile) | 20.3 | 23.6 | 58.7 | 93.4 | **96.6** | 96.3 |
| | Codeforces (Rating) | 717 | 759 | 1134 | 1820 | **2061** | 2029 |
| | SWE Verified (Resolved) | **50.8** | 38.8 | 42.0 | 41.6 | 48.9 | 49.2 |
| | Aider-Polyglot (Acc.) | 45.3 | 16.0 | 49.6 | 32.9 | **61.7** | 53.3 |
| Math | AIME 2024 (Pass@1) | 16.0 | 9.3 | 39.2 | 63.6 | 79.2 | **79.8** |
| | MATH-500 (Pass@1) | 78.3 | 74.6 | 90.2 | 90.0 | 96.4 | **97.3** |
| | CNMO 2024 (Pass@1) | 13.1 | 10.8 | 43.2 | 67.6 | - | **78.8** |
| Chinese | CLUEWSC (EM) | 85.4 | 87.9 | 90.9 | 89.9 | - | **92.8** |
| | C-Eval (EM) | 76.7 | 76.0 | 86.5 | 68.9 | - | **91.8** |
| | C-SimpleQA (Correct) | 55.4 | 58.7 | **68.0** | 40.3 | - | 63.7 |

</div>


### 蒸馏模型评估


<div align="center">

| 模型                                    | AIME 2024 pass@1 | AIME 2024 cons@64 | MATH-500 pass@1 | GPQA Diamond pass@1 | LiveCodeBench pass@1 | CodeForces rating |
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


## 5. 在线聊天网站与 API 平台
您可以在 DeepSeek 官方网站与 DeepSeek-R1 进行对话：[chat.deepseek.com](https://chat.deepseek.com)，并开启 "深度思考" 按钮。

我们还在 DeepSeek 平台提供了 OpenAI 兼容的 API 服务：[platform.deepseek.com](https://platform.deepseek.com/)

## 6. 本地运行指南

### DeepSeek-R1 模型

请访问[DeepSeek-V3](https://github.com/deepseek-ai/DeepSeek-V3) 仓库，了解更多关于本地运行 DeepSeek-R1 的信息。

**注意：Hugging Face 的 Transformers 库尚未直接支持。**

### DeepSeek-R1-Distill 模型

DeepSeek-R1-Distill 模型可以像 Qwen 或 Llama 模型一样使用。

例如，您可以使用 [vLLM](https://github.com/vllm-project/vllm):轻松启动服务

```shell
vllm serve deepseek-ai/DeepSeek-R1-Distill-Qwen-32B --tensor-parallel-size 2 --max-model-len 32768 --enforce-eager
```

You can also easily start a service using [SGLang](https://github.com/sgl-project/sglang)

```bash
python3 -m sglang.launch_server --model deepseek-ai/DeepSeek-R1-Distill-Qwen-32B --trust-remote-code --tp 2
```

### 使用建议

**我们建议在使用 DeepSeek-R1 系列模型（包括基准测试）时遵循以下配置，以达到预期性能：**

1. 将温度设置在 0.5-0.7 之间（推荐 0.6），以避免无限重复或输出不连贯的内容。
2. **避免添加系统提示；所有指令应包含在用户提示中。**
3. 对于数学问题，建议在提示中加入如下指令：“请逐步推理，并将最终答案放在\boxed{}.中”
4. 在评估模型性能时，建议进行多次测试并取平均值。

此外，我们观察到 DeepSeek-R1 系列模型在响应某些查询时可能会跳过思考模式（即输出 "<think>\n\n</think>"），这可能会影响模型的性能。
**为确保模型进行充分推理，我们建议强制模型在每次输出时以 "<think>\n" 开头。**

### 官方提示模板
在 DeepSeek 官方网页端/APP 中，我们未使用系统提示，但针对文件上传和网络搜索功能设计了特定提示模板以优化用户体验。此外，网页端/APP 的温度参数设置为 0.6。

请按照以下模板创建提示（其中 {file_name}、{file_content} 和 {question} 为参数）：
```
file_template = \
"""[file name]: {file_name}
[file content begin]
{file_content}
[file content end]
{question}"""
```

参数说明：{search_results} 表示搜索结果，{cur_date} 表示当前日期，{question} 表示用户问题。

中文查询提示模板：
```
search_answer_zh_template = \
'''# 以下内容是基于用户发送的消息的搜索结果:
{search_results}
在我给你的搜索结果中，每个结果都是[webpage X begin]...[webpage X end]格式的，X代表每篇文章的数字索引。请在适当的情况下在句子末尾引用上下文。请按照引用编号[citation:X]的格式在答案中对应部分引用上下文。如果一句话源自多个上下文，请列出所有相关的引用编号，例如[citation:3][citation:5]，切记不要将引用集中在最后返回引用编号，而是在答案对应部分列出。
在回答时，请注意以下几点：
- 今天是{cur_date}。
- 并非搜索结果的所有内容都与用户的问题密切相关，你需要结合问题，对搜索结果进行甄别、筛选。
- 对于列举类的问题（如列举所有航班信息），尽量将答案控制在10个要点以内，并告诉用户可以查看搜索来源、获得完整信息。优先提供信息完整、最相关的列举项；如非必要，不要主动告诉用户搜索结果未提供的内容。
- 对于创作类的问题（如写论文），请务必在正文的段落中引用对应的参考编号，例如[citation:3][citation:5]，不能只在文章末尾引用。你需要解读并概括用户的题目要求，选择合适的格式，充分利用搜索结果并抽取重要信息，生成符合用户要求、极具思想深度、富有创造力与专业性的答案。你的创作篇幅需要尽可能延长，对于每一个要点的论述要推测用户的意图，给出尽可能多角度的回答要点，且务必信息量大、论述详尽。
- 如果回答很长，请尽量结构化、分段落总结。如果需要分点作答，尽量控制在5个点以内，并合并相关的内容。
- 对于客观类的问答，如果问题的答案非常简短，可以适当补充一到两句相关信息，以丰富内容。
- 你需要根据用户要求和回答内容选择合适、美观的回答格式，确保可读性强。
- 你的回答应该综合多个相关网页来回答，不能重复引用一个网页。
- 除非用户要求，否则你回答的语言需要和用户提问的语言保持一致。

# 用户消息为：
{question}'''
```


英文查询提示模板：
```
search_answer_en_template = \
'''# The following contents are the search results related to the user's message:
{search_results}
In the search results I provide to you, each result is formatted as [webpage X begin]...[webpage X end], where X represents the numerical index of each article. Please cite the context at the end of the relevant sentence when appropriate. Use the citation format [citation:X] in the corresponding part of your answer. If a sentence is derived from multiple contexts, list all relevant citation numbers, such as [citation:3][citation:5]. Be sure not to cluster all citations at the end; instead, include them in the corresponding parts of the answer.
When responding, please keep the following points in mind:
- Today is {cur_date}.
- Not all content in the search results is closely related to the user's question. You need to evaluate and filter the search results based on the question.
- For listing-type questions (e.g., listing all flight information), try to limit the answer to 10 key points and inform the user that they can refer to the search sources for complete information. Prioritize providing the most complete and relevant items in the list. Avoid mentioning content not provided in the search results unless necessary.
- For creative tasks (e.g., writing an essay), ensure that references are cited within the body of the text, such as [citation:3][citation:5], rather than only at the end of the text. You need to interpret and summarize the user's requirements, choose an appropriate format, fully utilize the search results, extract key information, and generate an answer that is insightful, creative, and professional. Extend the length of your response as much as possible, addressing each point in detail and from multiple perspectives, ensuring the content is rich and thorough.
- If the response is lengthy, structure it well and summarize it in paragraphs. If a point-by-point format is needed, try to limit it to 5 points and merge related content.
- For objective Q&A, if the answer is very brief, you may add one or two related sentences to enrich the content.
- Choose an appropriate and visually appealing format for your response based on the user's requirements and the content of the answer, ensuring strong readability.
- Your answer should synthesize information from multiple relevant webpages and avoid repeatedly citing the same webpage.
- Unless the user requests otherwise, your response should be in the same language as the user's question.

# The user's message is:
{question}'''
```

## 7. 许可证声明
本代码仓库及模型权重遵循[MIT License](https://github.com/deepseek-ai/DeepSeek-R1/blob/main/LICENSE)授权。 
DeepSeek-R1 系列支持商业用途，允许任何修改和二次开发（包括但不限于蒸馏训练其他大语言模型）。需特别注意：
- DeepSeek-R1-Distill-Qwen-1.5B, DeepSeek-R1-Distill-Qwen-7B, DeepSeek-R1-Distill-Qwen-14B 和 DeepSeek-R1-Distill-Qwen-32B 基于  [Qwen-2.5 series](https://github.com/QwenLM/Qwen2.5), 原模型遵循 [Apache 2.0 License](https://huggingface.co/Qwen/Qwen2.5-1.5B/blob/main/LICENSE), 并通过 DeepSeek-R1 生成的 80 万样本进行微调
- DeepSeek-R1-Distill-Llama-8B  基于 Llama3.1-8B-Base 开发，原模型遵循 [llama3.1 license](https://huggingface.co/meta-llama/Llama-3.1-8B/blob/main/LICENSE).
- DeepSeek-R1-Distill-Llama-70B 基于Llama3.3-70B-Instruct 开发，原模型遵循 [llama3.3 license](https://huggingface.co/meta-llama/Llama-3.3-70B-Instruct/blob/main/LICENSE).

## 8. 引用声明
```
@misc{deepseekai2025deepseekr1incentivizingreasoningcapability,
      title={DeepSeek-R1: Incentivizing Reasoning Capability in LLMs via Reinforcement Learning}, 
      author={DeepSeek-AI},
      year={2025},
      eprint={2501.12948},
      archivePrefix={arXiv},
      primaryClass={cs.CL},
      url={https://arxiv.org/abs/2501.12948}, 
}
```

## 9. 联系我们
如有任何问题，请提交 issue 或通过 [service@deepseek.com](service@deepseek.com) 联系我们。
