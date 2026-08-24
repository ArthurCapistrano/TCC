

Statistical Validation of Column Matching in the Database
Schema Evolution of the Brazilian Public School Census
Muriki G. Yamanaka, Diogo H. de Almeida, Paulo R.
Lisboa de Almeida, Simone Dominico, Leticia M. Peres,
Marcos S. Sunye, Eduardo C. de Almeida
## 1
Federal University of Paran
## ́
a (UFPR)
Centro de Computac ̧
## ̃
ao Cient
## ́
ıfica e Software Livre (C3SL)
Curitiba – PR –Brazil
## {dha21,mgy20,paulo,sdominico,lmperes,sunye,eduardo}@inf.ufpr.br
Abstract.Publicly available datasets are subject to new versions, with each new
version potentially reflecting changes to the data.  These changes may involve
adding or removing attributes,  changing data types,  and modifying values or
their semantics.  Integrating these datasets into a database poses a significant
challenge:  how to keep track of the evolving database schema while incorpo-
rating different versions of the data sources?  This paper presents a statistical
methodology to validate the integration of 12 years of open-access datasets from
Brazil’s School Census, with a new version of the datasets released annually by
the Brazilian Ministry of Education (MEC). We employ various statistical tests
to find matching attributes between datasets from a specific year and their po-
tential equivalents in datasets from later years.  The results show that by using
the Kolmogorov–Smirnov test we can successfully match columns from different
dataset versions in about 90% of cases.
## 1.  Introduction
Integrating  open  data  sources  is  a  complex  challenge  in  the  development  of  web  in-
formation systems.   Open data sources may exhibit structural changes over time when
made  public,  including  variations  in  data  types,  values,  semantics,  and  missing  val-
ues,  requiring  constant  evolution  of  the  integrated  database  schema  before  the  inges-
tion of new data [Garcia-Molina et al. 2009].   The PRISM project reported an average
of 217% schema changes over a 48-month period across 12 large web information sys-
tems [Curino et al. 2009, Curino et al. 2013]. For example, the Ensembl Genome project
presented over 410 schema versions in 9 years.  The Ensembl DB schema contains over
175 individual changes of primary and foreign keys in its schema evolution history.
The evolution of a database schema often leads to mapping errors, compromising
the accuracy of stored data and ultimately leading to inconsistencies and inaccuracies in
data analysis.  Furthermore, differences in data presentation and evolving business needs
can significantly hinder the incorporation of new data into existing databases.
In this paper, we introduce a statistical methodology to validate the integration of
open-access datasets into the Educational Data Laboratory (Laborat
## ́
orio de Dados Educa-
cionais) (LDE) information system
## 1
. This methodology enables us to track the evolution
## 1
This  work  has  received  funding  from  the  MEC/FNDE  in  the  context  of  the  Laborat
## ́
orio  de  Dados
Educacionais (LDE) project (Grant agreement TED SIMEC No.: 11.437/2022).
arXiv:2407.09885v1  [cs.DB]  13 Jul 2024

of the system’s database schema across different dataset releases.  The LDE system in-
tegrates open-access data from Brazil’s School Census to support many studies and pub-
lic  educational  policies  [Schneider et al. 2023,  Alves et al. 2019,  Schneider et al. 2020,
Silveira et al. 2021].  The LDE database contains 12 years of School Census data and is
freely accessible. Each year, MEC publishes the School Census
## 2
, which includes compre-
hensive data from 179,500 schools, such as the number of students, teachers, and classes
at each school. However, the publicly available data files have undergone 416 individual
changes in naming conventions, as well as the addition and removal of columns over the
years. These changes, driven by evolving government requirements, make it challenging
for educational policymakers and researchers to access a unified and integrated reliable
source.
Our  methodology  employs  Goodness-of-fit  statistical  tests  to  evaluate  the  evo-
lution  of  the  LDE  database  schema  enhancing  the  reliability  of  column  matching.
Goodness-of-fit  tests  are  meant  to  define  how  well  some  sample  of  data  fits  with  an-
other given distribution [D’Agostino 1986].  In our context of data integration, the tests
conduct data profiling [Abedjan et al. 2015], analyzing column matching operations such
as detecting additions, removals, and changes.  This process helps minimize errors and
inconsistencies in the evolution of an integrated database schema.
Overall, our main contribution in this paper are the following:
Validation of the LDE database schema:Our methodology validates the quality of data
integrated into the LDE database, thereby supporting the evolution of its schema.
Quality  metrics  based  on  statistical  tests:Our  methodology  encompasses  metrics
from four goodness-of-fit statistical tests to evaluate the matches between the attributes
of datasets from different releases:  Kolmogorov-Smirnov test [Berger and Zhou 2014],
Anderson-Darling test [Anderson and Darling 1952], Welch’s t-test [Rayner et al. 2009],
and the F-test [Hahs-Vaughn and Lomax 2020].
Analysis of the tests:we present the analysis of the results indicating that our method-
ology  can  correctly  align  the  columns  of  different  datasets  in  about  the  90%  of  cases
considering the Top 3, and about 85% considering the Top 1, showing high accuracy and
effectiveness in the validation of the integrated schema.
This paper is structured as follows:  Section 2 outlines the changes of the open-
access data files and the potential integration problems in a database schema.  Section 3
delineates the methodology used in this study.  The findings are presented in Section 4,
followed  by  a  discussion  of  related  work  in  Section  5.   Finally,  Section  6  provides  a
summary of the study and outlines the next steps.
## 2.  Background
Although  schema  evolution  literature  has  long  acknowledged  the  complexity  of  data
source  integration,  the  high  computational  costs  associated  with  general  schema  evo-
lution  techniques  have  prevented  their  practical  deployment  [Cerqueus et al. 2015a,
Scherzinger et al. 2016]. Schema evolution refers to integrating changes to a data source
over  time,  including  adding  new  sources.    Examples  of  source  transformations  over
## 2
Open data: https://www.gov.br/inep/pt-br/acesso-a-informacao/dados-abertos (in Portuguese)

time include different column names,  changes to the data domain,  and their represen-
tation.   It  is  also  possible  for  columns  or  tables  to  be  added  as  new  sources  are  inte-
grated [Delplanque et al. 2020].
The LDE system stores data from the School Census over the past 12 years, com-
piling a vast amount of educational information.  Maintaining this dataset is crucial for
monitoring trends over time and gaining valuable insights into the Brazilian educational
context.  Consequently, the LDE system serves as a key resource for leveraging govern-
ment open data in academic research.   Many projects maintained by MEC and differ-
ent universities depends on this data, such as the Cost-Student Quality Simulator (SIM-
## CAQ)
## 3
[Alves et al. 2019].  SIMCAQ evaluates the cost of delivering quality education
based on various educational and structural variables, such as class size, teacher salaries,
and library resources.   Another example of a system that depends on the LDE data is
MapFor  [Schneider et al. 2023],  which  tracks  teachers’  academic  backgrounds.   These
projects demonstrably impact society,  highlighting the importance of maintaining high
data quality within the LDE database.
There are many tools to assist the integration of datasets (a non-exhaustive survey
on integration tools is found, here:  [Curino et al. 2013]).  However, human intervention
is often necessary to align open-access datasets containing historical information.  This
is further complicated by the evolution of the open data file structure over time, includ-
ing changes in column names, value domains, and additions/removals of columns.  This
paper focuses on addressing the challenges associated with column name changes and
additions/removals.
To illustrate the changes in column names, consider the following CSV headers
released by the MEC open-access files, shown in Figure 1: “numsalasutilizadas” and
“qtsalasutilizadas”.   To illustrate the introduction of new information,  consider the
column “qtdetablet” added in the 2020 data file. Finally, we illustrate columns when an
attribute is no longer included in the data for a particular year. For example, the attribute
“nuequipfoto” was removed from the scholar census in 2017.
Properly mapping all these changes in the LDE database is essential to enhanc-
ing data quality.  In Figure 1, consider a scenario where new information is added to the
data files of the scholar census, such as “qtsalasutilizadas”. Regardless of whether or
not this information is already implied in the existing “numsalasutilizadas” column,
there might be a tendency to treat it as a new column. This could lead to the addition of a
new column to the LDE database (“qt
salasutilizadas”), resulting in schema evolution.
However,  mapping to this new column can make it difficult to infer existing informa-
tion (“numsalasutilizadas”) without detailed analysis. When a new column is created
(such as “qtsalasutilizadas”), instances from previous years are filled with null val-
ues, and subsequent analysis may provide incorrect information, failing to indicate that
previous data was present in another column (such as “num
salasutilizadas”).
## 3.  Goodness-of-fit Schema Evolution Methodology
In this section,  we present our statistical methodology used in the integration of open
access datasets into the LDE database.  Our methodology employs goodness-of-fit sta-
tistical tests to match the CSV columns released each year with the existing columns in
## 3
https://www.simcaq.c3sl.ufpr.br/ (in Portuguese)

Figure  1.   Illustration  of  schema  evolution  showing  the  data  file  headers  from
2018 and 2020, as well as the impact of header changes on the integrated
schema.  Arrows indicate the mappings.  Columns are presented in their
original Portuguese names.
the database.  First, in Section 3.1, we define the goodness-of-fit tests in the context of
schema evolution tests.  In Section 3.2, we define our matching algorithm, which uses
specific metrics given by the goodness-of-fit tests to determine the correct match of each
column for a given year.
3.1.  Goodness-of-Fit
Our main hypothesis is that Goodness-of-fit statistical tests ensure reliabledata quality
metrics during column matching.  These tests provide information aboutdata distribu-
tions,means,variances, andmagnitudeof observed differences. We use the well-known
Kolmogorov–Smirnov test, Anderson–Darling test, Welch’s t-test, and the F-test to com-
pare the distributions of a column in a given year with possible matches from the next
year.
## Letx: (x
## 1
## ,x
## 2
## ,...,x
m
## )andy: (y
## 1
## ,y
## 2
## ,...,y
n
)be the distributions (collected data
between years) being compared of sizesmandn, respectively.  Also, let
xandybe the
means ofxandy, andS
## 2
x
andS
## 2
y
be the variances ofxandy.  Now, we briefly describe
each test.
Kolmogorov–Smirnov test:This test verifies if two samples are statistically
similar.  In our methodology, it determines whether the data in two columns from differ-
ent years follow the same distribution.  This allows us to evaluate data consistency over
time by comparing the base year with the following year based on the distribution of the
samples. LetF
m
andG
n
be the empirical Cumulative Distribution Functions (CDFs) for
thexandysamples defined as follows:
## F
m
## (t) =
number of sample x'≤t
m
## (1)
## G
n
## (t) =
number of sample y'≤t
n
## (2)

the Kolmogorov-Smirnov test is defined as follows:
D=max|F
m
(t)−G
n
## (t)|,min(x,y)≤t≤max(x,y)(3)
where samples are considered to come from the same distribution ifDis small enough
[D’Agostino 1986, Berger and Zhou 2014].  Considering the example illustrated by Fig-
ure  1,  the  attributes  “qtsalasutilizadas”  and  “numsalasutilizadas”  present  the
same distribution and data type.  In this particular case, the KS-test shows theD= 0.1
andp−value= 1.
Anderson–Darling test:Similar to the Kolmogorov-Smirnov test, the Ander-
son–Darling test considers the differences between the distributions, with the difference
that the Anderson–Darling test gives more weight to the tails of the distributions when
compared to the Kolmogorov-Smirnov test. For comparing two distributions, the Ander-
son–Darling statistic can be computed as follows:
## A
## 2
## =
## 1
## N(mn)
## N−1
## X
j=1
## (NX
j
## −jm)
## 2
## + (NY
j
## −jn)
## 2
j(N−j)
## (4)
whereN=m+n,Z
## 1
## <···< Z
## N
is the pooled ordered sample, andX
j
andY
j
are the
number of observations inxandythat are not greater thanZ
j
, respectively [Pettitt 1976].
The Anderson–Darling test applied to “nu
equipfoto” and “qtsalasutilizadas” re-
sults in a statistic of 5.58 and a p-value of 0.0009,  indicating a statistically significant
difference in their distributions.  This suggests that the columns are unlikely to be com-
patible.
F-test:By applying the F-test to each column,  we compare the data variance
across different data file versions (released in different years).  If the test statisticFis
significant, it implies a substantial difference in data distribution, potentially indicating
mismatches or missing data in the following year. The F-test can be computed as follows:
## F=
## S
## 2
x
## S
## 2
y
## (5)
Values closer to 1 indicate similar variances, suggesting that both samples belong
to the same distribution [Hahs-Vaughn and Lomax 2020].  In our example, the F-test ap-
plied to “qtde
tablet” and “qtsalasutilizadas” columns yields a value of 14.66 and a
p-value of 0.0004, indicating a statistically significant difference in their distributions.
Welch’s t-test: The Welch’s t-test is a variation of the Student’s t-test, adapted to
cases where the samples have unequal variances and sample sizes.  The test is similar to
the F-test, since it compares the variances.  But unlike the F-test, this test considers the
averaged values and sizes of the distributions. Its value is computed as follows:
t=
x−y
q
## S
## 2
x
m
## −
## S
## 2
y
n
## (6)

This variant of the t-test relaxes the assumption of equal variances between the
two samples [Rayner et al. 2009].  In our example, the attributes “qtsalasutilizadas”
and “numsalasutilizadas” in Figure 1 demonstrate similar distributions, as evidenced
by the Welch’s t-test statistic of 0.069 and a high p-value of 0.95, indicating no significant
difference in their distributions.
## 3.2.  The Schema Matching Algorithm
Algorithm 1 is designed to identify changes in data columns across different years. It com-
pares columns from later years with the “base schema” (lines 2-5).  The “base schema”
represents the operational schema following a successful evolution and data integration.
When the p-value from a comparison exceeds a specified threshold (line 7), the algorithm
flags the column from the later year as a potential match and selects it as the best candidate
for mapping to the corresponding base year column (line 8-10).
Most importantly,  the algorithm enables the classification of data columns into
three  categories  to  guide  integration  decisions:   identical  columns,  new  columns,  and
columns without data.  Identical columns exhibit consistent data across different years.
New columns are introduced in the following year with no corresponding column in the
base year.  Columns without data are present in the base schema but absent in the subse-
quent year.
The comparison of column matches falls under the broader domain of data pro-
filing, which involves analyzing columns [Abedjan et al. 2015, Pena et al. 2021]. In data
profiling, the number of potential column comparisons can grow exponentially with the
number of attributes in a relation.   While our algorithm inherits this complexity,  it fo-
cuses on the specific task of comparing two columns, resulting in a worst-case scenario
of quadratic complexity when dealing with identical schemas.
## 4.  Experimental Results
In this section, we delve into the experiments we conducted using statistical tech-
niques on data retrieved from the LDE database.  We describe the experimental protocol
we followed and report the results obtained from the evaluation process.
## 4
## 4.1.  Experimental Protocol
We used the R implementation for the Goodness-of-fit methods used in this work de-
scribed in Section 3.1. Some goodness-of-fit approaches may be sensible to outliers (e.g.,
the variance-based approaches,  such as the F-Test),  necessitating their removal during
data preprocessing.  We employed the Interquartile Range (IQR) method for outlier de-
tection  by  finding  the  first  (Q1)  and  third  (Q3)  quartiles,  representing  25%  and  75%,
respectively.  The IQR is the difference between Q1 and Q3.  We identify and remove
outliers as values falling below Q1 subtracted by1.5times the IQR, or above Q3 added
by1.5times the IQR.
Instead of feeding the columns data directly to the Algorithm 1, which could lead
to problems when estimating thep−value(indicating the confidence of a given column
## 4
In  this  link,   we  provide  access  to  data  and  the  complete  source  code  of  the  LDE  system:
https://dadoseducacionais.c3sl.ufpr.br/ (in Portuguese).

Algorithm 1:COLUMNMATCH(curr,new,gd,threshold).
Input:curr: the current database columns;new: the new columns that arrived that must be
matched;gd: goodness-of-fit method to be used;p
thresh: minimumpvalueto
accept the column as a possible match.
Result:A map matching the columns innewwith the columns incurr.
1matches=empty set
## 2forc
columnincurrdo
3chosencol=N U LL
4metric=N U LL
## 5forn
columninnewdo
6nmetric, pvalue=gd(ccolumn, ncolumn)
## 7ifp
value≥pthreshthen
8if(chosencol is N U LLornmetricis better thanmetric)then
## 9metric=nmetric
## 10chosen
col=ncolumn
// the tuple (ccolumn, ncolumn) is a match between the
current and the arrived column
11matches=matches∪(ccolumn, ncolumn)
## 12removechosen
colfrom the setnew
// Mark the remaining as no match (new columns)
## 13forn
columninnewdo
14matches=matches∪(N U LL, ncolumn)
## 15returnmatches
to be a correct match), we first transform the data of the columns in a10-binshistogram.
We definedpthresh= 0.9(i.e.,α= 0.1) in Algorithm 1, which is a common practice
when accepting/rejecting the NULL hypothesis (i.e., the columns come from the same
distribution).
4.2.  Results – Matches Considering the Previous Year
In Table 1, we show the results, considering the accuracy of the Top 1.  We define a suc-
cessful match as an exact match between a column and its corresponding column from the
previous year. The accuracy is defined asacc=
hits
## #columns
. In Table 1, columnYeardefines
the reference year, which we need to match the columns with the previous year. The col-
umnChangesshows[x]+as the number of new,[y]−as the number of removed, and[z]c
as the number of changed columns when compared with the previous year (considering
the ground-truth).
For example,  consider 2019 in Table 1.   This year,  when analyzing the official
data made available from the MEC and comparing it with the previous year (2018), no
columns changed their names;  17 new columns appeared, presenting data that was not
collected in the previous year, and eight columns disappeared, presenting data that was
no longer collected.
As one can observe in Table 1, the Kolmogorov–Smirnov (K-S) test presented the
best results when considering the averaged results, correctly fitting the columns in over
80% of the cases. The results in Table 1 also show that even in the event of many changes
occurring in a given year, such as in the year 2019, where 19 new columns appeared and
2 columns disappeared, all tested approaches were able to correctly detect most of the

YearChangesK–S TestA-D TestWelch’s TestF-Test
## 2007-----
2008no change0.6670.3330.50.333
2009no change1.00.3330.3330.0
2010no change0.8330.6670.3330.333
2011no change0.3330.6670.6670.167
2012no change1.00.6670.6670.333
## 2013[0]c[7]+ [0]−0.8460.6920.6920.769
2014no change0.9230.7690.4620.231
## 2015[14]c[0]+ [0]−1.00.8460.5380.308
2016no change1.00.8460.3850.462
2017no change0.6150.5380.4620.231
## 2018[7]c[0]+ [0]−1.00.7690.6920.846
## 2019[0]c[17]+ [8]−0.8240.8820.7060.706
2020no change1.01.00.6360.591
2021no change0.8180.7270.3640.273
## Average (stdev)0.847 (0.189)   0.701 (0.185)   0.531 (0.139)   0.393 (0.228)
Table 1. Accuracy Considering the Top 1 results.
correct fits, columns that should be created (new columns), and columns that should be
disregarded (discontinued ones).
During the tests, we observed an interesting phenomenon: even when the column
is not perfectly fitted with the previous year, the correct fit still presented a high probability
(according to each test) of belonging to its proper fit.  In light of this, we make a Top 3
analysis in Table 2. The Top 3 consider a hit if the predicted fit appears in the three most
probable fits for a given approach.  The Top 3 can present a more realistic scenario than
the Top 1 since it can show the most probable fits to a specialist, who will choose the
correct one according to his/her domain knowledge.
The Top 3 results in Table 2 show that both the Kolmogorov–Smirnov and An-
derson–Darling tests correctly fit the columns in almost 90% of the cases considering the
Top 3 results. This result shows that these goodness-of-fit tests used in combination with
our proposed Algorithm (Algorithm 1) can significantly decrease the manual work of the
domain’s specialist, who will find the correct match in the first proposals of the algorithm
instead of needing to find the proper fit considering all possible columns available for a
given year.
4.3.  Results – Matches Considering the Accumulated Years
In this Section, we follow the same protocol as in Section 4.2, with the difference that
when trying to match thenthreference year, all the data from the first year to thenth−1
year  are  used  to  create  the  distribution  to  be  compared.   For  instance,  when  trying  to
match the reference year of 2010, the data distribution from 2010 is compared with the
distributions of the years 2007, 2008, and 2009 combined. To make this possible, we first
normalize the histograms by dividing each bin by the number of tuples used to create the
histogram.

YearChangesK–S TestA-D Test   Welch’s TestF-Test
## 2007-----
2008no change1.00.8330.50.667
2009no change1.01.00.50.0
2010no change0.8331.00.6670.333
2011no change1.01.030.8330.33
2012no change1.01.00.6670.5
## 2013[0]c[7]+ [0]−0.8460.6920.4620.538
2014no change0.8460.8460.8460.462
## 2015[14]c[0]+ [0]−0.9230.9230.8460.538
2016no change0.9230.9230.7690.615
2017no change0.7690.8460.6920.385
## 2018[7]c[0]+ [0]−1.01.00.8460.923
## 2019[0]c[17]+ [8]−0.8240.7650.7060.647
2020no change0.8180.8180.5910.727
2021no change0.7730.7730.7270.591
## Average (stdev)0.897 (0.087)   0.887 (0.101)0.689 (0.13)   0.519 (0.21)
Table 2. Accuracy Considering the Top 3 results.
The concept of this test is that by grouping more data to compare, we could get
closer to the real underlying distribution of the data.  The Top 1 results of this test are
shown in Table 3.
As   one   can   observe   in   Table   3,   besides   the   good   results   of   the   Kol-
mogorov–Smirnov and Anderson–Darling tests, there was a decrease in the accuracy for
all the tested approaches when compared with the results when the columns were matched
considering only the previous year (Section 4.2)
## 5
.  We hypothesize that external factors,
such as data collection policy changes over time, made it more difficult to make a correct
match when including the data from previous years in the distribution for comparison.
The Kolmogorov-Smirnov test corroborates this hypothesis since the results got worse
for the latest years when compared with Section 4.2, since in the latest years, there were
more old data aggregated in the columns to make the comparison.
## 5.  Related Work
Schema   evolution   management   has   been   the   focus   of   several   works   over   the
years.These   works   conduct   empirical   investigations   into   relational   schema
evolution[Qiu et al. 2013,Vassiliadis et al. 2015,Vassiliadis and Zarras 2017,
Vassiliadis et al. 2019].In  [Klettke et al. 2017],  the  authors  evaluate  schema  evolu-
tion histories over time, examining data from a data lake and schema versioning.  Our
work analyzes data integration quality and tracks the evolution of the database schema.
SomeworkshaveevaluatedtheschemaevolutionintheNoSQL
database [Meurice and Cleve 2017, Ringlstetter et al. 2016].  In [Cerqueus et al. 2015a],
## 5
We identified a similar behavior in the Top 3 results, which are not included in this work due to length
restrictions.

YearChangesK–S TestA-D TestWelch’s TestF-Test
## 2007-----
2008no change1.00.3331.00.167
2009no change0.6670.6670.3330.0
2010no change0.6671.00.1670.0
2011no change0.6671.00.1670.0
2012no change1.01.00.1670.0
## 2013[0]c[7]+ [0]−1.01.00.6150.462
2014no change0.9230.6920.2310.077
## 2015[14]c[1]+ [0]−0.9230.9230.00.154
2016no change0.6920.6920.1540.154
2017no change1.00.8460.7690.231
## 2018[7]c[0]+ [0]−1.00.8460.8460.769
## 2019[0]c[17]+ [8]−0.3480.3480.3040.609
2020no change0.2670.2670.10.533
2021no change0.2670.20.0670.6
## Average (stdev)0.744 (0.271)   0.701 (0.287)   0.351 (0.309)   0.268 (0.26)
Table 3. Accuracy Considering the Top 1 accumulated results.
the  authors  discuss  the  implementation  and  customization  of  verification  rules  to  help
developers  manage  schema  evolution  and  prevent  compatibility  issues  and  data  loss.
[Scherzinger and Sidortschuck 2020,Scherzinger et al. 2016,Cerqueus et al. 2015b]
investigate the evolution of NoSQL database schema, focusing on their flexibility, denor-
malization practices, and changes over development time through empirical analysis of
open-source projects.  Our work evaluates the quality of schema evolution in a relational
database, which implies distinct challenges.  The NoSQL schema evolution has greater
flexibility and denormalization.  However, relational databases enforce constraints and a
greater need to maintain integrity.
Prism/Prism++ [Curino et al. 2009, Curino et al. 2013] implements a solution fo-
cused on schema evolution in relational databases. Prism uses the data dictionary to track
changes in the data schema.  It describes an integrated solution to predict and evaluate
the impact of schema changes and integrity constraints.   The objective is to minimize
downtime by automating database migration and documenting schema evolution.
The work of [Delplanque et al. 2020] discusses the challenges of evolving rela-
tional database schema.  The authors propose a meta-model approach to automate mo-
difications after database changes, providing recommendations to maintain a consistent
state.   As  observed  in  [Etien and Anquetil 2024],  a  meta-model  for  analyzing  the  im-
pact of changes and ensuring database relational constraints are verified. In contrast, our
methodology evaluates the data distribution and other statistical measures without ana-
lyzing  attribute  names.   This  approach  allows  us  to  monitor  schema  evolution  from  a
data-centric perspective, providing an understanding of how data changes over time.

-  Conclusion and Future Work
In this paper, we presented a methodology for identifying matches between attributes of
the census datasets from a given year and their possible matches in a dataset released in a
subsequent year.  Our hypothesis was that using statistical tests to evaluate the evolution
of the LDE database schema enhances the reliability of column matching.  Indeed, our
methodology finds the matching attributes and shows what the changes are, such as adding
new  data  or  data  columns  not  present  in  the  year  evaluated.   Results  showed  that  our
approach, combined with the Kolmogorov–Smirnov test, significantly reduced the manual
effort required by specialists.   In our methodology,  specialists can identify the correct
matches rather than having to evaluate all possible columns available for a given year.
As future work,  we plan to evaluate attributes that have binary and categorical
data.  These data require the application of different statistical tests than those used for
numerical  data.   Besides,  we  also  plan  to  automate  the  analysis  of  schema  quality  as
necessary by evaluating column matching.  At this point, we intend to study the use of
machine learning to facilitate the integration of databases and manage schema evolution.
## References
Abedjan,  Z.,  Golab,  L.,  and  Naumann,  F.  (2015).   Profiling  relational  data:  a  survey.
## VLDB J., 24(4):557–581.
Alves, T., Silveira, A. A. D., Schneider, G., and Fabro, M. D. D. (2019). Financiamento da
escola p
## ́
ublica de educac ̧
## ̃
ao b
## ́
asica: a proposta do simulador de custo-aluno qualidade.
## Educac ̧
## ̃
ao E Sociedade (in Portuguese), 40.
Anderson, T. W. and Darling, D. A. (1952).  Asymptotic Theory of Certain ”Goodness
of Fit” Criteria Based on Stochastic Processes.The Annals of Mathematical Statistics,
## 23(2):193 – 212.
Berger, V. W. and Zhou, Y. (2014).  Kolmogorov–smirnov test: Overview.Wiley statsref:
Statistics reference online.
Cerqueus,  T.,  de  Almeida,  E.  C.,  and  Scherzinger,  S.  (2015a).   Safely  managing  data
variety in big data software development. In1st IEEE/ACM BIGDSE, pages 4–10.
Cerqueus, T., Scherzinger, S., and de Almeida, E. C. (2015b). Controvol: Let yesterday’s
data catch up with today’s application code. InWWW Companion, pages 15–16.
Curino, C., Moon, H. J., Deutsch, A., and Zaniolo, C. (2013).  Automating the database
schema evolution process.VLDB J., 22(1):73–98.
Curino, C., Moon, H. J., and Zaniolo, C. (2009).  Automating database schema evolution
in information system upgrades. In2nd ACM HotSWUp 2009.
D’Agostino, R. (1986).Goodness-of-Fit-Techniques.  Statistics:  A Series of Textbooks
and Monographs. Taylor & Francis.
Delplanque, J., Etien, A., Anquetil, N., and Ducasse, S. (2020).  Recommendations for
evolving relational databases. InCAiSE 2020, pages 498–514.
Etien, A. and Anquetil, N. (2024).  Automatic recommendations for evolving relational
databases schema.arXiv preprint arXiv:2404.08525.

Garcia-Molina, H., Ullman, J. D., and Widom, J. (2009).Database systems - the complete
book (2. ed.). Pearson Education.
Hahs-Vaughn, D. and Lomax, R. (2020).Statistical Concepts:  A Second Course.  Rout-
ledge.
## Klettke, M., Awolin, H., St
## ̈
orl, U., M
## ̈
uller, D., and Scherzinger, S. (2017).  Uncovering
the evolution history of data lakes. InIEEE BigData 2017, pages 2462–2471.
Meurice, L. and Cleve, A. (2017). Supporting schema evolution in schema-less nosql data
stores. In24th IEEE SANER, pages 457–461.
Pena, E. H. M., de Almeida, E. C., and Naumann, F. (2021).   Fast detection of denial
constraint violations.Proc. VLDB Endow., 15(4):859–871.
Pettitt,  A.  N.  (1976).A  two-sample  anderson-darling  rank  statistic.Biometrika,
## 63(1):161–168.
Qiu, D., Li, B., and Su, Z. (2013).  An empirical analysis of the co-evolution of schema
and code in database applications. InACM SIGSOFT, page 125–135.
Rayner, J., Thas, O., and Best, D. (2009).Smooth Tests of Goodness of Fit:  Using R.
Wiley series in probability and statistics Smooth tests of goodness of fit using R. Wiley.
Ringlstetter, A., Scherzinger, S., and Bissyand
## ́
e, T. F. (2016). Data model evolution using
object-nosql mappers: folklore or state-of-the-art?  In2nd IEEE/ACM BIGDSE, page
## 33–36.
Scherzinger,  S.,  de Almeida,  E. C.,  Cerqueus,  T.,  de Almeida,  L. B.,  and Holanda,  P.
(2016). Finding and fixing type mismatches in the evolution of object-nosql mappings.
InEDBT/ICDT Workshops, volume 1558.
Scherzinger, S. and Sidortschuck, S. (2020).  An empirical study on the design and evo-
lution of nosql database schemas.  InConceptual Modeling, pages 441–455. Springer
## Inter. Publishing.
Schneider,  G.,  Gallotti  Frantz,  M.,  and  Alves,  T.  (2023).    Infraestrutura  das  escolas
p
## ́
ublicas no brasil: desigualdades e desafios para o financiamento da educac ̧
## ̃
ao b
## ́
asica.
## Revista Educac ̧
## ̃
ao B
## ́
asica em Foco (in Portuguese), 17(2).
Schneider, G., Silveira, A. A., and Alves, T. (2020).  Mapeamento da formac ̧
## ̃
ao de do-
centes no paran
## ́
a: um olhar para o indicador de adequac ̧
## ̃
ao.Jornal de Pol
## ́
ıticas Educa-
cionais (in Portuguese), 1(3).
Silveira, A. D., Schneider, G., and Alves, T. (2021).Simulador de Custo-Aluno Qualidade
(SimCAQ): Trajet
## ́
oria e Potencialidades.Inep/MEC (in Portuguese).
Vassiliadis, P., Kolozoff, M. R., Zerva, M., et al. (2019).  Schema evolution and foreign
keys:  a study on usage, heartbeat of change and relationship of foreign keys to table
activity. volume 101, pages 1431–1456.
Vassiliadis, P. and Zarras, A. V. (2017). Survival in schema evolution: Putting the lives of
survivor and dead tables in counterpoint. InCAiSE 2017, pages 333–347.
Vassiliadis, P., Zarras, A. V., and Skoulis, I. (2015). How is life for a table in an evolving
relational schema?  birth, death and everything in between.  InConceptual Modeling,
pages 453–466.