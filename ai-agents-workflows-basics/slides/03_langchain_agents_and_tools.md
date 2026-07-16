---

marp: true
theme: default
paginate: true
--------------

# LangChain for Developers

## Session 3

AI Agents & Workflows: Basics

---

# Agenda

* Why LangChain Exists
* LangChain Architecture
* Core Components
* Models
* Prompts
* Chains
* Tools
* Agents
* LangChain Ecosystem
* Building Real AI Applications

---

# Why LangChain Exists

Calling an LLM directly is simple:

```python
response = client.responses.create(
    model="gpt-5",
    input="Explain AI Agents"
)
```

But real applications need:

* Multiple prompts
* Tools
* Memory
* RAG
* Agents
* Observability

Managing everything manually becomes difficult.

---

# What Problems Does LangChain Solve?

Without a framework:

* Prompt management
* Tool integration
* Context management
* Agent orchestration
* Vendor abstraction

Developers quickly end up writing a lot of glue code.

---

# LangChain Architecture

```text
Application
     ↓
 LangChain
     ↓
 LLM Provider

(OpenAI, Anthropic, Gemini, Ollama ...)
```

LangChain acts as an abstraction layer.

---

# Why Abstraction Matters

Today:

```python
OpenAI()
```

Tomorrow:

```python
Anthropic()
```

Or:

```python
Ollama()
```

Your application logic remains largely unchanged.

---

# Core LangChain Components

```text
Model
Prompt
Chain
Tool
Agent
Memory
```

These are the building blocks of most LangChain applications.

---

# Models

Models generate responses.

Example:

```python
from langchain_openai import ChatOpenAI

llm = ChatOpenAI(
    model="gpt-4o"
)
```

Supported providers:

* OpenAI
* Anthropic
* Gemini
* Ollama
* Azure OpenAI

---

# Prompts

Prompts define the behavior of the model.

```python
from langchain_core.prompts import ChatPromptTemplate

prompt = ChatPromptTemplate.from_template(
    "Explain {topic} in simple terms."
)
```

Think of prompts as reusable templates.

---

# Prompt + Model

```python
chain = prompt | llm
```

Input:

```python
chain.invoke({
    "topic": "AI Agents"
})
```

This is called LCEL (LangChain Expression Language).

---

# Chains

A Chain connects components together.

Example:

```text
Prompt
   ↓
Model
   ↓
Parser
```

Chains help build structured applications.

---

# Why Chains Matter

Without chains:

* More custom code
* More maintenance
* Harder testing

With chains:

* Reusable
* Composable
* Easier to understand

---

# Tools

A Tool gives an Agent access to external capabilities.

Examples:

* REST APIs
* Databases
* Search Engines
* Internal Services
* Python Functions

---

# Creating a Tool

```python
from langchain.tools import tool

@tool
def get_weather(city: str):
    return f"Weather in {city} is sunny"
```

The Agent can now use this tool.

---

# Tool Calling

Important:

The LLM does NOT execute tools.

The LLM decides:

* Which tool to call
* When to call it
* Which parameters to provide

Your application executes the tool.

---

# Agent Architecture

```text
User
  ↓
Agent
  ↓
LLM
  ↓
Tool
  ↓
Result
  ↓
Answer
```

This is the core Agent pattern.

---

# ReAct Pattern

Most modern agents follow:

```text
Reason
   ↓
Act
   ↓
Observe
   ↓
Reason
```

The Agent repeatedly reasons and acts until it reaches a result.

---

# Agent Example

User:

"What is the weather in Sofia?"

Agent:

1. Understand request
2. Select Weather Tool
3. Execute Tool
4. Receive result
5. Generate answer

---

# Real-World Developer Tools

Common enterprise tools:

* Jira
* Confluence
* GitHub
* GitLab
* Databases
* REST APIs
* Internal Services

Agents become much more useful when connected to real systems.

---

# LangChain Ecosystem

```text
LangChain
     ↓
LangGraph
     ↓
LangSmith
```

Each solves a different problem.

---

# LangChain

Purpose:

Build AI applications.

Provides:

* Models
* Prompts
* Chains
* Tools
* Agents

---

# LangGraph

Purpose:

Agent orchestration.

Provides:

* State management
* Complex workflows
* Multi-step agents
* Multi-agent systems

---

# LangSmith

Purpose:

Observability.

Provides:

* Tracing
* Debugging
* Evaluation
* Monitoring

---

# Example Project Structure

```text
project/

├── prompts/
├── tools/
├── agents/
├── memory/
├── workflows/
├── tests/
└── main.py
```

Typical structure for production AI applications.

---

# Key Takeaways

* LangChain is an application framework for LLMs
* Models, Prompts, Chains and Tools are the core concepts
* Agents use Tools to interact with external systems
* Tool Calling is a fundamental capability
* LangGraph and LangSmith extend LangChain

---

# Next Session

## Memory & Prompt Engineering

* Short-Term Memory
* Long-Term Memory
* Prompt Design
* Human-in-the-Loop
* Context Management

```
```

