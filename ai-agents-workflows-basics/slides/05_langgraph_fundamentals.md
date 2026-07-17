---
marp: true
theme: default
paginate: true
---

# LangGraph Fundamentals

## Session 5

AI Agents & Workflows: Basics

---

# Agenda

- Why LangGraph exists
- LangChain vs LangGraph
- Graph mental model
- State
- Nodes
- Edges
- Conditional routing
- MessagesState
- Short-term memory
- Checkpointers
- Human-in-the-loop idea
- Practical workflow example
- Key takeaways

---

# Quick Recap

So far we have covered:

```text
Session 1: LLMs and AI Agents
Session 2: Workflows and Automation
Session 3: LangChain Models, Prompts, Tools, Agents
Session 4: Memory and Prompt Engineering
```

Now we move to stateful agent workflows.

---

# Why LangGraph Exists

LangChain is great for:

- model calls
- prompt templates
- tools
- simple chains
- simple agents

But complex agents need more control.

---

# Problem With Simple Agents

A simple agent loop can be hard to control:

```text
User
 ↓
Agent
 ↓
LLM
 ↓
Tool
 ↓
LLM
 ↓
Answer
```

But what if we need branching, approvals, retries, state, and multiple steps?

---

# Real Workflows Are Not Linear

Example:

```text
Receive ticket
 ↓
Classify ticket
 ↓
If incident → analyze logs
If documentation → search docs
If approval needed → ask human
 ↓
Draft response
 ↓
Review
 ↓
Send / close
```

This is a graph, not a simple chain.

---

# What is LangGraph?

LangGraph is a framework for building stateful, multi-step agent workflows.

It lets us model workflows as graphs:

```text
State
Nodes
Edges
```

The graph controls how the application moves from one step to the next.

---

# Core Idea

```text
State = what we know

Node = what we do

Edge = where we go next
```

This is the most important mental model.

---

# LangChain vs LangGraph

```text
LangChain
  ↓
Build LLM components

LangGraph
  ↓
Orchestrate stateful workflows
```

LangGraph can use LangChain models, prompts, tools, and messages.

---

# Graph Mental Model

```text
START
  ↓
Node A
  ↓
Node B
  ↓
END
```

Each node reads state and returns updates.

---

# State

State is the shared data structure of the graph.

Example:

```python
class State(TypedDict):
    input: str
    category: str
    response: str
```

All nodes can read from and write to state.

---

# Node

A node is usually just a Python function.

```python
def classify_node(state: State):
    return {"category": "incident"}
```

A node receives state and returns partial state updates.

---

# Edge

An edge tells LangGraph what to execute next.

```text
START → classify
classify → draft_response
draft_response → END
```

Edges define the workflow flow.

---

# Conditional Edge

Conditional edges allow branching.

```text
classify
   ↓
if incident → incident_handler
if docs     → docs_handler
if general  → general_handler
```

This is where LangGraph becomes very useful.

---

# Why State Matters

Without state:

```text
Each step forgets what happened before.
```

With state:

```text
Each step can read previous results
and add new information.
```

State makes multi-step workflows reliable.

---

# Simple Graph Example

```text
START
  ↓
prepare
  ↓
process
  ↓
finish
  ↓
END
```

Each node updates the same shared state.

---

# Developer View

```python
builder = StateGraph(State)

builder.add_node("classify", classify_node)
builder.add_node("respond", respond_node)

builder.add_edge(START, "classify")
builder.add_edge("classify", "respond")
builder.add_edge("respond", END)

graph = builder.compile()
```

Compile the graph before using it.

---

# What Happens During Execution?

```text
Input state
   ↓
Node reads state
   ↓
Node returns update
   ↓
LangGraph merges update into state
   ↓
Next node runs
   ↓
Final state
```

The final output is the final state.

---

# State Update Example

Initial state:

```json
{
  "ticket": "Build failed",
  "category": ""
}
```

Node returns:

```json
{
  "category": "build"
}
```

Final state:

```json
{
  "ticket": "Build failed",
  "category": "build"
}
```

---

# MessagesState

For chat and agents, LangGraph provides message-based state.

```text
messages
  ↓
HumanMessage
AIMessage
ToolMessage
```

This connects naturally with LangChain messages.

---

# Chatbot Graph

```text
START
  ↓
chatbot_node
  ↓
END
```

The chatbot node receives messages, calls the model, and appends the model response.

---

# Checkpointers

A checkpointer saves graph state.

This enables:

- short-term memory
- thread continuity
- resume after pause
- human-in-the-loop
- time travel debugging
- fault tolerance

---

# Thread ID

A thread ID identifies one conversation or workflow instance.

```text
thread_id = "user-123-ticket-456"
```

Same thread ID:

```text
continues existing state
```

Different thread ID:

```text
starts a separate state
```

---

# Checkpointer vs Store

```text
Checkpointer
  ↓
Short-term, thread-scoped state

Store
  ↓
Long-term, cross-thread data
```

This connects directly to Session 4.

---

# Human-in-the-Loop

LangGraph can pause execution and wait for human input.

Example:

```text
Draft response
  ↓
Human approval
  ↓
Send response
```

This is important for enterprise AI systems.

---

# Why Human-in-the-Loop Matters

Some actions should not be fully automated:

- sending emails to customers
- deleting resources
- approving deployments
- changing production configuration
- making financial decisions

The graph can pause before risky actions.

---

# LangGraph for DevOps Example

```text
Receive alert
  ↓
Classify severity
  ↓
Collect logs
  ↓
Analyze probable cause
  ↓
If high severity → human review
  ↓
Create incident summary
```

This is more controlled than a free-running agent.

---

# LangGraph for Internal Assistant

```text
User question
  ↓
Classify intent
  ↓
Search docs OR call tool OR ask clarification
  ↓
Generate answer
  ↓
Optionally store memory
```

This is a practical enterprise AI pattern.

---

# Workflow vs Agent in LangGraph

LangGraph can model both:

```text
Workflow
  ↓
Predetermined path

Agent
  ↓
Dynamic path decided by model/tool results
```

You can mix both.

---

# When To Use LangGraph

Use LangGraph when you need:

- multiple steps
- branching logic
- state
- memory
- human approval
- retries
- complex agent workflows
- better control and observability

---

# When Not To Use LangGraph

You may not need LangGraph for:

- one prompt
- simple text generation
- simple summarization
- simple prompt → model → output chain

Do not add complexity if a chain is enough.

---

# Practical Mental Model

```text
Prompt Engineering
  ↓
How to talk to the model

LangChain
  ↓
How to build LLM components

LangGraph
  ↓
How to control the workflow
```

---

# Production Concerns

In production, think about:

- state schema design
- retries and error handling
- idempotent nodes
- persistence
- human approvals
- tracing
- tests
- security boundaries

LangGraph helps structure these concerns.

---

# Common Mistake

Do not put everything inside one giant node.

Bad:

```text
one_node_does_everything()
```

Better:

```text
classify → retrieve → analyze → draft → review
```

Small nodes are easier to test and debug.

---

# Good Node Design

A good node should:

- do one clear task
- read state
- return state update
- be testable
- avoid hidden side effects when possible

Think of nodes as workflow steps.

---

# Good State Design

Good state should:

- contain raw data
- avoid unnecessary duplication
- be easy to understand
- support the next node
- not store huge irrelevant content

State is the backbone of the graph.

---

# What We Will Build In Notebook

We will build:

1. A simple graph
2. A multi-step graph
3. A graph with conditional routing
4. A chatbot graph with MessagesState
5. A graph with checkpointer memory
6. A practical support-ticket workflow

---

# Key Takeaways

- LangGraph models workflows as graphs.
- State is shared data.
- Nodes do work.
- Edges control flow.
- Conditional edges enable branching.
- Checkpointers provide short-term memory.
- Human-in-the-loop is possible through graph pauses.
- LangGraph gives control over complex agent workflows.

---

# Next Session

## RAG Fundamentals

- Embeddings
- Vector databases
- Document loading
- Retrieval
- Context injection
- RAG vs Agent
- Agentic RAG

---

# References

Official documentation:

- https://docs.langchain.com/oss/python/langgraph/overview
- https://docs.langchain.com/oss/python/langgraph/graph-api
- https://docs.langchain.com/oss/python/langgraph/persistence
- https://docs.langchain.com/oss/python/langgraph/thinking-in-langgraph
- https://docs.langchain.com/oss/python/langgraph/interrupts
