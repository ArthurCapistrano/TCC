# Protocolo de avaliação da qualidade metodológica

## Finalidade

Este protocolo orienta a avaliação da qualidade metodológica dos estudos
incluídos na extração de evidências. A avaliação serve para qualificar o uso de
cada resultado na síntese. Ela não mede relevância temática e não substitui os
critérios de elegibilidade.

## Referencial

Será utilizado o *ACM SIGSOFT Empirical Standards for Software Engineering*,
um conjunto modular de padrões para condução e avaliação de estudos empíricos
em engenharia de software.

Fontes consultadas em 2026-09-21:

- ACM SIGSOFT Empirical Standards: <https://www2.sigsoft.org/EmpiricalStandards/>
- Padrões e critérios: <https://www2.sigsoft.org/EmpiricalStandards/docs/standards>
- Ralph et al. (2020), *Empirical Standards for Software Engineering Research*:
  <https://arxiv.org/abs/2010.03525>

O campo `Avaliação de Qualidade (ex.: CASP, MMAT)` da planilha apresenta CASP
e MMAT como exemplos, sem exigir um instrumento específico. O referencial da
ACM SIGSOFT foi escolhido por contemplar métodos próprios de engenharia de
software, como avaliação de artefatos, benchmarking, mineração de repositórios,
estudos de caso e métodos mistos.

## Regra de aplicação

1. O `General Standard` será aplicado a todo estudo empírico que colete e
   analise dados no contexto de software, dados ou sistemas de informação.
2. Antes de avaliar os critérios, o desenho do estudo será identificado a partir
   do objetivo, das unidades de análise, da coleta e da análise descritas no
   artigo.
3. Um padrão específico será aplicado somente quando o estudo satisfizer as
   condições de aplicação definidas pelo próprio referencial.
4. Mais de um padrão específico poderá ser usado quando houver componentes
   metodológicos distintos que contribuam diretamente para os resultados
   extraídos.
5. Um rótulo empregado pelos autores, como `experimental` ou `survey`, não será
   suficiente por si só para determinar o padrão aplicável.
6. Quando nenhum padrão específico se ajustar ao desenho, será utilizado apenas
   o `General Standard`, com justificativa. Não serão forçados critérios de
   outros desenhos.
7. Serão avaliados todos os atributos classificados como essenciais nos padrões
   selecionados. Atributos desejáveis ou extraordinários poderão ser mencionados
   como observações, sem integrar o julgamento principal.

## Respostas

Cada critério receberá uma das seguintes respostas:

- `Atende`: a fonte apresenta evidência suficiente de atendimento.
- `Não atende`: a fonte apresenta evidência de não atendimento ou omite um
  elemento exigido que deveria estar relatado.
- `Não foi possível determinar`: o texto disponível não permite uma conclusão.
- `Não se aplica`: o critério não corresponde ao desenho ou ao objeto avaliado,
  com justificativa explícita.

Cada resposta deve indicar a seção e, quando disponível, página, tabela, figura
ou intervalo de linhas da fonte local.

## Síntese do julgamento

Não será calculada pontuação, percentual ou classificação agregada de qualidade.
A síntese destacará:

- aspectos metodológicos que sustentam a confiança nos resultados;
- limitações que restringem interpretação, transferência ou reprodução;
- informações que não puderam ser determinadas;
- consequências dessas limitações para o uso do estudo neste TCC.

Resultados de módulos diferentes não serão tratados como uma escala numérica
comum. A comparação entre artigos permanecerá descritiva.

## Relação com as demais etapas

- Elegibilidade é decidida na triagem, antes da extração.
- Qualidade metodológica não será usada retroativamente para alterar critérios
  de inclusão.
- Relevância para a pergunta do TCC será registrada separadamente como
  interpretação do projeto.
- Número de citações, Qualis e fator de impacto não serão usados como medidas de
  qualidade metodológica.
- Fragilidades não anulam automaticamente os resultados. Elas determinam o grau
  de cautela necessário na síntese.

## Registro e validação

A avaliação completa ficará na nota individual do artigo. A planilha receberá
uma síntese legível com o referencial aplicado e as principais forças,
limitações e incertezas.

A leitura, a extração e a aplicação inicial dos critérios poderão receber
assistência de IA. Cada avaliação permanecerá `Em Progresso` até a validação do
pesquisador. A nota deverá registrar a data dessa validação sem atribuir à IA
responsabilidade autoral ou decisão humana.
