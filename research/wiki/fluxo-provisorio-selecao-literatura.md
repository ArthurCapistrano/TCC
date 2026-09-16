# Fluxo provisório para busca e seleção da literatura

## Status

Proposta metodológica registrada em 2026-08-25 para discussão com a orientadora. Ainda não representa uma decisão metodológica definitiva.

## Decisão provisória

A etapa atual será dedicada à ampliação do conjunto de artigos candidatos. Os critérios objetivos de inclusão e exclusão serão definidos antes do início da triagem e aplicados somente depois dessa definição.

Para cada artigo incorporado ao conjunto de candidatos:

1. preservar o documento original em `research/papers/`, quando ele estiver disponível;
2. usar `register-paper` para criar um registro bibliográfico em `research/notes/screening/<paper-id>.md`;
3. manter os campos da seção de triagem como `PENDENTE`;
4. registrar a procedência do artigo, incluindo a base, o plano de busca e a string executada quando aplicáveis;
5. não usar `screen-paper` nem tomar uma decisão de inclusão, exclusão ou dúvida nesta etapa.

O registro bibliográfico indica apenas que o artigo pertence ao conjunto de candidatos a serem avaliados. Ele não significa que o artigo foi incluído na revisão nem que suas evidências podem ser usadas na síntese ou no manuscrito.

## Distinção operacional entre as skills

- `register-paper`: identifica e registra o artigo, preserva sua procedência e inicia seu registro com os campos decisórios pendentes.
- `screen-paper`: avalia um artigo já registrado contra critérios de elegibilidade previamente definidos e preenche a seção de triagem do mesmo arquivo `research/notes/screening/<paper-id>.md`.
- `extract-evidence`: cria `research/notes/evidence/<paper-id>.md` somente para artigos cuja decisão de triagem seja `Incluir`.

## Sequência prevista

1. adicionar o documento original a `research/papers/`, quando disponível;
2. executar `register-paper`, que cria `research/notes/screening/<paper-id>.md` com a identificação preenchida e a triagem pendente;
3. ampliar o conjunto de candidatos e documentar as estratégias de busca utilizadas;
4. definir critérios objetivos de inclusão e exclusão;
5. validar o protocolo e os critérios com a orientadora;
6. executar `screen-paper` para avaliar cada registro e completar a seção de triagem no próprio arquivo criado durante o registro;
7. após a validação humana da decisão, registrar sua autoria e data;
8. executar `extract-evidence` apenas para os artigos incluídos;
9. sintetizar as evidências extraídas e, então, atualizar a wiki com o entendimento consolidado.

A wiki não é uma etapa intermediária entre o registro bibliográfico e a triagem. O artigo original permanece na camada RAW, enquanto o registro e a avaliação de elegibilidade permanecem na camada de processamento da pesquisa.

## Situação da busca

A atividade atual é uma ampliação exploratória do conjunto de artigos candidatos. O pesquisador pretende trazer pelo menos mais uma string de busca. Quando ela for definida, deverá ser adicionada ao plano de busca com sua base, campos, filtros e demais informações aplicáveis antes de seus resultados serem tratados como uma execução formal.

## Questões ainda abertas para discussão com a orientadora

- Quantos artigos ou quais sinais de saturação serão suficientes para encerrar a busca exploratória e definir os critérios de elegibilidade?
- Artigos encontrados fora das strings documentadas, como por encadeamento de referências ou recomendações, serão admitidos como busca complementar? Em caso positivo, qual procedimento será usado para registrar essa origem?
- Qual limite de resultados será examinado em cada string e base para que a execução possa ser reproduzida e para que todos os resultados abrangidos pelo limite sejam registrados?
