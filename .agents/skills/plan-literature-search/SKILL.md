---
name: plan-literature-search
description: Create or update a reproducible literature search record in research/notes/search-plan using the fields from the Plano_de_Busca worksheet. Use for defining database queries or recording an executed search, not for screening individual papers.
---

# Plan Literature Search

## Purpose

Define a literature search before execution and record what was actually run.
The Markdown note is the project record corresponding to one row of the
`Plano_de_Busca` worksheet in
`0_Levantamento_Bibliografico_MODELO (1).xlsx`.

## Destination

`research/notes/search-plan/<search-id>.md`

Use a stable, descriptive ID. Do not overwrite a previous execution merely
because a query was revised; preserve the previous record and identify the new
version or execution.

## Required fields

Fill this structure, preserving the worksheet field order:

```markdown
# Plano de Busca

Tema/Área:
Objetivo Geral:
Pergunta de Pesquisa (PICO/SPIDER/Outros):
Bases de Dados (ex.: Scopus, WoS, PubMed, SciELO, IEEE, Google Scholar):
Campos de Busca (título/resumo/palavras-chave):
String de Busca #1:
String de Busca #2:
String de Busca #3:
Filtros (ano, idioma, tipo de doc.):
Data da Busca:
Responsável:
Nº de Resultados:
Observações:
```

## Field guidance

- **Tema/Área:** state the bounded subject of the search.
- **Objetivo Geral:** describe what the search is intended to discover or
  support; do not present the expected outcome as already established.
- **Pergunta de Pesquisa:** preserve the project's current question. Identify
  the framework used when applicable; do not force PICO or SPIDER when neither
  fits the study.
- **Bases de Dados:** name each database or search system actually planned or
  used. Do not conflate a database with a publisher website without noting the
  distinction.
- **Campos de Busca:** state whether the query targets title, abstract,
  keywords, full text, or another field.
- **Strings de Busca:** preserve Boolean operators, quotation marks,
  parentheses, wildcards, and database-specific syntax exactly. Associate each
  string with its database in the string itself or in `Observações`.
- **Filtros:** record only deliberately applied limits, including the exact
  year interval, languages, and document types when used.
- **Data da Busca:** record the actual execution date, preferably as
  `YYYY-MM-DD`. Use `PENDENTE` while the search is only planned.
- **Responsável:** record the accountable researcher or reviewer. Do not assign
  a person's name unless it was provided; AI assistance may be disclosed in
  `Observações` but does not replace human responsibility.
- **Nº de Resultados:** record the count reported by the search system for the
  executed query. Never estimate it. Use `PENDENTE` before execution.
- **Observações:** record adaptations per database, query version, export file,
  anomalies, duplicate-handling notes, or other information needed to reproduce
  the search.

## Process

1. Read the current research question, scope, and explicit methodological
   decisions from project files.
2. Separate the question into searchable concepts and identify justified
   synonyms or spelling variants.
3. Draft database-appropriate strings without silently changing the research
   question or scope.
4. Complete all planning fields and mark execution-dependent fields as
   `PENDENTE` when the search has not run.
5. After execution, update the date, responsible person, result count, exact
   query used, and relevant observations.
6. Ensure records sent to screening can be traced back to this search ID, for
   example through the `Base` or `Notas` fields of the screening note.

## Rules

- Do not invent databases, query executions, dates, responsible people, or
  result counts.
- Clearly distinguish a proposed string from an executed string.
- Do not use filters merely to obtain a convenient number of results.
- Do not design the search to exclude evidence that may contradict the project.
- Do not register or screen individual papers in this skill.
- If the project has not defined objective inclusion and exclusion criteria,
  flag that gap before screening begins.
