# TCC Research Project

## Project goal

This repository contains an undergraduate scientific research project
written as an academic article using Typst.

The research investigates how analytical pipelines that consume
Brazilian public CNES data can remain resilient when the structure
of the source data changes over time.

The study adopts the perspective of a downstream data consumer that
has no control over the data producer and no formal data contract
to guarantee schema stability

The main interest is in identifying, detecting, and handling structural
changes that could otherwise break or compromise analytical pipelines
and the data products built on top of them.

The research does not assume cooperation from the data producer and
does not aim to introduce producer-side data contracts. Instead, it
investigates resilience mechanisms that can be implemented from the
consumer side.

---

# Research architecture

The research repository follows a layered knowledge architecture.

## RAW layer

`research/papers/`

Contains the original academic sources.

Rules:

- Treat files in this directory as immutable source material.
- Never modify original papers.
- Never invent information that is not present in the sources.
- Do not promote claims directly from papers into the manuscript.
- Relevant information must first pass through the research notes workflow.

## Research processing layer

`research/notes/`

Contains the structured bibliographic workflow.

Expected flow:

papers
→ screening
→ evidence extraction
→ synthesis
→ wiki
→ article

The expected directories are:

- `notes/search-plan/`
- `notes/screening/`
- `notes/evidence/`
- `notes/synthesis/`

## Curated knowledge layer

`research/wiki/`

Contains the current consolidated understanding of the research project.

The wiki is not an academic source.

It exists to organize:

- research question;
- scope;
- terminology;
- methodological decisions;
- literature relationships;
- research gaps;
- open questions.

Whenever possible, statements added to the wiki must be traceable to
research notes or explicit project decisions.

## Manuscript

`article/`

Contains the Typst scientific manuscript.

Academic claims must ultimately be traceable to original sources.

The wiki or research notes must never be cited as academic sources.

---

# Evidence principles

Never fabricate:

- references;
- quotations;
- findings;
- datasets;
- experimental results;
- author conclusions.

Clearly distinguish:

1. what a source explicitly states;
2. interpretation of the source;
3. inference made for this research;
4. speculation.

If evidence cannot be located, explicitly mark the claim as unsupported.

Contradictory evidence must not be hidden simply because it weakens the
current research hypothesis.

Do not optimize answers to confirm the researcher's expectations.

---

# Writing principles

The researcher remains the author of the manuscript.

AI may:

- help structure arguments;
- suggest alternative formulations;
- improve clarity;
- identify missing transitions;
- identify unsupported claims;
- suggest how evidence may be connected.

AI must not silently introduce new scientific claims.

Whenever proposing academic text:

- distinguish source-supported information from interpretation;
- preserve the intended meaning;
- avoid strengthening claims beyond available evidence;
- flag areas where citations are needed.

Prefer assisting and explaining over replacing large amounts of text.

---

# Agent roles

Use specialized agents when their role matches the task.

## Writing Assistant

Use while constructing or improving academic text.

It helps the researcher express their intended argument.

It must not independently validate its own claims.

## Academic Writing Reviewer

Use after text has been written.

It checks grounding, citation fidelity, bias, claim strength and academic clarity.

## Literature Reviewer

Use when evaluating the relationship between the research and the literature.

## Scientific Reviewer

Use when evaluating the scientific argument as a whole.

## Research Auditor

Use periodically to audit whether the entire research process follows
the defined workflow and research rules.

---

# Core rule

No agent should try to make the research appear stronger than the evidence allows.

When uncertainty exists, preserve the uncertainty.