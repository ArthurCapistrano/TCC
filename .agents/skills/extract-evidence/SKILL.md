---
name: extract-evidence
description: Extract structured evidence from an included paper using every field from the Extração_de_Evidências worksheet, while preserving source traceability and uncertainty. Use only after inclusion, not for screening or cross-paper synthesis.
---

# Extract Evidence

## Source

`research/papers/<paper-id>...`

Only papers classified as `Incluir` should normally reach this stage.

## Destination

`research/notes/evidence/<paper-id>.md`

## Output structure

# Evidence Extraction

## Identification

ID (mesmo da Triagem):
Use exactly the same ID assigned during screening.

## Study Type

Tipo de Estudo:

Suggested values:
- Experimental
- Quase-experimental
- Observacional
- Survey
- Estudo de Caso
- Revisão Sistemática
- Revisão Integrativa
- Meta-análise
- Teórico/Conceitual
- Outro

## Method

Método (Quant/Qual/Misto):
- Quantitativo
- Qualitativo
- Misto
- NÃO IDENTIFICADO

## Study Objective

Objetivo do Estudo:

Describe the objective stated by the authors.
Do not reinterpret the objective according to this TCC.

## Research Questions / Hypotheses

Perguntas/hipóteses do Estudo:

Record the questions or hypotheses explicitly presented by the paper.

If none are explicitly stated:

NÃO IDENTIFICADO

## Sample / Size / Population

Amostra/Tamanho/População:

Describe the analyzed population, dataset, systems, repositories,
organizations or other units of analysis.

## Context / Sector / Country

Contexto/Setor/País:

Identify:
- application context;
- sector/domain;
- country or geographical scope when relevant.

## Variables / Constructs

Variáveis/Constructos:

Identify the central variables, concepts or constructs evaluated.

For software/data engineering papers, this may include concepts such as:
- schema changes;
- failures;
- compatibility;
- resilience;
- data quality;
- pipeline behavior.

Do not force these examples if they are not present in the paper.

## Tools / Techniques

Ferramentas/Técnicas:

Record technologies, frameworks, algorithms, architectures,
experimental techniques or analytical methods used.

## Metrics / Evaluation

Métricas/Avaliação:

Record how the proposed approach or phenomenon was evaluated.

Examples may include:
- accuracy;
- execution time;
- failure rate;
- compatibility;
- number of detected changes.

Only include metrics actually used by the study.

## Main Results

Principais Resultados:

Record the main findings reported by the authors.

Do not strengthen conclusions.

## Contributions

Contribuições:

Record the contributions explicitly presented or clearly demonstrated
by the study.

Separate author claims from project interpretation.

## Limitations

Limitações:

Prioritize limitations explicitly acknowledged by the authors.

If additional limitations are inferred, label them:

PROJECT INTERPRETATION

## Implications

Implicações (teóricas/práticas):

Record implications discussed by the study.

## Article Keywords

Palavras-chave do Artigo:

Prefer the keywords supplied by the original paper.

## Citation Count

Número de Citações (aprox.):

Record only a count obtained from an identified source. Include the retrieval
date and source in `Observações`, because citation counts change over time. Use
`NÃO IDENTIFICADO` rather than estimating.

## Journal or Venue Indicator

Qualis/Fator de Impacto (se aplicável):

Record the indicator name, edition or reference year, and source when the
project has a justified use for it. Do not treat different indicators as
interchangeable and do not infer research quality from the indicator alone.

## Quality Assessment

Avaliação de Qualidade (ex.: CASP, MMAT):

Apply a named appraisal instrument only when the project protocol defines an
appropriate instrument for that study type. Preserve item-level uncertainty;
do not invent a score merely to fill the field.

## Workflow Status

Status (Pendente/Em Progresso/Concluído):
- Pendente
- Em Progresso
- Concluído

Use `Concluído` only when every applicable field has been checked against the
paper and missing information is explicitly marked.

## File Link

Link para PDF/Arquivo:

Record the repository path to the immutable source in `research/papers/` or a
stable source link when appropriate.

## Observations

Observações:

Record ambiguities, supplementary materials consulted, field-specific sources,
and clearly labelled project interpretations that do not belong in another
field.

---

# Traceability

For important extracted information, record when possible:

Source Page:
Source Section:
Source Table/Figure:

---

# Rules

- Never fabricate missing information.
- Use `NÃO IDENTIFICADO` when the paper does not provide the requested information.
- Do not fill fields merely because they are required by the spreadsheet.
- Preserve negative and contradictory findings.
- Distinguish source information from project interpretation.
- Do not update the research wiki directly.
- Do not retrieve or guess mutable citation and venue metrics unless the user
  requests that verification; otherwise mark them `NÃO IDENTIFICADO`.
