[🇺🇸 English](./README.md) | [🇨🇳 中文](./README.zh-CN.md)

<!-- Chinese Content -->
# DeepSeek-R1

<!-- Same badges section -->
<div align="center">
  <img src="https://github.com/deepseek-ai/DeepSeek-V2/blob/main/figures/logo.svg?raw=true" width="60%" alt="DeepSeek-V3" />
</div>
<hr>
<div align="center" style="line-height: 1;">
  <a href="https://www.deepseek.com/" target="_blank" style="margin: 2px;">
    <img alt="Homepage" src="https://github.com/deepseek-ai/DeepSeek-V2/blob/main/figures/badge.svg?raw=true" style="display: inline-block; vertical-align: middle;"/>
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

<div align="center" style="line-height: 1;">
  <a href="https://github.com/deepseek-ai/DeepSeek-R1/blob/main/LICENSE" style="margin: 2px;">
    <img alt="License" src="https://img.shields.io/badge/License-MIT-f5de53?&color=f5de53" style="display: inline-block; vertical-align: middle;"/>
  </a>
</div>

<p align="center">
  <a href="https://github.com/deepseek-ai/DeepSeek-R1/blob/main/DeepSeek_R1.pdf"><b>论文链接</b>👁️</a>
</p>

## 1. 简介
我们推出了第一代推理模型 DeepSeek-R1-Zero 和 DeepSeek-R1。DeepSeek-R1-Zero 是首个无需监督微调（SFT）、直接通过大规模强化学习（RL）训练出的模型，展现了卓越的推理能力。通过 RL 训练，DeepSeek-R1-Zero 自然涌现出多种强大的推理行为。我们进一步引入 DeepSeek-R1，在 RL 前加入冷启动数据，使其在数学、代码和推理任务上达到与 OpenAI-o1 相媲美的性能。我们开源了 DeepSeek-R1-Zero、DeepSeek-R1 以及基于 Llama 和 Qwen 的六个蒸馏模型，其中 DeepSeek-R1-Distill-Qwen-32B 在多个基准测试中超越 OpenAI-o1-mini，创下密集模型新 SOTA。

**注意：在本地运行 DeepSeek-R1 系列模型前，请务必阅读[使用建议](#6-本地运行)章节。**

<p align="center">
  <img width="80%" src="figures/benchmark.jpg">
</p>

## 2. 模型概要
---

**后训练：基于基座模型的大规模强化学习**

- 我们直接在基座模型上应用强化学习（RL），不依赖监督微调（SFT）作为前置步骤，由此开发出 DeepSeek-R1-Zero。该模型展现出自我验证、反思和生成长思维链等能力，验证了仅通过 RL 即可激励 LLM 的推理能力

- 我们提出包含两个 RL 阶段和两个 SFT 阶段的完整训练流程，其中 RL 阶段用于发现更好的推理模式和对齐人类偏好，SFT 阶段为模型提供推理和非推理能力的种子
---

**蒸馏：小模型也能很强大**

- 我们证明大模型的推理模式可以通过蒸馏迁移到小模型，其性能优于直接在小模型上应用 RL 发现的结果
- 使用 DeepSeek-R1 生成的推理数据，我们微调了多个主流密集模型。评估结果显示这些蒸馏模型在基准测试中表现优异

## 3. 模型下载

### DeepSeek-R1 模型

<div align="center">

| **模型** | **总参数量** | **激活参数量** | **上下文长度** | **下载链接** |
| :------------: | :------------: | :------------: | :------------: | :------------: |
| DeepSeek-R1-Zero | 671B | 37B | 128K   | [🤗 HuggingFace](https://huggingface.co/deepseek-ai/DeepSeek-R1-Zero)   |
| DeepSeek-R1   | 671B | 37B |  128K   | [🤗 HuggingFace](https://huggingface.co/deepseek-ai/DeepSeek-R1)   |

</div>

DeepSeek-R1-Zero 和 DeepSeek-R1 是基于 DeepSeek-V3-Base 训练的。
有关模型架构的更多详细信息，请参考 [DeepSeek-V3](https://github.com/deepseek-ai/DeepSeek-V3) 仓库。

### DeepSeek-R1-Distill 模型
<div align="center">

| **模型** | **基座模型** | **下载链接** |
| :------------: | :------------: | :------------: |
| DeepSeek-R1-Distill-Qwen-1.5B  | [Qwen2.5-Math-1.5B](https://huggingface.co/Qwen/Qwen2.5-Math-1.5B) | [🤗 HuggingFace](https://huggingface.co/deepseek-ai/DeepSeek-R1-Distill-Qwen-1.5B)   |
| DeepSeek-R1-Distill-Qwen-7B  | [Qwen2.5-Math-7B](https://huggingface.co/Qwen/Qwen2.5-Math-7B) | [🤗 HuggingFace](https://huggingface.co/deepseek-ai/DeepSeek-R1-Distill-Qwen-7B)   |
| DeepSeek-R1-Distill-Llama-8B  | [Llama-3.1-8B](https://huggingface.co/meta-llama/Llama-3.1-8B) | [🤗 HuggingFace](https://huggingface.co/deepseek-ai/DeepSeek-R1-Distill-Llama-8B)   |
| DeepSeek-R1-Distill-Qwen-14B   | [Qwen2.5-14B](https://huggingface.co/Qwen/Qwen2.5-14B) | [🤗 HuggingFace](https://huggingface.co/deepseek-ai/DeepSeek-R1-Distill-Qwen-14B)   |
|DeepSeek-R1-Distill-Qwen-32B  | [Qwen2.5-32B](https://huggingface.co/Qwen/Qwen2.5-32B) | [🤗 HuggingFace](https://huggingface.co/deepseek-ai/DeepSeek-R1-Distill-Qwen-32B)   |
| DeepSeek-R1-Distill-Llama-70B  | [Llama-3.3-70B-Instruct](https://huggingface.co/meta-llama/Llama-3.3-70B-Instruct) | [🤗 HuggingFace](https://huggingface.co/deepseek-ai/DeepSeek-R1-Distill-Llama-70B)   |

</div>

DeepSeek-R1-Distill 模型基于开源模型进行微调，使用了 DeepSeek-R1 生成的样本。
我们略微修改了它们的配置和分词器。请使用我们的设置来运行这些模型。

## 4. 评估结果

### DeepSeek-R1 评估
对于所有模型，最大生成长度设置为 32,768 个 token。对于需要采样的基准测试，我们使用温度为 $0.6$，top-p 值为 $0.95$，并为每个查询生成 64 个响应以估计 pass@1。
<div align="center">

| 类别 | 基准测试（指标） | Claude-3.5-Sonnet-1022 | GPT-4o 0513 | DeepSeek V3 | OpenAI o1-mini | OpenAI o1-1217 | DeepSeek R1 |
|----------|-------------------|----------------------|------------|--------------|----------------|------------|--------------|
| | 架构 | - | - | MoE | - | - | MoE |
| | 激活参数量 | - | - | 37B | - | - | 37B |
| | 总参数量 | - | - | 671B | - | - | 671B |
| 英语 | MMLU (Pass@1) | 88.3 | 87.2 | 88.5 | 85.2 | **91.8** | 90.8 |
| | MMLU-Redux (EM) | 88.9 | 88.0 | 89.1 | 86.7 | - | **92.9** |
| | MMLU-Pro (EM) | 78.0 | 72.6 | 75.9 | 80.3 | - | **84.0** |
| | DROP (3-shot F1) | 88.3 | 83.7 | 91.6 | 83.9 | 90.2 | **92.2** |
| | IF-Eval (Prompt Strict) | **86.5** | 84.3 | 86.1 | 84.8 | - | 83.3 |
| | GPQA-Diamond (Pass@1) | 65.0 | 49.9 | 59.1 | 60.0 | **75.7** | 71.5 |
| | SimpleQA (正确率) | 28.4 | 38.2 | 24.9 | 7.0 | **47.0** | 30.1 |
| | FRAMES (准确率) | 72.5 | 80.5 | 73.3 | 76.9 | - | **82.5** |
| | AlpacaEval2.0 (LC-winrate) | 52.0 | 51.1 | 70.0 | 57.8 | - | **87.6** |
| | ArenaHard (GPT-4-1106) | 85.2 | 80.4 | 85.5 | 92.0 | - | **92.3** |
| 代码 | LiveCodeBench (Pass@1-COT) | 33.8 | 34.2 | - | 53.8 | 63.4 | **65.9** |
| | Codeforces (百分位) | 20.3 | 23.6 | 58.7 | 93.4 | **96.6** | 96.3 |
| | Codeforces (评分) | 717 | 759 | 1134 | 1820 | **2061** | 2029 |
| | SWE Verified (已解决) | **50.8** | 38.8 | 42.0 | 41.6 | 48.9 | 49.2 |
| | Aider-Polyglot (准确率) | 45.3 | 16.0 | 49.6 | 32.9 | **61.7** | 53.3 |
| 数学 | AIME 2024 (Pass@1) | 16.0 | 9.3 | 39.2 | 63.6 | 79.2 | **79.8** |
| | MATH-500 (Pass@1) | 78.3 | 74.6 | 90.2 | 90.0 | 96.4 | **97.3** |
| | CNMO 2024 (Pass@1) | 13.1 | 10.8 | 43.2 | 67.6 | - | **78.8** |
| 中文 | CLUEWSC (EM) | 85.4 | 87.9 | 90.9 | 89.9 | - | **92.8** |
| | C-Eval (EM) | 76.7 | 76.0 | 86.5 | 68.9 | - | **91.8** |
| | C-SimpleQA (正确率) | 55.4 | 58.7 | **68.0** | 40.3 | - | 63.7 |

</div>

### 蒸馏模型评估

<div align="center">

| 模型                                    | AIME 2024 pass@1 | AIME 2024 cons@64 | MATH-500 pass@1 | GPQA Diamond pass@1 | LiveCodeBench pass@1 | CodeForces 评分 |
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

## 5. 聊天网站 & API 平台
您可以在 DeepSeek 官方网站上与 DeepSeek-R1 进行对话：[chat.deepseek.com](https://chat.deepseek.com)，并开启 "DeepThink" 按钮

我们还在 DeepSeek 平台上提供了 OpenAI 兼容的 API：[platform.deepseek.com](https://platform.deepseek.com/)

## 6. 本地运行

### DeepSeek-R1 模型

请访问 [DeepSeek-V3](https://github.com/deepseek-ai/DeepSeek-V3) 仓库获取有关本地运行 DeepSeek-R1 的更多信息。

**注意：Hugging Face 的 Transformers 尚未直接支持。**

### DeepSeek-R1-Distill 模型

DeepSeek-R1-Distill 模型可以像 Qwen 或 Llama 模型一样使用。

例如，您可以使用 [vLLM](https://github.com/vllm-project/vllm) 轻松启动服务：

```shell
vllm serve deepseek-ai/DeepSeek-R1-Distill-Qwen-32B --tensor-parallel-size 2 --max-model-len 32768 --enforce-eager
```

您也可以使用 [SGLang](https://github.com/sgl-project/sglang) 轻松启动服务：

```bash
python3 -m sglang.launch_server --model deepseek-ai/DeepSeek-R1-Distill-Qwen-32B --trust-remote-code --tp 2
```

### 使用建议

**我们建议在使用 DeepSeek-R1 系列模型（包括基准测试）时遵循以下配置，以达到预期性能：**

1. 将温度设置在 0.5-0.7 之间（推荐 0.6），以防止无限重复或不连贯的输出。
2. **避免添加系统提示；所有指令应包含在用户提示中。**
3. 对于数学问题，建议在提示中包含如下指令："请逐步推理，并将最终答案放在 \boxed{} 中。"
4. 在评估模型性能时，建议进行多次测试并取平均值。

## 7. 许可证
本代码库和模型权重均遵循 [MIT 许可证](https://github.com/deepseek-ai/DeepSeek-R1/blob/main/LICENSE)。  
DeepSeek-R1 系列支持商业用途，允许任何修改和衍生作品，包括但不限于用于训练其他大模型的蒸馏。请注意：
- DeepSeek-R1-Distill-Qwen-1.5B、DeepSeek-R1-Distill-Qwen-7B、DeepSeek-R1-Distill-Qwen-14B 和 DeepSeek-R1-Distill-Qwen-32B 基于 [Qwen-2.5 系列](https://github.com/QwenLM/Qwen2.5)开发，原版遵循 [Apache 2.0 许可证](https://huggingface.co/Qwen/Qwen2.5-1.5B/blob/main/LICENSE)，并使用 DeepSeek-R1 生成的 80 万样本进行了微调。
- DeepSeek-R1-Distill-Llama-8B 基于 Llama3.1-8B-Base 开发，原版遵循 [llama3.1 许可证](https://huggingface.co/meta-llama/Llama-3.1-8B/blob/main/LICENSE)。
- DeepSeek-R1-Distill-Llama-70B 基于 Llama3.3-70B-Instruct 开发，原版遵循 [llama3.3 许可证](https://huggingface.co/meta-llama/Llama-3.3-70B-Instruct/blob/main/LICENSE)。

## 8. 引用
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

## 9. 联系我们
如有任何问题，请提交 issue 或通过 [service@deepseek.com](service@deepseek.com) 联系我们。
