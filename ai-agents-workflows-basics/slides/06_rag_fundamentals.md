---
marp: true
theme: default
paginate: true
---

# RAG Fundamentals

## Session 6

AI Agents & Workflows: Basics

---

# Agenda

- What is RAG?
- Why RAG exists
- LLM limitations
- RAG pipeline
- Documents
- Text splitting
- Embeddings
- Vector stores
- Retrieval
- Generation
- RAG vs Memory
- RAG vs Agent
- Practical RAG architecture
- Common problems
- Key takeaways

---

# Quick Recap

So far:

```text
Session 1: LLMs and AI Agents
Session 2: Workflows and Automation
Session 3: LangChain Models, Tools, Agents
Session 4: Memory and Prompt Engineering
Session 5: LangGraph Fundamentals
```

Now we add external knowledge.

---

# The Problem

LLMs are powerful, but they do not automatically know:

- your internal documentation
- your latest procedures
- your project-specific decisions
- private company knowledge
- newly created content
- local files and PDFs

So we need a way to provide relevant external knowledge.

---

# What is RAG?

## Retrieval-Augmented Generation

RAG means:

```text
Retrieve relevant information
        ↓
Add it to the prompt
        ↓
Generate an answer
```

The model answers using provided context.

---

# Simple Definition

```text
RAG = Search + LLM
```

More precisely:

```text
RAG = Retrieval + Context Injection + Generation
```

We search external knowledge first, then ask the LLM to answer using that knowledge.

---

# Without RAG

```text
User Question
      ↓
LLM
      ↓
Answer from model knowledge
```

Problem:

The model may not know your private or latest information.

---

# With RAG

```text
User Question
      ↓
Search Documents
      ↓
Relevant Context
      ↓
LLM
      ↓
Grounded Answer
```

The answer is grounded in retrieved documents.

---

# Example

User asks:

```text
How do we onboard a new Kubernetes namespace?
```

Without RAG:

```text
The LLM guesses based on generic Kubernetes knowledge.
```

With RAG:

```text
The app searches the internal onboarding template
and gives an answer based on that document.
```

---

# Why RAG Matters

RAG helps with:

- internal knowledge
- private documents
- current information
- project-specific answers
- reducing hallucinations
- citing sources
- building enterprise assistants

It gives the model relevant context at runtime.

---

# RAG Pipeline

```text
Documents
   ↓
Split into chunks
   ↓
Create embeddings
   ↓
Store in vector database
   ↓
Retrieve relevant chunks
   ↓
Send chunks to LLM
   ↓
Generate answer
```

---

# Two Phases

RAG has two main phases:

```text
Indexing Phase
  ↓
Prepare and store knowledge

Retrieval Phase
  ↓
Find relevant knowledge for a question
```

This distinction is important.

---

# Indexing Phase

```text
Load documents
      ↓
Split text
      ↓
Create embeddings
      ↓
Store vectors
```

This happens before answering user questions.

---

# Retrieval Phase

```text
User question
      ↓
Embed question
      ↓
Search vector store
      ↓
Retrieve relevant chunks
      ↓
Generate answer
```

This happens when the user asks something.

---

# Documents

A document is usually:

```text
page_content
metadata
```

Example metadata:

```text
source: "k8s-onboarding.md"
section: "namespace template"
owner: "platform team"
```

Metadata helps with filtering and citations.

---

# Text Splitting

Large documents are split into smaller chunks.

Why?

- LLM context is limited
- Retrieval works better on focused chunks
- Smaller chunks are easier to rank
- We do not want to send entire documents

---

# Chunk Size

Chunk size matters.

Too small:

```text
Context is fragmented.
```

Too large:

```text
Retrieval becomes noisy.
```

A common starting point is:

```text
chunk_size: 500-1000 characters
chunk_overlap: 50-200 characters
```

But this depends on the use case.

---

# Chunk Overlap

Overlap keeps context between chunks.

Example:

```text
Chunk 1: ... namespace requirements and labels
Chunk 2: labels and resource quotas ...
```

Overlap prevents losing important information at chunk boundaries.

---

# Embeddings

Embeddings convert text into vectors.

```text
Text
 ↓
Embedding model
 ↓
Vector of numbers
```

Similar meanings should produce similar vectors.

---

# Why Embeddings?

Keyword search looks for exact words.

Embedding search looks for meaning.

Example:

```text
Question:
"How do we deploy apps?"

Document:
"Applications are released through Jenkins pipelines."
```

The words differ, but the meaning is related.

---

# Vector Store

A vector store saves embeddings and documents.

Examples:

- Chroma
- FAISS
- Qdrant
- Pinecone
- Weaviate
- PostgreSQL + pgvector
- In-memory vector store for demos

The vector store enables similarity search.

---

# Similarity Search

```text
Question vector
      ↓
Compare with document vectors
      ↓
Return most similar chunks
```

The result is a list of relevant document chunks.

---

# Retriever

A retriever is the component that returns relevant documents.

```python
retriever = vector_store.as_retriever()
docs = retriever.invoke("How do we deploy?")
```

The retriever hides the search implementation.

---

# Generation

After retrieval, we build a prompt:

```text
Question:
...

Context:
retrieved chunk 1
retrieved chunk 2
retrieved chunk 3

Instruction:
Answer using only the context.
```

Then the LLM generates the final answer.

---

# Basic RAG Prompt

```text
You are a helpful assistant.

Use the provided context to answer the question.

If the answer is not in the context, say that you do not know.

Context:
{context}

Question:
{question}
```

This reduces guessing.

---

# RAG vs Prompt Engineering

Prompt engineering:

```text
Better instructions
```

RAG:

```text
Better knowledge
```

Both are usually needed.

---

# RAG vs Memory

```text
Memory
  ↓
What happened in the conversation?

RAG
  ↓
What external knowledge is relevant?
```

Memory is conversation context.
RAG is knowledge retrieval.

---

# RAG vs Agent

```text
RAG
  ↓
Retrieves knowledge and answers

Agent
  ↓
Chooses actions and tools
```

An agent can use RAG as one of its tools.

---

# Agentic RAG

In agentic RAG, the agent can decide:

- whether retrieval is needed
- which retriever to use
- whether to refine the query
- whether to retrieve again
- whether to call another tool

This is more dynamic than simple RAG.

---

# Simple RAG Architecture

```text
User
 ↓
Question
 ↓
Retriever
 ↓
Relevant Docs
 ↓
Prompt
 ↓
LLM
 ↓
Answer
```

This is the starting architecture.

---

# Enterprise RAG Architecture

```text
Data Sources
  ↓
Loaders
  ↓
Chunking
  ↓
Embeddings
  ↓
Vector Store
  ↓
Retriever
  ↓
LLM
  ↓
Answer + Sources
```

In production, add monitoring, security, and evaluation.

---

# Data Sources

Common data sources:

- Markdown files
- PDFs
- Confluence pages
- SharePoint
- Git repositories
- Jira tickets
- Runbooks
- API documentation
- Incident reports

The quality of the data source matters a lot.

---

# Metadata Matters

Good metadata enables:

- source attribution
- filtering
- permissions
- debugging
- freshness checks
- owner tracking

Example:

```json
{
  "source": "runbook.md",
  "team": "platform",
  "updated": "2026-07-17"
}
```

---

# RAG Quality Depends On Retrieval

If retrieval returns bad context, the LLM will answer badly.

Common retrieval problems:

- wrong chunks
- missing chunks
- outdated documents
- duplicate documents
- poor chunking
- poor metadata
- vague user query

RAG is only as good as the retrieved context.

---

# Hallucinations in RAG

RAG reduces hallucinations, but does not eliminate them.

The model can still:

- ignore context
- overgeneralize
- combine unrelated chunks
- invent missing details
- answer beyond the context

Use clear instructions and citations.

---

# Good RAG Answers

A good RAG answer should:

- answer the question
- use retrieved context
- avoid unsupported claims
- say when information is missing
- cite or mention sources
- be concise and actionable

---

# Common RAG Mistakes

- Dumping entire documents into the prompt
- Using chunks that are too large
- Using chunks that are too small
- Ignoring metadata
- No source citations
- No access control
- No evaluation
- No freshness strategy

---

# Security Considerations

For enterprise RAG:

- respect document permissions
- avoid leaking sensitive data
- filter by user access
- log carefully
- protect secrets
- validate external sources
- monitor usage

RAG can expose knowledge if not designed carefully.

---

# Evaluation

RAG systems should be evaluated.

Useful questions:

- Did retrieval find the right documents?
- Did the answer use the documents?
- Did the answer hallucinate?
- Was the answer complete?
- Was the answer useful?
- Were sources correct?

---

# Practical DevOps Example

```text
Question:
How do I troubleshoot a failing Kubernetes workload?

Retriever finds:
- workload troubleshooting runbook
- pod diagnostics checklist
- service dependency check

LLM answers:
- step-by-step troubleshooting process
- commands
- where to look next
```

This is a strong internal assistant use case.

---

# What We Will Build In Notebook

We will build:

1. A small knowledge base
2. Keyword retrieval baseline
3. Documents and metadata
4. Text splitting
5. Embeddings
6. In-memory vector store
7. Similarity search
8. Basic RAG chain
9. RAG with sources
10. RAG vs no-context example

---

# Key Takeaways

- RAG gives LLMs external knowledge.
- RAG has indexing and retrieval phases.
- Documents are split into chunks.
- Embeddings enable semantic search.
- Vector stores enable similarity search.
- Retrieved context is injected into the prompt.
- RAG is not the same as memory.
- An agent can use RAG as a tool.
- Good RAG needs good data, metadata, retrieval, and evaluation.

---

# Next Session

## LangSmith & Observability

- Why AI apps are hard to debug
- Tracing
- Tool calls
- Prompt inspection
- Evaluation
- Monitoring
- Cost and latency

---

# References

Official documentation:

- https://docs.langchain.com/oss/python/langchain/retrieval
- https://docs.langchain.com/oss/python/langchain/knowledge-base
- https://docs.langchain.com/oss/python/integrations/embeddings
- https://docs.langchain.com/oss/python/integrations/vectorstores
