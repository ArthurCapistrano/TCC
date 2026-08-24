---
name: register-paper
description: Register every record returned by a literature search in research/notes/screening using the bibliographic fields from the Triagem worksheet. Use for identification and initial status, not for deciding inclusion or extracting evidence.
---

# Register Paper

## Purpose

Register a search result and create its initial screening record. Registration
does not imply that the paper has been included.

## Source

`research/papers/`

## Destination

`research/notes/screening/<paper-id>.md`

## Required fields

Fill the following structure:

# Identificação

ID:
Base:
Título:
Autores:
Ano:
Periódico/Conferência:
DOI/URL:
Idioma:
Tipo de Documento:
Acesso (Aberto/Fechado):

# Triagem

Critério de Inclusão (Y/N): PENDENTE
Critério de Exclusão (Y/N): PENDENTE
Motivo da Exclusão: PENDENTE
Situação (Título-Resumo/Texto Completo): PENDENTE
Decisão (Incluir/Excluir/Dúvida): PENDENTE
Revisor(a): PENDENTE
Data da Decisão: PENDENTE
Notas:

## Allowed values

Tipo de Documento:
- Artigo de periódico
- Artigo de conferência
- Livro
- Capítulo de livro
- Tese/Dissertação
- Relatório técnico
- Pré-print
- Outro

Acesso:
- Aberto
- Fechado

Idioma (lista inicial da planilha; use os valores configurados no projeto):
- pt
- en
- es

Situação:
- Título-Resumo
- Texto Completo

Decisão:
- Incluir
- Excluir
- Dúvida

## Rules

- Register all results returned by an in-scope executed search, not only records
  that appear promising.
- Preserve the same ID throughout the entire research workflow.
- Record the originating database in `Base` and retain enough information in
  `Notas` to trace the record to its search-plan entry when needed.
- Do not infer unavailable bibliographic metadata.
- Use `NÃO IDENTIFICADO` for unavailable bibliographic metadata and `PENDENTE`
  for fields that belong to a later workflow stage.
- Do not perform evidence extraction.
- Do not make a screening decision during registration unless the user
  explicitly asks to continue with the screening workflow.
