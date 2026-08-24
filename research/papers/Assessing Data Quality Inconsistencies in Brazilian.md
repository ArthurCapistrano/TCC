

Journal of Information and Data Management, 2023, 14:1,doi: 10.5753/jidm.2023.3220
This work is licensed under a Creative Commons Attribution 4.0 International License.
Assessing Data Quality Inconsistencies in Brazilian
## Governmental Data
Gabriel P. Oliveira[Universidade Federal de Minas Gerais|gabrielpoliveira@dcc.ufmg.br]
Bárbara M. A. Mendes[Universidade Federal de Minas Gerais|barbaramit@ufmg.br]
Clara A. Bacha[Universidade Federal de Minas Gerais|clarabacha@ufmg.br]
Lucas L. Costa[Universidade Federal de Minas Gerais|lucas-lage@ufmg.br]
Larissa D. Gomide[Universidade Federal de Minas Gerais|larissa.gomide@dcc.ufmg.br]
Mariana O. Silva[Universidade Federal de Minas Gerais|mariana.santos@dcc.ufmg.br]
Michele A. Brandão[Instituto Federal de Minas Gerais|michele.brandao@ifmg.edu.br]
Anisio Lacerda[Universidade Federal de Minas Gerais|anisio@dcc.ufmg.br]
Gisele L. Pappa[Universidade Federal de Minas Gerais|glpappa@dcc.ufmg.br]
Computer Science Department, Universidade Federal de Minas Gerais, Av. Presidente Antônio Carlos, 6627, Pam-
pulha, Belo Horizonte, MG, 31270-901, Brazil.
Received:6 March 2023•Published:20 October 2023
AbstractIn recent years, vast volumes of data are constantly being made available on the Web, and they have been
increasingly used as decision support in different contexts. However, for these decisions to be more assertive and
reliable,itisnecessarytoensuredataquality. Althoughthereareseveraldefinitionsforthisarea,itisaconsensusthat
dataqualityisalwaysassociatedwithaspecificcontext. Thisworkaimstoanalyzedataqualityinadatawarehouse
with governmental information of the Brazilian state of Minas Gerais. We first present a brief comparison of eight
open-source data quality tools and then choose the Great Expectations tool for analyzing such data in two real
applications: publicbidsandpublicexpenditure. Ouranalysesshowthatthechosentoolhasrelevantcharacteristics
to generate good data quality indicators to reveal data quality issues that may directly impact the construction of
final applications using such data.
Keywords:data quality, governmental data, great expectations, public bids, public expenditure
## 1 Introduction
The statement “Data is the new oil” made by the British
mathematician Clive Humby
## 1
says a lot about the impor-
tance of building and maintaining data with quality. More
and more decisions are being made based on data, especially
in a reality where huge volumes of data are constantly avail-
able on the Web
## 2
. Thus, data must be reliable for these deci-
sionstobemoreassertiveandprecise[Medeiroset al.,2020;
Junior and Dorneles,2021].
## Theareaofdataqualityemergesinthiscontext. Although
there are several definitions for this area, it is a consensus
that it is always associated with a specific context [
## Junior
andDorneles
,2021]. Inotherwords, agivendatasetmaybe
suitable for one scenario, but not another, or data has qual-
ity when it is “fitness for use” [Wanget al.,2018]. There-
fore, many works analyze quality in a specific domain [
## Ci-
chy and Rass,2019]. Another definition concerns multi-
pledimensions,identifiedbyattributes,representingspecific
characteristics of the data [
Scannapieco and Catarci,2002;
Medeiroset al.,2020].
Therefore, this work aims to analyze data quality in a data
warehouse with governmental spending information within
the Brazilian state of Minas Gerais. The primary motiva-
tion is the identification of inconsistencies that may impact
## 1
Data is the new oil:https://bit.ly/DataTheNewOil
## 2
A minute on the Internet:http://bit.ly/3rdWUPf
the analyses carried out on public bids and expenditures. In
this way, we use several quality indicators,i.e., metrics that
evaluate specific rules in the data. For example, consider-
ing a column that stores percentage values, an indicator can
determine whether all records in that column range between
0% and 100%.
This work analyzes eight open-source tools that consider
different data quality dimensions. The selection of these
tools considers whether the tool is open-source and is easy
to use in a way that allows to reproduce the methodology
proposed here. After comparing their functionalities, we se-
lect the Great Expectations (GE) tool as the most appropri-
ateforourcontext,asitverifiesqualityproblemsandreports
them to the users in an automated way. This tool has several
indicators implemented natively, in addition to the possibil-
ity of developing customized indicators, through which it is
possible to implement business rules specific to the context
of the analyzed data. GE also has a component for generat-
ing an interactive graphical interface with the results of the
indicators. After selecting such a tool, we propose a novel
methodology for assessing data quality analysis using GE.
This article extends a full paper from the 37th Brazilian
Symposium on Databases [
Oliveiraet al.,2022b]. As a new
material, we introduce a new application of GE in public ex-
penditure data and the existing application in bidding data.
## Furthermore,weproposeanewqualitymetricthatcompares
tables from different applications. Overall, the results show

Assessing Data Quality Inconsistencies in Brazilian Governmental DataOliveira et al. 2023
that using GE allows the identification of quality problems
that would not be easily identified. Moreover, the proposed
quality metric can help quality analysts determine the prior-
ity of the tables for further manual inspection. Thus, it could
accelerate the resolution of problems in important tables.
The remainder of this article is organized as follows. Re-
lated work is presented in Section2. Next, Section3de-
scribes the comparative analysis of data quality tools. Sec-
tion4presents the methodology steps for data quality anal-
ysis using Great Expectations. Sections5and6presents the
results from data quality analysis of public bidding and pub-
lic expenditure data, respectively. Then, Section7introduce
the new quality metric based on GE results. Finally, in Sec-
tion8, we present our conclusions and future work.
## 2 Related Work
The term “data quality” is related to a set of characteristics
that data must have. These properties are called dimensions,
which include, for example, precision, completeness, and
consistency[ScannapiecoandCatarci,2002;Medeiroset al.,
2020]. The process of managing this quality comprises four
practices, namely: (i)data profiling, to create an overview
ofthedataandidentifyhowtheyarestored[CichyandRass,
2019]; (ii)data quality measurement, consisting, for exam-
ple, of identifying missing data, outliers and corrupted in-
formation [
## Lee
et al
.,2002;Ehrlinger and Wöß,2018]; (
iii
## )
data cleaning, to remove unwanted data [Elmagarmidet al.,
2007]; and (iv)data quality monitoring, to maintain the data
quality principles in a team, and to create/use tools and pro-
cessestobeappliedintheprevioussteps[
Pipinoet al.,2002;
Laranjeiroet al.,2015].
Data quality must be defined in its context of use, as the
same dataset may need different indicators depending on the
needs of its users [Ballou and Pazer,1985]. The importance
ofdataqualityhasbeennotedinmanydifferentcontexts, in-
cluding cartography [
Chrisman,1983], biology [Etcheverry
andConsens,2011],andmedicine[Goudaret al.,2015;Zöll-
neret al.,2016]. Other studies use data visualization tech-
niques to support quality analyses on abstract and timeless
data[JoskoandFerreira,2021]. Furthermore,giventheneed
for training artificial intelligence models,Sessions and Val-
torta[2006] present an analysis of the effects of data quality
on machine learning algorithms, demonstrating the impor-
tance of applying these concepts.
Thus, to analyze the quality of large volumes of data in
different contexts, automated methods are required, result-
ing in a vast market of tools for this purpose. In this sense,
previousworksaimtocomparedataqualitytools. Forexam-
ple,
Pushkarevet al.[2010]evaluateseventoolsopen-source
or with free trial periods using criteria such as connectivity,
management,interface,andfunctionalities.Gaoet al.[2016]
analyze eight commercial tools considering their functional-
ities. Furthermore,
Altendeitering and Tomczyk[2022] pro-
pose a taxonomy for data quality and analyze 18 tools in this
context. Finally, a more extensive study is carried out by
Ehrlinger and Wöß[2022], who analyze 667 different qual-
ity tools. The authors use a set of exclusion criteria to select
13 tools (eight commercial and five open-source) for further
comparison.
Although data quality is a research topic that has been ex-
tensively studied in different contexts, analyzing the quality
of government data is still an area in constant expansion. In
this sense,Wuet al.[2022] analyze the quality and applica-
bility of open government data related to COVID-19 in the
US, EU, and China. The results show that the data still lacks
the necessary metadata.
To the best of our knowledge, existing work on govern-
ment data does not perform quality analysis on public ex-
penditure data. Thus, this work expandsOliveiraet  al.
[2022b] to analyze open-source tools applied to this context
and present two applications with real-world data. Ensuring
dataqualityinthiscontextisfundamentalforfurtherapplica-
tions,suchasdetectingfraudinpublicbidsandotherpredic-
tion and recommendation tasks [
Maiaet al.,2020;Oliveira
et al.,2022a].
## 3 Data Quality Tools
This section presents a comparative analysis of data qual-
ity tools selected from pre-defined criteria. Section3.1de-
scribesthetoolselectioncriteriaandalltheconsideredtools.
## Then, Section
3.2presents the comparison results of each
tool’s functionalities. Finally, in Section
3.3, theGreat Ex-
pectationstool is described in detail, as it is the tool that best
meets our selection criteria.
## 3.1 Considered Quality Tools
We use two studies as a basis for selecting data quality tools.
The first one presents a systematic review of 667 tools and
appliesexclusioncriteriaforreachingthefinalsetof13tools
considered in its comparative analyses [Ehrlinger and Wöß,
2022]. Such criteria mainly check if the tools are designed
for specific tasks and domains and if they are publicly avail-
able or with a free trial period. The second work explores
three additional tools, which are not considered in the first
work [Foidlet al.,2022].
With the set of 16 tools pre-selected based on the two
works mentioned above, we also include an extra criterion,
which evaluates whether a tool is open-source and aims to
guarantee the possibility of using the tool easily and repro-
ducing the methodology proposed here. After considering
all such criteria, our selection process resulted in eight data
quality tools. Next, we describe each of them with reference
to the source article in which the tool was presented.
Aggregate Profiler (AP)
## 3
## .
This tool includes an integrated
data management platform that, in addition to features re-
latedtodatapreparation,alsoprovidesdatacleansing,statis-
ticalanalysis,patternmatching,anddataprofiling[
## Ehrlinger
and Wöß,2022].
Apache Griffin (AG)
## 4
.This tool focuses on big data and
is dedicated to continuously measuring batch or streaming
data quality. AG offers a set of well-defined data quality
## 3
## Aggregate Profiler:https://sourceforge.net/projects/
dataquality/
## 4
## Apache Griffin:https://griffin.apache.org/

Assessing Data Quality Inconsistencies in Brazilian Governmental DataOliveira et al. 2023
Table 1.Feature comparison of the considered data quality tools.
## #   Features
## Aggregate Profiler
## Apache Griffin
## Great Expectations
MobyDQ
OpenRefine & Metric
PyDeequ
## Talend Open Studio
## Tensorflow Data Validation
1Table formattingcp3cppp3
2Restrictions on valuescpccppcp
3Range of valuesppccppcp
4String matchingcpp7pppp
5Timestamp and JSON773pp7p7
6Aggregation functionspppp7ppp
7Multi-column operationsp7pp7p77
8Functions related to probability distributions77pp777p
9Functions related to filesp73cp777
10Custom indicators37337737
domain models, which cover different data quality problems
[Ehrlinger and Wöß,2022].
GreatExpectations(GE)
## 5
.GEisanopen-sourcelibraryfor
validating, documenting, and characterizing data. Its opera-
tionisbasedontheconceptoftestautomationfromSoftware
## Engineering,makingitpossibletoattesttodataqualitybased
on what is expected [
Foidlet al.,2022].
MobyDQ
## 6
.A tool for automating data quality checks dur-
ing data processing, capturing metric results, and triggering
alerts in case of anomalies. MobyDQ was inspired by an in-
ternal project by Ubisoft Entertainment to measure and im-
prove the data quality of its Enterprise Data Platform. How-
ever, its open-source version has been reformulated to im-
prove its design and remove technical dependencies with
commercial software [
Ehrlinger and Wöß,2022].
OpenRefine & Metric (ORM)
## 7
.A tool dedicated to clean-
ingandtransformingdata,operatingonstructureddata(rows
and columns), similar to how relational tables work. Specif-
ically, ORM projects consist of a table whose rows can be
filtered using defined criteria [
Ehrlinger and Wöß,2022].
PyDeequ
## 8
.A Python API for Amazon Deequ, a library
which aims to perform “unit tests” on data, i.e., to measure
dataqualityaccordingtopre-establishedrulesandconditions
[Foidlet al.,2022].
Talend Open Studio (TOS)
## 9
.The Talend company offers
twoproductsfordataquality: TalendDataManagementPlat-
form and Talend Open Studio (TOS). The prior requires a
paid subscription, while the latter is a free, open-source tool.
Both products (Open Studio and Enterprise) offer good sup-
portforBigDataanalytics(e.g.,SparkorHadoop)andavari-
ety of profiling and data cleansing functionalities [
## Ehrlinger
and Wöß,2022].
## 5
## Great Expectations:https://greatexpectations.io/
## 6
MobyDQ:https://ubisoft.github.io/mobydq/
## 7
OpenRefine & Metric:https://openrefine.org/
## 8
PyDeequ:https://github.com/awslabs/python-deequ
## 9
## Talend Open Studio:https://www.talend.com/products/
talend-open-studio/
Tensorflow Data Validation (TFDV)
## 10
.A library for ex-
ploring and validating machine learning data. TFDV is de-
signed to be highly scalable and work well with TensorFlow
and TensorFlow Extended (TFX) [
Foidlet al.,2022].
## 3.2 Feature Comparison
## Here,wecomparetheeightopen-sourcetoolsregardingtheir
respective functionalities. Following a methodology similar
toEhrlinger and Wöß[2022], we define a catalog of evalu-
ation requirements listed in the first column of Table1. Our
goal is to classify the fulfillment of each requirement into
four categories: (3) met, (7) not met, (p) partially met, and
## (c)availableaftercustomization. Inparticular,theccategory
indicates the possibility of implementing custom indicators,
making it possible to fulfill any requirement not available
natively in the tool.
To perform the comparative analysis and define the re-
quirements catalog, we evaluate only each tool’s documen-
tation. Therefore, we do not include any functionality that
is not mentioned in the documentation in the analysis. The
final set of requirements contains functionalities related to
the following categories: (#1) table formatting, such as size
and existence of rows/columns; (#2) restrictions on values;
(#3) range of values; (#4) pattern matching in strings; (#5)
datesandJSONformat;(#6)dataaggregationfunctions;(#7)
multi-column operations; (#8) functions related to probabil-
ity distributions; and (#9) file-related functions. In addition
to these nine categories, we also include one (#10) related to
the possibility of creating custom indicators
## 11
## .
Table1shows that the most basic features (1–4) are cov-
ered by most tools, either entirely or partially. Most of the
more sophisticated functionalities (5–9), such as functions
related to probability distributions and files, are more un-
usual. As an exception, aggregation functions, despite also
## 10
## Tensorflow Data Validation:https://github.com/tensorflow/
data-validation
## 11
The details of each category of functionalities are in the Sup-
plementary Material available athttps://doi.org/10.5281/zenodo.
## 7007428
## .

Assessing Data Quality Inconsistencies in Brazilian Governmental DataOliveira et al. 2023
Table 2.Ranking of tools that best fulfill our requirements.
#  Tool3cp7Additional components
1Great Expectations   40%  20%  40%  0%  Profiler, Graphical interface
2MobyDQ10%  40%  40%  10%  Graphical interface
3Aggregate Profiler   10%  30%  40%  20%  Graphical interface
4Talend Open Studio  10%  20%  40%  30%  –
## Choosing
the indicators
## Implementing
the indicators
Reading the
data source
## Executing
the indicators
## Visualizing
and analyzing
## Reviewing
the indicators
## NEW DATA
## LOAD
## Manual Step
## Automatic Step
## TABLE
Figure 1.Methodology for data quality analysis using Great Expectations.
being a more complex feature, are partially covered by most
tools. Finally, regarding the availability of creating cus-
tomized indicators (#10), we observe that half of the tools
meet such a requirement. Thus, even if such tools do not
present specific indicators natively, it is possible to imple-
ment them in a customized way.
Overall, the tools that least meet the listed requirements
are Apache Griffin, OpenRefine & Metric, PyDeequ, and
Tensorflow Data Validation. In addition to having few fea-
tures compared to other tools, they also do not provide cus-
tomized indicators. In contrast, the tools that best meet the
ten features are Great Expectations, MobyDQ, Aggregate
Profiler, and Talend Open Studio. All four tools provide the
application of business rules, as they provide customization
of indicators. In particular, such functionality is essential for
the domain analyzed in this study (i.e., governmental data),
given that such a context requires specific business rules.
We now rank the four tools mentioned above concerning
the best fulfillment of the requirements and their additional
components. Table
2presents this ranking, with the per-
centage of fulfillment of each category and a list of the re-
spective extra features, if any. Therefore, the tool that best
fits the comparative analysis isGreat Expectations, which
in addition to having overcome the other tools in terms of
functionality, provides additional relevant components, in-
cludingProfilerand a graphical interface, calledData Docs,
that shows the results of the executed indicators. Next, we
describe the main components and functionalities of Great
## Expectations.
3.3 TheGreat ExpectationsTool
Great Expectations (GE) is an open-source data quality tool
thatusesamechanismsimilartounittestsfordatavalidation.
## Eachvalidationisdonebyamodulecalledexpectation(here,
we call them indicators). GE provides several native indica-
tors that perform generic data validations, such as checking
field types, value ranges, and null records. In addition, GE
offers the possibility of creating custom indicators, allowing
the implementation of specific business rules for each table.
Such indicators are coded in Python and integrated into the
tool’s structure. Thus, they can be used in conjunction with
nativeindicators. Wenowdescribethemaincomponentsand
functionalities available in GE.
Expectations.Correspond to a set of assertions expressed
indeclarativelanguageandusedfordatavalidation. GEver-
ifies such assertions in the desired table columns and returns
the success or failure of the verification as a result. Thus,
expectations are the indicators to evaluate the data quality,
and they can run on Pandas, Spark, and SQLAlchemy data
frames. Finally, the results are returned in a structured for-
mat (JSON), which facilitates post-processing tasks.
Profiler.This component performs a pre-analysis and re-
turns a characterization of the data, as well as a collection
of indicators that best fit the analyzed data. Such indicators
serveasarecommendationofthebestvalidationsthatshould
be made on this data.
DataDocs.Thiscomponentdisplaystheresultsoftheindi-
cators executed on the data. It provides an interactive graph-
icalinterfaceinHTMLpageformat, wheretheusercannav-
igate the results.
In summary, we choose GE as the best data quality tool
for our context because: (i) the customized indicators allow
the implementation of quality indicators that assess specific
business problems; (ii)Data Docsgenerates a graphical in-
terface containing the results of the executed indicators, fa-
cilitating the analysis of the results by final users; and (iii)
## Profilerdoesapre-analysisofthestructureofthestoreddata,
and then shows an overview of the data with some recom-
mended indicators to be implemented on them.
4 Methodology for Data Quality
Analysis using Great Expectations
After choosing Great Expectations as our data quality tool,
we propose a methodology for the data quality analysis task
using it, as illustrated in Figure1. This pipeline consists of
fivemainstepsandoneoptionalstep,fromthechoiceofspe-
cificindicatorsforeachtabletothevisualizationandanalysis
of the results by specialists. Such steps are detailed below.
Choosing the indicators.This is the first step after select-
ing the table. It consists of a manual inspection of the table’s
structureandcontenttodefinethequalityindicatorsthatwill

Assessing Data Quality Inconsistencies in Brazilian Governmental DataOliveira et al. 2023
Table 3.Great Expectations indicators used in the analysis of public bidding data.
Indicator (expectation)Description
## Native
expect_column_values_to_not_be_nullColumn values must not be null
expect_column_values_to_be_uniqueThere must be no duplicate values in the column
expect_column_min_to_be_betweenThe smallest column value must be within the range [min, max]
expect_column_values_to_be_in_type_listColumn values must be of the specified type
expect_column_values_to_be_in_setColumn values must belong to a value set
expect_column_values_to_be_betweenColumn values must be in the range [min, max]
expect_column_values_to_match_regexColumn values must follow a given regular expression
## Custom
expect_value_less_revenueBids must have a value less than or equal to the entity revenue
expect_table_fato_licitacao_to_have_guests_if_inviteBids in invitation mode must have invited bidders
expect_dates_to_match_across_tablesReported dates must be in valid chronological order
expect_only_one_year_of_activityBids must have only a single year of activity
expect_sum_of_item_values_to_match_fato_licitacaoSum of bidding item values must match bid amount
beimplemented. Thepersonconductingthisstagemusthave
technical and business knowledge to ensure that the chosen
indicators are adequate. In this step, it is a good practice to
useGE’sProfilercomponentbecauseitverifieswhichnative
indicators are best suited to the analyzed data.
Implementing the indicators.This step refers to the code
implementation of the chosen indicators using Great Expec-
tations.
Reading the data source.In this step, the selected table is
loaded. It is necessary to read the entire content of the table
for the indicators to be executed.
Executing the indicators.After reading the table, the im-
plemented indicators are executed and the results are pre-
sented in an interactive graphical interface generated by the
## Data Docscomponent.
Visualizing and analyzing.The last step of the method-
ology corresponds to the visualization and analysis of the
results of the indicators in the interactive graphic interface.
From this analysis, it is possible to verify cases that indicate
errors in the loading process and/or data format and take the
necessary actions for correction.
Reviewing the indicators (optional).If necessary, this
step can be performed after the new data loads in the evalu-
ated tables. It comprises the reassessment and implementa-
tion of new indicators according to needs and demands that
may arise.
The following sections present the application of the pro-
posedmethodologyfordataqualityanalysisusingGEinreal
data from public bids and expenditures.
5 Application in Real Data of Public
## Bids
This section presents the application of a data quality tool in
a big data environment with real data from public bids. As
discussed in Section
3.2, we choose the Great Expectations
(GE) tool because it is more appropriate to our context. Fur-
thermore, we use the data quality methodology proposed in
Section4to choose and generate the most suitable quality
indicators for the data. Thus, this section is organized as fol-
lows: first, we describe the public bidding data on which the
qualityindicatorsareapplied(Section
## 5.1). Then,wediscuss
the main results generated by such indicators (Section5.2).
5.1 DataDescriptionandChoiceofIndicators
We consider data from public biddings in the Brazilian state
of Minas Gerais (both at the state and city levels). The mu-
nicipal bids come from the portal of the Computerized Sys-
temofAccountsoftheMunicipalities(SICOM)oftheCourt
of Auditors of the State of Minas Gerais
## 12
, and the state bids
comefromtheMinasGeraisGovernmentTransparencyPor-
tal
## 13
## . Thus,thefinaldatasetcontainsinformationon378,137
bids comprising 12,522,661 bid items and 103,858 bidders
(individuals or legal entities) from 2014 to 2021. The data
are stored in a big data environment using the Apache Hive
data warehouse
## 14
version 2.0.0. This version of Hive does
not support checking data integrity constraints. However,
we use this version to show that GE manages to mitigate the
lack of such restrictions by detecting inconsistent records.
RegardingthequalityindicatorsofGreatExpectationsfor
this data source, we use native and custom expectations (ac-
cording to Section
3.3). The first group comprises standard
and generic rules implemented internally in the tool, such
as validating the data domain and checking whether the data
follows a regular expression or a range of values. Table
## 3
presents the list of native indicators used in the analysis of
public bids data performed in this section.
## 15
Custom indicators aim to validate a specific business rule
in the data domain. For example, when manually analyz-
ing the bid values, we observe very inconsistent numbers:
a single bid had a value almost 200 times greater than the
entire revenue of its city that year. Possible causes of this
anomaly are a typing error by whoever entered this data in
the source or a failure to extract these values from the bid-
ding process documents. Thus, we implemented a custom
indicator that compares the value of the bidding with the to-
tal revenue of the city or state in the bidding year. Overall,
we implemented five custom indicators, described in Table
- Such indicators were implemented following the naming
and organization standards of native indicators.
## 12
https://portalsicom1.tce.mg.gov.br/
## 13
https://www.transparencia.mg.gov.br/
compras-e-patrimonio/compras-e-contratos
## 14
https://hive.apache.org/
## 15
List of native expectations of GE:https://greatexpectations.
io/expectations

Assessing Data Quality Inconsistencies in Brazilian Governmental DataOliveira et al. 2023
Table 4.Overall statistics from GE indicators for bidding data.
TableSuccessesFailures  Total
## Bids88 (68.22%)  41 (31.78%)   129
Qualified bidders  26 (74.29%)   9 (25.71%)    35
Winner bidders   37 (50.00%)  37 (50.00%)    74
Bidding items    60 (73.17%)  22 (26.83%)    82
## Commissions47 (83.93%)   9 (16.07%)    56
Table 5.Number of failures captured by quality indicators for pub-
lic bidding data.
Error / TableB  QB  WB  BI  BC
Null values18   1   15   6   0
Out of range values   12   2    9   4   1
Inconsistent data type   8   2    3   8   7
Duplicated values0   1    3   1   0
## Other3   3    7   3   1
## Total41   9   37  22   9
B:BidsQB:QualifiedBiddersWB:WinnerBidders
BI:Bidding ItemsBC:Bidding Commission
## 5.2 Data Quality Analysis
In this section, we present the main results of the quality in-
dicators of Great Expectations (GE) on real public bidding
data. In this analysis, we consider the five main tables that
gatherbiddingdata: (i)generalbiddinginformation; (ii)bid-
dersqualifiedtoparticipateinbiddingprocesses;(iii)bidders
approved as winners in bids; (iv) bidding items; and (v) bid-
ding commissions (committees established to act in bids).
Foreachtable, wechoosespecificnativeindicatorswhich
make sense in the context of the table. In addition, we use
ourimplementedcustomindicatorsaccordingtopre-defined
businessrules. Table
## 4presentsthenumberofsuccessesand
failures in the indicators for each analyzed table, as well as
the total number of implemented indicators.
## Table
5presents the most common errors detected in the
analyzed tables. One of the most frequent errors is the pres-
ence of null values in columns where they are not allowed
according to business rules. For example, it is not expected
that fields containing the year of the bidding exercise have
null values. Other common errors include non-standard val-
ues and/or out-of-the-expected range and inconsistent data
type. In addition, some tables have duplicated records, an
error that can occur for two reasons: (i) data loading prob-
lems and (ii) the data warehouse used does not support in-
tegrity restrictions to avoid this duplicity. However, as GE
detects these duplicate records, it is possible to mitigate this
data warehouse limitation.
In addition, GE’s custom indicators allow checking
more complex business rules that native indicators cannot
check. Table
6presents a part of the result of theex-
pect_values_less_revenueindicator in the table with bidding
information. Using such an indicator, we can verify that
threebidshavediscrepantvaluescomparedtothecity’stotal
revenue in that year (also obtained from the database). For
example,bidAhasavaluemorethan4,000timeshigherthan
its city revenue. However, this is not the value in the price
survey in the bidding notice, indicating a probable error in
the data extraction and/or loading process.
## Anotherbusinessruleverifiedbyacustomindicatoristhe
chronological order of date fields in the bidding records, as
Table 6.Custom indicator that verifies bids whose value is greater
than the city revenue in that year.
Bid  Year  Entity nameBid valueCity revenue
A   2014  City XR$ 59,415,748,800.00   R$ 11,912,844.54
B   2015  City YR$ 16,880,000.00   R$ 13,124,280.52
C   2020  City ZR$ 262,029,682.50  R$ 240,799,958.79
Table 7.Custom indicator for records that disrespect the chrono-
logical order of bidding dates (Date 1≤Date 2).
Date 1Date 2Records   %
Public notice date   Publication date of notice7,672  2.03
Public notice date   Date of publication on the
vehicle
## 8,728  2.31
Publication date of
notice
Expected date of receipt of
documentation
## 2,186  0.58
the dates must respect the order of the bidding process. For
example, the date of the bidding notice must be before its
publication, as the preparation of the notice is the first stage
oftheprocess,andthereceiptofthedocumentationonlyhap-
pens once it is published. Table7presents the number of
cases that do not respect this order in the bidding table. An-
alyzing the number of records in this situation, it is possible
thattherewasaproblemwiththeimputationorloadingofthe
data. This result reinforces the need for a thorough analysis
of the data extraction, processing, and loading processes.
6 Application in Real Data of Public
## Expenditure
This section presents a second application of Great Expec-
tations (GE) as a quality tool in government data. He, we
apply GE to five tables referring to purchases and public ex-
penditurescarriedoutbycitiesintheBrazilianstateofMinas
Gerais. As in the previous section, we apply the data quality
methodology proposed in Section
- Thus, in this section,
we first present the description of the data and the choice of
indicators in Section6.1, and then we present and analyze
the results of the indicators in Section6.2.
6.1 DataDescriptionandChoiceofIndicators
For this application, we use public expenditure data from
cities and the state of Minas Gerais that are not necessar-
ily linked to public bids. According to Brazilian law No.
## 14,133of2021
## 16
## ,somepurchasescanbemadewithoutneed-
ing to start a bidding process for specific reasons. Thus, we
consider five new tables with information on revenues ob-
tained by federal entities, receipts issued (and their items),
and signed contracts (and their items). As in Section
## 5.1,
data also comes from the Computerized System of Accounts
of the Municipalities (SICOM) of the Court of Auditors of
the State of Minas Gerais and the Transparency Portal of the
GovernmentofMinasGeraisandisstoredinabigdataenvi-
ronment using Apache Hive. All tables contain information
from 2014 to 2021, except for the revenue table, which has
records from 2002.
## 16
## Law No. 14,133:https://www.planalto.gov.br/ccivil_03/
_Ato2019-2022/2021/Lei/L14133.htm

Assessing Data Quality Inconsistencies in Brazilian Governmental DataOliveira et al. 2023
Table 8.Great Expectations indicators used in analyzing public expenditure data.
Indicator (expectation)Description
## Native
expect_column_values_to_not_be_nullColumn values must not be null
expect_column_values_to_be_uniqueThere must be no duplicate values in the column
expect_column_min_to_be_betweenThe smallest column value must be within the range [min, max]
expect_column_values_to_be_in_type_listColumn values must be of the specified type
expect_column_values_to_be_in_setColumn values must belong to a value set
expect_column_values_to_be_betweenColumn values must be in the range [min, max]
expect_column_values_to_match_regexColumn values must follow a given regular expression
expect_column_pair_values_a_to_be_greater_than_bValues in columnamust be greater than columnb(pairwise)
## Cus.
expect_value_less_revenueBids must have a value less than or equal to the entity revenue
expect_dates_to_match_across_tablesReported dates must be in valid chronological order
Table 9.Overall statistics from GE indicators for public expendi-
ture data.
TableSuccessesFailures  Total
## Revenue69 (65.09%)  37 (34.91%)   106
## Receipt101 (78.29%)  28 (21.71%)   129
Receipt item   46 (20.20%)   5 (9.80%)    51
## Contract68 (83.95%)  13 (16.05%)    81
Contract item   12 (85.71%)   2 (14.29%)    14
Table 10.Number of failures captured by quality indicators for
public expenditure data.
Error / TableRV  RC  RCI  C  CI
Null values32   17    0   2   1
Out of range values4   3    2   7   0
Inconsistent data type   0   5    3   2   0
Duplicated values0   0    0   0   0
## Other1   3    0   2   1
## Total37   28    5  13   2
RV:RevenueRC:ReceiptRCI:Receipt Item
C:ContractCI:Contract Item
Table8presents the indicators used in the tables consid-
ered in this application. We use both native and custom in-
dicators that allow us to verify specific business rules in this
context. Ingeneral,thenativeindicatorsarethesameasused
in the first application (see Section5) since the source and
structure of the data are the same. What is new is the indica-
torexpect_column_pair_values_a_to_be_  greater_than_b,
whichweusetocomparewhetherthevaluesofacolumnare
greater than another. For example, in the receipt table, we
check if the gross amount is greater than or equal to the net
amount. In addition, we use two custom indicators to check
valuefields(expect_value_less_revenue)andthechronolog-
ical order of dates (expect_dates_to_match_across_tables).
## 6.2 Data Quality Analysis
Inthissection, wepresentanddiscusstheresultsofthequal-
ity indicators for the public expenditure tables considered in
thisapplication. Aswedescribedintheprevioussection,this
application considers five distinct tables: (i) revenue from
themunicipalitiesandtheStateofMinasGerais;(ii)invoices
used for public purchases; (iii) items present in the invoices;
(iv) contracts entered into by municipalities and the State;
and (v) items present in such contracts.
## Tables
9and10present the general statistics and most
common errors found in each table. Considering absolute
and proportional values, the table with the highest number
Table11.Customindicatorthatverifiescontractitemswhosevalue
is greater than the city revenue in that year.
Item  Year  Entity nameItem valueCity revenue
X    2017  City AR$ 65,000,000.00  R$ 33,921,834.39
Y    2020  City BR$ 954,750,000.00  R$ 30,853,996.41
Z2021  City CR$ 2,200.00R$ 632.78
Table 12.Custom indicator for records that disrespect the chrono-
logical order of contract dates (Date 1≤Date 2).
Date 1Date 2Records   %
Signature date    Validity end date   73,096  7.41
Validity start date  Validity end date   77,157  7.82
Publication date   Validity end date   43,856  4.45
of errors is the revenue one, in which 37 out of 106 expec-
tations (34.91%) failed. When examining these failures in
moredepth,wenotethatthevastmajorityofthemarerelated
to the presence of null values in columns where they should
not exist. Examples include fields that indicate the revenue
sourceanditstype. Inaddition,somerecordshaveanegative
collected amount, which is out of the accepted range accord-
ing to the pre-defined business rules. Both types of errors
may have occurred due to a failure in the data extraction or
loading process, which requires a detailed manual revision
of this process by analysts.
## Thecustomizedindicatorsalsoraisewarningsignalsabout
data quality in the analyzed tables. For example, Table
## 11
presents a part of the results of the indicator that verifies the
business rule in which the values of the contract items must
be lower than the entity’s revenue (city or state). We verify
that the value of item Y contracted by City B is more than
30 times greater than the city’s revenue. In this case, it is
possible that there was an error in extracting or imputing the
valueofthecontractediteminthedatabase,requiringfurther
analysis. On the other hand, item Z acquired by City C has
a feasible value, but the sum of the city’s revenues in that
year registered in the database results in a very low value.
Suchavalueisimpossibleanddoesnotmatchthecity’sGDP,
indicating a possible lack of revenue records in the database.
It is important to note that such errors would not be noticed
inaquickanalysiswithouttheGreatExpectationsindicators,
reinforcing this tool’s importance.
Finally, the indicator that verifies the chronological order
ofdatesalsobringsrelevantresultsforthisapplication. Table
12shows the results of this indicator for the contracts table.
## Weobservethatasmallpartoftherecordspresentsinconsis-
tencies between the dates in the table. For example, 7.82%

Assessing Data Quality Inconsistencies in Brazilian Governmental DataOliveira et al. 2023
Table 13.Overall statistics from GE indicators for public bidding and expenditure data. Tables are sorted by Table Error Score (TES).
ApplicationTableRecords  IndicatorsFailures  PF(t)  TES(t)
Public bidsWinner bidders   12,298,68374  37 (50.00%)  0.666   4.724
Public expenditure  Revenue1,155,372106  37 (34.91%)  0.510   3.092
Public bidsBidding items    12,522,66182  22 (26.83%)  0.404   2.866
Public expenditure  Receipt21,239,828129  28 (21.71%)  0.300   2.199
Public bidsQualified bidders    833,77735   9 (25.71%)  0.354   2.093
Public bidsCommissions1,505,35856   9 (16.07%)  0.332   2.052
Public expenditure  Contract item6,218,47014   2 (14.29%)  0.264   1.793
Public bidsBids378,137129  41 (31.78%)  0.318   1.773
Public expenditure  Contract986,52481  13 (16.05%)  0.229   1.373
Public expenditure  Receipt item4,098,96751   5 (9.80%)  0.163   1.076
of the records have a validity start date later than a validity
end date, which is impossible according to business rules.
Likewise, some records have a signature date and publica-
tion date after the end of the contract validity. Again, a de-
tailed analysis of the records is essential to detect the source
ofinconsistenciesandcorrectthisqualityproblemsincesuch
inconsistenciescanimpactotherfinalapplications,including
trails for detecting fraud in public expenditure.
7 DataQualityScoreBasedonExpec-
tations
In this section, we further analyze the data quality by pre-
senting an error metric for each table using the Great Ex-
pectations (GE) results. Such a deeper analysis is necessary
because simply aggregating the success rates of indicators
by a simple average may not fully represent reality since the
table size also influence its quality. In this work, validation
failures mean GE indicators that returned an error, regard-
less of the number of records impacted. That is,nvalidation
failures do not meannrecords with a problem butnindica-
tors that failed. In addition, the greater the number of val-
idation failures, the greater the error score for the table in
question should be since each failure requires a specific ac-
tion by the analysts to correct it. For example, a table with
1,000,000 records and two validation failures of the GE in-
dicators should have a higher error score than a table with
1,000 records and the same two failures.
To further analyze the data quality, we first calculate a
penalty factorP F(t)for each tabletin our dataset (Equa-
tion1). Each table has a set ofNindicators implemented,
of whichnindicators fail. Furthermore, each indicatori
presents a percentage of unexpected values founde
i
## ∈[0,1]
(for successful indicators,e
i
= 0). Thus,P Fis the product
of each indicator’s average percentage of validation failure
by the proportion of failed indicators. Both factors are in-
creased by one so that the penalty increases according to the
number of errors. After the multiplication, the value is sub-
tracted from one so thatP F(t)is zero when no indicator
fails. The values ofP F(t)start from zero (when no indica-
tors fail) and go up to3(when all of them fail with 100% of
unexpected values). Thus, the greater the number of errors,
the greater the score for a given table.
## P F(t) =
## 
## 
## 
## 
## 
## 1 +
## N
t
## ∑
i=0
e
i
## N
t
## 
## 
## 
## 
## 
## (
## 1 +
n
t
## N
t
## )
## −1(1)
Therefore, we propose the Table Error Score (T ES) to
quantify the quality of each table in our application and to
compare the tables more fairly. For each tablet, it is calcu-
latedastheproductofthepenaltyfactorP F(t)andtheorder
ofmagnitudeofthegiventable,representedbythelogarithm
of its number of records (Equation
2). Hence, the quality
scoreofthetablealsoconsidersitssizesincetableswithmil-
lionsofrecordsmustpresentahigheralertlevelthansmaller
tables with the same level of indicator failures.
T ES(t) =log
## 10
## (r
t
)·P F(t)(2)
AsanexampleoftheapplicationofTES,considertableA
with100recordsandthreeimplementedindicators,ofwhich
two fail with percentages of unexpected values 90% and
1%, respectively. The PF value for this table isP F(A) =
## (
## 1 +
## 0+0.9+0+01
## 3
## )(
## 1 +
## 2
## 3
## )
−1 = 1.172. Then, the TES
value for such a table isT ES(A) =log
## 10
## (100)·1.172 =
2.344. Moreover, table B with 1000 records and the same
indicators and faults, has the sameP Fvalue (1.172), but its
TESvalueisT ES(B) =log
## 10
## (1000)·1.172 = 3.516. Such
valuesfollowthepremisementionedabovesincetableswith
more records represent a higher alert for quality analysts.
## Table
13presents general statistics for each table of both
applications, including the number of failures in the indica-
tors, as well as their Table Error Score (TES). The impor-
tanceofcalculatingtheTESisevidentbasedonsuchresults.
For example, the winner bidders table has the highest TES
value, butitisnotthetablewiththehighestabsolutenumber
of indicator failures. When considering such a metric, the
first table in the ranking would be the bid table (41 failures).
However, in our analysis, it makes more sense for the win-
ner bidders table to have the highest error score since it is
among the tables with the highest order of magnitude of size
## (log
## 10
## (r
i
)≈7). Thus, such a table would be a great candi-
date to start a manual analysis to correct quality problems.
Overall, the TES metric offers a great benefit for quality
analysis as it is a metric that allows comparing the data qual-
ity of tables from different applications. This metric goes
beyond the simple percentage of failures offered by Great
Expectations because it also considers the number of un-
expected values for each indicator and the total number of

Assessing Data Quality Inconsistencies in Brazilian Governmental DataOliveira et al. 2023
records in the table. Thus, the metric is in accordance with
thepremisethattableswithmorerecordsandindicatorswith
ahigherpercentageoffailurerepresentahigherlevelofalert,
allowing people responsible for quality control of the data to
determine the order of the tables to be examined.
## 8 Conclusion
This article presents a comparative analysis of eight open-
source data quality assessment tools and the results of two
applications in a big data environment with real data from
governmental data using the Great Expectations (GE) tool.
This tool was chosen because it has graphical interface com-
ponentsthathelpinthevisualizationofresultsandbecauseit
allows the creation of customized indicators that allow ver-
ifying complex business rules not verified by native indica-
tors. In other words, such indicators allow the implementa-
tion of specific validations for the data analysis. It is worth
noting that GE assists in identifying records that have prob-
lems caused by the impossibility of implementing data in-
tegrity restrictions by the data warehouse in question.
The results of GE’s indicators in applications to real data
frompublicbidsandexpendituresbringupqualityproblems
thatwouldnotbeeasilyidentified,includinginconsistencyin
the values in the tables and the chronological order of dates.
Furthermore, we propose a new quality metric to allow the
comparison of the GE results in tables from different appli-
cations. This metric goes beyond the percentage of failed
indicators and considers the number of records in the tables
and the percentage of unexpected values for each indicator.
Its use can help quality analysts determine the priority of the
tables for manual inspection. Thus, analyzing the quality of
governmentaldataisanecessarysteptoensurethereliability
of records, which directly impacts the construction of future
applications that use this data (e.g., fraud detection and anal-
ysis of overpricing).
As future work, we plan to expand the usage of Great Ex-
pectations (GE) for other tables with governmental data in
both public bids and expenditure applications. We also in-
tend to analyze the quality of other data domains, including
expenditure data on electoral processes. Since the best qual-
ity tool depends on usage dynamics and data context, such
analyses may require applying other data quality tools.
## Acknowledgements
The authors thank this work’s collaborators, Arthur P. G. Reis,
Gabriel L. Canguçu, and Victor Caetano.
## Funding
This work was funded by the Prosecution Service of State of Mi-
nas Gerais (in Portuguese,Ministério Público do Estado de Mi-
nas Gerais, or simply MPMG) through the Analytical Capabilities
Project (in Portuguese,Programa de Capacidades Analíticas) and
by CNPq, CAPES, and FAPEMIG.
Competing interests
The authors declare that they have no competing interests.
## References
Altendeitering, M. and Tomczyk, M. (2022). A functional
taxonomy of data quality tools: Insights from science and
practice. InWirtschaftsinformatik.
Ballou,D.P.andPazer,H.L.(1985). Modelingdataandpro-
cess quality in multi-input, multi-output information sys-
tems.Management Science, 31(2):150–162.
Chrisman, N. R. (1983). The role of quality information in
thelong-termfunctioningofageographicinformationsys-
tem. InAuto-Carto, pages 303–312.
Cichy, C. and Rass, S. (2019). An overview of data quality
frameworks.IEEE Access, 7:24634–24648.
Ehrlinger, L. and Wöß, W. (2018). A novel data quality met-
ric for minimality.QUAT, 1:1 – 15. DOI: 10.1007/978-3-
## 030-19143-6_1.
Ehrlinger, L. and Wöß, W. (2022). A survey of data quality
measurement and monitoring tools.Front. Big Data, 5.
DOI: 10.3389/fdata.2022.850611.
Elmagarmid, A. K., Ipeirotis, P. G., and Verykios,
V. S. (2007).  Duplicate record detection: A sur-
vey.IEEE Trans. Knowl. Data Eng., 19(1):1–16. DOI:
## 10.1109/TKDE.2007.250581.
Etcheverry, L. and Consens, M. P. (2011). Summary-based
comparison of data quality across public MAGE-ML ge-
nomic datasets.J. Inf. Data Manag., 2(1):3–10.
Foidl, H., Felderer, M., and Ramler, R. (2022).  Data
smells: Categories, causes and consequences, and detec-
tionofsuspiciousdatainai-basedsystems. InarXiv.DOI:
## 10.48550/ARXIV.2203.10384.
Gao, J. Z., Xie, C., and Tao, C. (2016). Big data valida-
tionandqualityassurance-issuses,challenges,andneeds.
InSOSE, pages 433–441. IEEE Computer Society. DOI:
## 10.1109/SOSE.2016.63.
Goudar, S. S., Stolka, K. B., Koso-Thomas, M., Honnun-
gar, N. V., Mastiholi, S. C., Ramadurg, U. Y., Dhaded,
S. M., Pasha, O., Patel, A., Esamai, F.,et al. (2015). Data
quality monitoring and performance metrics of a prospec-
tive,population-basedobservationalstudyofmaternaland
newborn health in low resource settings.Reproductive
Health, 12(2):1–10. DOI: 10.1186/1742-4755-12-S2-S2.
Josko, J. M. B. and Ferreira, J. E. (2021). Using visual-
interactivepropertiestosupportdataqualityvisualassess-
ment on abstract and timeless data.J. Inf. Data Manag.,
## 12(2).
Junior, C. S. and Dorneles, C. F. (2021). Avaliação de di-
mensões de qualidade de dados para o agronegócio. In
SBBD, pages 283–288. SBC.
Laranjeiro, N., Soydemir, S. N., and Bernardino, J. (2015).
A survey on data quality: Classifying poor data.PRDC,
pages 179 – 188. DOI: 10.1109/PRDC.2015.41.
Lee, Y. W., Strong, D. M., Kahn, B. K., and Wang, R. Y.
(2002). Aimq: a methodology for information quality as-
sessment.Information & Management, 40(2):133 – 146.

Assessing Data Quality Inconsistencies in Brazilian Governmental DataOliveira et al. 2023
Maia, P., Meira Jr., W., Cerqueira, B., and Cruz, G.
## (2020). Auditinggovernmentpurchaseswithamulticrite-
riaanomalydetectionstrategy.J. Inf. Data Manag.,11(1).
Medeiros, G. F. d., Degrossi, L. C., and Holanda, M. (2020).
Qualiosm: Melhorando a qualidade dos dados na ferra-
menta de mapeamento colaborativo openstreetmap. In
SBBD, pages 77–82. SBC.
## Oliveira, G. P., Reis, A. P. G., Freitas, F. A. N., Costa, L. L.,
## Silva, M. O., Brum, P. P. V., Oliveira, S. E. L., Brandão,
M. A., Lacerda, A., and Pappa, G. L. (2022a). Detecting
inconsistencies in public bids: An automated and data-
based approach. InProceedings  of  the  28th  Brazilian
Symposium on Multimedia and Web, pages182–190, New
York, NY, USA. ACM. DOI: 10.1145/3539637.3558230.
## Oliveira, G. P., Reis, A. P. G., Mendes, B. M. A., Bacha,
## C. A., Costa, L. L., Canguçu, G. L., Silva, M. O., Cae-
tano, V., Brandão, M. A., Lacerda, A., and Pappa, G. L.
(2022b). Ferramentas open-source de qualidade de dados
paralicitaçõespúblicas: Umaanálisecomparativa.InPro-
ceedings of the 37th Brazilian Symposium on Databases,
pages 116–127, Porto Alegre, RS, Brasil. SBC. DOI:
## 10.5753/sbbd.2022.224351.
Pipino,L.L.,Lee,Y.W.,andWang,R.Y.(2002). Dataqual-
ity assessment.Commun. ACM, 45(4):211 – 218. DOI:
## 10.1145/505248.506010.
Pushkarev, V., Neumann, H., Varol, C., and Talburt, J. R.
(2010). An overview of open source data quality tools. In
IKE, pages 370–376. CSREA Press.
Scannapieco, M. and Catarci, T. (2002). Data quality under
a computer science perspective.Journal of The ACM -
## JACM, 2:1–12.
Sessions, V. and Valtorta, M. (2006). The effects of data
quality on machine learning algorithms. InICIQ, pages
## 485–498. MIT.
Wang, R. Y., Strong, D. M., and Guarascio, L. M. (2018).
Beyond accuracy: What data quality means to data con-
sumers. 1996.Total  Data  Quality  Management  Pro-
gramme.
Wu, D., Xu, H., Wang, Y., and Zhu, H. (2022). Quality
of government health data in COVID-19: definition and
testing of an open government health data quality eval-
uation framework.Libr. Hi Tech, 40(2):516–534. DOI:
## 10.1108/LHT-04-2021-0126.
## Zöllner, F. G., Daab, M., Sourbron, S. P., Schad, L. R.,
Schoenberg, S. O., and Weisser, G. (2016). An open
sourcesoftwareforanalysisofdynamiccontrastenhanced
magnetic resonance images: Ummperfusion revisited.
BMC Med Imaging, 16(7):1–13. DOI: 10.1186/s12880-
## 016-0109-0.

