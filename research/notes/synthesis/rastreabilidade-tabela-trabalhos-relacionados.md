# Rastreabilidade da tabela de trabalhos relacionados

Esta nota reúne a tabela comparativa dos cinco trabalhos relacionados e os
trechos que sustentam a classificação de cada critério. As citações foram
mantidas no idioma original. As indicações de linha remetem às transcrições em
Markdown armazenadas em `research/papers/`.

## Critérios e escala

Os trabalhos são comparados segundo seis critérios:

1. Dados públicos: utiliza dados produzidos por órgãos públicos.
2. Mudanças estruturais: aborda alterações de colunas, tipos ou formatos.
3. Ferramentas selecionadas: inclui Great Expectations, Pandera, Frictionless
   ou Soda Core. O atendimento completo exige a inclusão das quatro
   ferramentas.
4. Avaliação empírica: executa métodos ou ferramentas sobre dados reais ou
   experimentais.
5. Protocolo comparativo: avalia mais de uma técnica ou solução sob critérios
   comuns.
6. Métricas de detecção: mede a capacidade de identificar casos corretos ou
   incorretos, por exemplo por acurácia ou resultados de validação.

Escala utilizada:

- **Sim:** atende ao critério.
- **Parcial:** aborda apenas parte do critério ou o faz de forma indireta.
- **Não:** não atende ou não avalia o critério.

## Tabela comparativa

| Critério | Foidl et al. (2024) | Yamanaka et al. (2024) | Ehrlinger e Wöß (2022) | Papastergios et al. (2026) | Oliveira et al. (2023) |
|---|---|---|---|---|---|
| Dados públicos | Não | Sim | Não | Não | Sim |
| Mudanças estruturais | Parcial | Sim | Parcial | Parcial | Parcial |
| Ferramentas selecionadas | Não | Não | Não | Parcial | Parcial |
| Avaliação empírica | Sim | Sim | Sim | Não | Sim |
| Protocolo comparativo | Não | Sim | Sim | Não | Parcial |
| Métricas de detecção | Não | Sim | Não | Não | Parcial |

## Foidl et al. (2024)

Fonte: `research/papers/Data Pipeline Quality  Influencing Factors, Root Causes of Data-related Issues, and Processing Problem Areas for Developers.md`

### 1. Dados públicos: Não

> “we first look at the root causes and stages of data-related issues in data pipelines by studying GitHub projects. Moreover, we further examine whether there are problem areas for developers [...] by analyzing Stack Overflow questions.”

Localização: linhas 94-98.

Interpretação: o estudo analisa relatos de desenvolvimento, não uma base
pública.

### 2. Mudanças estruturais: Parcial

> “Data representation — Data formats, data structures, data types, and further data representation aspects (e.g., data encoding).”

Localização: linhas 916-923.

> “Data type handling — Handling of data types (e.g., type casting, delimiter handling, encoding).”

Localização: linhas 1107-1111.

Interpretação: tipos, estruturas, delimitadores e *encoding* aparecem como
causas de problemas, mas não são aplicados como mudanças controladas.

### 3. Ferramentas selecionadas: Não

> “An empirical study about [...] the root causes of data-related issues [...] by examining a sample of 600 issues from 11 GitHub projects, and [...] analyzing a sample of 400 Stack Overflow posts.”

Localização: linhas 101-108.

Interpretação: o escopo não contempla a avaliação de Great Expectations,
Pandera, Frictionless ou Soda Core.

### 4. Avaliação empírica: Sim

> “To get a better understanding [...] we conducted two exploratory case studies.”

Localização: linhas 627-635.

> “After manually analyzing 100 data-related issues from the chosen GitHub projects, we identified seven root cause categories.”

Localização: linhas 1124-1129.

Interpretação: o trabalho realiza dois estudos de caso com dados observados em
projetos e discussões de desenvolvimento.

### 5. Protocolo comparativo: Não

> “The first study aimed at identifying the root causes [...] In the second study, we analyzed Stack Overflow posts to identify the main topics developers ask about.”

Localização: linhas 627-635.

Interpretação: os estudos de caso têm objetivos diferentes e não comparam
soluções sob os mesmos critérios.

### 6. Métricas de detecção: Não

> “The most frequent root cause identified in 33% of the analyzed problems is related to data types.”

Localização: linhas 1125-1135.

Interpretação: o percentual é uma frequência observacional, não uma medida da
capacidade de detectar alterações conhecidas.

## Yamanaka et al. (2024)

Fonte: `research/papers/Statistical Validation of Column Matching in the Database.md`

### 1. Dados públicos: Sim

> “This paper presents a statistical methodology to validate the integration of 12 years of open-access datasets from Brazil’s School Census, with a new version of the datasets released annually by the Brazilian Ministry of Education (MEC).”

Localização: linhas 19-31.

Interpretação: os dados abertos do Censo Escolar brasileiro são o objeto da
avaliação.

### 2. Mudanças estruturais: Sim

> “the publicly available data files have undergone 416 individual changes in naming conventions, as well as the addition and removal of columns over the years.”

Localização: linhas 68-70.

> “This paper focuses on addressing the challenges associated with column name changes and additions/removals.”

Localização: linhas 123-129.

Interpretação: o estudo observa renomeações, adições e remoções de colunas entre
versões reais dos dados.

### 3. Ferramentas selecionadas: Não

> “Our methodology encompasses metrics from four goodness-of-fit statistical tests [...] Kolmogorov-Smirnov [...] Anderson-Darling [...] Welch’s t-test [...] and the F-test.”

Localização: linhas 81-87.

Interpretação: o estudo utiliza um algoritmo próprio e testes estatísticos em
R, sem incluir as ferramentas selecionadas para o TCC.

### 4. Avaliação empírica: Sim

> “we delve into the experiments we conducted using statistical techniques on data retrieved from the LDE database.”

Localização: linhas 327-330.

Interpretação: os testes são executados sobre dados reais recuperados do banco
do Laboratório de Dados Educacionais.

### 5. Protocolo comparativo: Sim

> “We use the well-known Kolmogorov–Smirnov test, Anderson–Darling test, Welch’s t-test, and the F-test to compare the distributions.”

Localização: linhas 164-170.

> “We define a successful match as an exact match between a column and its corresponding column from the previous year.”

Localização: linhas 381-391.

Interpretação: os quatro testes são avaliados com os mesmos dados e a mesma
definição de acerto.

### 6. Métricas de detecção: Sim

> “The accuracy is defined as acc = hits / #columns.”

Localização: linhas 382-391.

> “The Top 3 consider a hit if the predicted fit appears in the three most probable fits.”

Localização: linhas 423-429.

Interpretação: o estudo define acerto e calcula acurácia para os cenários *Top
1* e *Top 3*.

## Ehrlinger e Wöß (2022)

Fonte: `research/papers/A Survey of Data Quality Measurement and Monitoring Tools.md`

### 1. Dados públicos: Não

> “For the evaluation [...] we used a modernized version of the well-known Northwind DB [...] with five tables.”

Localização: linhas 374-380.

Interpretação: a avaliação utiliza o banco de exemplo Northwind, não dados
públicos governamentais.

### 2. Mudanças estruturais: Parcial

> “Patterns, data types, and domains”
>
> “Basic type”
>
> “DBMS-specific data type”

Localização: linhas 326-333.

Interpretação: o catálogo considera tipos e padrões, mas não testa mudanças de
*schema* entre versões.

### 3. Ferramentas selecionadas: Não

A relação das ferramentas avaliadas aparece nas linhas 437-456. Ela inclui
Aggregate Profiler, Apache Griffin, Ataccama ONE, DataCleaner, MobyDQ,
OpenRefine, Talend e outras soluções. Nenhuma das quatro ferramentas do TCC
está nessa lista. “Experian Pandora” não deve ser confundida com Pandera.

### 4. Avaliação empírica: Sim

> “To compare the results [...] we defined a test case for each requirement from the data profiling category.”

Localização: linhas 382-415.

> “All test cases were conducted by two researchers [...] who verified each other's results.”

Localização: linha 417.

Interpretação: as ferramentas foram instaladas e submetidas a casos de teste
com uma base comum.

### 5. Protocolo comparativo: Sim

> “The aim is to rate the fulfillment of each requirement with three categories: (✓) for fulfilled, (−) for not fulfilled, and (p) for partially fulfilled.”

Localização: linhas 362-365.

> “To compare the results of the requirements between the DQ tools, we defined a test case for each requirement from the data profiling category.”

Localização: linhas 382-384.

Interpretação: há uma base comum, casos de teste e uma escala compartilhada
entre as ferramentas.

### 6. Métricas de detecção: Não

> “We did not define such fine-grained test cases for the DQ measurement category since the DQ metric implementations were too diverse to compare their results directly.”

Localização: linhas 382-385.

Interpretação: o estudo classifica o atendimento aos requisitos, mas não
calcula acurácia, falsos positivos ou falsos negativos da detecção.

## Papastergios et al. (2026)

Fonte: `research/papers/Unfolding Data Quality Dimensions in Practice: A Survey.md`

### 1. Dados públicos: Não

> “Our survey focuses on relational data.”

Localização: linha 35.

> “we conducted a thorough examination of each tool’s official documentation and source code.”

Localização: linhas 81-85.

Interpretação: o objeto de análise são as ferramentas e suas implementações,
não uma base pública.

### 2. Mudanças estruturais: Parcial

> “This category addresses the question ‘What error detection checks can be executed on the schema of a database to assess its quality?’”

Localização: linhas 269-273.

> “It detects structural discrepancies, such as missing or extraneous columns.”

Localização: linhas 281-285.

Interpretação: o estudo cataloga verificações estruturais, mas não as testa
sobre versões alteradas.

### 3. Ferramentas selecionadas: Parcial

> “dbt Core”
>
> “Deequ”
>
> “Evidently”
>
> “Great Expectations (GX)”
>
> “Griffin”
>
> “MobyDQ”
>
> “Soda Core”

Localização: linhas 69-77.

Interpretação: a lista contém Great Expectations e Soda Core, mas não Pandera
e Frictionless.

### 4. Avaliação empírica: Não

> “systematic source code examination of seven widely used open-source DQ tools.”

Localização: linhas 24-26.

> “we tracked and thoroughly studied the exact source code fragments that are executed when each one of these functionalities is used.”

Localização: linhas 89-97.

Interpretação: há exame sistemático do código, mas não execução experimental
das ferramentas sobre dados ou mudanças estruturais.

### 5. Protocolo comparativo: Não

> “Our survey’s objective is not to compare the tools. Instead, we treat these tools as representatives of the current error detection landscape.”

Localização: linhas 120-125.

Interpretação: os autores declaram que o objetivo do levantamento não é
comparar as ferramentas. Não há casos de teste comuns ou *benchmark*.

### 6. Métricas de detecção: Não

> “Columns 13–19 represent the examined DQ tools, indicating whether a tool directly implements a functionality through built-in checks.”

Localização: linhas 122-124.

Interpretação: a matriz registra a presença de funcionalidades, não a eficácia
da detecção.

## Oliveira et al. (2023)

Fonte: `research/papers/Assessing Data Quality Inconsistencies in Brazilian.md`

### 1. Dados públicos: Sim

> “governmental information of the Brazilian state of Minas Gerais”
>
> “two real applications: public bids and public expenditure”

Localização: linhas 19-27.

Interpretação: as duas aplicações utilizam dados governamentais brasileiros.

### 2. Mudanças estruturais: Parcial

> “table formatting, such as size and existence of rows/columns”
>
> “Timestamp and JSON”
>
> “file-related functions”

Localização: linhas 323-335.

> “GE provides several native indicators that perform generic data validations, such as checking field types.”

Localização: linhas 407-415.

Interpretação: o estudo verifica tipos, formatos e existência de colunas, mas
não acompanha mudanças entre versões.

### 3. Ferramentas selecionadas: Parcial

> “Aggregate Profiler”
>
> “Apache Griffin”
>
> “Great Expectations”
>
> “MobyDQ”
>
> “OpenRefine & Metric”
>
> “PyDeequ”
>
> “Talend Open Studio”
>
> “Tensorflow Data Validation”

Localização: linhas 227-247.

Interpretação: Great Expectations é a única das quatro ferramentas selecionadas
para o TCC.

### 4. Avaliação empírica: Sim

> “This section presents the application of a data quality tool in a big data environment with real data from public bids.”

Localização: linhas 504-517.

> “Table 4 presents the number of successes and failures in the indicators for each analyzed table.”

Localização: linhas 593-607.

Interpretação: Great Expectations é executada sobre dados reais e os resultados
dos indicadores são analisados.

### 5. Protocolo comparativo: Parcial

> “we compare the eight open-source tools regarding their respective functionalities.”

Localização: linhas 312-319.

> “To perform the comparative analysis [...] we evaluate only each tool’s documentation.”

Localização: linhas 323-326.

Interpretação: as oito ferramentas são comparadas pela documentação, mas
somente Great Expectations é executada sobre os dados.

### 6. Métricas de detecção: Parcial

> “validation failures mean GE indicators that returned an error, regardless of the number of records impacted.”

Localização: linhas 827-840.

> “each indicator [...] presents a percentage of unexpected values found.”

Localização: linhas 845-861.

Interpretação: o artigo mede falhas e valores inesperados, mas não utiliza um
*ground truth* para calcular a correção da detecção.
