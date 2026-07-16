---

marp: true
theme: default
paginate: true
--------------

# Introduction to AI Agents

## Session 1

AI Agents & Workflows: Basics

---

# Agenda

* What is AI?
* What is an LLM?
* LLM vs Agent
* Agent Components
* Agent Lifecycle
* Agent Example
* AI Agent Ecosystem
* Summary

---

# What is AI?

Artificial Intelligence (AI) is the field of creating systems capable of performing tasks that normally require human intelligence.

Examples:

* Language understanding
* Image recognition
* Decision making
* Planning
* Problem solving

---

# What is an LLM?

LLM = Large Language Model

Examples:

* GPT
* Claude
* Gemini
* Llama

Capabilities:

* Understand text
* Generate text
* Summarize information
* Answer questions

---

# LLM vs Agent

## LLM

* Generates responses
* Works with provided context
* No direct access to external systems

## Agent

* Uses an LLM
* Uses tools
* Maintains memory
* Performs actions

---

# Agent Architecture

```text
User
  ↓
Agent
  ↓
LLM
  ↓
Tools / Memory
  ↓
Result
```

Agent = LLM + Tools + Logic + Memory

---

# Core Components

### LLM

The reasoning engine

### Tools

APIs, functions, databases, services

### Memory

Stores context and information

### Prompt

Defines behavior and rules

---

# Agent Lifecycle

1. Receive request
2. Analyze request
3. Decide what to do
4. Use tools if needed
5. Process results
6. Return answer

---

# Example

User:

"What is the weather in Sofia?"

Agent:

1. Understands the request
2. Calls weather API
3. Receives forecast
4. Generates answer

---

# AI Agent Ecosystem

* OpenAI
* Anthropic
* LangChain
* LangGraph
* LangSmith
* Ollama
* Hugging Face

These tools help build modern AI applications.

---

# Key Takeaways

* LLM is not an Agent
* Agents use tools and memory
* Prompts define behavior
* Agents can perform actions
* Modern frameworks simplify development

---

# Next Session

## Workflows & Automation

* What is a workflow?
* Agent vs Workflow
* Introduction to automation
* Practical examples

