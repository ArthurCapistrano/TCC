# Trabalhos relacionados

## P004

**ID:** P004

**Autor(es) e Ano:** Foidl et al. (2024). O arquivo analisado preserva o pré-print de 2023 da versão publicada.

**Tema/Subtema:** Qualidade de pipelines de dados; fatores de influência, causas-raiz de problemas relacionados a dados e áreas problemáticas do processamento.

**Tipo de Estudo:** Outro — estudo multimétodo composto por revisão multivocal, entrevistas estruturadas e dois estudos de caso exploratórios com mineração de GitHub e Stack Overflow.

**Método:** Misto: síntese temática qualitativa, avaliações em escala Likert, rotulagem manual, codificação indutiva/dedutiva e frequências descritivas.

**Contexto/País:** Engenharia de software e de dados, sem domínio de aplicação específico; literatura científica e cinzenta, projetos open-source no GitHub, posts do Stack Overflow e especialistas de diferentes áreas de negócio. País da população estudada: NÃO IDENTIFICADO.

**Variáveis centrais:** Qualidade de pipelines; fatores ligados a dados, desenvolvimento e implantação, infraestrutura, ciclo de vida e processamento; representação, metadados, fontes, garantia da qualidade, data drift, compatibilidade, monitoramento, linhagem, automação, limpeza e tipos de dados; causas-raiz e estágios do pipeline.

**Achados Relevantes (1-2 frases):** A taxonomia reúne 41 fatores em 14 categorias e cinco temas; 13 categorias foram avaliadas pela maioria dos especialistas como de influência média a alta, embora os autores recomendem cautela no ranking. Tipos de dados foram 33% das causas-raiz nas 100 issues do GitHub, e compatibilidade apareceu em 8% dos posts analisados do Stack Overflow, afetando a funcionalidade central em todos esses casos; a associação entre compatibilidade e tipos de dados é apresentada apenas como possibilidade.

**Lacunas/Oportunidades:** **AUTHOR-STATED GAP:** os autores recomendam aprofundar os problemas de compatibilidade e tipos de dados, investigar dependências entre fatores, ranquear fatores individualmente e desenvolver métricas de dificuldade para tópicos do Stack Overflow. **PROJECT-INTERPRETED OPPORTUNITY:** testar experimentalmente se ferramentas de validação detectam tipos concretos de mudança estrutural, pois este estudo é observacional, não usa versões históricas de bases públicas e não mede eficácia de detecção, falsos resultados, esforço ou desempenho; isso é uma oportunidade derivada deste estudo, não prova de lacuna geral na literatura.

**Como contribui para minha pesquisa:** Fundamenta a relevância de representação, tipos, símbolos/caracteres, compatibilidade, ingestão, metadados, validação e monitoramento na resiliência de pipelines e apoia a seleção de mudanças a testar. Sua contribuição é contextual e indireta: não avalia Great Expectations, Pandera, Frictionless ou Soda Core nem mudanças em bases públicas.

## P002

**ID:** P002

**Autor(es) e Ano:** Yamanaka et al. (2024). A fonte local é a versão do arXiv aceita no SBBD 2024.

**Tema/Subtema:** Evolução de schema e validação estatística da correspondência de colunas entre versões anuais de dados públicos.

**Tipo de Estudo:** Experimental.

**Método:** Quantitativo: quatro testes estatísticos de aderência, algoritmo de correspondência e avaliação contra um ground truth, comparando o ano anterior e distribuições acumuladas de anos anteriores.

**Contexto/País:** Integração de versões anuais dos dados públicos do Censo Escolar no Laboratório de Dados Educacionais, Brasil, entre 2007 e 2021. A nota preserva uma inconsistência da fonte: o texto declara 12 anos de dados, mas as tabelas abrangem 2007-2021.

**Variáveis centrais:** Evolução de schema; correspondência de colunas; colunas idênticas, novas e sem dados no ano seguinte; renomeação, adição e remoção; distribuições, médias e variâncias; estatísticas e valores-p; acurácia Top 1 e Top 3; comparação anual ou acumulada.

**Achados Relevantes (1-2 frases):** Kolmogorov-Smirnov obteve a maior acurácia média no cenário com o ano anterior: 0,847 no Top 1 e 0,897 no Top 3; Anderson-Darling chegou a 0,887 no Top 3. A acurácia caiu no cenário acumulado, e mudanças nas políticas de coleta são apenas uma hipótese explicativa; a fonte também apresenta números contraditórios para adições e remoções em 2019.

**Lacunas/Oportunidades:** **AUTHOR-STATED GAP:** avaliar atributos binários e categóricos, que exigem testes diferentes; a automação da análise de qualidade do schema e o uso de aprendizado de máquina são indicados como trabalho futuro. **PROJECT-INTERPRETED OPPORTUNITY:** comparar ferramentas open-source de validação sob mutações controladas e versões históricas, incluindo tipo, encoding e delimitador, falsos positivos/negativos, custo e esforço; P002 não avalia essas ferramentas, e essa ausência neste estudo não demonstra lacuna geral.

**Como contribui para minha pesquisa:** Fornece evidência empírica diretamente próxima do problema de mudanças não comunicadas em dados públicos: identifica adição, remoção e renomeação e apoia a correspondência de colunas sem depender de seus nomes. Também oferece referência metodológica de ground truth e acurácia, mas o procedimento de construção desse ground truth não é descrito em detalhe e o Top 3 ainda requer decisão de especialista.

## P006

**ID:** P006

**Autor(es) e Ano:** Ehrlinger e Wöß (2022).

**Tema/Subtema:** Ferramentas de qualidade de dados para profiling, medição e monitoramento contínuo/automatizado.

**Tipo de Estudo:** Survey.

**Método:** Misto por interpretação do projeto: busca e seleção de ferramentas, avaliação categórica por 43 requisitos, 30 casos de teste de profiling no Northwind e investigação descritiva de instalação, documentação, interfaces e suporte. O artigo não se autodeclara como método misto.

**Contexto/País:** Ferramentas generalistas de gestão e engenharia de dados; avaliação sobre banco relacional Northwind com cinco tabelas. Escopo geográfico da avaliação: NÃO IDENTIFICADO; as instituições dos autores são da Áustria.

**Variáveis centrais:** Profiling; dimensões e métricas de qualidade; regras de negócio; monitoramento por agendamento, armazenamento, recuperação, comparação e visualização temporal; atendimento integral, parcial ou ausente dos requisitos; interface e suporte.

**Achados Relevantes (1-2 frases):** Onze das 13 ferramentas avaliadas suportaram profiling ao menos parcialmente, mas nenhuma implementou ampla variedade das métricas destacadas na literatura; completude e unicidade foram as mais comuns e geralmente operaram no nível de atributo. Armazenamento e agendamento eram difundidos, porém monitoramento generalista completo era tipicamente comercial; Apache Griffin foi a exceção open-source dedicada, com automação de métricas, mas sem funções predefinidas e sem profiling, e um teste do Aggregate Profiler divergiu de SAS e NumPy.

**Lacunas/Oportunidades:** **AUTHOR-STATED GAP:** a investigação profunda dos requisitos de profiling e da correção de implementações ficou para trabalhos posteriores; os autores defendem aprimorar automação e tornar explícitos cálculos, algoritmos, parâmetros e limiares. **PROJECT-INTERPRETED OPPORTUNITY:** adaptar as dimensões de regras, agendamento, armazenamento, comparação e alertas a uma avaliação empírica de mudanças estruturais em arquivos públicos; Northwind não representa versões históricas, CNES, encoding ou delimitador, e essa delimitação não prova ausência geral de estudos.

**Como contribui para minha pesquisa:** Oferece um catálogo operacional para avaliar profiling, medição, regras e monitoramento do lado do consumidor e evidencia que cobertura funcional não equivale a correção da implementação. A comparação não inclui Great Expectations, Pandera, Frictionless ou Soda Core e não mede detecção de mudanças estruturais, falsos resultados ou custo computacional.

## P005

**ID:** P005

**Autor(es) e Ano:** Papastergios, Ehrlinger e Gounaris (2026). A versão curta preliminar de 2024 não é tratada como estudo separado.

**Tema/Subtema:** Materialização de dimensões de qualidade de dados em funcionalidades de baixo nível de ferramentas open-source.

**Tipo de Estudo:** Survey.

**Método:** Qualitativo por interpretação do projeto: exame sistemático de documentação e código-fonte, extração e reconciliação de funcionalidades, agrupamento conceitual e mapeamento para seis dimensões da ISO/IEC 25012. O artigo não declara explicitamente essa classificação metodológica.

**Contexto/País:** Avaliação de qualidade de dados relacionais em bancos, CSV e XLS, independente de domínio. Setor e país: NÃO IDENTIFICADO.

**Variáveis centrais:** Funcionalidades de baixo nível e variantes; dimensões accuracy, completeness, consistency, currentness, accessibility e compliance; relação muitos-para-muitos; granularidade de valor, linha, coluna e tabela; avaliação direta e indireta; categorias de checks e presença de implementação direta e embutida.

**Achados Relevantes (1-2 frases):** Nenhuma das sete ferramentas cobre todo o espectro catalogado, e a terminologia varia: nomes diferentes podem designar implementações semelhantes e termos semelhantes podem designar funcionalidades diferentes. A relação entre checks e dimensões é muitos-para-muitos; uma ausência na matriz não significa impossibilidade, pois a função pode ser indireta ou definida pelo usuário, e o survey declara não ter objetivo comparativo.

**Lacunas/Oportunidades:** **AUTHOR-STATED GAP:** os autores apontam como trabalhos futuros a padronização de checks, a investigação de qualidade em streams e métodos sensíveis a dependências temporais e distribuição. **PROJECT-INTERPRETED OPPORTUNITY:** verificar empiricamente os checks de schema incorporados em Great Expectations e Soda Core diante de versões históricas e mutações controladas, comparando também ferramentas não cobertas pelo survey; a falta dessa avaliação em P005 não estabelece uma lacuna geral.

**Como contribui para minha pesquisa:** Sustenta a seleção de checks de schema, presença, ausência, ordem de colunas e tipos para Great Expectations e Soda Core e alerta contra inferir capacidade apenas da nomenclatura ou de uma matriz documental. Não fornece evidência de resiliência, taxas de erro, esforço, automação ou custo computacional e não inclui Pandera ou Frictionless.

## P001

**ID:** P001

**Autor(es) e Ano:** Gabriel P. Oliveira; Bárbara M. A. Mendes; Clara A. Bacha; Lucas L. Costa; Larissa D. Gomide; Mariana O. Silva; Michele A. Brandão; Anisio Lacerda; Gisele L. Pappa (2023).

**Tema/Subtema:** Qualidade e inconsistências em dados governamentais brasileiros; comparação funcional de ferramentas e aplicação de Great Expectations.

**Tipo de Estudo:** Estudo de caso por interpretação do projeto, com duas aplicações empíricas e uma comparação documental; os autores não formalizam o desenho.

**Método:** Misto por interpretação do projeto: comparação documental e categórica de oito ferramentas combinada à avaliação quantitativa de indicadores em dez tabelas. O artigo não declara explicitamente método misto.

**Contexto/País:** Dados governamentais abertos de licitações, receitas, compras e despesas de Minas Gerais, Brasil, armazenados em Apache Hive; duas aplicações, dez tabelas e dados principalmente de 2014 a 2021.

**Variáveis centrais:** Requisitos funcionais; sucesso/falha de expectations e valores inesperados; nulidade, intervalos, tipos inconsistentes, duplicidade, divergências e cronologia; regras técnicas e de negócio; número de registros; Penalty Factor e Table Error Score.

**Achados Relevantes (1-2 frases):** Great Expectations foi a ferramenta mais aderente na comparação documental, com 40% dos requisitos atendidos, 20% parcialmente atendidos e 40% disponíveis após customização; sua aplicação detectou nulos, valores fora de intervalo, tipos inconsistentes, duplicidades e violações de regras de negócio. Os autores tratam as causas como possibilidades que exigem análise adicional, e inconsistências internas da fonte sobre percentuais e unidades foram preservadas na nota de evidência.

**Lacunas/Oportunidades:** **AUTHOR-STATED GAP:** expandir Great Expectations para outras tabelas e domínios governamentais; os autores também reconhecem que a seleção de indicadores exige inspeção e conhecimento técnico e de negócio. **PROJECT-INTERPRETED OPPORTUNITY:** aplicar as ferramentas sob as mesmas mudanças estruturais entre versões e medir detecção, falsos positivos/negativos, esforço e custo, pois apenas Great Expectations foi aplicado empiricamente e os demais foram comparados por documentação; isso delimita P001, sem provar uma lacuna geral.

**Como contribui para minha pesquisa:** Demonstra, em dados públicos brasileiros, que validação unilateral e posterior à carga pode revelar inconsistências sem restrições de integridade do produtor e que regras customizadas capturam conhecimento de domínio. Não demonstra detecção longitudinal de adição, remoção ou renomeação de colunas, mudança de tipo entre versões, encoding ou delimitador, nem implementa data contracts.

## Comparação transversal

| Estudo | Problema | Contexto/dados | Método | Ferramentas | Mudanças estruturais | Resultados | Contribuição | Limitações |
|---|---|---|---|---|---|---|---|---|
| P004 | Fatores que afetam a qualidade de pipelines, causas-raiz e áreas problemáticas | Literatura, 100 issues de GitHub, 99 posts de Stack Overflow e oito especialistas; sem país/domínio específico | Revisão multivocal, entrevistas e estudos de caso; método misto | Não avalia ferramentas de validação específicas | Tipos, representação, símbolos/caracteres e compatibilidade aparecem como fatores ou problemas, não como mutações executadas | Tipos foram 33% das causas-raiz no GitHub; compatibilidade apareceu em 8% dos posts e afetou a funcionalidade central nesses casos | Justifica dimensões de risco e pontos do pipeline para os testes | Evidência observacional e indireta; amostras e fontes limitam generalização; sem métricas de detecção |
| P002 | Correspondência de colunas e evolução de schema entre versões anuais | Censo Escolar brasileiro, 2007-2021; contagem temporal inconsistente na fonte | Experimento quantitativo com quatro testes e ground truth | Implementações em R de Kolmogorov-Smirnov, Anderson-Darling, Welch e F; algoritmo próprio | Adição, remoção e renomeação de colunas; 416 mudanças individuais declaradas | Melhor média no ano anterior: KS Top 1 = 0,847 e Top 3 = 0,897; desempenho menor com anos acumulados | Evidência direta sobre versões públicas e referência para ground truth/acurácia | Só atributos numéricos e uma fonte; ground truth pouco detalhado; sem tipo, encoding, delimitador, taxas separadas de erro, custo ou tempo |
| P006 | Cobertura prática de profiling, medição e monitoramento | 13 ferramentas sobre Northwind; escopo generalista | Survey misto, catálogo de 43 requisitos e 30 casos de profiling | 13 ferramentas, cinco gratuitas/open-source; não inclui as quatro ferramentas centrais do TCC | Tipos e padrões entram no profiling; não há teste histórico de evolução de schema, encoding ou delimitador | Profiling básico foi comum, métricas amplas não; monitoramento generalista completo foi tipicamente comercial; houve resultado divergente no Aggregate Profiler | Fornece dimensões de profiling, regras, agendamento, armazenamento, comparação e visualização | Seleção reduziu 667 ferramentas a 13 avaliadas; casos finos não cobriram medição/monitoramento; retrato temporalmente instável |
| P005 | Relação entre checks concretos e dimensões abstratas de qualidade | Documentação e código de sete ferramentas open-source para dados relacionais | Survey qualitativo por interpretação; catálogo e mapeamento ISO/IEC 25012 | dbt Core, Deequ, Evidently, Great Expectations, Apache Griffin, MobyDQ e Soda Core | Cataloga checks de schema, presença/ausência/ordem de colunas e tipos; não executa mudanças entre versões | Cobertura fragmentada, terminologia não padronizada e relação muitos-para-muitos entre checks e dimensões | Apoia seleção dos checks de Great Expectations e Soda Core e interpretação cautelosa das capacidades | Não é comparação experimental; ausência na matriz não implica incapacidade; não inclui Pandera/Frictionless nem mede eficácia, esforço ou custo |
| P001 | Identificação de inconsistências em dados governamentais já carregados | Dez tabelas de licitações e despesas de Minas Gerais em Hive | Estudo de caso misto por interpretação; comparação documental e aplicação empírica | Oito comparadas; somente Great Expectations aplicada | Detecta inconsistências de tipo e formato, mas não avalia longitudinalmente adição, remoção, renomeação, encoding ou delimitador | GE teve cobertura documental total entre atendimento integral, parcial e customização; encontrou nulos, intervalos, tipos, duplicidades e regras violadas | Evidência de validação unilateral em dados públicos brasileiros e de checks customizados | Uma ferramenta aplicada; sem mutações controladas, ground truth, falsos resultados ou comparação empírica equivalente; causas exigem inspeção |

As diferenças entre os estudos não autorizam concluir, apenas com este conjunto de cinco notas, que inexista literatura adicional sobre avaliação empírica de ferramentas ou mudanças estruturais. Também não há comparação diretamente combinável entre seus números: P002 mede acurácia de correspondência, P001 conta falhas de expectations, P004 relata frequências observacionais, P005 cataloga implementações e P006 classifica atendimento de requisitos.
