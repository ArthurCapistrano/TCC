# Critérios de elegibilidade para o corpus de extração de evidências

## Status

Critérios elaborados com assistência de IA e validados pelo pesquisador em
2026-09-21 para ampliar o corpus de extração de cinco para dez estudos. O
documento foi definido após uma seleção exploratória e leitura prévia das fontes
adicionais pelo pesquisador. Portanto, ele organiza e torna explícita a
elegibilidade do corpus ampliado, mas não deve ser apresentado como protocolo
prospectivo de uma revisão sistemática.

Os critérios anteriormente usados na seleção dos cinco trabalhos relacionados
permanecem preservados em
`research/notes/screening/criterios-elegibilidade-trabalhos-relacionados.md`.

## Escopo

Estes critérios serão aplicados ao corpus usado na extração de evidências do
TCC. Os estudos podem contribuir de forma direta, metodológica, conceitual ou
contextual para a investigação da resiliência do consumidor diante de mudanças
estruturais em dados públicos.

A inclusão na extração não implica inclusão na seção de trabalhos relacionados.
Os cinco trabalhos relacionados constituem o subconjunto de maior proximidade
com a avaliação que será conduzida. A proximidade temática e a qualidade
metodológica serão registradas separadamente da decisão de elegibilidade.

## Critérios de inclusão

- **I1 — Natureza científica:** o documento apresenta pesquisa acadêmica em
  formato de artigo de periódico, artigo de conferência, pré-print associado a
  trabalho científico, tese ou dissertação.
- **I2 — Acesso ao texto completo:** o texto integral está disponível para
  avaliar problema, objetivo, método, contexto, resultados, contribuições e
  limitações. Uma cópia local de acesso fechado satisfaz este critério quando
  permite a análise completa, sem alterar a classificação de acesso da fonte.
- **I3 — Aderência temática:** o trabalho aborda diretamente pelo menos um dos
  seguintes eixos: ferramentas ou técnicas de validação, medição ou
  monitoramento de qualidade de dados; mudanças, evolução ou drift de schema;
  qualidade, confiabilidade ou falhas em pipelines e ecossistemas de dados;
  qualidade de dados públicos ou governamentais.
- **I4 — Contribuição identificável ao TCC:** o trabalho fornece evidência ou
  fundamentação técnica, metodológica, conceitual ou contextual aplicável à
  definição das mudanças estruturais, ao desenho da avaliação comparativa, à
  interpretação das capacidades das ferramentas ou ao contexto de consumo de
  dados públicos.
- **I5 — Conteúdo analisável:** o documento apresenta objetivo ou questão de
  pesquisa, abordagem ou método e resultados ou conclusões identificáveis.
- **I6 — Idioma:** o trabalho está disponível em português ou inglês.

## Critérios de exclusão

- **E1 — Versão substituída:** versão preliminar, resumida ou duplicada de um
  trabalho para o qual uma versão ampliada e mais recente será analisada. A
  relação entre as versões deve permanecer registrada.
- **E2 — Ausência de caráter científico:** documentação de produto, material
  promocional, postagem ou texto de opinião sem método ou contribuição de
  pesquisa identificável.
- **E3 — Desalinhamento temático:** trabalho que menciona qualidade de dados,
  schema, pipelines, ecossistemas ou setor público apenas incidentalmente, sem
  contribuição identificável para I3 e I4.
- **E4 — Evidência insuficiente:** indisponibilidade do texto completo ou falta
  de informações que permita avaliar objetivo, abordagem e resultados.
- **E5 — Escopo sem conexão demonstrável:** trabalho restrito a limpeza,
  remediação, governança ou gestão organizacional sem relação identificável com
  validação, monitoramento, mudanças estruturais, confiabilidade de pipelines ou
  ecossistemas, qualidade de dados públicos ou desenho da avaliação do TCC.

## Regra de decisão

Um trabalho poderá ser incluído quando satisfizer I1 a I6 e nenhum critério de
exclusão. O resultado será `Dúvida` quando o texto disponível não permitir uma
avaliação defensável. Uma exclusão deverá indicar ao menos um critério de
exclusão satisfeito e sua evidência.

A decisão será registrada individualmente e permanecerá pendente de validação
do pesquisador quando a avaliação tiver assistência de IA.

## Função da evidência

Após a inclusão, cada estudo receberá uma caracterização independente de sua
função no TCC:

- **Direta:** avalia ferramentas, técnicas ou mecanismos próximos da pergunta
  comparativa do TCC.
- **Metodológica:** informa critérios, métricas, desenho experimental ou
  procedimentos de avaliação.
- **Conceitual:** define fenômenos, categorias ou relações necessárias à
  fundamentação do estudo.
- **Contextual:** caracteriza dados públicos, organizações, pipelines,
  ecossistemas ou consequências relevantes para interpretar o problema.

Um estudo pode exercer mais de uma função. Essa classificação não substitui a
avaliação metodológica e não autoriza extrapolar os resultados além do contexto
estudado.

## Restrições da avaliação

- Concordância com a hipótese ou com a direção esperada do TCC não é critério
  de inclusão.
- Fragilidade metodológica não implica exclusão automática; ela limita o peso e
  o uso da evidência na síntese.
- Evidência contextual não será apresentada como evidência direta de eficácia
  de ferramentas.
- A posição na seleção exploratória não determina a decisão.
- A procedência de uma busca será marcada como `NÃO IDENTIFICADO` quando a
  relação com uma execução e uma string específicas não puder ser demonstrada.
- A versão preliminar de `P005` permanece registrada como versão substituída e
  não recebe extração independente.
- O ID histórico `P003` permanece reservado e não será reutilizado.
