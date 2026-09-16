# Trabalho de Conclusão de Curso

## Título

**Validação do Lado do Consumidor diante de Mudanças Estruturais em Dados
Públicos: uma Avaliação Comparativa de Ferramentas Open-Source**

## Contexto

Este projeto investiga como consumidores de dados públicos podem identificar e
bloquear dados estruturalmente incompatíveis quando não existe um data contract
formal ou outra garantia de estabilidade fornecida pelo produtor.

O estudo utiliza dados do Cadastro Nacional de Estabelecimentos de Saúde (CNES),
disponibilizados pelo DataSUS, como estudo de caso. O consumidor não controla a
publicação desses dados e precisa proteger seu pipeline de ingestão contra
alterações que possam causar falhas ou resultados silenciosamente incorretos.

O trabalho não propõe um novo framework nem um data contract do lado do
produtor. Seu objeto é a validação unilateral realizada pelo consumidor após a
publicação dos dados.

## Objetivo

Buscar literatura sobre detecção de mudanças estruturais, qualidade de dados e
ferramentas de validação para fundamentar uma avaliação comparativa aplicada a
dados públicos.

## Pergunta de pesquisa

> Em um pipeline batch de ingestão de dados do CNES, em que medida Great
> Expectations, Pandera, Frictionless e Soda Core detectam e bloqueiam mudanças
> estruturais predefinidas, quando configuradas segundo uma mesma política de
> aceitação, considerando cobertura de detecção por tipo de mudança, falsos
> bloqueios, tempo de configuração e tempo de execução?

## Ferramentas avaliadas

- Great Expectations;
- Pandera;
- Frictionless;
- Soda Core.

## Avaliação experimental

As ferramentas serão integradas a um pipeline batch e configuradas para
representar uma mesma política de aceitação definida pelo consumidor. A
avaliação deverá combinar versões históricas do CNES, quando adequadas, com
mutações sintéticas controladas.

As mudanças estruturais candidatas incluem:

- adição, remoção, renomeação e reordenação de colunas;
- alteração de tipo;
- alteração de obrigatoriedade ou presença de valores nulos;
- mudanças de delimitador e encoding, tratadas separadamente como problemas de
  serialização ou ingestão quando ocorrerem antes da validação de schema.

Os resultados serão analisados por meio de:

- cobertura de detecção por tipo de mudança;
- falsos bloqueios de entradas consideradas compatíveis;
- falhas não detectadas;
- capacidade de impedir a continuação do pipeline;
- tempo de configuração inicial;
- tempo de execução em ambiente controlado.

O tempo de configuração inicial corresponde ao tempo ativo necessário, após a
instalação da ferramenta e a definição da política comum, para implementar os
checks, conectar a validação ao pipeline e obter a primeira execução em que os
casos mínimos produzem as decisões esperadas. Tempo de instalação e tempo de
manutenção de regras deverão ser registrados separadamente.

## Busca bibliográfica

### Informações da busca

| Campo | Definição |
|---|---|
| Base | Google Scholar |
| Campos | Pesquisa padrão do Google Scholar, sem restrição específica de campo |
| Filtros | Publicações a partir de 2022, em português ou inglês |
| Data da busca | 2026-08-23 |
| Responsável | Arthur |

### Strings de busca

```text
("great expectations" OR pandera OR "soda core" OR frictionless OR "dbt test*" OR "dbt-expectations")
AND ("data quality" OR "data validation")
AND ("comparative stud*" OR "comparative analysis" OR benchmark* OR "empirical comparison")
AND ("data engineering" OR "data pipeline" OR "software engineering")
```

```text
("schema evolution" OR "schema drift" OR "schema change*")
AND ("data pipeline" OR ETL OR "data integration" OR "data quality")
NOT ("XML schema" OR ontolog* OR "database migration" OR "schema matching")
```

```text
("open government data" OR "open data portal*" OR "dados abertos governamentais" OR "dados abertos")
AND ("data quality" OR "information quality" OR "quality assessment" OR "qualidade de dados")
NOT (epidemiolog* OR "clinical trial" OR "ensaio clínico" OR "sistema de informação" OR "aplicativo móvel")
```

O registro operacional e a proveniência das execuções são mantidos em
[`research/notes/search-plan/`](research/notes/search-plan/). Os documentos em
`research/papers/` são fontes originais e não são modificados.

## Estrutura do repositório

- `article/`: manuscrito científico em Typst;
- `research/papers/`: documentos acadêmicos originais;
- `research/notes/search-plan/`: planejamento e registro das buscas;
- `research/notes/screening/`: registros bibliográficos e decisões de triagem;
- `research/notes/evidence/`: extrações estruturadas dos artigos incluídos;
- `research/notes/synthesis/`: síntese comparativa das evidências;
- `research/wiki/`: entendimento consolidado e decisões do projeto.
