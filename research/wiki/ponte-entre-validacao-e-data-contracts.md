# Ponte entre validação do consumidor e data contracts

## Status

Orientação conceitual registrada para ser retomada durante a escrita do artigo.
Não constitui evidência acadêmica nem texto definitivo do manuscrito.

## Decisão atual

O TCC manterá o foco na avaliação empírica de ferramentas de validação usadas
unilateralmente pelo consumidor de dados do CNES. Não haverá migração do tema
para a proposição ou avaliação de um data contract entre o DataSUS e seus
consumidores.

Data contracts poderão ser utilizados na fundamentação como contraste
conceitual e como uma solução que não está disponível no cenário estudado. A
pergunta orientadora desse contraste é:

> Se data contracts são uma solução desejável, o que o consumidor consegue
> fazer quando não tem poder para estabelecê-los?

## Distinções a preservar

- **Especificação de dados:** descreve estrutura, tipos, restrições e
  expectativas aplicáveis aos dados.
- **Validação:** compara os dados recebidos com uma especificação.
- **Gate de qualidade:** transforma o resultado da validação em uma decisão de
  aceitar ou bloquear o lote.
- **Data contract:** envolve, além de uma especificação, compromissos entre
  partes e mecanismos como responsabilidades, versionamento e governança de
  mudanças. A caracterização exata deverá ser sustentada pela literatura antes
  de ser incorporada ao manuscrito.

No experimento, a política comum de aceitação será uma especificação executável
definida pelo consumidor e representada de forma equivalente nas ferramentas.
Ela não deverá ser chamada de data contract, pois é unilateral e não cria
obrigações para o produtor.

## Possível argumento para a escrita

O trabalho poderá apresentar a validação como uma salvaguarda unilateral e
preventiva diante da ausência de garantias fornecidas pelo produtor. Seus
resultados mostrarão apenas o que as ferramentas conseguem detectar e bloquear
no pipeline estudado; não deverão ser interpretados como substituição integral
de um data contract.

Esse posicionamento permite discutir duas situações distintas:

```text
Especificação unilateral do consumidor
                  ↓
        Ferramenta de validação
                  ↓
      Decisão de aceitar/bloquear
                  ↓
Proteção parcial do pipeline consumidor
```

```text
Especificação negociada e versionada
                  ↓
 Responsabilidades de produtor e consumidor
                  ↓
 Enforcement e gestão de compatibilidade
                  ↓
 Comunicação coordenada das mudanças
```

O segundo fluxo é apenas uma representação conceitual provisória. Seus
componentes deverão ser verificados em fontes acadêmicas e técnicas adequadas
antes de aparecerem como características gerais de data contracts.

## Uso limitado de data contracts no artigo

Durante a escrita, considerar três funções possíveis:

1. contraste conceitual para explicar por que validação unilateral não é um
   data contract;
2. contextualização de uma solução que exigiria cooperação ou compromisso do
   produtor e que, portanto, está indisponível no caso estudado;
3. indicação de trabalho futuro sobre como uma especificação fornecida e
   versionada pelo produtor poderia alterar os resultados observados.

## Cuidados de escopo

- Não afirmar que as ferramentas avaliadas implementam data contracts apenas
  porque permitem declarar schemas ou expectativas.
- Não introduzir comparação de plataformas de data contracts no experimento
  atual.
- Não propor tradução automática de uma especificação neutra para as quatro
  ferramentas sem reavaliar o escopo, pois isso acrescentaria a fidelidade da
  tradução como uma nova variável experimental.
- Não atribuir à validação mecanismos organizacionais de negociação,
  comunicação ou responsabilização que não serão avaliados.
- Distinguir detecção e bloqueio de recuperação, adaptação e coordenação entre
  produtor e consumidor.

## Evidências a buscar antes da escrita

- definições acadêmicas de data contract e data specification;
- elementos que distinguem contrato, schema e regra de validação;
- papel de produtor e consumidor na definição e no enforcement;
- versionamento, compatibilidade e comunicação de mudanças;
- limitações de abordagens unilaterais do lado do consumidor.

Afirmações sobre esses pontos somente deverão ser promovidas ao manuscrito após
triagem e extração de evidências segundo o fluxo de pesquisa do projeto.
