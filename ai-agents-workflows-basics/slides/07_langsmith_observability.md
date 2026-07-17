---
marp: true
theme: default
paginate: true
---

# LangSmith & Observability

## Session 7

AI Agents & Workflows: Basics

---

# Agenda

- Why observability matters
- Why AI apps are hard to debug
- Traces
- Runs
- Inputs and outputs
- Tool calls
- Latency and cost
- LangSmith overview
- Tracing LangChain apps
- Debugging agents
- Evaluation basics
- Datasets
- Human review
- Production monitoring
- Course wrap-up

---

# Quick Recap

So far:

```text
Session 1: LLMs and AI Agents
Session 2: Workflows and Automation
Session 3: LangChain Models, Tools, Agents
Session 4: Memory and Prompt Engineering
Session 5: LangGraph Fundamentals
Session 6: RAG Fundamentals
```

Now we learn how to debug, evaluate, and monitor AI applications.

---

# The Problem

Traditional applications are easier to debug:

```text
Input
 ↓
Deterministic code
 ↓
Output
```

AI applications are different:

```text
Input
 ↓
Prompt
 ↓
LLM
 ↓
Tool calls
 ↓
Retrieved context
 ↓
LLM
 ↓
Output
```

Many things can go wrong.

---

# Why AI Apps Are Hard To Debug

AI applications can fail because of:

- bad prompt
- wrong retrieved context
- wrong tool call
- missing memory
- model hallucination
- slow response
- high token usage
- broken tool
- unexpected model behavior

We need visibility into every step.

---

# What is Observability?

Observability answers questions like:

```text
What happened?
Why did it happen?
Where did it fail?
How long did it take?
How much did it cost?
Which input caused the issue?
```

For AI apps, observability must include model and tool behavior.

---

# What is LangSmith?

LangSmith is an observability and evaluation platform for LLM applications.

It helps you inspect:

- traces
- prompts
- model calls
- tool calls
- retrieved documents
- inputs and outputs
- errors
- latency
- feedback
- evaluations

---

# Core Concept: Trace

A trace is the full execution of one request.

```text
User request
  ↓
Prompt
  ↓
LLM call
  ↓
Tool call
  ↓
Retriever
  ↓
LLM call
  ↓
Final answer
```

A trace shows the whole path.

---

# Core Concept: Run

A run is one step inside a trace.

Examples:

```text
LLM call
Tool execution
Retriever call
Chain step
Graph node
Parser step
```

A trace contains many runs.

---

# Trace vs Run

```text
Trace
  ↓
The complete request execution

Run
  ↓
One individual step inside the trace
```

This is similar to distributed tracing in backend systems.

---

# Why Traces Matter

Traces help answer:

- What prompt was sent?
- Which model was used?
- Which tool was called?
- What did the tool return?
- Which documents were retrieved?
- Where did the error happen?
- How long did each step take?

Without traces, debugging agents is guesswork.

---

# Example: RAG Failure

User asks:

```text
How do I onboard a namespace?
```

Bad answer.

Possible causes:

```text
Retriever found wrong docs
Prompt did not tell model to use context
Context was too long
Model ignored the source
Document was outdated
```

Trace helps find which one happened.

---

# Example: Agent Failure

User asks:

```text
Check deployment status.
```

Agent gives wrong answer.

Possible causes:

```text
Agent selected wrong tool
Tool arguments were wrong
Tool returned an error
LLM misunderstood tool result
Memory had stale context
```

Trace shows the decision path.

---

# What To Track

Useful observability signals:

- input
- output
- model
- prompt
- latency
- token usage
- tool calls
- retrieved documents
- errors
- user feedback
- evaluation scores

This is AI application telemetry.

---

# LangSmith Environment Variables

Typical local setup:

```bash
LANGSMITH_TRACING=true
LANGSMITH_API_KEY=your_langsmith_api_key
LANGSMITH_PROJECT=ai-agents-workflows-basics
```

Keep API keys in `.env`, not in Git.

---

# Tracing LangChain Apps

LangSmith integrates with LangChain.

When tracing is enabled, LangChain components can automatically create traces.

Useful for:

- chains
- agents
- tools
- retrievers
- LangGraph workflows

---

# Manual Tracing

For custom Python functions, we can use tracing decorators.

Example:

```python
from langsmith import traceable

@traceable
def classify_ticket(ticket: str):
    return "incident"
```

This makes custom steps visible in traces.

---

# Observability for LangGraph

LangGraph workflows are especially good candidates for tracing.

```text
Node: classify
Node: retrieve
Node: analyze
Node: draft
Node: human_review
```

Each node can be inspected.

---

# Debugging Workflow

A practical debugging flow:

```text
Find bad output
  ↓
Open trace
  ↓
Inspect prompt
  ↓
Inspect retrieved context
  ↓
Inspect tool calls
  ↓
Identify failure point
  ↓
Fix prompt / retrieval / tool / state
  ↓
Run evaluation
```

---

# Evaluation

Debugging one failure is not enough.

We need to test the AI app on many examples.

Evaluation answers:

```text
Does the application work reliably across many inputs?
```

---

# Dataset

A dataset is a collection of test examples.

Example:

```json
{
  "input": "How do I onboard a production namespace?",
  "expected": "Mention approval, owner, monitoring contacts, quota."
}
```

Datasets let us compare versions.

---

# Evaluators

Evaluators score outputs.

Types:

- exact match
- contains expected information
- similarity
- correctness
- helpfulness
- human review
- LLM-as-judge

Start simple before using complex evaluators.

---

# Simple Evaluator

Example:

```text
Input:
"What is needed for production namespace?"

Expected keywords:
approval, monitoring, escalation owner

Score:
PASS if answer contains these keywords
```

This is basic but useful.

---

# Why Evaluation Matters

Without evaluation:

```text
We changed a prompt and hope it still works.
```

With evaluation:

```text
We changed a prompt and tested it on known examples.
```

This is more like software engineering.

---

# Regression Testing for AI

AI applications also need regression tests.

Example:

```text
Old prompt worked for 8/10 examples.
New prompt works for 9/10 examples.
```

Now we can compare versions.

---

# Human Feedback

Human feedback is important for AI systems.

Examples:

- thumbs up / thumbs down
- correction
- rating
- preferred answer
- issue tag
- reviewer comment

Feedback can become future evaluation data.

---

# Production Monitoring

In production, monitor:

- latency
- error rate
- cost
- token usage
- tool failures
- retrieval quality
- user feedback
- model changes
- prompt versions

AI apps need operational monitoring.

---

# Cost and Latency

AI applications can be expensive and slow.

Track:

```text
Prompt tokens
Completion tokens
Total tokens
Model used
Tool latency
Retriever latency
End-to-end latency
```

This helps optimize architecture.

---

# Security and Privacy

Tracing can contain sensitive data.

Be careful with:

- user input
- internal documents
- secrets
- tool outputs
- personal data
- production logs

Do not trace secrets unnecessarily.

---

# Redaction

Before tracing or logging, consider:

- masking secrets
- removing tokens
- filtering sensitive fields
- limiting document content
- storing metadata instead of full content

Observability must be safe.

---

# Enterprise Best Practices

For production AI systems:

- use separate projects per environment
- version prompts
- tag runs
- store metadata
- evaluate before release
- monitor cost and latency
- review failures
- collect human feedback
- protect sensitive data

---

# Tags and Metadata

Tags and metadata help filter traces.

Examples:

```text
environment: dev
course: ai-agents-workflows
component: rag
version: v1
team: platform
```

This is very useful at scale.

---

# Final AI App Lifecycle

```text
Build
  ↓
Trace
  ↓
Debug
  ↓
Evaluate
  ↓
Improve
  ↓
Monitor
```

This is the production loop for AI applications.

---

# Full Course Mental Model

```text
LLM
  ↓
Prompt
  ↓
Tool
  ↓
Agent
  ↓
Memory
  ↓
Graph
  ↓
RAG
  ↓
Observability
```

This is the foundation for real AI agent applications.

---

# Final Mini Project Idea

Build an internal engineering assistant that can:

- answer course questions
- search documentation
- use tools
- keep short-term memory
- route tasks with LangGraph
- trace runs in LangSmith
- evaluate answers on test questions

This combines the whole course.

---

# Key Takeaways

- AI apps need observability.
- A trace shows the full execution of a request.
- A run is one step inside a trace.
- LangSmith helps inspect prompts, model calls, tools, retrievers, and errors.
- Evaluation tests the app across many examples.
- Human feedback improves quality over time.
- Production AI requires tracing, evaluation, monitoring, and safety.

---

# Course Wrap-Up

You now understand:

- AI Agents
- Workflows
- LangChain
- Tools
- Memory
- Prompt Engineering
- LangGraph
- RAG
- LangSmith Observability

This is a strong foundation for building real AI agent workflows.

---

# References

Official documentation:

- https://docs.langchain.com/langsmith/observability
- https://docs.langchain.com/langsmith/observability-quickstart
- https://docs.langchain.com/langsmith/trace-with-langchain
- https://docs.langchain.com/langsmith/evaluation
- https://docs.langchain.com/langsmith/evaluate-llm-application
