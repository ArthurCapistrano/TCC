

Data Pipeline Quality:  Influencing Factors, Root Causes of
Data-related Issues, and Processing Problem Areas for Developers
## Harald Foidl
a,∗
## , Valentina Golendukhina
a
## , Rudolf Ramler
b
## , Michael Felderer
c,a,d
a
University of Innsbruck, Austria
b
Software Competence Center Hagenberg GmbH, Austria
c
Institute for Software Technology, German Aerospace Center (DLR), Germany
d
University of Cologne, Germany
## Abstract
Data pipelines are an integral part of various modern data-driven systems.  However, despite
their importance,  they are often unreliable and deliver poor-quality data.  A critical step
toward  improving  this  situation  is  a  solid  understanding  of  the  aspects  contributing  to
the  quality  of  data  pipelines.   Therefore,  this  article  first  introduces  a  taxonomy  of  41
factors that influence the ability of data pipelines to provide quality data.  The taxonomy is
based on a multivocal literature review and validated by eight interviews with experts from
the data engineering domain.  Data, infrastructure, life cycle management, development &
deployment,  and  processing  were  found  to  be  the  main  influencing  themes.   Second,  we
investigate the root causes of data-related issues, their location in data pipelines, and the
main topics of data pipeline processing issues for developers by mining GitHub projects and
Stack Overflow posts.  We found data-related issues to be primarily caused by incorrect data
types (33%), mainly occurring in the data cleaning stage of pipelines (35%). Data integration
and ingestion tasks were found to be the most asked topics of developers,  accounting for
nearly half (47%) of all questions.  Compatibility issues were found to be a separate problem
area  in  addition  to  issues  corresponding  to  the  usual  data  pipeline  processing  areas  (i.e.,
data loading, ingestion, integration, cleaning, and transformation).  These findings suggest
that future research efforts should focus on analyzing compatibility and data type issues in
more depth and assisting developers in data integration and ingestion tasks.  The proposed
taxonomy is valuable to practitioners in the context of quality assurance activities and fosters
future research into data pipeline quality.
Keywords:Data pipeline, Data quality, Influencing factors, GitHub, Stack Overflow,
## Taxonomy
## ∗
Corresponding author
Email address:harald.foidl@uibk.ac.at(Harald Foidl)
Preprint submitted to Journal of Systems and SoftwareSeptember 14, 2023
arXiv:2309.07067v1  [cs.SE]  13 Sep 2023

## 1.  Introduction
Data pipelines play a crucial role in today’s data-centric age and have become fundamen-
tal components in enterprise IT infrastructures.  By collecting, processing, and transferring
data, they make it possible to use the ever-growing amounts of information to gain valuable
insights  and  make  improved  decisions.   In  addition,  they  have  also  become  integral  parts
of data-driven systems, e.g., recommender systems, speech, and image recognition systems.
Within these systems, they are primarily responsible for putting the data into a suitable form
so that the built-in machine learning (ML) algorithms can automatically make intelligent
decisions.
Since the quality of the data plays an important role in making reliable and accurate
decisions, research on data cleaning and validation has gained significant interest in the last
decade [1, 2].  Most of the work dealt with cleaning and validating data at the early stages of
a pipeline, assuming that low data quality was already caused before the pipeline [3].  The
quality of data pipelines themselves, that is, processing data correctly and without errors,
has  not  been  treated  in  much  detail.   However,  the  importance  of  reliable  data  pipelines
was recently underpinned by a global survey of 1,200 organizations.  This survey found that
74% of companies that invest in high-quality and reliable data pipelines have increased their
profits by an average of 17% [4].
Nevertheless, evidence suggests that data pipelines tend to be error-prone, hard to debug,
and require a lot of maintenance and management [5, 6, 7].  A recent survey even identified
debugging and maintaining data pipelines as the most pressing issues for data engineers [8].
Moreover,  recent  studies  [9,  10]  show  that  developers  face  huge  difficulties  implementing
data  processing  logic.   These  difficulties  were  also  observed  by  Yang  et  al.   [11].   In  their
study, they found data handling code to be often repetitive, dense, and error-prone.  This
bad state of data pipelines contributes to the fact that today’s data-driven systems suffer
heavily from data-induced bugs and data-related technical debt [12, 13].
Research has recently started to address these issues in a variety of ways.  First, there are
research efforts aiming to improve the debugging of data pipelines [14, 15, 16].  Second, there
are  several  attempts  to  automate  and  guide  the  creation  of  data  processing  components
[17,  18,  19].   Third,  research  appears  to  be  actively  shifting  its  focus  toward  an  end-to-
end analysis of data pipelines especially considering the entire inner data handling process
## [20, 21].
However, this recent research stream is still in its early stages.  A deeper understanding
of  the  underlying  aspects  contributing  to  successful  data  pipelines  is  required  to  ensure
dependable  pipelines  consistently  deliver  high-quality  data.   Such  an  enhanced  insight  is
instrumental in enabling further research endeavors advancing the quality of data pipelines.
This paper aims to address this need as follows.First,  we aim to identify influencing
factors  (IFs)  that  may  affect  a  data  pipeline’s  ability  to  provide  high-quality  data.   We
define an IF or factor of influence as any human,  technical,  or organizational aspect that
may  affect  the  ability  of  a  data  pipeline  to  deliver  quality  data.   Those  aspects  uncover
the  core  drivers  of  data  pipeline  quality  and  serve  as  fundamental  building  blocks  in  the
improvement of data pipeline success.Second, we adopt a more technological perspective
## 2

and seek to understand the nature of data pipeline quality better.  In particular, we first look
at the root causes and stages of data-related issues in data pipelines by studying GitHub
projects.   Moreover,  we  further  examine  whether  there  are  problem  areas  for  developers
that  do  not  correspond  to  the  typical  processing  stages  of  pipelines  by  analyzing  Stack
Overflow  questions.   These  insights  are  essential  to  support  debugging  activities  and  to
define possible strategies to mitigate data-related issues and can further help uncover specific
training needs, focus quality assurance efforts, or discover future research opportunities.  The
major contributions of the paper are:
•Ataxonomyof 41 data pipeline IFs grouped into 14 IF categories covering five main
themes:  data, development & deployment, infrastructure, life cycle management, and
processing.  The taxonomy was validated by eight structured expert interviews.
•Anempirical studyabout (1) the root causes of data-related issues and their location
in data pipelines by examining a sample of 600 issues from 11 GitHub projects, and (2)
the main topics developers ask about data pipeline processing by analyzing a sample
of 400 Stack Overflow posts.
The remaining paper is structured as follows.  First,  Section 2 provides relevant back-
ground information on data pipelines and discusses related work.  Section 3 describes the
applied  research  procedure  in  this  paper.   Section  4  presents  the  developed  taxonomy  of
IFs and its evaluation.  Section 5 elaborates on the root causes of data-related issues and
the topics developers face in processing data in the context of data pipelines.  Afterward,
Section 6 discusses the findings and limitations of the study.  Finally, the paper is concluded
in Section 7.
-  Background and related work
In this section, we first cover background information on data pipelines (Section 2.1) and
subsequently provide an overview of earlier work related to this paper in Section 2.2.
2.1.  Data pipeline
This section first presents the concept and architecture of a data pipeline.  Afterward,
common pipeline types and the underlying software stack of data pipelines are outlined.
2.1.1.  Data pipeline concept
The concept of a ’data pipeline’ is described differently in the literature, depending on
the perspective taken [22].  Following,  we describe a data pipeline first from a theoretical
and then from a practical perspective.
Theoretically,  a  data  pipeline  refers  to  adirected  acyclic  graph(DAG)  composed  of  a
sequence of nodes [23].  These nodes process (e.g., merge, filter) data while the output of
one node will be the input of the next node.  At least one source node produces the data
at  the  beginning  of  the  DAG,  and  at  least  one  sink  node  finally  receives  the  processed
## 3

data.  Considering pipelines from this perspective is often done in mathematical settings to
formally describe and analyze data flows (e.g., node dependencies).
From a practical point of view, data pipelines typically constitute a piece of software that
automates the manipulation of data and moves them from diverse source systems to defined
destinations [7].  Thus, data pipelines represent digitized data processing workflows based on
a set of programmed scripts or simple software tools.  Given the increasing importance and
complexity of data processing, data pipelines are nowadays even treated ascomplete software
systems  with  their  own  ecosystemcomprising several technologies and software tools [24].
The primary purpose of this set of complex and interrelated software bundles is to enable
efficient data processing, transfer, and storage, control all data operations, and orchestrate
the entire data flow from source to destination.  We will adopt this practical point of view
in the remaining paper.
2.1.2.  Data pipeline architecture
We present a generic architecture of a data pipeline shown in Figure 1.  As not otherwise
stated, the remaining description in this section is based on [7, 25, 26, 27, 28, 29, 30].
## Components
Core tasks
Supporting tasks
## Legend
Data sourcesData processing
## Data
integration
## Data
cleaning
## Data
transformation
## Management
Data sinks
## Structured
data
## Semi-structured
data
## Unstructured
data
## Applications
Data preprocessing
## Monitoring
Data storage
WorkflowDataApplication
Data loading
Data ingestion
Data stores
Figure 1:  High-level data pipeline architecture
Data  pipeline  components.While  the  internal  structure  of  a  data  pipeline  can  vary
significantly,  its  main  components  are  typically  the  same:data  sources,data  processing,
data storage, anddata sinks.  Following, we describe these components while focusing on the
processing component, as it contains the core tasks of a data pipeline.
Data sources.The starting point of every data pipeline is its data sources.  They can be of
different types,  e.g.,  databases,  sensors,  or text files.  The data produced by data sources
## 4

are typically either in astructured(e.g., relational database),semi-structured(e.g., e-mails,
web pages), orunstructured(e.g., videos, images) form.
Data  processing.The  second  and  central  component  of  a  data  pipeline  is  its  processing
component.   Within  this  component,  the  core  tasks  for  manipulating  and  handling  data
(i.e., data ingestion, data preprocessing, and data loading) are provided.  We will refer to
these core tasks as stages in the remaining paper.
Data ingestion.Typically, the extraction of the data from the data sources and their
import in the pipeline starts the data flow.  Depending on the size and format of the
raw data, different ingestion methods are applied.  The data can be ingested into the
pipeline  with  different  load  frequencies,  i.e.,  the  data  can  be  ingested  continuously,
intermittently, or in batches.
Data preprocessing.After the raw data are available in the pipeline, data preprocessing
aims to bring the data into an appropriate form for further usage.  Typical preprocess-
ing techniques include data integration, cleaning, and transformation.  Note that not
all preprocessing techniques are applicable in every use case and can be orchestrated
differently.Data  integrationaims to merge and integrate the ingested data through,
for example, schema mapping or redundancy removal.Data cleaningremoves data er-
rors and inconsistencies by applying data preparation techniques grouped into missing
value treatment (e.g., imputing or discarding) and noise treatment (e.g., smoothing or
polishing).Data transformationseeks to bring the data in a form suitable for further
processing or usage (e.g.,  statistical analysis or ML models).  Typical data prepara-
tion techniques for this are binarization, normalization, discretization, dimensionality
reduction, numerosity reduction, oversampling, or instance generation.
Data loading.This task loads the ingested or preprocessed data into internal storage
systems or external destinations.
Data  storage.The data storage component represents the internal storage of the pipeline.
It stores raw, ingested, and processed data, depending on the configuration of the pipeline.
A common distinction is made between temporary or long-term storage of the data.
Data  sinks.The fourth component of a data pipeline describes the destinations where the
data are finally provided.  These can be other pipelines, applications of any type, or external
data storage systems (e.g., data warehouses, databases).
Data  pipeline  supporting  tasks.The  data  processing  tasks  of  a  pipeline  are  usually
supported by several monitoring and management tasks.
Monitoring.This set of tasks refers to overseeing the data quality, all data operations, and
controlling  the  performance  of  the  pipeline.   By  using  logging  mechanisms  and  creating
alerts,  monitoring  prevents  data  quality  issues  and  eases  debugging  and  recovering  from
failures.
## 5

Management.The main management tasks in the context of data pipelines are related to the
data, the workflow, and the overall application.  Workflow management describes all activi-
ties regarding the orchestration and dependencies between the different data processing tasks
(i.e., the entire data flow).  Data management includes tasks such as creating and maintain-
ing  metadata,  data  catalogs,  and  data  versioning.   Application  management  encompasses
the configuration and maintenance (e.g., upgrades, version control) of all software tools a
pipeline is built upon.
2.1.3.  Data pipeline types
Pipelines  can  be  classified  based  on  several  characteristics.   The  three  most  common
types of classification are described in the following.
Data  ingestion  strategy.Data pipelines can be classified based on their data ingestion fre-
quency.  Data can be ingested either in batches or continuously.  A data pipeline operating
inbatch  modeingests  data  only  in  fixed  intervals  (e.g.,  daily,  weekly)  or  when  a  trigger
(e.g., manual execution, size of available data) occurs.  In contrast, a pipeline continuously
ingesting data is operating instreaming mode.  In this mode, data are consumed in real-time
as they become available.  There are also scenarios where both ingestion modes are used in
parallel (e.g., lambda architecture).
Data processing method.Another way to classify pipelines is based on the application and
order of data processing tasks. Commonly used concepts in this regard areExtract Transform
Load(ETL) andExtract Load Transform(ELT). Originally, ETL was used to describe the
data transfer from diverse data sources into data warehouses.  Data pipelines applying the
ETL  concept  (i.e.,ETL  pipelines)  ingest  the  data  (i.e.,  Extract),  preprocess  them  (i.e.,
Transform), and then load (i.e., Load) them to the data sinks.  During this usually batch-
oriented process, the data are typically stored temporarily in the data storage component
of the pipeline.  On the other hand,ELT  pipelinesingest (i.e., Extract) the data and then
directly load (i.e., Load) them to the data sinks (e.g., data lakes) without preprocessing them.
The preprocessing of the data (i.e., Transform) occurs in the data sinks or by applications
consuming these data.  As a newer concept compared to ETL, ELT is often applied in cloud-
based settings,  providing fast data without the need for intermediate storage in the data
pipeline.
Use case.Data pipelines can be used for a variety of different purposes.  They are typically
used for data movement and preparation for,  or as part of,  other applications (e.g.,  visu-
alization, analysis tools, ML and deep learning applications, or data mining).  A common
scenario is the usage of data pipelines to gather data from a variety of sources and to move
them to a central place for further usage.  In this realm, data pipelines are often referred to
asdata collection pipelinesand are applied in nearly every business domain (e.g., manufac-
turing, medicine, finance).  In the context of data science [31], AI or ML applications, data
pipelines are usually used for preparing the data so that they are in a suitable form when
fed to algorithmic models.  Data pipelines used as part of AI-based systems, ML pipelines,
or in data science projects are thus usually referred to asdata preprocessing pipelines.
## 6

2.1.4.  Data pipeline software stack
Various  technologies  and  software  applications  are  used  for  running  data  pipelines  in
production.  Data processing components can be implemented with different programming
languages (e.g., Python, Java), tools or frameworks (e.g., ETL tools such as Apache Mahout
or Pig, message brokers such as RabbitMQ or Apache Kafka, or stream processors such as
Apache Spark or Flink).  Distributed filesystems (e.g., Hadoop Distributed File System) or
databases (relational database management systems such as PostgreSQL, or NoSQL such
as Apache Cassandra) are usually used to store the data.  To coordinate all data processing
tasks  in  a  pipeline,  workflow  orchestration  tools  are  typically  used  (e.g.,  Apache  Airflow,
Apache Luigi).  A further group of several tools is used for monitoring the infrastructure,
the  data  lineage,  and  data  quality  (e.g.,  OpenLineage,  MobyDQ).  From  the  plethora  of
tools, one can choose between open-source or proprietary solutions.  Moreover, running the
pipeline in the cloud is common to address use cases with high demands on scalability.
2.2.  Related work
To the best of our knowledge, no previous study has specifically examined factors that
may affect the quality of data in the realm of data pipelines.  We thus classify related work
into three categories:  (1) publications on factors and causes influencing data quality in the
field  of  information  and  communication  technology,  (2)  contributions  on  data  processing
topic issues in related areas, and (3) literature in the context of data pipelines that examine
aspects intimately related to the quality of data provided by pipelines.
2.2.1.  Related work on factors and causes that influence data quality
There is a considerable amount of literature that studies factors influencing data quality.
These studies can roughly be classified by the perspective taken and the domain of data being
examined.  The perspective describes the type of factors (e.g., managerial, technical factors)
and the level of abstraction (e.g., very detailed or general factors) considered.  The domain of
the data describes whether the data represent a specific area (e.g., health, accounting data)
or application (e.g., Internet of Things, data warehouse).  While many publications treat IFs
from a neutral point of view, some treat them from either a positive (e.g., facilitators, drivers
of data quality) or a negative (e.g., barriers, impediments of data quality) perspective.
Several  studies  [32,  33,  34,  35]  investigated  factors  that  influence  the  quality  of  data
in organizations’ information systems.  Collectively, these studies highlight the importance
of management support and communication as crucial factors that influence organizations’
general data quality.  Other studies took a more narrow approach by focusing, for example,
on IFs on master data [36, 37] or accounting data [38, 39, 40, 41].  For accounting and master
data, literature agrees [37, 40] that the characteristics of information systems (e.g., ease of
use, system stability, and quality) are among the three most influential factors.
In addition to business-related data, there are studies on factors influencing health data
quality.  Recently, Carvalho et al.  [42] identified 105 potential root causes of data quality
problems in hospital administrative databases.  The authors associated more than a quarter
of  these  causes  with  underlying  personnel  factors  (e.g.,  people’s  knowledge,  preferences,
education, and culture), thus being the most critical factor for the quality of health data.
## 7

A  different  perspective  was  taken  by  Cheburet  &  Odhiambo-Otieno  [43].   In  their  study,
the authors tried to identify process-related factors influencing the data quality of a health
management information system in Kenya.  Further, Ancker et al.  [44] investigated issues of
project management data in the context of electronic health records to uncover where those
issues arose from (e.g., software flexibility that allowed a single task to be documented in
multiple ways).
With  the  widespread  adoption  of  the  Internet  of  Things  (IoT),  there  also  has  been
emerging interest in investigating factors that affect IoT data.  In 2016, Karkouch et al.  [45]
proposed several factors that may affect the data quality within the IoT (e.g., environment,
resource constraints).  A recent literature review of Cho et al.  [46] identified device- and
technical-related  factors,  user-related,  and  data  governance-related  factors  that  affect  the
data quality of person-generated wearable device data.
The  most  relevant  research  regarding  our  work  has  investigated  factors  that  influence
the quality of data in data warehouses.  In 2010, Singh & Singh [47] presented a list of 117
possible causes of data quality issues for each stage of data warehouses (i.e., data sources,
data integration & profiling, ETL, schema modeling).  In contrast to Singh & Singh, a more
high-level perspective was taken by Zellal and Zaouia [48].  In their work,  they examined
general factors that influence the quality of data in data warehouses.  Therefore, the authors
proposed several factors that may affect the data quality loosely based on literature [49].
They  further  developed  a  measurement  model  [50]  to  enable  the  measurement  of  these
factors.  Based on this preliminary work, they conducted an empirical study and found that
technology factors (i.e., features of ETL and data quality tools, infrastructure performance,
and type of load strategy) are the most critical factors that influence data quality in data
warehouses.  We will compare these contributions with our work in Section 6.1.
2.2.2.  Related work on data processing topic issues
Bagherzadeh & Khatchadourian [51] investigated difficulties for big data developers by
mining  Stack  Overflow  questions.   They  found  connection  management  to  be  the  most
difficult topic.  In contrast to our work, where we zoom into data processing, they focused
on  the  rather  broad  and  more  abstract  area  of  big  data.   Islam  et  al.   [9]  and  Alshangiti
et al.  [52] analyzed the most difficult stages in ML pipelines for developers.  Both studies
identified  data  preparation  as  the  second  most  difficult  stage  in  ML  pipelines.   Wang  et
al.  [10] analyzed 1,000 Stack Overflow questions related to the data processing framework
Apache  Spark.   They  reported  that  questions  regarding  data  processing  were  among  the
most prevalent issues developers have, with 43% of all analyzed questions asked.  We will
compare these contributions with our work in Section 6.2.
2.2.3.  Related work on data pipelines
The quality of the data delivered by data pipelines is closely coupled with the quality of
the pipelines themselves.  Well-engineered pipelines are likely to provide data of high quality.
Following,  we give a brief overview of research directions in the context of pipelines that
contribute to increasing their quality.
## 8

Experiences  &  Guidelines.There is a large volume of literature providing frameworks [53,
54], guidelines [55, 56], or architectures [57, 58] to foster the development and use of data
pipelines.  While many contributions focused on specific application domains, e.g., manufac-
turing [59, 60], others took a more generic approach [61, 21].  Further, there are a number
of studies that share experiences (e.g., lessons learned, challenges) about engineering data
pipelines [62, 63, 7].
Quality aspects.Research providing a comprehensive overview of the quality aspects of data
pipelines  is  rare.   The  studies  available  mostly  focus  on  specific  quality  characteristics  of
pipelines,  for  example,  performance  and  scalability  [64,  65]  or  robustness  [66].   However,
extensive investigations of quality characteristics were conducted on ETL processes [67, 68,
69]. As a sub-concept of data pipelines, ETL processes, and thus their quality characteristics,
are highly relevant to data pipelines.
Development  and  maintenance  support.Recently,  several  research  works  have  focused  on
supporting data and software engineers in developing and maintaining data pipelines.  There
are plenty of works that presented tools for debugging pipelines [14, 15, 16, 70].  Further,
several publications aimed to improve the reliability of pipelines by addressing provenance
aspects of pipelines [71, 72, 73].
Data  Preprocessing.Besides work on pipelines in general,  there is also plenty of research
that focuses on the preprocessing of data within pipelines.  Studies in this area specifically
aim to assist in choosing appropriate data operators and defining their optimal combinations
[74, 75, 76] or even automate the entire creation of preprocessing chains [18].
-  Research procedure
In this paper,  we seek to improve the understanding of data pipeline quality.  In fact,
this research attempts to address the following objectives.
-  To identify and evaluateinfluencing factorsof a data pipeline’s ability to provide data
of high quality.
-  To analyzedata-related issuesand elaborate on theirroot causesandlocationin data
pipelines.
-  To identifydata  pipeline  processing  topic  issuesfor developers and analyze whether
they correspond to the typical processing stages of pipelines.
An overview of all applied research methods and the corresponding research objectives
is depicted in Figure 2.  The remaining section describes the research methods used to reach
these objectives.
## 9

## Structured Interviews
## Multivocal Literature Review
Research methods
## Section 3.1
## Exploratory Case Study
on GitHub
## Exploratory Case Study
on Stack Overflow
## Section 3.2
## Section 3.3
Identification of
influencing factors
of a data pipeline's ability to
provide high-quality data
Evaluation of the identified
influencing factors
Research objectives
Investigation of
root causes and location
of data-related issues
in data pipelines
Identification of
topic issues of data processing
in data pipelines
## 1
## 2
## 3
Figure 2:  Research procedure
3.1.  Multivocal literature review
To identify general factors that influence data pipelines regarding their provided data
quality,  we  conducted  a  Multivocal  Literature  Review  (MLR).  The  goal  of  the  literature
review was to synthesize the available literature related to aspects that may affect the ability
of pipelines to deliver high data quality.  We gathered problem-related and quality-related
aspects of pipelines to derive corresponding IFs.
3.1.1.  Search process and source selection
As a  first step,  we  conducted a trial  search  on the Google  and Google Scholar search
engines to identify relevant keywords and elaborate the search strategy.  While the Google
search engine returned a large number of results for the term ’data pipeline’, Google Scholar
returned instead few in comparison.  One possible reason we encountered in our trial search
could be that modified versions of the term data pipeline (e.g., data processing pipeline) are
often used in the scientific literature, whereas the term data pipeline is commonly used in
practice.  Another reason could be that research in the developing field of data engineering
and its concepts (e.g., data pipeline) is still relatively new.
Because  of  these  differences  in  the  search  results,  we  decided  to  use  different  sets  of
keywords  for  Google  Scholar  and  the  regular  Google  search  engine.   The  detailed  search
strings can be found in Table 1.  For comprehensibility, the search string used for the regular
Google search engine was rewritten with distributive law.
We  performed  initial  searches  with  these  search  strings  on  both  search  engines.   By
scanning each hit’s title, abstract, and conclusion on Google Scholar, we selected the first
set of potentially relevant scientific sources.  Potential relevant grey literature was selected
based on the title and introduction of each hit on Google’s regular search engine.
Based on their generic nature, some keywords (e.g., quality model, error, issue) caused a
very large number of hits.  To reduce the number of hits to a manageable size, we restricted
## 10

Initial search
## Google Scholar
## Snowballing
Extraction of quality-
related and problem-
related aspects
## C
## Excluded
sources (n=40)
1- Search process and source selection
Inductive descriptive
coding
2- Data extraction and synthesis
Extracted quality-related
and problem-related
aspects (m=612)
Application of
inclusion/exclusion
criteria
## Activity
## Multiple
entities
## Database
## Legend
## Regular Google
search engine
Initial pool of
sources (n=1203)
## Search
strategy
Excluded sources
## (n=1059)
Remaining pool of
sources (n=144)
## C
Final pool
## (n=109)
## C
## Candidate
sources (n=149)
## Additional
sources (n=5)
## Themes
identification
Categories and
influencing factors
identification
Iterative refinement
Influencing factors
taxonomy
## Entity
## C
## Excluded
aspects
## (n=115)
Identification of
relevant aspects
Relevant quality-related
and problem-related
aspects (m=437)
Identified categories
and influencing
factors
Iterative refinement
Iterative refinement
Figure 3:  Multivocal literature review process
Table 1:  Search strings
## Google Scholar
[’data pipeline’ AND ’software quality’] OR [’data  pipeline’ AND ’quality requirements’] OR
[’data  pipeline’  AND  ’code  quality’]  OR  [’data  pipeline’  AND  ’*functional  requirements’]
OR  [’data  pipeline’  AND  ’quality  model’]  OR  [’data  science  pipeline’]  OR  [’data  engineering
pipeline’]  OR  [’data  pipeline’]  OR  [’machine  learning  pipeline’]  OR  [’data  flow  pipeline’]  OR
[’data *processing pipeline’] OR [’data processing pipeline’]
## Google Search Engine
’data pipeline’ AND (’software quality’ OR ’quality requirements’ OR ’code quality’ OR ’*func-
tional requirements’ OR ’quality model’ OR ’pitfall’ OR ’error’ OR ’anti pattern’ OR ’problem’
OR ’challenges’ OR ’issues’)
the search space by utilizing the relevance ranking algorithms of both databases.  That is, we
assumed that the most relevant sources usually appear on the first few result pages.  Thus,
we only checked the first three pages of each search string’s result (i.e., 30 hits) and only
continued if a relevant source was found on the last page.
In total, we excluded 1,059 sources from an initial pool of 1,203 scanned sources resulting
## 11

in a remaining pool of 144 potential relevant sources.  Of these, 111 were found with Google
Scholar and 33 with Google’s regular search engine (i.e., grey literature).
To  ensure  finding  all  relevant  sources,  we  additionally  applied  forward  and  backward
snowballing [77] to the 111 scientific sources.  By examining the references of a paper (back-
ward snowballing) and citations to a paper (forward snowballing), we identified five addi-
tional papers.  Thus, we got a final set of 149 candidate sources.
Table 2:  Inclusion and exclusion criteria
Inclusion CriteriaExclusion Criteria
Accessible in full-textNon-english articles
Published between 2000 and 2021Only address machine learning aspects
Addressing quality characteristics, best
practices, lessons learned,
requirementsorproblems, issues,
challenges related to data pipelines
As  a  next  step,  we  reviewed  each  of  the  149  sources  in  detail  based  on  the  defined
inclusion  and  exclusion  criteria  shown  in  Table  2.   To  ensure  the  validity  of  the  results,
two researchers independently voted on whether to include or exclude each source.  In case
of disagreements, the corresponding sources were discussed again, and the final choice was
made.  Finally,  we excluded 40 sources and got a remaining pool of 109 sources (26 grey
literature,  83  scientific  literature)  for  further  consideration.   The  complete  process  of  the
literature review is depicted in Figure 3.
3.1.2.  Data extraction and synthesis
We used a Google Sheets spreadsheet to extract all quality-related (i.e., best practices,
quality characteristics) and problem-related (i.e., issues, challenges) aspects of data pipelines
from  the  final  pool  of  sources.   In  detail,  we  extracted  text  fragments  describing  either
quality-  or  problem-related  aspects  that  may  influence  the  data  quality  of  data  pipelines
and entered them in separate columns in the spreadsheet.  To ensure clarity, we additionally
entered context information as notes for some extracted text fragments.  Note that whereas
some sources contained both quality- and problem-related aspects, others contained infor-
mation on only one aspect.
After all text fragments (612) were extracted, we reviewed them based on their potential
influence on a data pipeline’s ability to deliver high data quality. We excluded text fragments
(175) describing either too abstract quality concepts (e.g., the flexibility of pipelines), too
general (e.g., data transformation error), or not impacting the quality of data provided by
pipelines (e.g., cosmetic bugs of graphical user interfaces).  To be able to assess the influence
on the data quality, we relied on the ISO/IEC’s [78] inherent data quality characteristics,
i.e., accuracy, completeness, consistency, credibility, and currentness.
The remaining data (437 text fragments) were then synthesized using the thematic syn-
thesis approach.  Thematic synthesis is a qualitative data analysis technique that aims to
## 12

Text fragements
## Codes
Influencing Factors (IFs)
IF Categories
"data aggregation may remove important data
points which cannot be collected again"
Premature data aggregation
Sequence of data operations
Data flow architecture
IF Themes
## Processing
## 437
## 164
## 44
## 14
## 5
## #
## Example
Figure 4:  Thematic synthesis procedure
identify and report recurrent themes in the analyzed data [79, 80].  This technique was cho-
sen because it is frequently used by studies for similar purposes [81, 82] and fits well with
different types of evidence (i.e., scientific and grey literature) [83].
We started the synthesis by applying descriptive labels (i.e., codes) to each data fragment
following an inductive approach.  Thus, we generated the codes purely based on the concept
the text fragment described.  In detail, we derived neutral code names that described the
underlying influencing aspect of the extracted quality- and problem-related text fragments.
After  the  fragments  were  coded,  two  researchers  created  a  visual  map  of  the  codes  and
reviewed  them  together.   Thereby,  it  was  recognized  that  the  level  of  abstraction  varied
widely between the codes.  Thus, we defined codes that represent higher-level concepts as IF
categories (e.g., monitoring) or directly as IFs (i.e., data lineage).  In addition, we identified
IFs  (e.g.,  code  quality)  based  on  the  similarity  of  the  codes  (e.g.,  glue  code,  dead  code,
duplicated code) and derived overarching IF categories (e.g.,  software code).  During this
process,  we  constantly  relabeled  and  subsumed  codes  and  refined  the  emerging  IFs  and
categories.  In fact, the procedure was carried out in an interactive and iterative manner by
two researchers.
As the last step, the identified IF categories were reviewed together, and a set of concise
higher-order IF themes was created to succinctly summarize and encapsulate the categories.
The themes were developed based on the experience of the researchers in previous studies
[84,  13]  and  refined  by  reviewing  relevant  current  literature  [85,  21,  86].   Each  researcher
then independently assigned all categories to a theme.  In the case of different assignments,
the corresponding category, as well as themes, were discussed again with a third researcher
and refined to reach a consensus.  Finally, a terminology control [87] of all IFs, categories,
and themes was executed to ensure a consistent and accurate nomenclature.  Figure 4 shows
the procedure of the thematic synthesis illustrated with an example.  In total, we identified
five IF themes comprising 14 IF categories and a further 41 IF based on 164 codes assigned
to 437 text fragments.
3.2.  Expert evaluation
To  evaluate  our  findings  and  strengthen  the  trustworthiness  of  the  identified  IFs,  we
conducted  structured  interviews  following  the  guidelines  of  Hove  &  Anda  [88]  with  eight
## 13

experts to collect empirical evidence about our identified IFs.
The purpose of the interviews was to validate the identified factors.  In total, we collected
opinions from eight experts with a minimum of three years of practical experience in the
field of data engineering or a similar field where data pipelines are used.
The  interview  consisted  of  two  parts:  the  profiling  of  the  respondents  with  questions
about their experience and background;  and the main part with questions about the IFs.
To not overwhelm the experts and receive quality feedback, we decided to validate the 14
IF categories and provide the IFs as examples for each category.
The opinions of the experts regarding the influence of a certain IF category on data qual-
ity were measured with a 4-point Likert scale including high, medium, low, or no influence.
We  also  allowed  no  answer  in  case  participants  did  not  have  sufficient  experience  with  a
category or were not certain about their answers.
3.3.  Empirical study
To get a better understanding of the main problems a data pipeline encounters in its main
task, i.e., processing data, we conducted two exploratory case studies.  The first study aimed
at identifying the root causes of data-related issues and their location in a data pipeline.  To
achieve this, we analyzed open-source GitHub projects that have a data pipeline as one of
its main components.  In the second study, we analyzed Stack Overflow posts to identify the
main topics developers ask about processing data and examine whether the found problem
areas correspond to the typical processing stages of pipelines.  The process of mining GitHub
and Stack Overflow is presented in Figure 5 and described in the following sections.
3.3.1.  Exploratory Case Study on GitHub
Table 3:  Analyzed GitHub projects
NoProject nameProject description# of Issues
1ckanData management system2908
2covid-19-dataData collector of COVID-19 cases, deaths, hospitalizations,
tests
## 888
3DataGristleTools  for  data  analysis,  transformation,  validation,  and
movement.
## 69
4dataprepA tool for data preparation376
5doitTask management and automation tool269
6flyteKubernetes-native workflow automation platform for com-
plex, mission-critical data and ML processes at scale
## 1442
7networkxNetwork Analysis in Python2712
8opendata.cern.ch   Source code for the CERN Open Data portal1603
9pandas-profilingHTML profiling reports from pandas DataFrame objects564
10pybossaA framework to analyze or enrich data that cannot be pro-
cessed by machines alone.
## 999
11rubrixData annotation and monitoring for enterprise NLP515
## 14

to data analysis
1 - Data extraction from GitHub
2 - Data extraction from Stack Overflow
3 - Data analysis
to data analysis
## Activity
## Database
## Legend
## Entity
## Multiple
entities
Initial pool
of issues
## (n=12,345)
## Initial
pool of
projects
## (n=11)
## Extraction
of issues
## Non-data-
related
issues
## (n=358)
## Manual
labeling
## Data-related
issues (n=42)
## Identification
of non-data-
related
keywords
## Non-data-
related
keywords
## (n=15)
Application of
keywords to
initial pool
New pool
of issues
## (n=5,773)
## Sample
## (n=200)
## Data-related
issues
## (n=58)
GitHub
## Manual
labeling
## Sample
## (n=400)
Initial set
of tags
## (n=8)
## Snowballing
## Additional
tags (n=22)
## Extraction
of posts
Pool of
posts
## (n=15,035)
## Sample (n=400)
## Data
pipeline
related
posts
## (n=99)
## Manual
labeling
to data analysis
## Inductive &
deductive coding
Themes and sub-
themes
identification
Identified themes
and sub-themes
Grouping and
analysis
Iterative refinement
## Root-causes &
topic issues
## Stack Overflow
Figure 5:  GitHub and Stack Overflow mining procedure
For  mining  GitHub,  we  followed  the  procedure  used  by  a  related  study  of  Ray  et  al.
[89].   First,  we  analyzed  projects  on  GitHub  and  identified  those  that  were  suitable  for
our analysis.  The main inclusion criterion was that a project either has a data pipeline as
one of the main components or includes several data processing steps before further data
application.  Following these criteria, we identified 11 projects.  The list of the projects, their
description, and an overall number of open and closed issues are presented in Table 3.
Next, we extracted 12,345 open and closed issues reported by users or developers from
these  projects.   Since  it  was  unfeasible  to  analyze  over  12,000  posts  manually,  a  random
sample of the population was taken considering the confidence level of 95%.  For our popu-
lation, the minimum sample size is equal to 373.  To cover the minimum properly, we chose
a sample size of 400.
In the next step, one researcher manually labeled each issue by assigning three groups:
data-related, not data-related, and ambiguous.  The last category was added for the issues,
including project-specific names or issues that cannot be classified without deeper knowledge
of  the  project.   These  issues  were  not  included  in  the  further  analysis  since  they  do  not
represent common but rather project-specific issues.  As a result, 42 issues were classified as
data-related and used in further analysis.
Because only approximately 10% of all the sample issues were classified as data-related,
we  decided  to  apply  an  additional  strategy  to  increase  the  number  of  data-related  issues
further.  The main idea of this strategy was to reduce the total number of extracted issues
(12,345) based on a set of keywords that are related to the non-data-related issues.  These
## 15

keywords were extracted from the non-data-related issues from the initial sample.  We val-
idated them by checking that they were not present in the data-related issues.  The list of
the non-data-related keywords is presented in Table 4.
Table 4:  Non-data-related keywords
UI,  API,  support,  version,  tutorial,  guide,  instruction,  license,  picture,  GitHub,  typo,  logo,
documentation, readme, graphics
Afterward, we applied the set of non-data-related keywords to the total pool of issues
and identified 6,172 issues (52%) as not data-related.  In the next step, we took a sample of
200 issues from the remaining 5,773 issues while considering the distribution of all issues in
every chosen project, thereby identifying 58 additional data-related issues.  As a result, the
final set consisted of 100 data-related issues extracted from 11 different projects.
To  assign  issues  to  the  root  causes  and  data  pipeline’s  stages,  we  applied  descriptive
labels  following  an  inductive  (root  causes)  and  deductive  (stages)  approach.   If  the  root
cause or stage were not identifiable from the issue description, the source code and solution
of  the  issue,  if  available,  were  examined.   To  maintain  the  objectivity  of  the  results,  the
labels were then investigated by two other researchers until an agreement was reached.
3.3.2.  Exploratory Case Study on Stack Overflow
We followed the procedure described by Ajam et al.  [90] for mining Stack Overflow posts.
The process is shown in Figure 5.
One of the features of the platform is the ability to add tags to every question according
to  the  topic  the  given  question  covers.   A  tag  is  a  word  or  a  combination  of  words  that
expresses the main topics of the question and groups posts into categories and branches.
If there is more than one topic to which a question belongs, several tags can be applied.
Each post can have up to five different tags.  To identify the questions relevant to our study,
we defined a starting collection of data pipeline processing-related tags.  It includes the main
tasks of data pipelines defined in the earlier sections such as: ’data pipeline’, ’data cleaning’,
’data integration’, ’data ingestion’, ’data transformation’, and ’data loading’.  In addition,
we added two tags,  ’Pandas’ and ’Scikit-learn’,  that describe packages frequently used in
processing data in pipelines.
To identify and extract posts containing these tags, we used Stack Overflow API, which
provides various options for interaction and parsing of the website through commands.  API
facilitates  the  process  of  post-collection  and  allows  the  specification  of  the  required  tags.
Since every post can have up to five tags simultaneously, API helps to extract more related
tags  based  on  the  initially  added  tags.   Such  functionality  allows  the  application  of  the
snowball method where new tags are discovered based on the original ones [52].  Based on
the starting tags, API showed up to eight related tags.  We repeated the procedure for several
iterations until no new tags were identified.  As a result, we got 30 tags shown in Table 5
and extracted all posts containing these tags.  After handling duplicates, we got a final pool
of 15,035 posts from 11,290 different Stack Overflow forum branches.
## 16

Table 5:  Data pipeline processing-related tags on Stack Overflow
arrays,   classification,   data-augmentation,   data-cleaning,   dataframe,   data-ingestion,   data-
integration, data-loading, data-pipeline, data-preprocessing, data-science, data-transformation,
data-wrangling, datetime, deep-learning, discretization, etl, feature-selection, image-processing,
keras, kettle, machine-learning, numpy, opencv, pandas, pdi, pentaho-data-integration , python,
scikit-learn, tensorflow
Since  it  was  unfeasible  to  analyze  over  15,000  posts  manually,  we  randomly  selected
a  sample  of  400  posts  using  a  95%  confidence  level.   From  these  posts,  we  excluded  301
posts asking general questions about the usage of certain libraries or specific data analytics
questions (e.g., about image transformation, feature extraction or selection, dimensionality
reduction, algorithmic optimization, visualization, or noise reduction).
Afterward, one researcher investigated all 99 remaining sample posts and first assigned
deductive labels describing the usual data processing stages of a pipeline.  In several iter-
ations, the labels were grouped, refined, and new labels were created until the main data
pipeline processing topic issues were identified.  The whole labeling process was constantly
verified by a second researcher.
-  Data pipeline influencing factors
This section deals with influencing factors (IFs) affecting a pipeline’s ability to deliver
quality data.  First, Section 4.1 presents the IFs in the form of a taxonomy.  Afterward, Sec-
tion 4.2 outlines the evaluation of the taxonomy in the form of structured expert interviews.
4.1.  Taxonomy of influencing factors
The taxonomy is depicted in Figure 6.  In total,  we identified 41 IFs grouped into 14
IF  categories  and  five  IF  themes.   Following,  we  describe  each  identified  theme,  namely
Data,Development  &  deployment,Infrastructure,Life  cycle  management, andProcessing,
and provide a description of all identified IFs.
## 4.1.1.  Data
This theme covers aspects of the data processed by pipelines that may affect a pipeline’s
ability to process and deliver these data correctly.  The aspects are represented by the fol-
lowing  three  categories:Data  characteristics,Data  management,  andData  sources.   We
identified four factors of influence related to the category Data characteristics:  ’Data de-
pendencies’,  ’Data representation’,  ’Data variety’,  and ’Data volume’.  The category data
management comprises the IFs ’Data governance’,  ’Data security’,  and ’Metadata’.  Note
that the IFs data governance and security only relate to the pipeline and not to upstream
processes (e.g., data producers).  Finally, the ’Complexity’ and ’Reliability’ of sources pro-
viding  data  are  IFs  summarized  under  the  category  Data  sources.   A  description  of  each
identified IF is given in Table 6.
## 17

4.1.2.  Development & deployment
The  development  and  deployment  processes  of  pipelines  were  identified  as  significant
aspects that may influence a pipeline’s data quality.  This theme is structured into four cate-
gories:Communication & information sharing,Personnel,Quality assurance, andTraining-
serving skew.  Within the category of Communication & information sharing, we identified
the ’Awareness’ to perceive a pipeline as an overall construct that comprises different ac-
tors and ’Requirements specifications’ as IFs.  Regarding the category Personnel,  ’Exper-
tise’ and ’Domain knowledge’ were found as important IFs.  ’Testing scope’ and applying
’Best practices’ manifest the IFs of the category quality assurance.  Concerning the cate-
gory Training-serving skew, ’Code equality’ between development and deployment and ’Data
drift’ constitute factors influential to the data quality provided by pipelines. Table 7 provides
a description of all identified IFs of this theme.
## 4.1.3.  Infrastructure
This theme reflects important aspects of the infrastructure data pipelines are based on
that  may  affect  their  ability  to  provide  data  of  high  quality.   The  identified  IFs  of  this
theme are grouped into two categories:Serving environmentandTools & technology.  The
category Serving environment encompasses infrastructural factors related to pipelines that
are running in production, that is, ’Hardware’, ’Performance’, and ’Scalability’. Under the IF
category Tools and technology, we identified the factors ’Appropriateness’, ’Compatibility’,
’Debugging capabilities’, ’Functionality’, ’Heterogeneity’, ’Reliability’, and ’Usability’.  This
category covers tools and technologies used during development and in the operational state
of pipelines.  In Table 8 a description of each identified IF of this theme is given.
## Infrastructure
Life cycle management
## Processing
Data characteristicsData management
Data sources
Communication & information sharingPersonnel
Quality assuranceTraining-serving skew
Serving environmentTools & technology
Application management
Data flow architectureFunctionality
Software code
Data dependenciesData representation
Data varietyData volume
Data governance
Data security
## Metadata
ComplexityReliability
AwarenessRequirements specificationsDomain knowledgeExpertise
Best practicesTesting scopeCode equalityData drift
HardwarePerformance
## Scalability
AppropriatenessCompatibility
Debugging capabilitiesFunctionality
HeterogeneityReliability
## Usability
Configuration management
Continuous integration and deployment
Application performance monitoring
Data lineage
ComplexityDependencies
ModularizationProcessing mode
ReproducibilitySequence of data operations
AutomationConfiguration
Data cleaning
Code qualityData type handling
Influencing factors
Workflow and orchestration management
## Monitoring
Development & deployment
Software code
FunctionalityData flow architecture
Serving environment
## Data
Figure 6:  Taxonomy of data pipeline influencing factors (IFs)
## 18

Table 6:  Influencing factors (IFs) of the theme Data
IF Category & IFDescription
Data characteristics
Data dependenciesInstability of data regarding their quality or quantity over time.
Data representationData formats, data structures, data types, and further data represen-
tation aspects (e.g., data encoding).
Data varietyHeterogeneity (i.e., formats, structures, types) of the data consumed.
Data volumeQuantity and rate at which data are coming into the pipeline.
Data management
Data governanceProcesses, policies, standards, and roles related to managing the data
processed  by  a  pipeline  (e.g.,  data  ownership,  data  accessibility,  raw
data storage).
Data securityDegree to which data are protected during their transmission and pro-
cessing.
MetadataDegree to which data consumed and processed are documented (e.g.,
data catalog, data dictionary, data models, schemas).
Data sources
ComplexityNumber of data models and data sources a pipeline has to deal with,
including  the  degree  of  simplicity  of  merging  the  corresponding  data
(e.g., joinability).
ReliabilityDegree to which data sources are available, accessible, and provide data
of high quality.
4.1.4.  Life cycle management
The life cycle management of data pipelines has been found to be influential on the qual-
ity of the data delivered by pipelines.  Within this theme, two IF categories were identified:
Application managementandMonitoring.  Important IFs of the category Application man-
agement are:  ’Configuration management’,  ’Continuous integration and deployment’,  and
’Workflow and orchestration management’.  The category Monitoring comprises the factors
’Application performance monitoring’ and ’Data lineage’.  Table 9 describes all IFs of both
categories in more detail.
## 4.1.5.  Processing
This theme includes factors that are related to the processing of the data in pipelines.
In  total,  we  identified  eleven  processing  factors  that  may  impact  the  quality  of  the  pro-
cessed data.  We grouped them into three categories:Data flow architecture,Functionality,
andSoftware  code.  Regarding the category Data flow architecture,  following factors were
found to be influential:  ’Complexity’, ’Dependencies’, ’Modularization’, ’Processing mode’,
’Reproducibility’,  and ’Sequence of data operations’.  The category Functionality summa-
rizes the IFs ’Automation’, ’Configuration’, and ’Data cleaning’.  Finally, ’Code quality’ and
’Data type handling’ comprise the IFs of the category Software code.  Table 10 provides a
## 19

Table 7:  Influencing factors (IFs) of the theme Development & deployment
IF Category & IFDescription
Communication & information sharing
AwarenessThe  perception  of  the  pipeline  as  a  coherent  overall  construct  and  the
awareness and ability of knowledge exchange.
## Requirements
specifications
Completeness  and  level  of  detail  regarding  the  specification  and  docu-
mentation of the pipeline (e.g., data transformation rules, processing re-
quirements).
## Personnel
Domain knowledge   Entities’  knowledge  and  understanding  of  the  domain  underlying  the
data.
ExpertiseBackground, experiences, technical knowledge, and quality awareness of
entities.
Quality assurance
Best practicesCode and configuration reviews, refactoring, canary processes, and fur-
ther best practices (e.g., use of control variables).
Testing scopeTesting depth and space (e.g., test coverage, test cases).
Training-serving skew
Code equalityEquality  of  software  code  between  development  and  production  (e.g.,
ported code, code paths, bugs).
Data driftDifferences  in  the  data  between  development  and  production  (e.g.,  en-
codings, distribution).
description of all eleven identified processing factors.
4.2.  Expert evaluation
To assess the validity of the identified influencing factors, we conducted eight structured
interviews with experts from different business areas.  A prerequisite for the candidates was
at least three years of experience in data engineering.  Half of the respondents had three to
five years of experience, and the others had more than five years of experience, including two
experts with more than ten years of experience.  Seven experts assessed all 14 IF categories,
while one expert only assessed 11 of them.  Additionally, we asked about the format of data
being  processed  in  their  data  pipelines.   The  main  types  of  data  mentioned  were  tabular
data and text.
The results of the experts’ evaluation of the taxonomy are presented in Figure 7.  The
Y-axis represents the average influence of all 14 assessed IF categories assessed by the ex-
perts.  Each category is represented by a bubble while the color of the bubble highlights the
corresponding IF theme.  The size (i.e.,  area) of the bubbles represents the experts’ level
of agreement on every IF category and is calculated as the standard deviation.  High stan-
dard deviation coefficients evidence low agreement among the experts, which is expressed
## 20

Table 8:  Influencing factors (IFs) of the theme Infrastructure
IF Category & IFDescription
Serving environment
HardwareType and reliability of the hardware in production.
PerformanceAvailability and manageability of the resources in production.
ScalabilityThe capacity to change resources in size or scale.
Tools & technology
AppropriatenessTypes (e.g., code/GUI-first, own solutions, propriety), maturity, flexibil-
ity, and up-to-dateness of tools and technology.
CompatibilityAbility of tools and technology (e.g., frameworks, platforms, libraries) to
work together.
## Debugging
capabilities
Availability and extent (i.e., level of detail) of opportunities (e.g., tools)
to find and correct errors.
FunctionalityThe scope of functions (e.g., advanced data operations, support of data
management, engineering, and validation) provided.
HeterogeneityNumber of different technologies and tools used.
ReliabilityDegree to which tools and technologies are working correct (e.g., software
quality, complexity).
UsabilityAvailability, documentation, and ease of use of APIs, libraries, and tools.
## Data
characteristics
## Data
management
Data sources
## Communication
## Personnel
## Quality
assurance
## Training-serving
skew
## Serving
environment
## Tools &
technology
## Application
management
## Monitoring
Data flow
architecture
## Functionality
## Software
code
full agreement
total disagreement
## High
influence
## Medium
influence
## Low
influence
## No
influence
## Data
DevelopmentProcessingInfrastructureManagement
Figure 7:  Experts evaluation of IF categories and the levels of their agreement
by smaller sizes of the bubbles.  As a reference, the two gray shaded bubbles on the lower
right-hand side of the figure visualize the range between no and full agreement.
The majority of categories, eight out of 14, were assessed similarly by experts, i.e., within
one point (influence level) difference.  The largest disagreement appeared in five categories:
data management,  data sources,  personnel,  serving environment,  and tools & technology.
Although  the  average  assessed  influence  of  serving  environment-related  IFs  received  the
lowest score, it also showed the lowest agreement among experts from no influence to medium
influence.  Notably, this category received a ”no influence” assessment from the expert who
did not assess all categories.  Besides the three no answers, there were 51 high, 49 medium,
eight low, and one no influence assessments.
Despite different levels of agreement, 13 out of 14 categories were identified by the ma-
jority of experts to have medium to high influence.  According to the experts’ assessment,
## 21

Table 9:  Influencing factors (IFs) of the theme Life cycle management
IF Category & IFDescription
Application management
Configuration managementVersion control and dependency management for code, li-
braries, and configurations.
Continuous integration and
deployment
Automation of providing new releases and changes.
Workflow and orchestration
management
Tools for managing the entire workflow of pipelines.
## Monitoring
Application performance
monitoring
Observing and logging the operational runtime of all soft-
ware components.
Data lineageObservability of the data during all transformation steps,
including data versioning.
Table 10:  Influencing factors (IFs) of the theme Processing
IF Category & IFDescription
Data flow architecture
ComplexityComputational  effort  and  pipeline  complexity  (e.g.,  transformation
complexity).
DependenciesDependencies between architectural components or processing steps.
ModularizationModularization of data pipeline components (e.g., codes, APIs).
Processing modeType of processing (e.g., batch, stream, distributed or parallel process-
ing).
ReproducibilityDegree to which processing is reproducible, including aspects such as
caching and idempotency.
Sequence of data
operations
Application order of data preparation and processing techniques.
## Functionality
AutomationAutomation of data validation, handling, and providing corresponding
guidance.
ConfigurationConfiguration (e.g., parameters, settings) for processing data.
Data cleaningTreatment of data issues (e.g., modification or deletion).
Software code
Code qualityQuality and complexity of the code for processing data (e.g., dead code,
duplicated code, language heterogeneity).
Data type handlingHandling of data types (e.g., type casting, delimiter handling, encod-
ing).
the five most influential categories are functionality, personnel, quality assurance, data flow
architecture, and software code.  They fall under the development and deployment, and pro-
## 22

cessing categories.  Overall, processing-related IFs were rated highly influential, with a high
level of agreement among the experts.  In conclusion, the expert interviews have confirmed
that the categories have the potential to affect the data quality of a data pipeline.
-  Empirical study on data-related and data processing issues
In this section, we first outline the root causes of data-related issues and their location
in data pipelines based on analyzing GitHub projects (Section 5.1).  Afterward, Section 5.2
presents the main data pipeline processing problem areas for developers identified by mining
Stack Overflow posts and compares them to the typical processing stages of pipelines.
5.1.  Root causes and stages of data-related issues in data pipelines
After manually analyzing 100 data-related issues from the chosen GitHub projects, we
identified seven root cause categories of these issues.  The categories are listed on the left-
hand side of Figure 8.
The most frequent root cause identified in 33% of the analyzed problems is related to
data types.  These issues occur at almost every stage of the data pipeline; incorrectly defined
data types make it difficult to clean, ingest, integrate, process, and load the data.  It can
lead to more obvious issues when the data cannot be processed due to unknown or incorrect
data types,  but also it can cause loss of information if data cannot be read and no error
is raised.  Data type issues are not limited to single data items but also concern how data
types are handled in data frames.  In almost 90% of all cases, data type issues arise in the
cleaning or integration stages.
Issues  caused  by  the  misplacement  ofsymbols  and  charactersaccount  for  17%  of  all
investigated issues.  Special characters, such as diacritics, letters of different alphabets, or
symbols not supported by used encoding standards, cannot be processed and cause errors
in the data pipeline.
Figure 8:  Data-related issues’ root causes and pipeline stage in GitHub projects
## 23

The next identified category of root causes is related toraw data.  This category describes
all issues rooted in the raw data. For example, duplicated data, missing values, and corrupted
data.  Mostly, the issues appear at the ingestion and integration stages.
Functionalityissues account for 13% of the issues and describe misbehavior of functions
or lack of necessary functions.  About half of the issues occurred during the cleaning process
and characterize wrong outputs of the cleaning functions, i.e., correctly processed data are
recognized as incorrect after the cleaning stage of a pipeline. Further issues describe functions
delivering inconsistent results or not processing the data as the function intended it.
Data frame-relatedissues were identified in 11% of all issues.  They cover all data frame-
related activities, such as data frame creation, merging, purging, and other changes.  Addi-
tionally, some of the issues are connected to the access of different groups of users to the
data.
The last two categories were related to processing large data sets and logical errors, with
seven and two percent, respectively.  Theinput data set sizecan cause problems at different
pipeline stages.  The issues discovered during the analysis included failure to read, upload,
and load large data sets.  Therefore, the ability of the data pipeline to scale according to the
amount of data must be considered already in the early stages of data pipeline development.
Issues in the categorylogical errorsdescribe, for example, calls to the non-existing attributes
of objects or non-existing methods.
An  overview  of  the  pipeline  stages  where  the  analyzed  data-related  issues  occurred  is
shown on the right-hand side of Figure 8.  Most of all issues manifested during the cleaning
and ingestion stages of the pipelines, with 35% and 34%, respectively.  Further, 21% of all
issues  were  detected  at  the  integration  stage.   The  stages  with  the  fewest  issues  seen  are
loading and transformation.
5.2.  Main topic issues of data processing for developers in data pipelines
Figure 9:  Data pipeline processing topics asked in Stack Overflow posts
After manually labeling all 99 data pipeline processing-related posts,  we identified six
main  data  pipeline  processing  topic  issues,  five  of  which  represent  typical  data  pipeline
## 24

stages:  integration, ingestion, loading, cleaning, and transformation.  The sixth topic identi-
fied was compatibility.  Figure 9 shows the number of posts related to different data pipeline
stages and their distribution.  Since one post may include more than one label,  there are
more than 99 labels represented in the figure.
The largest topic was related tointegrationissues.  Here users mostly asked questions
about the transformation of databases, operations with tables or data frames, and platform-
or language-specific questions.
Posts  related  to  ingestion  and  loading  were  the  second  and  third  most  asked  group
of  posts.   Posts  related  toingestiontypically  discussed  the  upload  of  certain  data  types
and the connection of different databases with data processing platforms.  Posts regarding
loadingmostly cover several issues:  efficiency,  process,  and correctness.  Efficiency relates
to  the  speed  of  loading  and  memory  usage.   Posts  about  processes  ask  platform-related
questions on how to connect different services.  Correctness covers questions about incorrect
or inconsistent results of data output.
Cleaning  and  transformation  posts  account  for  13%  of  all  posts.   A  large  portion  of
all posts regardingcleaninginclude questions about the handling of missing values.  Posts
that were labeled astransformationcover such issues as the replacement of characters and
symbols, data types handling, and others.
The last topic identified iscompatibility.  This topic is not specific to any data pipeline
stage but includes a block of questions regarding software or hardware compatibility for data
pipeline-related processes.  Examples are code running inconsistently in different operational
systems, e.g., Ubuntu and macOS, programming language differences, software installation
in different environments, and others.  Compatibility issues are critical but hard to foresee.
We  found  8%  of  posts  on  Stack  Overflow  with  a  focus  on  compatibility  issues  in  various
stages of data pipelines.  In all cases, the issues affected the core functionality of pipelines.
## 6.  Discussion
This section discusses the findings of the research in connection with the related liter-
ature and describes the limitations of the study.  Section 6.1 focuses on the taxonomy and
its evaluation.  Afterward, Section 6.2 highlights the core findings and limitations of the ex-
ploratory case studies on GitHub and Stack Overflow and connects them to related works.
Finally, Section 6.3 provides an overview of the findings and their relations.
6.1.  Data pipeline influencing factors taxonomy
Our developed taxonomy summarizes the factors influencing a data pipeline’s ability to
deliver high-quality data into five main pillars:  data, development and deployment, infras-
tructure, life cycle management, and processing.
Interpretation.The identification of 41 IFs grouped into 14 categories underlines the com-
plex and wide range of aspects that may affect data pipelines.  This necessitates an urgent
need to further study the influencing effects of each factor.  Notwithstanding the relatively
limited size of our evaluation, the following conclusions can be drawn.  Processing-related
## 25

IFs were identified as highly influential by the majority of the experts in the structured in-
terviews.  In contrast, IFs of the theme infrastructure were estimated to have low to medium
influence  with,  however,  low  agreement  rates  between  respondents.   This  leads  to  several
conclusions.   First,  the  impact  of  different  IFs  on  the  final  data  quality  is  not  equal  and
homogeneous,  and  some IFs  have  a higher effect  than others.  Consequently,  they should
be considered in the first place.  Second,  the lower levels of experts’ agreement regarding
data sources, personnel, and the serving environment might indicate that the influence of
different  factors  depends  on  the  domain  of  the  data  pipeline  application  and  the  form  of
data (e.g., tabular, text, images).  However, since the main purpose of the evaluation was to
confirm the influencing ability of the factors, the results in terms of the relative influencing
ranking must be interpreted with caution.
Comparison with related work.We briefly compare our taxonomy to two contributions clos-
est to our work regarding the domain of data and the perspective taken.  The first article
was published by Singh & Singh [47] and presents possible causes of data quality issues in
data warehouses.  In contrast to our work, the authors only consider the causes of poor data
quality at a very detailed level and do not form overarching causes (i.e., IFs categories and
themes).  Moreover, they did not provide empirical validation of the proposed factors.  The
second article [48] took a more high-level perspective and investigated general factors that
influence the quality of data in data warehouses.  In their work, Zellal & Zaouia found that
technological factors (e.g., ETL and data quality tools), data source quality, teamwork, and
the adoption of data quality management practices are the most critical factors that influ-
ence data quality in data warehouses.  As these factors are also represented in our taxonomy
(i.e., tools & technology, data sources, communication & information sharing, and best prac-
tices), our findings confirm their influential characteristics.  Unlike Zellal & Zaouia’s work,
however, we base our research on a comprehensive set of systematically gathered grey and
scientific literature.  In conclusion, our taxonomy differs from the presented related work in
the following ways.  First, we provide factors of influence on several abstraction levels (i.e.,
themes, categories, and factors).  Second, we do not focus on any domain, thus ensuring the
taxonomy is valuable to researchers and practitioners of all fields.
Limitations.Although the taxonomy was constructed in a way to mitigate threats of valid-
ity (e.g., several researchers worked on the literature review and data synthesis), the final
taxonomy has several limitations.  First, we took a software and data engineering perspec-
tive, thus not considering managerial or business-related factors.  Second, although different
types of data were considered when analyzing the literature, there is more evidence of chal-
lenges and data quality for tabular data than for other data types.  This aspect can lead to a
biased representation of IFs for different data types.  Third, it is important to bear in mind
possible IF relationships.  In a study on factors influencing software development produc-
tivity, Trendowicz & Muench [91] described dependencies between these factors.  Similarly,
data quality IFs may also be in a casual relationship which determines the final change of
the  quality  of  the  data  delivered  by  a  pipeline.   Nevertheless,  more  research  is  needed  to
investigate these relationships between different factors and examine their interdependence.
## 26

6.2.  Data-related and data pipeline processing issues
By  mining  GitHub  and  Stack  Overflow,  we  got  more  profound  insights  into  the  root
causes of data-related issues, their location in data pipelines, and the main topics of data
pipeline processing issues for developers.
Interpretation.The majority of the analyzed issues on GitHub were caused by incorrect data
types.  A possible explanation for this may be that many data handling and ML libraries
use custom data types which often cause interoperability issues (i.e., type mismatch) within
pipelines [9, 92, 93].  This matches with the results of analyzing the main data pipeline pro-
cessing topics developers ask on Stack Overflow.  In fact, compatibility issues were found to
represent a separate topic besides the typical data processing stages in pipelines.  Regarding
these stages, we found data integration and ingestion to be the most asked topics.  This is
in good agreement with the work of Kandel et al.  [94], who found integrating and ingesting
data to be the most difficult tasks for data analysts.  A further aspect worth mentioning
is that data-related issues rarely occur in the data transformation stage of a pipeline.  A
possible explanation for this is that incorrect transformations do not cause errors that are
immediately  recognized  and  thus  can  stay  undetected.   A  further  interesting  finding  was
that data-related issues mainly occurred in the data cleaning stage of a pipeline.  In con-
trast, developers ask the most about integrating, ingesting, and loading data but not about
cleaning data.  Although we cannot reason that the amount of asked questions of a topic
reflects its difficulty, this can partly be explained by the fact that most issues in the data
cleaning stage can be attributed to the raw data and data type characteristics and, thus,
not directly to developers’ skills.
Comparison  to  related  work.We  first  compare  our  case  study  on  GitHub  with  the  work
of Rahman & Farhana [95].  In their work, the authors investigated the bug occurrence in
Covid-19 software projects on GitHub.  They found data-related bugs to be their own cate-
gory and identified storage, mining, location, and time series as corresponding sub-categories.
However,  their classification of data-related issues is strongly based on the inherent char-
acteristics  of  Covid-19  software.   For  example,  location  data  bugs  describe  issues  where
geographical location information in the data is incorrect.  In contrast, our work describes
general root causes applicable to a broader range of domains.  A further study that dealt
with data bugs was published by Islam et al.  [92].  In their paper,  the authors identified
data-related issues as the most occurring bug type in deep learning software.  However, the
authors do not provide further empirical evidence on concrete root causes of these issues.
Regarding mining Stack Overflow, several other contributions used this platform to in-
vestigate topics and challenges for developers in related fields.  Prior work [52, 9] analyzed
difficulties for developers in the closely related area of ML pipelines.  Both studies found
data preprocessing to be the second most challenging stage.  However, these studies focused
in particular on preparing data for ML models, e.g., data labeling and feature extraction.
A further study [10] on issues encountered by Apache Spark developers identified data pro-
cessing  as  the  most  prevalent  issue,  accounting  for  43%  of  all  questions  asked.   However,
this study did not detail the main topics of data processing and maps them to the usual
processing stage of a pipeline.
## 27

Limitations.To  maintain  the  internal  validity  of  the  empirical  studies,  two  researchers
worked on the labeling independently.  Inconsistencies were discussed and resolved together.
However, the conducted exploratory case studies have several limitations.  First, we solely
used  GitHub  and  Stack  Overflow  for  our  study.   Thus,  the  generalizability  of  our  results
must  be  treated  with  caution.   Second,  the  findings  are  limited  by  the  tags  used  in  both
studies.  To reduce these threats, we applied the snowballing method in defining the Stack
Overflow tags and, besides using data-related tags in mining GitHub, non-data-related tags
to ensure excluding only non-relevant issues.  The findings of the studies are further limited
by the fact that we relied on sampling during the analysis.  Thus, we cannot guarantee the
completeness of the identified results, although we chose a statistically significant sample of
posts and issues for the detailed analysis.  Moreover, similarly to the taxonomy limitations,
most Stack Overflow posts are related to tabular data; thus the results can be biased towards
other data types.
6.3.  Overview of results and their relation
Recapitulating our main research objectives, we recognize the following relations shown in
Figure 10.  Influencing factors contribute to the occurrence of the root causes of data-related
issues.  For example, the influencing factors ’data type handling’ and ’data representation’
explain the most frequent root cause ’data type’.  This, in turn, suggests an interdependence
between the influencing factors.  Further, the typical data pipeline stages where data-related
issues occur mainly reflect what developers ask about data pipeline processing.  However, we
found compatibility issues as a separate category of questions developers ask.  It is possible
that this category reflects the most identified root cause data type, especially as previous
research links these aspects [9, 92, 93].
Data type
## Symbols,
characters
Raw data
## Function
Data frame
Input data
set size

Logical errors
contribute to
## Loading
## Ingestion
## Integration
## Cleaning
## Transformation
## Compatibility
## Processing
topic issues
reflect
Root causes of
data-related
issues
## Data
## Development &
deployment
## Infrastructure
## Processing
Life cycle
management
## Influencing
factors
InterdependenciesData pipeline stages
Figure 10:  Overview of influencing factors’ contribution to data-related issues and processing topic issues in
data pipelines
## 7.  Conclusions
This article contributes to enhancing the understanding of data pipeline quality.  First,
we  descriptively  summarized  relevant  data  pipeline  influencing  factors  in  the  form  of  a
## 28

taxonomy.  The developed taxonomy of influencing factors emphasizes today’s complexity of
data pipelines by describing 41 influencing factors.  The influencing ability of the proposed
factors was confirmed by expert interviews. Second, we explored the quality of data pipelines
from  a  technological  perspective.   Therefore,  we  conducted  an  empirical  study  based  on
GitHub issues and Stack Overflow posts.  Mining GitHub issues revealed that most data-
related issues occur in the data cleaning (35%) stage and are typically caused by data type
problems.  Studying Stack Overflow questions showed that data integration and ingestion are
the most frequently asked topic issues of developers (47%).  In addition, we further found
that  compatibility  issues  are  a  separate  problem  area  developers  face  alongside  the  usual
issues  in  the  phases  of  data  pipeline  processing  (i.e.,  data  loading,  ingestion,  integration,
cleaning, and transformation).
The results of our research have several practical implications.  First, practitioners can
use the taxonomy to identify aspects that may negatively affect their data pipeline prod-
ucts.  Thus, the taxonomy can serve as a clear framework to assess, analyze, and improve
the quality of their data pipelines.  Second, the root causes of data-related issues and their
specific locations within data pipelines can help industry practitioners prioritize their efforts
in addressing the most critical points of failure and enhancing the overall reliability of their
data products.  Third, the main data processing topics of concern for developers enable com-
panies to focus on common challenges faced by developers, particularly in data integration
and ingestion tasks, which can lead to more effective support and assistance for developers
in tackling those issues.
Moreover, this study lays the groundwork for future research into data pipeline quality.
First, further research should be carried out to explore the identified compatibility and data
type issues developers face during engineering pipelines in more detail. Second, future studies
need to determine a ranking of the IFs based on the analysis of the individual influence levels
of each factor.  Third, further work may extend our study aiming to infer the difficulty of
each data processing stage by additionally considering difficulty metrics of Stack Overflow
posts, e.g., the average time to receive an accepted answer or the average number of answers
and views.
We intend to focus our future research on studying the dependencies between the pro-
posed influencing factors.  For this purpose, we plan to apply interpretive structural model-
ing.  There are already promising applications of this modeling technique to uncover inter-
relationships between factors [96].
## Acknowledgement
This work was supported by the Austrian ministries BMK & BMDW and the State of
Upper Austria in the frame of the COMET competence center SCCH [865891], and by the
Austrian Research Promotion Agency (FFG) in the frame of the projects Green Door to Door
Business Travel [FO999892583] and ConTest [888127]. We also thank Ilona Chochyshvili and
Matthias Hauser for their contribution in the conduction of the exploratory case studies.
## 29

## References
[1]  E.  Breck,  N.  Polyzotis,  S.  Roy,  S.  E.  Whang,  M.  Zinkevich,  Data  Validation  for  Machine  Learning,
Proceedings of Machine Learning and Systems (MLSys) (2019) 334–347.
[2]  F. Biessmann, J. Golebiowski, T. Rukat, D. Lange, P. Schmidt, Automated data validation in machine
learning systems, Bulletin of the IEEE Computer Society Technical Committee on Data Engineering
## 44 (1) (2021) 51–65.
[3]  H. Foidl,  M. Felderer,  Risk-based data validation in machine learning-based software systems,  MaL-
TeSQuE 2019 - Proceedings of the 3rd ACM SIGSOFT International Workshop on Machine Learning
Techniques for Software Quality Evaluation, co-located with ESEC/FSE 2019 (2019) 13–18.
[4]  IDC InfoBrief, Data as the New Water:  The Importance of Investing in Data and Analytics Pipelines
## (2020).
[5]  J. Bomanson, Diagnosing Data Pipeline Failures Using Action Languages, in:  International Conference
on Logic Programming and Nonmonotonic Reasoning, Springer, 2019, pp. 181–194.
[6]  O.  Romero,  R.  Wrembel,  I.  Y.  Song,  An  Alternative  View  on  Data  Processing  Pipelines  from  the
DOLAP 2019 Perspective, Information Systems 92 (2020) 101489.
[7]  A.  R.  Munappy,  J.  Bosch,  H.  H.  Olsson,  Data  Pipeline  Management  in  Practice:   Challenges  and
Opportunities, in:  Product-Focused Software Process Improvement. PROFES 2020. Lecture Notes in
Computer Science(vol 12562), 2020, pp. 168–184.
[8]  Data.world, DataKitchen, 2021 Data Engineering Survey Burned-Out Data Engineers Call for DataOps,
Tech. rep. (2021).
[9]  M.  J.  Islam,  H.  A.  Nguyen,  R.  Pan,  H.  Rajan,  What  Do  Developers  Ask  About  ML  Libraries?   A
Large-scale Study Using Stack Overflow (2019).arXiv:1906.11940.
[10]  Z. Wang,  T. H. P. Chen,  H. Zhang,  S. Wang,  An empirical study on the challenges that developers
encounter when developing Apache Spark applications,  Journal of Systems and Software 194 (2022)
## 111488.
[11]  C. Yang, S. Zhou, J. L. C. Guo, C. K ̈astner, Subtle bugs everywhere: Generating documentation for data
wrangling  code,  in:  36th  IEEE/ACM  International  Conference  on  Automated  Software  Engineering
(ASE), 2021, pp. 304–316.
[12]  J.  Bogner,  R.  Verdecchia,  I.  Gerostathopoulos,  Characterizing  Technical  Debt  and  Antipatterns  in
AI-Based Systems:  A Systematic Mapping Study, IEEE/ACM International Conference on Technical
Debt (TechDebt) (2021) 64–73.
[13]  H. Foidl, M. Felderer, R. Ramler, Data Smells: Categories , Causes and Consequences , and Detection of
Suspicious Data in AI-based Systems, in:  IEEE/ACM 1st International Conference on AI Engineering
– Software Engineering for AI (CAIN), pp. 229–239.
[14]  M. Zwick, ML-PipeDebugger: A Debugging Tool, in: International Conference on Database and Expert
Systems Applications., Springer International Publishing, 2019, pp. 263–272.
[15]  E. K. Rezig, A. Brahmaroutu, N. Tatbul, M. Ouzzani, N. Tang, T. Mattson, S. Madden, M. Stonebraker,
Debugging large-scale data science pipelines using dagger, Proceedings of the VLDB Endowment 13 (12)
## (2020) 2993–2996.
[16]  R. Louren ̧co, J. Freire, D. Shasha, BugDoc:  A System for Debugging Computational Pipelines, Pro-
ceedings of the ACM SIGMOD International Conference on Management of Data (2020) 2733–2736.
[17]  B. Bilalli, A. Abell ́o, T. Aluja-banet, R. Wrembel, Intelligent assistance for data pre-processing, Com-
puter Standards & Interfaces 57 (2018) 101–109.
[18]  J. Giovanelli, B. Bilalli, A. Abell ́o, Data pre-processing pipeline generation for AutoETL, Information
## Systems (108) (2022) 101957.
[19]  N. Konstantinou, N. W. Paton, Feedback driven improvement of data preparation pipelines, Information
## Systems 92 (2020) 101480.
[20]  D. Sch ̈afer, B. Palm, L. Schmidt, P. L ̈unenschloß, J. Bumberger, From source to sink-Sustainable and
reproducible  data  pipelines  with  SaQC,  in:  EGU  General  Assembly  Conference  Abstracts,  2020,  p.
## 19648.
## 30

[21]  A.  R.  Munappy,  J.  Bosch,  H.  Holmstr,  T.  J.  Wang,  Modelling  Data  Pipelines,  in:  46th  Euromicro
conference on software engineering and advanced applications (SEAA), 2020, pp. 13–20.
[22]  S.  Agostinelli,  D.  Benvenuti,  F.  De  Luzi,  A.  Marrella,  Big  data  pipeline  discovery  through  process
mining:  Challenges  and  research  directions,  CEUR  Workshop  Proceedings  2952  (101016835)  (2021)
## 50–55.
[23]  M. Drocco, C. Misale, G. Tremblay, M. Aldinucci, A Formal Semantics for Data Analytics Pipelines,
Tech. rep. (2017).arXiv:1705.01629.
[24]  T. Koivisto, Efficient Data Analysis Pipeline, Data Science for Natural Sciences Seminar (2019) 2–5.
[25]  H. Hapke, C. Nelson, Building Machine Learning Pipelines, 1st Edition, O’Reilly, Sebastopol, CA, 2020.
[26]  A. R. Munappy, J. Bosch, H. H. Olsson, T. J. Wang, Towards automated detection of data pipeline
faults, 27th Asia-Pacific Software Engineering Conference (APSEC) (2020) 346–355.
[27]  S. Garc ́ıa, S. Ram ́ırez-gallego, J. Luengo, J. M. Ben ́ıtez, F. Herrera, Big data preprocessing:  methods
and prospects, Big Data Analytics 1 (1) (2016) 1–22.
[28]  A. Chapman, P. Missier, G. Simonelli, R. Torlone, Capturing and querying fine-grained provenance of
preprocessing pipelines in data science, Proceedings of the VLDB Endowment 14 (4) (2020) 507–520.
[29]  T.  Hlupi ́c,  J.  Puniˇs,  An  Overview  of  Current  Trends  in  Data  Ingestion  and  Integration,  in:   44th
International Convention on Information, Communication and Electronic Technology (MIPRO), 2021,
pp. 1265–1270.
[30]  B.  Malley,  D.  Ramazzotti,  J.  T.-y.  Wu,  Data  Pre-processing,  in:   Secondary  Analysis  of  Electronic
Health Records, Springer, 2016, Ch. 12, pp. 115–141.
[31]  S. Biswas, M. Wardat, H. Rajan, The Art and Practice of Data Science Pipelines:  A Comprehensive
Study  of  Data  Science  Pipelines  In  Theory,  In-The-Small,  and  In-The-Large,  in:  44th  International
Conference on Software Engineering (ICSE ’22), May 21-29, 2022, Pittsburgh, PA, USA, Association
for Computing Machinery, 2022, pp. 2091–2103.
[32]  H. Xu,  J. H. Nord,  N. Brown,  G. D. Nord,  Data quality issues in implementing an ERP, Industrial
Management and Data Systems 102 (1) (2002) 47–58.
[33]  S.  W.  Tee,  P.  L.  Bowen,  P.  Doyle,  F.  H.  Rohde,  Factors  influencing  organizations  to  improve  data
quality in their information systems, Accounting and Finance 47 (2) (2007) 335–355.
[34]  J. H. Xiao, K. Xie, X. W. Wan, Factors influencing enterprise to improve data quality in information
systems application - An empirical research on 185 enterprises through field study, International Con-
ference on Management Science and Engineering - 16th Annual Conference Proceedings, ICMSE (1996)
## (2009) 23–33.
[35]  H. Xu, Factor analysis of critical success factors for data quality, 19th Americas Conference on Informa-
tion Systems, AMCIS 2013 - Hyperconnected World:  Anything, Anywhere, Anytime 3 (August 2013)
## (2013) 1679–1684.
[36]  A.  Haug,  J.  S.  Arlbjørn,  F.  Zachariassen,  J.  Schlichter,  Master  data  quality  barriers:  An  empirical
investigation, Industrial Management and Data Systems 113 (2) (2013) 234–249.
[37]  A.  Ibrahim,  I.  Mohamed,  N.  S.  M.  Satar,  Factors  Influencing  Master  Data  Quality:  A  Systematic
Review, International Journal of Advanced Computer Science and Applications 12 (2) (2021) 181–192.
[38]  G. D. Nord,  J. N. Nord,  H. Xu,  An investigation of the impact of organization size on data quality
issues, Journal of Database Management 16 (3) (2005) 58–71.
[39]  E. Zoto, D. Tole, The main factors that influence Data Quality in Accounting Information Systems,
International Journal of Science, Innovation and New Technology 1 (1) (2014) 1–8.
[40]  Hongjiang,  What  Are  the  Most  Important  Factors  for  Accounting  Information  Quality  and  Their
Impact on AIS Data Quality Outcomes?, Journal of Data and Information Quality 5 (4) (2015) 1–22.
[41]  T. Knauer, N. Nikiforow, S. Wagener, Determinants of information system quality and data quality in
management accounting, Journal of Management Control 31 (1-2) (2020) 97–121.
[42]  R. Carvalho, M. Lobo, M. Oliveira, A. R. Oliveira, F. Lopes, J. Souza, A. Ramalho, J. Viana, V. Alonso,
I.  Caballero,  J.  V.  Santos,  A.  Freitas,  Analysis  of  root  causes  of  problems  affecting  the  quality  of
hospital  administrative  data:   A  systematic  review  and  Ishikawa  diagram,  International  Journal  of
Medical Informatics 156 (September) (2021) 104584.
## 31

[43]  S. K. Cheburet,  G. W. Odhiambo-Otieno,  Process factors influencing data quality of routine health
management information system:  Case of Uasin Gishu County referral Hospital , Kenya, International
Research Journal of Public and Environmental Health 3 (6) (2016) 132–139.
[44]  J. S. Ancker, S. Shih, M. P. Singh, A. Snyder, A. Edwards, R. Kaushal, H. investigators, Root causes
underlying challenges to secondary use of data, in:  AMIA Annual Symposium Proceedings, 2011, pp.
## 57–62.
[45]  A. Karkouch, H. Mousannif, H. Al Moatassime, T. Noel, Data quality in internet of things:  A state-
of-the-art survey, Journal of Network and Computer Applications 73 (2016) 57–81.
[46]  S. Cho, I. Ensari, C. Weng, M. G. Kahn, K. Natarajan, Factors affecting the quality of person-generated
wearable device data and associated challenges:  Rapid systematic review, JMIR mHealth and uHealth
## 9 (3) (2021) 1–12.
[47]  R. Singh, K. Singh, A Descriptive Classification of Causes of Data Quality Problems in Data Ware-
housing, IJCSI International Journal of Computer Science Issues 7 (2) (2010) 41.
[48]  N. Zellal, A. Zaouia, An Examination of Factors Influencing the Quality of Data in a Data Warehouse,
IJCSNS International Journal of Computer Science and Network Security 17 (8) (2017) 161–169.
[49]  N. Zellal, A. Zaouia, An exploratory investigation of Factors Influencing Data Quality in Data Ware-
house, Proceedings of 2015 IEEE World Conference on Complex Systems, WCCS 2015 (2016).
[50]  N.  Zellal,  A.  Zaouia,  A  measurement  model  for  factors  influencing  data  quality  in  data  warehouse,
Colloquium in Information Science and Technology, CIST 0 (2016) 46–51.
[51]  M. Bagherzadeh, R. Khatchadourian, Going big:  A large-scale study on what big data developers ask,
ESEC/FSE 2019 - Proceedings of the 2019 27th ACM Joint Meeting European Software Engineering
Conference and Symposium on the Foundations of Software Engineering (2019) 432–442.
[52]  M. Alshangiti, H. Sapkota, P. K. Murukannaiah, X. Liu, Q. Yu, Why is Developing Machine Learning
Applications Challenging?  A Study on Stack Overflow Posts, International Symposium on Empirical
Software Engineering and Measurement (2019).
[53]  E. Badidi, N. El Neyadi, M. Al Saeedi, F. Al Kaabi, M. Maheswaran, Building a data pipeline for the
management and processing of urban data streams, Handbook of Smart Cities:  Software Services and
## Cyber Infrastructure (2018) 379–395.
[54]  O. Oleghe, K. Salonitis, A framework for designing data pipelines for manufacturing systems, Procedia
## CIRP 93 (2020) 724–729.
[55]  A. Ismail, H. L. Truong, W. Kastner, Manufacturing process data analysis pipelines:  a requirements
analysis and survey, Journal of Big Data 6 (1) (2019) 1–26.
[56]  R. Tardio, A. Mate, J. Trujillo, An Iterative Methodology for Defining Big Data Analytics Architectures,
IEEE Access 8 (2020) 210597–210616.
[57]  J.  Ronkainen,  A.  Iivari,  Designing  a  data  management  pipeline  for  pervasive  sensor  communication
systems, Procedia Computer Science 56 (1) (2015) 183–188.
[58]  M. Helu,  T. Sprock,  D. Hartenstine,  R. Venketesh,  W. Sobel,  Scalable data pipeline architecture to
support the industrial internet of things, CIRP Annals 69 (1) (2020) 385–388.
[59]  P. O’Donovan, K. Leahy, K. Bruton, D. T. O’Sullivan, An industrial big data pipeline for data-driven
analytics maintenance applications in large-scale smart manufacturing facilities, Journal of Big Data
## 2 (1) (2015) 1–26.
[60]  M. Frye, R. H. Schmitt, Structured Data Preparation Pipeline for Machine Learning-Applications in
Production, in:  17th IMEKO TC 10 and EUROLAB Virtual Conference “Global Trends in Testing,
Diagnostics & Inspection for 2030”, 2020, pp. 241–246.
[61]  T. Von Landesberger, D. W. Fellner, R. A. Ruddle, Visualization System Requirements for Data Pro-
cessing Pipeline Design and Optimization, IEEE Transactions on Visualization and Computer Graphics
## 23 (8) (2017) 2028–2041.
[62]  K. Goodhope, J. Koshy, J. Kreps, Building LinkedIn’s Real-time Activity Data Pipeline., IEEE Data
## Eng. Bull. 35 (2) (2012) 1–13.
[63]  J.  Tiezzi,  R.  Tyler,  S.  Sharma,  Lessons  Learned:  A  Case  Study  in  Creating  a  Data  Pipeline  using
Twitter’s API, in:  Systems and Information Engineering Design Symposium, SIEDS 2020, IEEE, 2020,
## 32

pp. 1–6.
[64]  M. Bhandarkar, AdBench:  A complete benchmark for modern data pipelines, Lecture Notes in Com-
puter Science (including subseries Lecture Notes in Artificial Intelligence and Lecture Notes in Bioin-
formatics) 10080 LNCS (2017) 107–120.
[65]  G. Van Dongen, D. Van Den Poel, Influencing Factors in the Scalability of Distributed Stream Pro-
cessing Jobs, IEEE Access 9 (2021) 109413–109431.
[66]  A. R. Munappy, J. Bosch, H. H. Olsson, On the Trade-off Between Robustness and Complexity in Data
Pipelines, in: International Conference on the Quality of Information and Communications Technology,
2021, pp. 401–415.
[67]  T. L. Alves, P. Silva, M. S. Dias, Applying ISO / IEC 25010 Standard to prioritize and solve quality
issues of automatic ETL processes, in:  IEEE International Conference on Software Maintenance and
Evolution, IEEE, 2014, pp. 573–576.
[68]  V. Theodorou, A. Abell, W. Lehner, Quality Measures for ETL Processes, in:  International Conference
on Data Warehousing and Knowledge Discovery, Springer, 2014, pp. 9–22.
[69]  Z.  E.  Akkaoui,  A.  Vaisman,  E.  Zim,  A  Quality-based  ETL  Design  Evaluation  Framework,  ICEIS  1
## (2019) 249–257.
[70]  M. Kuchnik, A. Klimovic, J. Simsa, V. Smith, G. Amvrosiadis, Plumber:  Diagnosing and Removing
Performance Bottlenecks in Machine Learning Data Pipelines,  in:  Proceedings of Machine Learning
and Systems, 2021, pp. 33–51.
[71]  R. Wang, D. Sun, G. Li, R. Wong, S. Chen, Pipeline provenance for cloud-based big data analytics,
Software - Practice and Experience 50 (5) (2020) 658–674.
[72]  L. Rupprecht, J. C. Davis, C. Arnold, Y. Gur, D. Bhagwat, Improving reproducibility of data science
pipelines through transparent provenance capture, Proceedings of the VLDB Endowment 13 (12) (2020)
## 3354–3368.
[73]  S. Grafberger, T. U. Munich, J. Stoyanovich, S. Schelter, Lightweight Inspection of Data Preprocessing
in Native Machine Learning Pipelines, in:  Conference on Innovative Data Systems Research (CIDR),
## 2021.
[74]  B. Bilalli, A. Abell ́o, T. Aluja-Banet, R. Wrembel, PRESISTANT: Learning based assistant for data
pre-processing, Data and Knowledge Engineering 123 (August) (2019) 101727.
[75]  C. Yan,  Y. He,  Auto-Suggest:  Learning-to-Recommend Data Preparation Steps Using Data Science
Notebooks, Proceedings of the ACM SIGMOD International Conference on Management of Data (2020)
## 1539–1554.
[76]  V.  Desai,  H.  A.  Dinesha,  A  Hybrid  Approach  to  Data  Pre-processing  Methods,  IEEE  International
Conference for Innovation in Technology, INOCON 2020 (2020) 1–4.
[77]  C.  Wohlin,  Guidelines  for  snowballing  in  systematic  literature  studies  and  a  replication  in  software
engineering, in:  M. Shepperd, T. Hall, I. Myrtveit (Eds.), Proceedings of the 18th International Con-
ference on Evaluation and Assessment in Software Engineering - EASE ’14,  ACM Press,  New York,
New York, USA, 2014, pp. 1–10.
[78]  ISO/IEC, Iso/iec 25012:2008 software engineering - software product quality requirements and evalua-
tion (square) - data quality model (2008).
[79]  D. S. Cruzes, T. Dyb ̊a, Recommended steps for thematic synthesis in software engineering, International
Symposium on Empirical Software Engineering and Measurement (7491) (2011) 275–284.
[80]  D. S. Cruzes, T. Dyb ̊a, Research synthesis in software engineering:  A tertiary study, Information and
## Software Technology 53 (5) (2011) 440–455.
[81]  D. Badampudi, C. Wohlin, K. Petersen, Software component decision-making:  In-house, OSS, COTS
or outsourcing - A systematic literature review, Journal of Systems and Software 121 (2016) 105–124.
[82]  A.  Font ̃ao,  A.  Dias-Neto,  D.  Viana,  Investigating  Factors  That  Influence  Developers’  Experience  in
Mobile Software Ecosystems, in:  Proceedings - 2017 IEEE/ACM Joint 5th International Workshop on
Software Engineering for Systems-of-Systems and 11th Workshop on Distributed Software Development,
Software Ecosystems and Systems-of-Systems, JSOS 2017, no. 2, 2017, pp. 55–58.
[83]  D. Cruzes, P. Runeson, Case studies synthesis:  a thematic , cross-case , and narrative synthesis worked
## 33

example, Empirical Software Engineering 20 (6) (2015) 1634–1665.
[84]  V. Golendukhina, V. Lenarduzzi, M. Felderer, What is Software Quality for AI Engineers?  Towards
a  Thinning  of  the  Fog,  in:  IEEE/ACM  1st  International  Conference  on  AI  Engineering  –  Software
Engineering for AI (CAIN), Vol. 1, 2022, pp. 1–9.
[85]  V. Lenarduzzi, F. Lomio, S. Moreschini, D. Taibi, D. A. Tamburri, Software Quality for AI: Where We
Are Now?, Lecture Notes in Business Information Processing 404 (August) (2021) 43–53.
[86]  S.  Mart ́ınez-fern ́andez,  J.  Bogner,  X.  Franch,  M.  Oriol,  J.  Siebert,  A.  Trendowicz,  A.  M.  Vollmer,
S.  Wagner,  Software  Engineering  for  AI-Based  Systems:  A  Survey,  ACM  Transactions  on  Software
Engineering and Methodology (TOSEM) 31 (2) (2022) 1–59.
[87]  M.  Usman,  R.  Britto,  J.  B ̈orstler,  E.  Mendes,  Taxonomies  in  software  engineering:   A  Systematic
mapping study and a revised taxonomy development method, Information and Software Technology 85
## (2017) 43–59.
[88]  S.  E.  Hove,  B.  Anda,  Experiences  from  conducting  semi-structured  interviews  in  empirical  software
engineering research, Proceedings - International Software Metrics Symposium 2005 (Metrics) (2005)
## 10–23.
[89]  B. Ray, V. Hellendoorn, S. Godhane, Z. Tu, A. Bacchelli, P. Devanbu, On the naturalness of buggy
code, Proceedings - International Conference on Software Engineering 14-22-May- (2016) 428–439.
[90]  G. Ajam, C. Rodr, U. Sydney, API Topics Issues in Stack Overflow Q&As Posts:  An Empirical Study
## (2020).
[91]  A. Trendowicz, Factors Influencing Software Development Productivity-State-of-the-Art and Industrial
Experiences Related papers, in:  Advances in Computers, vol. 77 Edition, 2009, pp. 185–241.
[92]  M. J. Islam, G. Nguyen, R. Pan, H. Rajan, A comprehensive study on deep learning bug characteristics,
in:  Proceedings of the 2019 27th ACM Joint Meeting on European Software Engineering Conference
and Symposium on the Foundations of Software Engineering, 2019, pp. 510–520.
[93]  R. Zhang,  W. Xiao,  H. Zhang,  Y. Liu,  H. Lin,  M. Yang,  An empirical study on program failures of
deep learning jobs, Proceedings - International Conference on Software Engineering (2020) 1159–1170.
[94]  S.  Kandel,  A.  Paepcke,  J.  M.  Hellerstein,  J.  Heer,  Enterprise  data  analysis  and  visualization:   An
interview  study,  IEEE  Transactions  on  Visualization  and  Computer  Graphics  18  (12)  (2012)  2917–
## 2926.
[95]  A.  Rahman,  E.  Farhana,  An  Empirical  Study  of  Bugs  in  COVID-19  Software  Projects,  Journal  of
Software Engineering Research and Development 9 (3) (2021).
[96]  C.  Samantra,  S.  Datta,  S.  S.  Mahapatra,  Interpretive  structural  modelling  of  critical  risk  factors  in
software engineering project, Benchmarking:  An International Journal 23 (1) (2016) 2–24.
## 34