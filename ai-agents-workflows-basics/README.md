# AI Agents & Workflows: Basics

Welcome to the AI Agents & Workflows: Basics course.

This repository contains course materials, presentations, Jupyter notebooks, code examples, and exercises designed to provide a practical introduction to AI Agents and modern AI application development.

---

## Course Objectives

By the end of this course participants will:

* Understand the difference between LLMs and AI Agents
* Understand how tools, memory, and prompts work
* Understand workflow automation concepts
* Become familiar with LangChain, LangGraph, and LangSmith
* Build simple AI Agent applications
* Understand the modern AI Agent ecosystem

---

## Course Structure

### Session 0 – Course Introduction

* Course overview
* Learning objectives
* Environment setup

### Session 1 – Introduction to AI Agents

* What is an AI Agent?
* LLM vs Agent
* Agent architecture
* Agent lifecycle

### Session 2 – Workflows & Automation

* What is a workflow?
* Agent vs Workflow
* Automation concepts

### Session 3 – LangChain: Agents & Tools

* Tool calling
* Agent execution flow
* Working with tools

### Session 4 – Memory & Prompt Engineering

* Memory concepts
* Prompt design
* Human-in-the-Loop

### Session 5 – LangGraph

* Agent orchestration
* State machines
* Multi-step workflows

### Session 6 – Observability & Debugging

* LangSmith
* Tracing
* Evaluation

### Session 7 – Building a Simple AI Agent

* Putting everything together
* End-to-end example

---

## Repository Structure

```text
ai-agents-workflows-basics/
│
├── README.md
│
├── slides/
│   ├── 00_course_introduction.md
│   ├── 01_introduction_to_ai_agents.md
│   └── ...
│
├── notebooks/
│   ├── 01_introduction_to_ai_agents.ipynb
│   └── ...
│
├── examples/
│   ├── simple_llm.py
│   ├── simple_tool.py
│   └── ...
│
├── docs/
│   ├── glossary.md
│   └── useful_links.md
│
├── requirements.txt
│
└── .env.example
```

---

## Getting Started

Clone the repository:

```bash
git clone <repository-url>
cd ai-agents-workflows-basics
```

Create a virtual environment:

```bash
python -m venv .venv
```

Linux/macOS:

```bash
source .venv/bin/activate
```

Windows:

```cmd
.venv\Scripts\activate
```

Install dependencies:

```bash
pip install -r requirements.txt
```

Start JupyterLab:

```bash
jupyter lab
```

---

## OpenAI API Configuration

Create a `.env` file in the repository root:

```bash
cp .env.example .env
```

Example:

```text
OPENAI_API_KEY=your_api_key_here

LANGCHAIN_API_KEY=
LANGCHAIN_TRACING_V2=false

LANGCHAIN_PROJECT=ai-agents-workflows-basics
```

---

## Recommended Tools

* Python 3.11+
* JupyterLab
* VS Code
* Git

---

## Recommended Learning Approach

For each session:

1. Review the presentation slides
2. Run the accompanying Jupyter notebook
3. Experiment with the provided examples
4. Complete the exercises
5. Discuss findings with the group

---

## License

The educational content in this repository, including presentations,
documentation, diagrams, and exercises, is licensed under the
Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International
License.

Source code, scripts, and executable examples are licensed separately
under the MIT License.

Third-party images, trademarks, and referenced materials remain subject
to their respective owners and licenses.

