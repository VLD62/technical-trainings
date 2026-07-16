---
marp: true
theme: default
paginate: true
---

# Memory & Prompt Engineering

## Session 4

AI Agents & Workflows: Basics

---

# Agenda

- Why memory exists
- Stateless LLMs
- Where memory really lives
- LangChain messages
- Conversation history
- Context window
- Memory strategies
- Prompt engineering
- LangChain prompt templates
- Enterprise best practices
- Preparing for LangGraph

---

# Quick Recap

In Session 3 we built the foundation:

```text
Model
  ↓
Prompt
  ↓
Chain
  ↓
Tool
  ↓
Agent
```

Today we add two important ideas:

- Memory
- Better prompts

---

# Why Memory Matters

Imagine this conversation:

```text
User:
My favorite programming language is Python.

Later...

User:
What is my favorite programming language?
```

Without memory, the model has no reliable way to know.

---

# Example Without Memory

```text
User:
My name is Vlad.

LLM:
Nice to meet you, Vlad.

-------------------------

User:
What is my name?

LLM:
I don't know.
```

Why?

Because the model does not automatically remember previous requests.

---

# Example With Memory

```text
User:
My name is Vlad.

Application stores:
"My name is Vlad."

-------------------------

User:
What is my name?

Application sends previous context.

LLM:
Your name is Vlad.
```

The memory comes from the application.

---

# LLMs Are Stateless

A model call is usually independent:

```text
Request 1
   ↓
LLM
   ↓
Response 1

Request 2
   ↓
LLM
   ↓
Response 2
```

The model itself does not keep session state between calls.

---

# Important Idea

## Memory is not magic.

Memory means:

```text
Application stores context
        ↓
Application sends relevant context
        ↓
LLM generates better answer
```

The LLM does not remember by itself.

---

# Where Does Memory Come From?

```text
Application
    ↓
Conversation History
    ↓
Prompt Construction
    ↓
LLM
    ↓
Response
```

The application is responsible for deciding what context to send.

---

# LangChain View

LangChain helps us structure:

- Messages
- Prompts
- Conversation history
- Tools
- Agent state
- Runtime context

This makes AI applications easier to build and maintain.

---

# LangChain Messages

LangChain works with structured messages.

Common message types:

```python
SystemMessage
HumanMessage
AIMessage
ToolMessage
```

This is better than managing one large string manually.

---

# Message Roles

```text
SystemMessage
  ↓
Developer instructions / behavior

HumanMessage
  ↓
User input

AIMessage
  ↓
Model response

ToolMessage
  ↓
Tool execution result
```

Messages form the conversation context.

---

# Conversation History

A simple conversation can be represented as:

```python
history = [
    SystemMessage(content="You are a helpful assistant."),
    HumanMessage(content="My name is Vlad."),
    AIMessage(content="Nice to meet you, Vlad."),
    HumanMessage(content="What is my name?")
]
```

This message list is sent to the model.

---

# Memory Is Usually Message History

For many applications, memory starts as:

```text
List of messages
```

Example:

```text
User message
AI response
User message
AI response
...
```

This gives the model conversational context.

---

# Prompt Construction

A real prompt is often built from multiple parts:

```text
System Prompt
      ↓
Conversation History
      ↓
Retrieved Documents
      ↓
Tool Results
      ↓
Current User Message
      ↓
LLM
```

Prompt engineering is not only "writing a question".

---

# Context Window

Every LLM has a maximum amount of input it can process.

This includes:

- System prompt
- User messages
- AI messages
- Tool results
- RAG documents
- Current request

Everything must fit inside the context window.

---

# Context Window Problem

If we send too much context:

- Higher cost
- Slower responses
- More irrelevant information
- Possible context limit errors
- Worse answer quality

More context is not always better.

---

# Context Management

Common approaches:

- Keep recent messages
- Remove irrelevant messages
- Summarize older history
- Retrieve only relevant documents
- Store long-term facts separately

This is part of application design.

---

# Memory Types

```text
Short-Term Memory
    ↓
Current conversation / current thread

Long-Term Memory
    ↓
Information stored across sessions
```

Both are useful, but they solve different problems.

---

# Short-Term Memory

Short-term memory is conversation scoped.

Examples:

- Current chat history
- Current task state
- Uploaded file in this session
- Tool results from this run

It helps the agent continue the current conversation.

---

# Long-Term Memory

Long-term memory persists across conversations.

Examples:

- User preferences
- Team information
- Saved facts
- Application knowledge
- Historical decisions

It usually requires a database or persistent storage.

---

# Memory vs RAG

Do not confuse memory with RAG.

```text
Memory
  ↓
What happened in the conversation?

RAG
  ↓
What external knowledge is relevant?
```

They often work together.

---

# Memory Strategies

Common strategies:

```text
Conversation Buffer
Conversation Summary
Vector Memory
Persistent Memory
```

Each strategy has trade-offs.

---

# Conversation Buffer

Stores full conversation history.

Good:

- Simple
- Easy to understand
- Works for short chats

Problems:

- Grows quickly
- Expensive
- Can exceed context window

---

# Conversation Summary

Instead of storing everything, summarize older messages.

```text
Old messages
    ↓
Summary
    ↓
Current messages
    ↓
LLM
```

Good for longer conversations.

---

# Vector Memory

Stores information as embeddings.

Useful for:

- Finding relevant past facts
- Semantic search
- Long-term knowledge lookup

This is closer to how RAG systems work.

---

# Persistent Memory

Persistent memory stores information outside the current session.

Examples:

```text
PostgreSQL
Redis
Vector database
Object storage
Application database
```

Useful for production systems.

---

# LangChain Memory Today

In older LangChain examples you may see:

```python
ConversationBufferMemory
```

Modern LangChain and LangGraph focus more on:

- Messages
- State
- Checkpointers
- Stores

This is important for production-ready agents.

---

# LangGraph Bridge

LangGraph gives agents state.

```text
Agent State
    ↓
Messages
    ↓
Tool Results
    ↓
Intermediate Values
    ↓
Next Step
```

This prepares us for the next session.

---

# Prompt Engineering

Prompt Engineering is designing instructions and context so the model produces better output.

It includes:

- Role
- Task
- Context
- Constraints
- Output format
- Examples

---

# Bad Prompt

```text
Explain Docker.
```

This can work, but it is vague.

Problems:

- Unknown audience
- Unknown depth
- Unknown output style
- Unknown constraints

---

# Better Prompt

```text
You are a Senior DevOps Engineer.

Explain Docker to a Junior Developer.

Use simple language.

Return maximum 5 bullet points.
```

This gives the model more guidance.

---

# Prompt Anatomy

A strong prompt often includes:

```text
Role
  ↓
Task
  ↓
Context
  ↓
Constraints
  ↓
Output Format
```

This makes the output more predictable.

---

# Role

Role defines the perspective.

Examples:

```text
You are a Senior DevOps Engineer.

You are a Python mentor.

You are a technical documentation reviewer.
```

Role helps shape style and depth.

---

# Task

Task defines what must be done.

Examples:

```text
Summarize this incident report.

Explain this code.

Generate a test plan.

Classify this ticket.
```

The task should be specific.

---

# Context

Context gives the model background information.

Examples:

```text
The audience is junior developers.

The system runs on Kubernetes.

The output will be used in an internal report.
```

Context improves relevance.

---

# Constraints

Constraints limit the output.

Examples:

```text
Use maximum 5 bullets.

Do not use jargon.

Do not invent missing information.

Ask a clarification question if needed.
```

Constraints reduce unwanted behavior.

---

# Output Format

Define the desired structure.

Examples:

```text
Return as Markdown.

Return as JSON.

Return as a table.

Return sections: Summary, Risks, Next Steps.
```

This is very useful in applications.

---

# LangChain Prompt Templates

Instead of hardcoding prompt strings:

```python
prompt = ChatPromptTemplate.from_template(
    "Explain {topic} to {audience}."
)
```

Prompt templates are reusable and easier to test.

---

# ChatPromptTemplate

For chat models, use message-based prompts:

```python
from langchain_core.prompts import ChatPromptTemplate

prompt = ChatPromptTemplate.from_messages([
    ("system", "You are a helpful technical trainer."),
    ("human", "Explain {topic} to {audience}.")
])
```

This matches how chat models work.

---

# MessagesPlaceholder

A placeholder can insert conversation history:

```python
from langchain_core.prompts import MessagesPlaceholder

prompt = ChatPromptTemplate.from_messages([
    ("system", "You are a helpful assistant."),
    MessagesPlaceholder("history"),
    ("human", "{question}")
])
```

This is a common LangChain pattern.

---

# Prompt + History + Model

```text
System Instructions
      ↓
History Placeholder
      ↓
Current Question
      ↓
Model
      ↓
Answer
```

This is how conversational AI is usually built.

---

# Prompt Templates in Applications

Good structure:

```text
prompts/
  assistant_system_prompt.txt
  incident_summary_prompt.txt
  ticket_classifier_prompt.txt

agents/
tools/
memory/
config/
tests/
```

Do not hide important prompts randomly inside code.

---

# System Prompt

The system prompt controls behavior.

Example:

```text
You are an internal engineering assistant.

Be concise.

Use only provided context when answering internal process questions.

If information is missing, say so.
```

This is application behavior.

---

# Human Prompt

The human prompt is the user's request.

Example:

```text
Summarize this incident and list the probable root cause.
```

The system prompt defines behavior.
The human prompt defines the current task.

---

# Tool Messages

When an agent uses a tool:

```text
LLM requests tool call
      ↓
Application executes tool
      ↓
ToolMessage contains result
      ↓
LLM uses result
```

Tool messages become part of context.

---

# Memory + Tools

```text
Conversation History
      ↓
Prompt
      ↓
LLM
      ↓
Tool Call
      ↓
Tool Result
      ↓
Final Answer
```

Memory helps the agent understand the current state.

Tools help the agent act.

---

# Good Agent Prompt

```text
You are a helpful engineering assistant.

Use tools when you need external information.

Do not guess internal system state.

If a tool fails, explain the failure clearly.

Keep answers concise and actionable.
```

This is much better than "You are helpful."

---

# Few-Shot Prompting

Few-shot prompting means giving examples.

```text
Input:
"Build failed because tests failed."

Output:
Category: Test Failure

Input:
"Deployment blocked by missing approval."

Output:
Category: Approval Issue
```

The model learns the expected pattern.

---

# Zero-Shot vs Few-Shot

```text
Zero-shot
  ↓
Instruction only

Few-shot
  ↓
Instruction + examples
```

Few-shot is useful when output format or classification matters.

---

# Structured Output

For applications, structured output is often better than free text.

Example:

```json
{
  "summary": "...",
  "risk_level": "high",
  "next_steps": ["...", "..."]
}
```

Structured output is easier to process automatically.

---

# Prompt Engineering Is Engineering

In production, prompts should be:

- Versioned
- Reviewed
- Tested
- Documented
- Monitored
- Improved over time

Treat prompts like application code.

---

# Common Prompt Problems

- Too vague
- Too long
- Conflicting instructions
- Missing context
- No output format
- Asking for unsupported facts
- Mixing data and instructions

These issues create unreliable behavior.

---

# Hallucinations

Hallucination means the model produces unsupported or false information.

Mitigations:

- Provide context
- Use RAG
- Use tools
- Ask model to say when unsure
- Validate important outputs
- Keep human review where needed

---

# Enterprise Best Practices

For internal AI applications:

- Do not hardcode secrets
- Do not expose sensitive data unnecessarily
- Store prompts separately
- Add logging and tracing
- Validate tool outputs
- Use access control
- Monitor cost and latency

---

# Best Practices for Context

- Keep context relevant
- Avoid dumping everything into the prompt
- Summarize old history
- Retrieve only useful documents
- Separate instructions from data
- Prefer structured outputs

Context management is a core AI engineering skill.

---

# Developer Mental Model

```text
Memory
  ↓
Prompt Template
  ↓
Messages
  ↓
Model
  ↓
Tools
  ↓
Output
```

This is the foundation of many LangChain applications.

---

# Production Project Structure

```text
project/

├── agents/
├── tools/
├── prompts/
├── memory/
├── rag/
├── config/
├── tests/
└── main.py
```

This keeps the AI application maintainable.

---

# What We Have Built So Far

```text
Session 1
  LLM basics

Session 2
  Workflows and automation

Session 3
  LangChain models, prompts, tools, agents

Session 4
  Memory, context, prompt engineering
```

Now we are ready for stateful agent workflows.

---

# Preparing for LangGraph

Question:

> What if the agent needs multiple steps, loops, state, checkpoints, or multiple agents?

Answer:

```text
LangGraph
```

LangGraph gives us explicit control over state and flow.

---

# Key Takeaways

- LLMs are stateless by default.
- Memory is managed by the application.
- LangChain represents conversations using messages.
- Context window management is important.
- Prompt templates make applications maintainable.
- Prompt engineering is part of software engineering.
- LangGraph is the next step for stateful agents.

---

# Next Session

## LangGraph Fundamentals

- State
- Nodes
- Edges
- Agent workflows
- Checkpoints
- Multi-step agents

---

# References

Useful official documentation:

- https://docs.langchain.com/oss/python/langchain/messages
- https://docs.langchain.com/oss/python/concepts/memory
- https://docs.langchain.com/oss/python/langchain/short-term-memory
- https://docs.langchain.com/oss/python/langgraph/add-memory
- https://docs.langchain.com/oss/python/concepts/context
