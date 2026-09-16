# TCC Research Project

## Project goal

# Contexto do Projeto de TCC

## Título
Resiliência do Lado do Consumidor: Como resistir a Mudanças Estruturais em Base de Dados Públicas, uma Avaliação Comparativa de Ferramentas Open-Source de Qualidade de Dados

## Pergunta-problema
Em que medida ferramentas open-source de validação de schema/dados (como Great Expectations, Pandera, Frictionless e Soda Core) conseguem detectar mudanças estruturais em dados públicos, funcionando como mecanismo de resiliência do lado do consumidor na ausência de um data contract formal com o produtor?

## Contexto e escopo
Trata-se de um Trabalho de Conclusão de Curso (graduação), individual, com tempo limitado, escrito em Typst como artigo acadêmico. Por isso, o escopo foi deliberadamente definido como uma **avaliação comparativa empírica de ferramentas já existentes** — e não a proposta de um novo framework, o que seria inviável nesse formato.

O trabalho adota a perspectiva de um **consumidor de dados** que:
- não tem controle sobre o produtor dos dados (CNES/DataSUS);
- não possui nenhum data contract formal ou garantia de estabilidade de schema;
- precisa lidar com mudanças estruturais que podem quebrar silenciosamente pipelines analíticos.

Importante: o trabalho **não propõe** data contracts do lado do produtor. Ele investiga o que é possível fazer **apenas do lado do consumidor**, usando ferramentas de validação de dados (que são conceitualmente diferentes de data contracts — ver distinção abaixo).

## Distinção conceitual central
- **Data contract**: acordo formal entre produtor e consumidor, geralmente com enforcement no momento da publicação/escrita dos dados (ex: schema registry). Exige cooperação do produtor.
- **Ferramentas de validação de dados** (Great Expectations, Pandera, Frictionless, Soda Core): verificam se os dados recebidos atendem a expectativas definidas, aplicadas do lado do consumidor, de forma unilateral e posterior à publicação dos dados. Não exigem cooperação do produtor.

O TCC se posiciona explicitamente na segunda categoria, como resposta prática à ausência da primeira.

## Metodologia planejada
1. Definir critérios de comparação entre as ferramentas: tipos de mudança estrutural detectada (coluna adicionada/removida/renomeada, tipo alterado, mudança de encoding/delimitador), falsos positivos/negativos, esforço de configuração, facilidade de automação/alerta, extensibilidade, custo computacional, maturidade do projeto.
2. Coletar versões históricas reais dos dados do CNES com mudanças estruturais conhecidas (via FTP do DataSUS), ou provocar mudanças sintéticas controladas quando necessário.
3. Rodar cada ferramenta contra essas versões e medir empiricamente a capacidade de detecção e o esforço envolvido.
4. Apresentar resultados em tabela comparativa + discussão qualitativa.

## Motivação
O CNES é amplamente usado por pesquisadores, gestores públicos e empresas, mas não oferece garantias formais de estabilidade de schema nem comunicação estruturada de mudanças. Isso causa pipelines quebrando silenciosamente ou produzindo resultados incorretos sem aviso. A maior parte da literatura sobre data contracts assume que o consumidor tem poder de negociação com o produtor — o que não existe na relação entre um pesquisador/empresa e um órgão público. O trabalho preenche uma lacuna prática (guia de decisão para quem constrói pipelines sobre CNES ou bases públicas similares) e acadêmica (pouca literatura aplicada a dados públicos brasileiros).

## Pitch resumido
Dados públicos como os do CNES podem mudar de estrutura sem aviso, já que o governo não tem obrigação de comunicar isso a quem consome. Quando isso acontece, pipelines de análise quebram ou passam a gerar números errados silenciosamente. Este TCC testa, na prática, se ferramentas gratuitas de validação de dados conseguem funcionar como uma "rede de segurança" para detectar essas mudanças antes que causem estrago, comparando o desempenho de cada uma nesse cenário real usando o histórico de dados do CNES como estudo de caso.

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

search plan
→ search execution
→ papers and bibliographic records
→ screening
→ evidence extraction
→ synthesis
→ wiki
→ article

The expected directories are:

- `research/notes/search-plan/`
- `research/notes/screening/`
- `research/notes/evidence/`
- `research/notes/synthesis/`

## Bibliographic workflow schema

`0_Levantamento_Bibliografico_MODELO (1).xlsx` defines the fields used by the
research processing layer. The workbook is a structural model and operational
record; it is not an academic source.

Use the same stable paper ID across screening, evidence extraction and
synthesis. Preserve the relationship between each registered search result and
the search-plan execution that produced it.

The worksheet-to-repository mapping is:

| Worksheet | Repository destination | Specialized skill |
|---|---|---|
| `Plano_de_Busca` | `research/notes/search-plan/<search-id>.md` | `plan-literature-search` |
| `Triagem` — bibliographic registration | `research/notes/screening/<paper-id>.md` | `register-paper` |
| `Triagem` — eligibility assessment | same screening note | `screen-paper` |
| `Triagem` — decision provenance | same screening note | `register-screening-decision` |
| `Extração_de_Evidências` | `research/notes/evidence/<paper-id>.md` | `extract-evidence` |
| `Matriz_de_Síntese` | `research/notes/synthesis/` | `synthesize-literature` |

The `Listas` worksheet supplies controlled values for document type, screening
stage, decision, access, study type, method, language and workflow status. It
does not create a separate research-note stage.

## Workflow gates

- Plan and record the search before treating its results as the screening
  corpus.
- Register every returned record that is in scope for the documented search,
  not only promising papers.
- Define objective inclusion and exclusion criteria before applying them.
- Do not send an excluded or unresolved paper to evidence extraction.
- Do not synthesize a paper until its evidence note is complete enough for the
  fields being compared.
- Use `PENDENTE` for a stage not yet performed and `NÃO IDENTIFICADO` for
  information that was sought but could not be located.
- Never invent execution dates, result counts, reviewer identities, screening
  decisions, citation counts or journal indicators.
- When AI assists with search design, screening or extraction, disclose that
  assistance in the relevant notes; do not attribute human responsibility or
  validation that did not occur.

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
