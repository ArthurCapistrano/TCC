---
name: register-paper
description: Register a newly collected academic paper and prepare its metadata using the same fields defined in the literature screening spreadsheet.
---

# Register Paper

## Purpose

Register a new paper in the RAW layer and create its initial screening record.

## Source

`research/papers/`

## Destination

`research/notes/screening/<paper-id>.md`

## Required fields

Fill the following structure:

# Paper Identification

ID:
Base:
Title:
Authors:
Year:
Journal/Conference:
DOI/URL:
Language:
Document Type:
Access:

# Screening

Inclusion Criterion:
Exclusion Criterion:
Exclusion Reason:
Screening Stage:
Decision:

## Allowed values

Document Type:
- Journal article
- Conference paper
- Book
- Book chapter
- Thesis/Dissertation
- Technical report
- Pre-print
- Other

Access:
- Open
- Closed

Screening Stage:
- Title-Abstract
- Full Text

Decision:
- Include
- Exclude
- Uncertain

## Rules

- Preserve the same ID throughout the entire research workflow.
- Do not infer unavailable bibliographic metadata.
- Use `NOT IDENTIFIED` when necessary.
- Do not perform evidence extraction.
- Initial screening fields may remain pending.