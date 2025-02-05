[🇺🇸 English 🇺🇸](./README.md) ⬦ [🇨🇳 简体中文 🇨🇳](./README_zh.md)
# DeepSeek-R1
<!-- markdownlint-disable first-line-h1 -->
<!-- markdownlint-disable html -->
<!-- markdownlint-disable no-duplicate-header -->

<div align="center">
  <img src="https://github.com/deepseek-ai/DeepSeek-V2/blob/main/figures/logo.svg?raw=true" width="60%" alt="DeepSeek-V3" />
</div>
<hr>
<div align="center" style="line-height: 1;">
  <a href="https://www.deepseek.com/" target="_blank" style="margin: 2px;">
    <img alt="主页" src="https://github.com/deepseek-ai/DeepSeek-V2/blob/main/figures/badge.svg?raw=true" style="display: inline-block; vertical-align: middle;"/>
  </a>
  <a href="https://chat.deepseek.com/" target="_blank" style="margin: 2px;">
    <img alt="对话" src="https://img.shields.io/badge/🤖%20Chat-DeepSeek%20R1-536af5?color=536af5&logoColor=white" style="display: inline-block; vertical-align: middle;"/>
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
    <img alt="微信" src="https://img.shields.io/badge/微信-DeepSeek%20AI-brightgreen?logo=wechat&logoColor=white" style="display: inline-block; vertical-align: middle;"/>
  </a>
  <a href="https://twitter.com/deepseek_ai" target="_blank" style="margin: 2px;">
    <img alt="Twitter 关注" src="https://img.shields.io/badge/Twitter-deepseek_ai-white?logo=x&logoColor=white" style="display: inline-block; vertical-align: middle;"/>
  </a>
</div>

<div align="center" style="line-height: 1;">
  <a href="https://github.com/deepseek-ai/DeepSeek-R1/blob/main/LICENSE" style="margin: 2px;">
    <img alt="许可证" src="https://img.shields.io/badge/许可证-MIT-f5de53?&color=f5de53" style="display: inline-block; vertical-align: middle;"/>
  </a>
</div>


<p align="center">
  <a href="https://github.com/deepseek-ai/DeepSeek-R1/blob/main/DeepSeek_R1.pdf"><b>论文链接</b>👁️</a>
</p>


## 1. 简介

我们推出第一代推理模型 DeepSeek-R1-Zero 与 DeepSeek-R1。  
DeepSeek-R1-Zero 通过大规模强化学习（RL）直接训练基座模型，无需监督微调（SFT）作为前置步骤，在推理任务中展现卓越性能。通过 RL 训练，该模型自然涌现出多种强大的推理行为。然而，DeepSeek-R1-Zero 存在无限循环、可读性差与语言混杂等问题。为解决这些问题并进一步提升推理能力，我们引入 DeepSeek-R1，其在 RL 前加入冷启动数据。  
DeepSeek-R1 在数学、代码和推理任务中达到与 OpenAI-o1 相当的水平。为支持研究社区，我们开源了 DeepSeek-R1-Zero、DeepSeek-R1 及基于 Llama 和 Qwen 的六个蒸馏模型。其中，DeepSeek-R1-Distill-Qwen-32B 在多项基准测试中超越 OpenAI-o1-mini，刷新密集模型性能纪录。

**注意：本地运行 DeepSeek-R1 系列模型前，请务必阅读[使用建议](#使用建议)。**

<p align="center">
  <img width="80%" src="figures/benchmark.jpg">
</p>

## 2. 模型概要

---

**后训练：基座模型的大规模强化学习**

- 我们直接在基座模型上应用强化学习（RL），无需监督微调（SFT）作为前置步骤。这种方法使模型能通过思维链（CoT）探索复杂问题解决方案，最终形成 DeepSeek-R1-Zero。该模型展现出自我验证、反思和生成长 CoT 等能力，标志着研究社区的重要突破——首次验证仅通过 RL 即可激励 LLM 的推理能力，无需依赖 SFT。
- 我们提出开发 DeepSeek-R1 的完整流程，包含两个 RL 阶段（用于发现更优推理模式与对齐人类偏好）和两个 SFT 阶段（作为模型推理与非推理能力的种子）。该流程将为行业提供构建更优模型的参考框架。

---

**蒸馏：小模型亦可强大**

- 我们证明大模型的推理模式可蒸馏至小模型，其性能优于直接通过 RL 训练的小模型。开源的 DeepSeek-R1 及其 API 将为社区后续的模型蒸馏研究提供支持。
- 利用 DeepSeek-R1 生成的推理数据，我们对多个主流密集模型进行微调。评估结果显示，蒸馏后的小型密集模型在基准测试中表现优异。我们开源基于 Qwen2.5 和 Llama3 系列的 1.5B、7B、8B、14B、32B 和 70B 检查点。

## 3. 模型下载

### DeepSeek-R1 模型

<div align="center">

| **模型** | **总参数量** | **激活参数量** | **上下文长度** | **下载地址** |
| :------------: | :------------: | :------------: | :------------: | :------------: |
| DeepSeek-R1-Zero | 671B | 37B | 128K   | [🤗 HuggingFace](https://huggingface.co/deepseek-ai/DeepSeek-R1-Zero)   |
| DeepSeek-R1   | 671B | 37B |  128K   | [🤗 HuggingFace](https://huggingface.co/deepseek-ai/DeepSeek-R1)   |

</div>

DeepSeek-R1-Zero 与 DeepSeek-R1 基于 DeepSeek-V3-Base 训练。有关模型架构的详细信息，请参考 [DeepSeek-V3](https://github.com/deepseek-ai/DeepSeek-V3) 代码库。

### DeepSeek-R1-Distill 模型

<div align="center">

| **模型** | **基座模型** | **下载地址** |
| :------------: | :------------: | :------------: |
| DeepSeek-R1-Distill-Qwen-1.5B  | [Qwen2.5-Math-1.5B](https://huggingface.co/Qwen/Qwen2.5-Math-1.5B) | [🤗 HuggingFace](https://huggingface.co/deepseek-ai/DeepSeek-R1-Distill-Qwen-1.5B)   |
| DeepSeek-R1-Distill-Qwen-7B  | [Qwen2.5-Math-7B](https://huggingface.co/Qwen/Qwen2.5-Math-7B) | [🤗 HuggingFace](https://huggingface.co/deepseek-ai/DeepSeek-R1-Distill-Qwen-7B)   |
| DeepSeek-R1-Distill-Llama-8B  | [Llama-3.1-8B](https://huggingface.co/meta-llama/Llama-3.1-8B) | [🤗 HuggingFace](https://huggingface.co/deepseek-ai/DeepSeek-R1-Distill-Llama-8B)   |
| DeepSeek-R1-Distill-Qwen-14B   | [Qwen2.5-14B](https://huggingface.co/Qwen/Qwen2.5-14B) | [🤗 HuggingFace](https://huggingface.co/deepseek-ai/DeepSeek-R1-Distill-Qwen-14B)   |
|DeepSeek-R1-Distill-Qwen-32B  | [Qwen2.5-32B](https://huggingface.co/Qwen/Qwen2.5-32B) | [🤗 HuggingFace](https://huggingface.co/deepseek-ai/DeepSeek-R1-Distill-Qwen-32B)   |
| DeepSeek-R1-Distill-Llama-70B  | [Llama-3.3-70B-Instruct](https://huggingface.co/meta-llama/Llama-3.3-70B-Instruct) | [🤗 HuggingFace](https://huggingface.co/deepseek-ai/DeepSeek-R1-Distill-Llama-70B)   |

</div>

DeepSeek-R1-Distill 模型基于开源模型微调，使用 DeepSeek-R1 生成的样本训练。我们略微调整了模型配置与分词器，请使用我们的设置运行这些模型。

## 4. 评估结果

### DeepSeek-R1 评估
所有测试中，最大生成长度设为 32,768 tokens。需采样的基准测试使用温度 0.6、top-p 0.95，每 query 生成 64 个响应计算 pass@1。
<div align="center">


| 类别 | 基准测试（指标） | Claude-3.5-Sonnet-1022 | GPT-4o 0513 | DeepSeek V3 | OpenAI o1-mini | OpenAI o1-1217 | DeepSeek R1 |
|----------|-------------------|----------------------|------------|--------------|----------------|------------|--------------|
| | 架构 | - | - | MoE | - | - | MoE |
| | 激活参数量 | - | - | 37B | - | - | 37B |
| | 总参数量 | - | - | 671B | - | - | 671B |
| 英文 | 大规模多任务语言理解 (Pass@1) | 88.3 | 87.2 | 88.5 | 85.2 | **91.8** | 90.8 |
| | 大规模多任务语言理解 redux集 (EM) | 88.9 | 88.0 | 89.1 | 86.7 | - | **92.9** |
| | 大规模多任务语言理解Pro集 (EM) | 78.0 | 72.6 | 75.9 | 80.3 | - | **84.0** |
| | 段落级离散推理 (3-shot F1) | 88.3 | 83.7 | 91.6 | 83.9 | 90.2 | **92.2** |
| | IF-Eval聚焦可验证指令评估 (Prompt Strict) | **86.5** | 84.3 | 86.1 | 84.8 | - | 83.3 |
| | 研究生级的google问答基准 (Pass@1) | 65.0 | 49.9 | 59.1 | 60.0 | **75.7** | 71.5 |
| | open AI SimpleQA评估 (正确率) | 28.4 | 38.2 | 24.9 | 7.0 | **47.0** | 30.1 |
| | FRAMES (准确率) | 72.5 | 80.5 | 73.3 | 76.9 | - | **82.5** |
| | Tatsu Lab的AlpacaEval2.0指令遵循语言模型的自动评估(LC胜率) | 52.0 | 51.1 | 70.0 | 57.8 | - | **87.6** |
| | ArenaHard基准 (GPT-4-1106) | 85.2 | 80.4 | 85.5 | 92.0 | - | **92.3** |
| 代码 | LiveCodeBench编码基准 (Pass@1-COT) | 33.8 | 34.2 | - | 53.8 | 63.4 | **65.9** |
| | Codeforces基准  | 20.3% | 23.6% | 58.7% | 93.4 | **96.6%** | 96.3% |
| | Codeforces基准 (分数) | 717 | 759 | 1134 | 1820 | **2061** | 2029 |
| | SWE Verified (解决率) | **50.8** | 38.8 | 42.0 | 41.6 | 48.9 | 49.2 |
| | Aider-Polyglot (准确率) | 45.3 | 16.0 | 49.6 | 32.9 | **61.7** | 53.3 |
| 数学 | 美国数学邀请赛 2024届 (Pass@1) | 16.0 | 9.3 | 39.2 | 63.6 | 79.2 | **79.8** |
| | MATH-500数学问题集 (Pass@1) | 78.3 | 74.6 | 90.2 | 90.0 | 96.4 | **97.3** |
| | 中国数学奥林匹克竞赛 2024届 (Pass@1) | 13.1 | 10.8 | 43.2 | 67.6 | - | **78.8** |
| 中文 | CLUEWSC中文语言理解测评基准 (EM) | 85.4 | 87.9 | 90.9 | 89.9 | - | **92.8** |
| | 中文大模型评估基准 (EM) | 76.7 | 76.0 | 86.5 | 68.9 | - | **91.8** |
| | C-SimpleQA大型语言模型的中文事实评价集 (正确率) | 55.4 | 58.7 | **68.0** | 40.3 | - | 63.7 |

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


## 5. 在线对话与 API 平台
您可通过 DeepSeek 官网与 DeepSeek-R1 对话：[chat.deepseek.com](https://chat.deepseek.com)，并开启 "DeepThink" 模式

我们还提供 OpenAI 兼容 API：[platform.deepseek.com](https://platform.deepseek.com/)

## 6. 本地运行指南

### DeepSeek-R1 模型

本地运行 DeepSeek-R1 的详细说明请参考 [DeepSeek-V3](https://github.com/deepseek-ai/DeepSeek-V3) 代码库。

**注意：Hugging Face Transformers 暂未直接支持。**

### DeepSeek-R1-Distill 模型

DeepSeek-R1-Distill 模型的使用方式与 Qwen 或 Llama 模型相同。

例如，可通过 [vLLM](https://github.com/vllm-project/vllm) 快速启动服务：

```shell
vllm serve deepseek-ai/DeepSeek-R1-Distill-Qwen-32B --tensor-parallel-size 2 --max-model-len 32768 --enforce-eager
```

或使用 [SGLang](https://github.com/sgl-project/sglang) 部署：

```bash
python3 -m sglang.launch_server --model deepseek-ai/DeepSeek-R1-Distill-Qwen-32B --trust-remote-code --tp 2
```

### 使用建议

**为保证 DeepSeek-R1 系列模型的预期性能（包括基准测试），建议遵循以下配置：**

1. 温度设置于 0.5-0.7 区间（推荐 0.6），避免输出陷入循环或逻辑混乱
2. **勿添加系统提示词，所有指令应包含在用户输入中**
3. 数学问题建议在提示词中加入指令："请逐步推理，并将最终答案置于 \boxed{} 内"
4. 评估模型性能时，建议多次测试取平均值

## 7. 许可协议
本代码库和模型权重亦需遵循 [MIT 许可证](https://github.com/deepseek-ai/DeepSeek-R1/blob/main/LICENSE)。  
DeepSeek-R1 系列支持商业用途，允许修改和二次创作（包括但不限于用于其他 LLM 的蒸馏训练）。需注意：
- DeepSeek-R1-Distill-Qwen-1.5B/7B/14B/32B 基于 [Qwen-2.5 系列](https://github.com/QwenLM/Qwen2.5)（原协议 [Apache 2.0](https://huggingface.co/Qwen/Qwen2.5-1.5B/blob/main/LICENSE)），使用 DeepSeek-R1 生成的 80 万样本微调
- DeepSeek-R1-Distill-Llama-8B 基于 Llama3.1-8B-Base（原协议 [llama3.1 license](https://huggingface.co/meta-llama/Llama-3.1-8B/blob/main/LICENSE)）
- DeepSeek-R1-Distill-Llama-70B 基于 Llama3.3-70B-Instruct（原协议 [llama3.3 license](https://huggingface.co/meta-llama/Llama-3.3-70B-Instruct/blob/main/LICENSE)）

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
如有疑问，请提交 issue 或发送邮件至 [service@deepseek.com](service@deepseek.com)。
