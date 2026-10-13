#set text(lang: "pt", region: "BR")
#set heading(numbering: "1.1")

= Introdução

== Motivação e contexto

Com a expansão do uso de dados em processos analíticos, manter _pipelines_ de ingestão em funcionamento passou a ocupar uma parte importante do trabalho de engenharia de dados #cite(<foidl2024>). Quando esses dados são extraídos de uma fonte externa, parte desse funcionamento fica sujeita à estrutura publicada pelo produtor. O consumidor não controla essa estrutura, embora dependa dela para executar consultas, transformações e outros procedimentos. No contexto dos dados governamentais abertos, essa relação também envolve a confiança na instituição responsável pela disponibilização dos dados #cite(<zainal2024>). A avaliação da qualidade também considera a adequação dos dados ao uso pretendido #cite(<syed2023>).

A estrutura esperada dos dados constitui o _schema_, que inclui colunas, tipos e restrições. Sua modificação pode envolver a adição, a remoção, a renomeação ou a alteração de componentes e atingir consultas, visões, procedimentos e código que dependem deles #cite(<brahmia2024>). Problemas de tipo, representação, caracteres e compatibilidade também interferem no processamento #cite(<foidl2024>).

Um _data contract_, entendido neste trabalho como um acordo formal entre produtor e consumidor, pode estabelecer expectativas sobre a estrutura e o significado dos dados, obrigações e políticas de descontinuação #cite(<opendatameshDataContract>). Sem esse acordo, o consumidor precisa verificar os dados recebidos e decidir se eles continuam compatíveis com o processamento.

No setor público, regras e métricas são usadas para avaliar a qualidade dos dados. Entre essas verificações, a validação de _schema_ permite examinar a integridade estrutural e identificar anomalias #cite(<silva2025>). O cenário analisado utiliza dados do Cadastro Nacional de Estabelecimentos de Saúde (CNES), disponibilizados pelo Departamento de Informática do Sistema Único de Saúde (DATASUS), cuja documentação descreve os layouts dos arquivos de disseminação (Brasil, #cite(<brasil2017cnes>, form: "year")). O CNES publica informes sobre atualizações do sistema e alterações em arquivos #cite(<brasilCnesInformes>).

Neste experimento, entretanto, a validação será realizada a partir dos dados recebidos, sem utilizar esses informes como entrada para a detecção de mudanças. Logo, a motivação desta pesquisa está na necessidade de identificar alterações nos dados consumidos antes que elas comprometam as etapas seguintes do processamento.

== Problema de pesquisa

Sem uma garantia formal de versionamento ou comunicação de mudanças, os dados de uma fonte externa podem chegar à _pipeline_ com uma estrutura diferente da esperada. Essa mudança pode provocar uma falha durante o processamento ou permitir que dados incompatíveis avancem no fluxo. O problema desta pesquisa é determinar até que ponto ferramentas de qualidade de dados conseguem detectar e bloquear essas incompatibilidades antes que alcancem as etapas seguintes, sem interromper o processamento de dados que continuam válidos.

Uma incompatibilidade não detectada permite que dados inadequados avancem pela _pipeline_. Um bloqueio indevido interrompe o processamento de um lote que continua válido. Para o consumidor, a dificuldade está em saber quais mudanças cada ferramenta reconhece e se o bloqueio ocorre apenas quando a entrada viola as condições definidas.

A pesquisa será orientada pela seguinte pergunta:

#quote(block: true)[
  Em uma _pipeline batch_ de ingestão de dados do CNES, em que medida Great Expectations, Pandera, Frictionless e Soda Core detectam e bloqueiam mudanças estruturais predefinidas, quando configuradas segundo uma mesma política de aceitação, considerando cobertura de detecção por tipo de mudança, falsos bloqueios, tempo de configuração e tempo de execução?
]

== Justificativa

Para escolher uma ferramenta, o consumidor precisa saber quais mudanças ela detecta, se consegue impedir o avanço de entradas incompatíveis e com que frequência bloqueia dados válidos. A lista de funcionalidades declaradas não basta para estabelecer como as ferramentas se comportam diante dos mesmos casos. O estudo do tema exige, portanto, observar os resultados produzidos em condições comparáveis.

Pesquisas anteriores mostram que mudanças entre versões de bases públicas podem comprometer análises posteriores #cite(<yamanaka2024>) e que regras definidas pelo consumidor revelam inconsistências em dados governamentais #cite(<oliveira2023>). Também indicam que verificações semelhantes recebem nomes e formas de configuração diferentes #cite(<papastergios2026>) e que ferramentas de qualidade de dados já foram comparadas por meio de uma base comum e de casos de teste associados a requisitos definidos #cite(<ehrlinger2022>). Entre os trabalhos incluídos na revisão bibliográfica deste estudo, não foi identificada uma avaliação que reúna Great Expectations, Pandera, Frictionless e Soda Core sob as mesmas entradas, a mesma política de aceitação e a mesma definição de bloqueio.

A adoção de condições comuns reduz a influência de diferenças entre regras, dados e critérios de sucesso sobre os resultados. A pesquisa poderá mostrar a cobertura de cada ferramenta por tipo de mudança, os bloqueios indevidos, as incompatibilidades não detectadas e os tempos de configuração e execução. Essas medidas poderão apoiar a escolha de uma ferramenta segundo as mudanças que ela reconhece, os erros que produz e o tempo exigido para configurá-la e executá-la.

== Objetivos

=== Objetivo geral

Avaliar comparativamente a capacidade de Great Expectations, Pandera, Frictionless e Soda Core para detectar e bloquear mudanças estruturais predefinidas em uma _pipeline batch_ de ingestão de dados do CNES, sob uma mesma política de aceitação, considerando a cobertura por tipo de mudança, os falsos bloqueios e os tempos de configuração e execução.

=== Objetivos específicos

- Definir uma política comum de aceitação e cenários com adição, remoção, renomeação e reordenação de colunas, alteração de tipo, nulidade, delimitador e _encoding_;
- configurar e integrar as quatro ferramentas à mesma _pipeline batch_;
- executar casos provenientes de versões históricas do CNES e de mutações sintéticas controladas;
- medir a cobertura de detecção por tipo de mudança, os falsos bloqueios, as falhas não detectadas, a capacidade de interromper a etapa seguinte e os tempos de configuração e execução;
- comparar os resultados e as limitações das ferramentas no cenário estudado.

= Trabalhos relacionados

== Qualidade e falhas em pipelines de dados

Foidl et al. (#cite(<foidl2024>, form: "year")) investigam os fatores que comprometem a capacidade das _pipelines_ em processar dados corretamente e entregá-los com qualidade. Para compreender esses fatores e localizar os problemas relacionados aos dados, o estudo combina uma revisão multivocal da literatura, entrevistas com oito profissionais de engenharia de dados e análises de _issues_ do GitHub e publicações do Stack Overflow. A revisão resultou em uma taxonomia de 41 fatores, distribuídos entre aspectos dos dados, do desenvolvimento, da infraestrutura, do ciclo de vida e do processamento.

Na análise do GitHub, problemas de tipo representaram 33% das 100 _issues_ relacionadas a dados identificadas no conjunto final. Essas ocorrências apareceram principalmente nas etapas de limpeza, ingestão e integração. No Stack Overflow, integração e ingestão reuniram 47% dos tópicos discutidos, enquanto questões de compatibilidade formaram uma categoria adicional aos estágios usuais de processamento. Os autores indicam que a taxonomia pode orientar a identificação e a priorização de aspectos que prejudicam a qualidade das _pipelines_.

A pesquisa ajuda a delimitar o que uma estratégia de validação precisa observar, pois tipos, representação, caracteres e compatibilidade interferem na forma como os dados são recebidos e processados. Essa relação apoia a escolha de mudanças estruturais que serão avaliadas no TCC. O alcance do estudo, entretanto, permanece descritivo e genérico: são analisados relatos de desenvolvedores e projetos de software, sem o acompanhamento de versões históricas de uma base pública ou o teste de ferramentas de validação sob alterações controladas. Resta observar como esses problemas aparecem quando uma fonte pública muda sua estrutura ao longo do tempo, situação examinada pelo trabalho seguinte.

== Evolução de schema em dados públicos brasileiros

Yamanaka et al. (#cite(<yamanaka2024>, form: "year")) aproximam a discussão das mudanças que ocorrem quando uma fonte pública disponibiliza novas versões de seus dados. O estudo examina arquivos anuais do Censo Escolar brasileiro, publicados pelo Ministério da Educação e integrados ao Laboratório de Dados Educacionais. Alterações de nomes, adições e remoções de colunas dificultam a correspondência entre os arquivos e o _schema_ mantido pelo sistema. Os autores registram 416 mudanças e mostram que uma associação incorreta pode separar em duas colunas uma informação que apenas mudou de nome, preenchendo anos anteriores com valores nulos e comprometendo análises posteriores.

A pesquisa propõe uma metodologia estatística que compara a distribuição das colunas numéricas de versões consecutivas. São avaliados os testes Kolmogorov-Smirnov, Anderson-Darling, t de Welch e F. As sugestões são confrontadas com um _ground truth_ em dois cenários: o _Top 1_ considera a primeira coluna indicada, enquanto o _Top 3_ verifica se a correspondência correta aparece entre as três primeiras. O teste Kolmogorov-Smirnov obteve acurácia média de 84,7% no _Top 1_ e 89,7% no _Top 3_ na comparação com o ano anterior. Com o acúmulo dos anos anteriores, a acurácia _Top 1_ caiu para 74,4%.

O estudo mostra que a evolução estrutural de uma base pública pode ser examinada por quem integra os dados, sem depender dos nomes das colunas. Para este TCC, isso oferece um cenário próximo ao CNES e exemplos de mudanças capazes de afetar a continuidade de uma _pipeline_. A abordagem, contudo, restringe-se a atributos numéricos, mantém um especialista na escolha entre candidatos e não avalia Great Expectations, Pandera, Frictionless ou Soda Core. Com o problema estrutural delimitado, torna-se necessário compreender como ferramentas de qualidade transformam requisitos de validação e monitoramento em recursos disponíveis ao consumidor.

== Medição e monitoramento por ferramentas de qualidade

Ehrlinger e Wöß (#cite(<ehrlinger2022>, form: "year")) investigam como conceitos de medição e monitoramento de qualidade de dados aparecem nas ferramentas disponíveis. O estudo parte da distância entre as dimensões discutidas na literatura e as funções oferecidas na prática. Sua busca reuniu 667 ferramentas associadas à qualidade de dados. Após a aplicação de critérios de exclusão, 17 foram selecionadas e 13 puderam ser avaliadas, sendo oito comerciais e cinco _open-source_. A análise utiliza um catálogo de 43 requisitos sobre _data profiling_, medição de qualidade e monitoramento contínuo. As ferramentas foram instaladas e examinadas por dois pesquisadores com uma versão do banco Northwind.

A comparação mostrou ampla presença de funções básicas de _data profiling_ em uma única coluna, como contagem de valores nulos e identificação de tipos. Recursos envolvendo múltiplas colunas ou descoberta de dependências apareceram com menor frequência. Os autores também não encontraram uma ferramenta que implementasse um conjunto amplo das métricas propostas pela literatura para as principais dimensões de qualidade. Algumas métricas de acurácia dependiam de um conjunto de referência que nem sempre existe. O monitoramento automatizado variou entre as soluções e, nas ferramentas generalistas, apareceu frequentemente como recurso de versões comerciais.

Nesse contexto, o catálogo oferece critérios para avaliar regras de validação e recursos de monitoramento. Essa distinção é pertinente para um consumidor que acompanha uma fonte sem possuir uma base confiável para comparar os dados recebidos. O levantamento, contudo, retrata versões específicas das ferramentas e não inclui Great Expectations, Pandera, Frictionless ou Soda Core entre as soluções avaliadas. Também não testa versões históricas de dados públicos ou mudanças estruturais controladas. A visão geral oferecida pelo _survey_ deixa uma questão mais específica: quais verificações estão implementadas nas ferramentas _open-source_ atuais e como elas representam requisitos de _schema_?

== Funcionalidades de ferramentas open-source

Papastergios, Ehrlinger e Gounaris (#cite(<papastergios2026>, form: "year")) aprofundam a análise das ferramentas _open-source_ ao examinar como suas funcionalidades são implementadas. O estudo parte de um problema de terminologia: funções semelhantes recebem nomes diferentes nas ferramentas, enquanto um mesmo termo pode representar operações distintas. Para aproximar essas implementações das dimensões discutidas na literatura, os autores selecionam sete projetos ativos e de uso geral, entre eles Great Expectations e Soda Core. A documentação oficial e o código-fonte são examinados separadamente para cada ferramenta. Em seguida, funcionalidades equivalentes são reunidas, organizadas por finalidade e relacionadas a seis dimensões da ISO/IEC 25012.

O levantamento produz um catálogo de verificações de conformidade, distribuição, volume, cardinalidade, correlação e verificações orientadas a _machine learning_. Entre as funções ligadas ao _schema_ estão a conferência do número e da ordem das colunas, a presença de campos esperados, a ausência de campos inesperados e a validação de tipos. Os resultados mostram que nenhuma das sete ferramentas cobre todo o conjunto encontrado. Também indicam que a relação entre uma verificação concreta e uma dimensão de qualidade não é direta: uma mesma função pode contribuir para mais de uma dimensão, e uma dimensão depende de diferentes verificações.

O catálogo contribui para esta pesquisa ao relacionar mudanças estruturais a _checks_ que podem ser procurados durante a implementação do experimento. A presença de Great Expectations e Soda Core aproxima o _survey_ das ferramentas selecionadas, mas Pandera e Frictionless não fazem parte da análise. O trabalho também não executa um _benchmark_ entre as soluções. Sua comparação registra funcionalidades incorporadas, sem medir acurácia de detecção, falsos positivos, custo computacional ou esforço de configuração. Assim, o estudo descreve o que as ferramentas oferecem, mas não demonstra como elas se comportam quando recebem versões alteradas de uma base pública. Essa passagem da capacidade catalogada para o uso em dados governamentais aparece no trabalho seguinte, que seleciona Great Expectations e a aplica em duas situações reais.

== Avaliação de dados governamentais com Great Expectations

Oliveira et al. (#cite(<oliveira2023>, form: "year")) analisam a qualidade de dados governamentais de Minas Gerais utilizados em aplicações de licitações e despesas públicas. O problema investigado está nas inconsistências que podem afetar análises posteriores e que não são impedidas pelas restrições de integridade do _data warehouse_ empregado. Inicialmente, os autores comparam oito ferramentas _open-source_ segundo dez categorias de funcionalidades identificadas em suas documentações. Great Expectations foi a solução que melhor atendeu ao conjunto adotado, com parte das funções disponível de forma nativa e parte dependente de customização. A ferramenta foi então aplicada a dez tabelas reais mantidas em Apache Hive, divididas entre os dois domínios governamentais.

A avaliação combina _expectations_ nativas com regras desenvolvidas pelos autores em Python. As verificações tratam de valores nulos, unicidade, tipos, intervalos, expressões regulares e relações entre colunas. As regras customizadas examinam condições próprias do domínio, como a coerência entre valores financeiros e a ordem cronológica de datas. Os resultados apontaram valores fora de intervalos, tipos inconsistentes, duplicidades e violações de regras de negócio. O estudo também propõe o _Table Error Score_, uma medida que considera o tamanho da tabela, a proporção de verificações com falha e o percentual de valores inesperados para ordenar tabelas que exigem inspeção manual @oliveira2023.

A aplicação de Great Expectations em dados públicos brasileiros é o cenário mais próximo da pesquisa desenvolvida neste TCC. O trabalho mostra como regras definidas por quem utiliza os dados podem revelar inconsistências sem exigir alterações no sistema produtor. Entretanto, somente Great Expectations é executada nos estudos de caso; as outras ferramentas são comparadas por sua documentação. A pesquisa não acompanha mudanças de _schema_ entre versões, não utiliza defeitos estruturais controlados e não mede falsos positivos, falsos negativos, esforço de configuração ou custo computacional.

== Análise comparativa

Tomados em conjunto, os cinco trabalhos abordam partes diferentes do problema investigado. A comparação considera o uso de dados públicos, o tratamento de mudanças estruturais, a presença das ferramentas escolhidas e a forma como os estudos avaliam seus resultados. _Sim_ indica atendimento ao critério, _Parcial_ corresponde a uma cobertura limitada ou indireta e _Não_ indica que o critério está fora do escopo do estudo.

_Testes com dados_ são aplicações de um método ou ferramenta sobre uma base. A comparação ocorre sob condições comuns quando mais de uma solução recebe os mesmos casos e critérios. Para medir a acurácia da detecção, o resultado obtido precisa ser confrontado com uma resposta conhecida. Na cobertura das ferramentas, o atendimento parcial indica que apenas parte das quatro soluções do TCC foi incluída.

#figure(
  table(
    columns: (1.7fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    align: (left, center, center, center, center, center),
    inset: 4pt,
    table.header(
      [*Critério*],
      [*Foidl et al. (2024)*],
      [*Yamanaka et al. (2024)*],
      [*Ehrlinger e Wöß (2022)*],
      [*Papastergios et al. (2026)*],
      [*Oliveira et al. (2023)*],
    ),
    [Dados públicos], [Não], [Sim], [Não], [Não], [Sim],
    [Mudanças estruturais], [Parcial], [Sim], [Parcial], [Parcial], [Parcial],
    [Cobertura das ferramentas do TCC], [Não], [Não], [Não], [Parcial], [Parcial],
    [Testes com dados], [Não], [Sim], [Sim], [Não], [Sim],
    [Comparação sob condições comuns], [Não], [Sim], [Sim], [Não], [Parcial],
    [Acurácia da detecção], [Não], [Sim], [Não], [Não], [Não],
  ),
  caption: [Comparação dos trabalhos relacionados segundo os critérios desta pesquisa.],
) <tab:comparacao-trabalhos>

Foidl et al. (#cite(<foidl2024>, form: "year")) identificam tipos, representação e compatibilidade entre os problemas encontrados em _pipelines_, mas não submetem métodos de validação a uma base nem medem a detecção desses problemas. Yamanaka et al. (#cite(<yamanaka2024>, form: "year")) examinam o passo seguinte: mudanças de colunas entre versões de uma base pública. A comparação de quatro testes estatísticos com um _ground truth_ permite medir a acurácia das correspondências. Entre os trabalhos analisados, esse é o único que reúne dados públicos, mudanças estruturais observadas entre versões, comparação sob condições comuns e acurácia da detecção. Seu objeto, contudo, é um método de correspondência de colunas, não as ferramentas selecionadas para este TCC.

Ehrlinger e Wöß (#cite(<ehrlinger2022>, form: "year")) executam casos de _data profiling_ sobre uma base comum e comparam as soluções por um catálogo de requisitos, embora o conjunto não inclua as quatro ferramentas deste TCC nem meça a acurácia da detecção de mudanças estruturais. Papastergios, Ehrlinger e Gounaris (#cite(<papastergios2026>, form: "year")) incluem Great Expectations e Soda Core, porém deixam de fora Pandera e Frictionless. O trabalho examina documentação e código para catalogar _checks_, sem executar as ferramentas sobre versões alteradas. Oliveira et al. (#cite(<oliveira2023>, form: "year")) retomam o contexto dos dados públicos e comparam oito soluções pela documentação, mas aplicam apenas Great Expectations. As falhas de _expectations_ e os valores inesperados mostram o resultado das validações, embora não permitam calcular a acurácia da detecção sem um _ground truth_.

Nos cinco trabalhos analisados, o estudo de mudanças estruturais em dados públicos permanece separado da avaliação das ferramentas. Este TCC propõe aproximar essas duas frentes: Great Expectations, Pandera, Frictionless e Soda Core serão configuradas segundo uma mesma política de aceitação e receberão as mesmas alterações em dados do CNES. A comparação permitirá observar quais mudanças cada ferramenta detecta e se cada uma impede que entradas incompatíveis prossigam na _pipeline_.

#bibliography("references.bib", title: [Referências], style: "associacao-brasileira-de-normas-tecnicas")
