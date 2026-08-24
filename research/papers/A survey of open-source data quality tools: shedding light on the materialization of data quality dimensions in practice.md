

A survey of open-source data quality tools: shedding light on the
materialization of data quality dimensions in practice
## Vasileios Papastergios
## Aristotle University
## Greece
papastva@csd.auth.gr
## Anastasios Gounaris
## Aristotle University
## Thessaloniki, Greece
gounaria@csd.auth.gr
## ABSTRACT
Data Quality (DQ) describes the degree to which data characteristics
meet requirements and are fit for use by humans and/or systems.
There are several aspects in which DQ can be measured, called
DQ dimensions (i.e. accuracy, completeness, consistency, etc.), also
referred to as characteristics in literature. ISO/IEC 25012 Standard
defines a data quality model with fifteen such dimensions, setting
the requirements a data product should meet. In this short report,
we aim to bridge the gap between lower-level functionalities offered
by DQ tools and higher-level dimensions in a systematic manner,
revealing the many-to-many relationships between them. To this
end, we examine 6 open-source DQ tools and we emphasize on
providing a mapping between the functionalities they offer and
the DQ dimensions, as defined by the ISO standard. Wherever
applicable, we also provide insights into the software engineering
details that tools leverage, in order to address DQ challenges.
## 1  INTRODUCTION
In the modern data-driven era, the importance of Data Quality (DQ)
has escalated, as organizations increasingly rely on data to drive
strategic decisions and operations.High-qualitydata are essential
for ensuring the integrity of analytics, empowering Machine Learn-
ing (ML) models and supporting Business Intelligence (BI) efforts.
Poor data quality can lead to costly, misguided decisions, opera-
tional inefficiencies, and a loss of trust among stakeholders or end
users. Managing DQ effectively becomes even more crucial as the
volume of data collected, stored and processed grows exponentially.
In response to these challenges, a wide variety of DQ tools have
been developed, providing solutions that help organizations en-
hance their DQ capabilities. However, despite the great amount of
effort devoted to address DQ challenges, there still exist significant
discrepancies in (i) the terminology used to describe these solu-
tions and (ii) the alleged connection of these solutions with the DQ
dimensions.
In particular, there are functionalities that are common among
the tools; yet different names are employed to describe them. For
example, ensuring that all records of a dataset satisfy some kind of
restriction can be found as “conformance", “compliance” or even “va-
lidity”; all referring to the same software engineering functionality.
In addition, there are cases where the same term can be interpreted
to different functionality in different tools. “Completeness”, for ex-
ample, may refer to the number of records in a dataset in some tools,
while associated with the presence of NULL values in others. Even
the DQ dimensions are not always named under the same terms.
For instance, the words “currentness”, “freshness”, “recency” and
“timeliness” can all be found in literature and tools’ documentation,
referring to roughly the same DQ dimension.
Figure 1: The data quality characteristics as defined in
## ISO/IEC 25012 [3].
To date, there has not been much work conducted in terms of
connecting the low-level functionalities provided by the tools with
the dimensions they are closely related to. In simple words, it seems
that a bridge is missing between the dimensions defined by some
theoretical DQ model and the way real-world implementations
materialize them taking into consideration that lower-level func-
tionalities are related to higher-level dimensions in a many-to-many
manner.
In this paper, we aim to bridge this gap. We investigate six widely-
spread open-source DQ tools. We opt for using ISO/IEC 25012 Stan-
dard [3] as the unifying theoretical basis of our investigation. This
standard defines a DQ model with 15 dimensions (characteristics),
i.e, requirements that a data product has to meet. The quality char-
acteristics in the standard are shown in Figure 1. Overall, our work
seeks to offer a concise overview of the current landscape in DQ
management, as represented by the investigated tools. In particular,
our main contribution is twofold and can be summarized in the
following:
(1)We provide a comprehensive and unifying listing of all the
different functionalities offered under different names and
in multiple variations in 6 widely used open-source DQ
tools. Wherever applicable, we also dive into engineering
insights regarding the implementation of these functionali-
ties.
(2)Taking a step further, we focus on the connection between
existing solutions and DQ dimensions. More specifically, we
present a mapping between the DQ low-level functionalities
observed in the tools and the standard’s dimensions that
are closely associated with them.
arXiv:2407.18649v1  [cs.DB]  26 Jul 2024

Vasileios Papastergios and Anastasios Gounaris
The rest of our work is structured as follows. In Section 2, we
summarize the methodology. In Section 3, we present the findings of
our investigation and introduce the mapping between DQ solutions
and dimensions. Section 4 provides information about related work
and how it compares with ours. Finally, in Section 5, we conclude
providing also insights into future work.
## 2  OUR METHODOLOGY
In this section, we explain our approach in terms of conducting
our survey. We begin with selecting representative open-source
DQ tools in line with other existing selection, e.g., [4], enriched
with tools we are aware of, such as Apache Griffin [1]. The final
list comprises 6 widely-used, open-source andactiveprojects. To
the best of our knowledge, there are not other tools that meet these
specifications and are dedicated to DQ management. The tools are:
(1) Deequ, (2) dbt Core, (3) MobyDQ, (4) Great Expectations (GX),
(5) Soda Core and (6) Apache Griffin.
The second step of our investigation has been to emphasize on
the low-level functionalities offered by each tool. The challenging
part of this step has been to bypass the widely diverse terminology
and focus on the core functionality, grouping together similar func-
tionalities from different tools. To accomplish this, we have dived
into the source code of these tools, in combination with study-
ing their official documentation, setting them up locally on our
machines and experimenting with simple examples.
Based on the recorded functionalities, we, then, proceed to reveal-
ing the connections between the recorded functionalities and the
DQ dimensions, as defined by the ISO/IEC 25012 standard. The utter
goal of such an approach has been to provide useful insights into
the way DQ tools available at current time address and materialize
these dimensions.
## 3  DQ FUNCTIONALITIES AND MAPPINGS
The findings of our investigation are summarized in Table 1. The
second column contains all the different low-level functionalities
(i.e., data checks) that were found in the tools examined. The func-
tionalities are grouped into more general categories, listed in the
first column. The next six columns represent the ISO/IEC 25012
dimensions that are affected by at least one low-level functionality.
Note that, out of the fifteen dimensions defined by the standard, we
were able to identify six of them as associated with the recorded
functionalities, the ones referring to the so-called inherent data
quality. We use a•to denote that a low-level functionality is closely
related to a specific dimension. The rest six columns stand for the
examined DQ tools. For each recorded functionality, we use a✓
to imply that it isdirectlysupported by a specific tool. Note that
we only mark the respective cell if the low-level functionality is
squarelysupported by some built-in check of the tool. This does
not necessarily imply that the functionality cannot be achieved
by other tools, as well, in an indirect or user-defined way. In the
subsections that follow, we provide details about the functionality
categories, shifting our emphasis towards their connection with
the DQ dimensions.
We note that a comprehensive list of theexact namesof the
functions provided by the tools for each low-level functionality can
be found in Table 2 in the appendix. Some names are hyphenated
to fit in the line width. In these cases, the actual name does not
contain a hyphen.
Anomaly Detection.Anomaly detection (AD) is closely related
to the accuracy dimension. An anomaly is an erroneous and/or un-
expected value that does not represent the truth (actual value) of the
intended attribute; as such, it violates the accuracy definition pro-
vided by the standard. AD functionality is offered by Deequ and is
based on previously saved metrics for the same or similar data, per-
forming comparisons with some kind of user-defined threshold(s).
The tool has a wide range of built-in (heuristic, non-ML) anomaly
detection strategies. The strategies cover both absolute and relative
metrics, and offer support for batch (mainly) and streaming data.
All AD strategies can be combined with previously saved metrics.
For example, given a saved metric about the number of rows in a
dataset, an AD check could be to examine whether the saved size
and the currently computed size of the dataset exhibit a difference
that falls inside a range (either in absolute or relative value).
Statistic Measures.The computation of statistic measures (data
profiling) on single columns is a common low-level functionality
found in the majority of the examined tools. Minimum and maxi-
mum values, sum, standard deviation (std), etc. are examples of such
measures. Deequ, GX and Soda Core directly offer these checks as
built-in functionalities, while the rest of the tools offer indirect ways
to the user to define their own checks that fall into this category.
In the general case, the user defines a threshold and a comparison
operator. The tool is, then, responsible for executing the test. The
general formula that can be derived is the following:
## 푚{>,<,≥,≤,=,≠}푇,
where푚is a computed statistic measure and푇a user-defined
numeric threshold. The check outcome is binary, i.e. pass or fail.
These low-level functionalities are closely related to three DQ
dimensions: accuracy, consistency and compliance. In particular,
accuracy is strongly connected, since statistic measures usually
encapsulate the true value of the intended attribute. For exam-
ple, a column representing product quantities is expected to have
non-negative (푚푖푛=0) values, or else data accuracy is impaired.
Consistency is also connected, because measures such as mean,
median and std take into account not only a single value, but also
the coherence of it with other data as well in a specific context.
Compliance is also relevant, since the use of thresholds for com-
puted measures implies the presence of (physical or business) rules
the data have to comply with.
From an implementation perspective, all tools leverage SQL-like
queries, which are executed at the data sources to obtain the desired
statistic values. An interesting implementation detail comes from
Soda Core and it has to do with the way standard deviation and vari-
ance are computed. There are two variations provided, which use
either the complete dataset or just a sample of it, respectively. Under
the hood, again, the tool leverages thepopandsampfunctionality
provided by SQL, in order to run queries on the data sources.
Column-level validity.Another family of checks provide low-
level functionalities for validating column values in a column-level
scope. Several variations of these checks were found throughout our
investigation. In particular, dbt Core offers a check that examines
whether values in a column are not all the same. Given an examined

A survey of open-source data quality tools: shedding light on the materialization of data quality dimensions in practice
DQ dimensionsDQ tools
CategoryLow-level functionality
## Accuracy
## Completeness
## Consistency
## Currentness
## Accessibility
## Compliance
## Deequ
dbt Core
MobyDQ
## GX
## Soda Core
## Apache Griffin
Anomaly Detection(01) anomaly detection based on comparison with saved statistics•✓
Statistic Measures(02) max / min / mean / median / std / sum / z-score / entropy of values of a column•••✓✓✓
Column-level scoped validity
(03) values in a column are not all the same•••✓
(04) values in a column are sequential / increasing / decreasing•••✓✓
## Distribution / Quantiles
(05) distribution histogram of values of a column•••✓
(06) (approximate) quantile(s) of distribution•••✓✓✓
(07) changes in distribution of the values of a column, based on historic data•••✓
Record-level scoped validity
(08) a column takes values from a specific range or set••✓✓✓
(09) string values in a column satisfy length restrictions••✓✓
(10) compliance with a given SQL expression•••✓✓✓✓
(11) fraction of rows that comply with a given regex•••✓✓✓
Cross-column checks
(12) comparison between respective values of two different columns•••✓
(13) Pearson correlation between two columns•••✓
(14) mutual information between two columns•••✓
Cross-row checks(16) range columns have not overlapping values•••✓
Cross-table checks(17) referential integrity•••✓✓
Presence / Availability(18) presence of at least one value in a column•••✓
Number of rows / columns
(19) number of rows in a column or dataset•✓✓✓
(20) number of distinct rows in a column (cardinality)•✓✓✓
(21) number of columns in a dataset•✓✓✓
(22) number of rows in a column or dataset, compared to another dataset•✓✓✓
(23) cardinality comparison of two different columns of different datasets•✓
Difference between datasets(24) difference between a measure computed in a source and a target dataframe•✓✓
Matching between datasets(25) matching between a source and a target dataset••••✓✓✓
NULL values(26) number / fraction of non-NULL values•••✓✓✓✓✓
Distinct & Unique values
(27) number / fraction of distinct values•✓✓
(28) approximate number of distinct values••✓
(29) fraction of unique values over total number of values or only distinct••✓✓✓✓
## Schema
(30) distribution of data types of the column values••✓✓
(31) presence / absence / order of columns•••✓✓
(32) values in a column are of specific data type••✓✓
Recentness(33) timestamp column is at least as recent as a given time interval•✓✓✓
## Accuracy
## Completeness
## Consistency
## Currentness
## Accessibility
## Compliance
## Deequ
dbt Core
MobyDQ
## GX
## Soda Core
## Apache Griffin
Table 1: A catalog of the low-level functionalities (column 2) offered by the examined DQ tools, grouped into general categories
(column 1). Each low-level functionality is associated with the dimension(s) they are closely related to (columns 3-8) and the
tools they are directly supported by (columns 9-14).

Vasileios Papastergios and Anastasios Gounaris
column with values, this check can be summarized in the following
clause:
## ∃푣(푖)≠푣(푗),  푖, 푗∈ [0, 푁),
where푣(푖)and푣(푗)denote two values in the column at index
푖and푗respectively and푁denotes the total number of values in
the examined column. The outcome of the check is binary (pass
or fail). Other variations of this check, provided by dbt Core and
GX, take it a step further by examining whether the values have a
specific ordering, rather than being just different. More specifically,
these checks require that the values are sequential, increasing or
decreasing. The math formula for this check can be summarized in
the following
## 푣(푖) {>,<,≥,≤}푣(푖−1),∀푖∈ (0, 푁)
where푣(푖)and푣(푖−1)are two consecutive values in the column,
at indices푖and푖−1respectively and푁is the total number of
values in the examined column. The outcome of the check is, again,
binary.
Accuracy is closely related to this functionality because, in case
the check fails, it can be assumed that the values stored in the data
are not the true ones. Consistency is also affected, since values
violating ordering or inequality are not coherent with the rest of
the data, in a specific context of use. Furthermore, there must be
some convention, enforcing that the values have to be different. As a
result, this category of low-level functionalities is closely connected
with compliance, as well. Regarding implementation, all the above
are executed in some form of SQL queries with small differences in
each tool.
Distribution / Quantiles.Concerning the values of a specific
column, Deequ offers built-in functionality that enables the user to
query on the distribution of the column values. More specifically,
the tool constructs a distribution object with a single pass on the
data. The latter stores distribution information that can be accessed
and checked by the user, using complex constraints. The supported
functionalities by Deequ include both absolute and ratio checks
on the distribution values. Regarding implementation, callback
functions can be passed as arguments by the user. These functions
can be called either on every element or on an aggregated value
of the distribution object. The affected dimensions are accuracy,
consistency and compliance for the same reasons as above.
Similarly, there are checks that measure the distribution quantiles
of a column’s values. Deequ provides three flavors of the quantile
distribution check. The first flavor computes exact percentiles. The
second flavor [2] computes an approximate quantile, based on the
Apache Spark’ssql.catalystrelative implementation. The third
flavor leverages KLL Sketching [7]. After quantile computation, the
user can define and execute threshold-based checks. Nevertheless,
the distribution of values in current time may not be valuable
information alone, but only when compared with the distribution of
the same attribute in the past. Soda Core comes with an interesting
low-level functionality about the distribution change of a column’s
values, based on some saved distribution snapshot.
Record-level validity.Apart from the value’s distribution, sev-
eral tools provide low-level functionalities to enable the user check
that values in a column are limited to a specific set or range of
allowed values. Accuracy is directly affected by this check, due to
the fact that non-allowed values are not truthfully representing the
modeled domain. Compliance is also affected, since a regulation is
implied, imposing a set or range of allowed values.
Regarding software engineering implementation, Dbt Core offers
support for both inclusive and exclusive ranges. The check can be
formally expressed with the following:
## ∀푖∈ [0, 푁), 푣(푖) ∈S
## 푎푙푙표푤푒푑
## ,
where푁is the total number of values in the examined column,푣(푖)
is the value at index푖andS
## 푎푙푙표푤푒푑
is the set (or range) of allowed
values. It also supports a where-clause to execute the check only on
a subset of the total records. Other variations, found in GX, are (i)
checking that themost commonvalue is contained in a user-defined
set and (ii) involving two columns at a time, examining whether
the pair of values are contained in an accepted set of pairs.
Being able to define in advance all different alternatives con-
tained in an accepted range/set is not always the case, however. For
that purpose, GX and Soda Core provide functionalities such as ver-
ifying length constraints on strings or digit restrictions on numbers.
These checks can be considered a generalization of the previous
cases, where the allowed values are all possible alternatives. From
an engineering point of view, the tools opt for selecting violating
records, using some form of SQL queries. Enforcing compliance
with some SQL-predicate or regex are more generic forms these
low-level functionalities can take. Note that checking regex using
SQL is enabled through thematch_recognizeoperator.
Cross-column checks.Up to that point, we have examined
checks that operate on single columns or combinations of them.
However, there are cases where the objective is to enforce some
kind of constraint that involves more than one column, for a spe-
cific record of data. Comparisons between respective values of two
different columns within the same record is an example of such
functionality, offered by GX. The tool leverages SQL queries that
capture records violating the check. The outcome is a set violating
records (S
## 푣푖표푙
) and can be formally expressed as following:
## S
## 푣푖표푙
## ={푟
## 푖
## :푟
## 푖
## .푎<푟
## 푖
## .푏},
where푟
## 푖
is a record in the dataset with attributes푎and푏. The rule
that is checked between the two values can be any comparator or,
in general, any boolean callback function that takes as input the
two values and outputs a boolean value.
This check is closely related to three dimensions, as previosuly:
accuracy, because a violating record does not represent the true
value; consistency, since a violating value is not coherent with the
rest values; compliance, due to the presence of the validation rule.
Other low-level functionalities in this category are checking restric-
tions on either the correlation or the mutual information between
two different columns, with straightforward implementations.
Cross-row checks.Another type of low-level DQ functional-
ity relates to checks regarding multiple rows together. The check
ensures that columns representing range information do not have
illegally overlapping values, where “illegally” can be user defined.
Note that the check requires the existence of two columns, one
representing the lower and one the upper bound of the range. The
tool sorts the data based on the lower bound column and, then,
leverages theLEADSQL function to access the current and next

A survey of open-source data quality tools: shedding light on the materialization of data quality dimensions in practice
row at the same time. There are options that can be set to allow,
disallow or require gaps between ranges.
Cross-table checks.Ensuring referential integrity between a
primary key column in a dataset and a foreign key column in an-
other dataset are low-level functionalities that fall into this category.
To the best of our knowledge, no automation or discovery capabili-
ties were found. That means the user has to define themselves the
columns to be checked for referential integrity.
Value presence / Availability.Dbt Core is the only tool of
the ones we examined that offers such low-level functionality. The
check is as simple as examining whether there is at least one record
(value) in the given table (column). The functionality is closely
related to the accessibility dimension, since a non-present record
or value is obviously inaccessible by the users, in a specific context
of use.
Number of rows and cardinality.The next family of checks
relate closely to the completeness dimension of the DQ model.
In particular, we encountered two variations of checks about the
number of rows in a column or dataset. The first variation verifies
constraints on the number of rows, without a reference column or
dataset. The user can define either simple or more elaborate size
constraints in the form of Spark functions (e.g.,size > 5 && size
< 10). GX, on the other hand, offers an additional check for the
number ofcolumnsof a dataset.
The second variation measures the number of rows, relatively
to another column or dataset. It is essentially a completeness check
based on a gold standard. The formal expression is:
## |푛|
## |푛
## 푔표푙푑
## |
## ≥푇,
where|푛|is the number of rows in the currently examined column
or dataset,|푛
## 푔표푙푑
|is the number of rows in the gold standard and
푇some user-defined threshold in the range[0,1]. Dbt Core sup-
portsGROUP BYoperations that can be executed before checking
completeness. Soda Core can execute checks only for row count
equality. A slightly different completeness check measures the car-
dinality (i.e. number of distinct values), instead of the total row
count. This implementation is, again, based on a gold standard:
## |푑|
## |푑
## 푔표푙푑
## |
## ≥푇,
where|푑|is the number of distinct values in the currently examined
column,|푑
## 푔표푙푑
|is the number of distinct values in the gold standard
and푇some user-defined threshold in the range[0,1]. Note that
cardinality is computed with appropriate SQL queries.
Difference between datasets.Completeness, however, may
not always be perfectly depicted by just the number of rows or
distinct values that a column contains. More complex checks may
be required, executed both in the available dataset and in the gold
standard, in order to assess the results in a comparative way with
regard to the reference dataset. MobyDQ and Soda Core offer a
more generic, expressive completeness checks. In particular, the
user can compute a measure in both the source and target datasets
and then get their difference:
## 푚
## 푡
## −푚
## 푠
## 푚
## 푠
## ∗100,
where푚
## 푡
and푚
## 푠
is the computed value of the metric in the source
and target dataset respectively. The result is a percentage represent-
ing the difference (in terms of the metric) between the two datasets.
Soda core offers similar functionality, with the additional support
for more expressive checks of metrics (not only percentage). It also
enables the user to define their own query for the source and target
datasets in the form of SQL expressions.
Matching between datasets.A similar low-level functionality
measures thematchingbetween a source and a target dataset. In
Deequ, the comparison between them can be made in a granularity
level of respective columns, defined via a column mapping. The re-
sult is the fraction of matching:
## |푣
## 푚푎푡푐ℎ
## |
## |푣
## 푠
## |
## ≥푇,where|푣
## 푚푎푡푐ℎ
|is the
number of values that match between the two datasets,|푣
## 푠
|is the
number of values in the source dataset and푇is some user-defined
threshold in the range(0,1). Dbt Core provides the same function-
ality but supports only full (no partial) matching. Deequ and dbt
Core use traditional SQL joins to find the number of matching and
mismatching records. Apache Griffin, on the other hand, operates
on two Spark dataframes.
Mapping this family of low-level functionalities to the DQ di-
mensions can be challenging. More specifically, assuming that the
reference dataset plays the role of gold standard, this check is closely
related to accuracy and the source dataset is, actually, the source of
ground truth. At the same time, counting the number of mismatched
records that exist in the source but not in the target implies a com-
pleteness check, based, again, on a gold standard. Furthermore, one
could argue that currentness is relevant, as well, assuming that data
are supposed to flow from source to target. As a result, measuring
the fraction of records that appear in the source but not in the target
gives an idea about delayed data, imposing freshness issues on the
target end. Last but not least, missing data at the target dataset may
denote that they are not accessible by the end user (accessibility),
since they are not present.
NULL values.A NULL value denotes an absent value and, thus,
affects accuracy, since the true value of the intended attribute fails to
be represented. At the same time, a missing value is not available for
the end user, thus accessibility is also impaired. Moreover, a dataset
with missing values is probably incomplete, making completeness
an affected dimension, as well.
From an implementation point of view, different variations of
this functionality were found throughout our investigation. Some of
them check for total completeness, while others are flexible enough
to enable fractional constraints (e.g.,completeness > 0.9). The
completeness factor can be formally expressed as following:
## C=
## |푛
## 푚푖푠푠
## |
## |푛|
## ,
where|푛
## 푚푖푠푠
|denotes the number of missing (NULL) values in the
column and|푛|the total number of values. Some other variations
check completeness on the combination of multiple columns, using
either conjuction or disjunction to connect them. Special variations
were found for string data. Soda Core and Apache Griffin allow the
user to define regex and SQL-like expressions respectively to define
what “nullness” means in their own use-case.
Distinct & Unique values.Distinct values are considered those
that appearat leastonce. For example, in[푎, 푎,푏]the distinct values
are푎,푏. Unique values are considered those that appearexactly

Vasileios Papastergios and Anastasios Gounaris
once. For example, in[푎, 푎,푏]the only unique value is푏. Unique
and distinct values are strongly connected with duplicate data,
i.e. values that appear more than once, although they should not.
Duplicate values may be deemed as not representing the truth of
the intended attribute, so they impair accuracy. The true value is
missing, thus it is not available for the user, affecting accessibility
as well [8]. Measuring distinct and unique values was observed in
several variations.
The next big family of checks involves measuring distinct and
unique values in several variations. Deequ offers three flavors of
this metric. The two of them are exact;
## |푢푛푖푞푢푒|
## |푡표푡푎푙|
(uniqueness) and
## |푢푛푖푞푢푒|
## |푑푖푠푡푖푛푐푡|
(unique value ratio). Uniqueness can be checked either
on single columns or combinations of them. Although there is a
reserved primary key check, it offers no extra functionality, since
it just checks for uniqueness of the specified column(s). The third
flavor offered by Deequ computes an approximation of the distinct
values, using HyperLogLog++ sketching. Dbt Core offers built in
test only for complete uniqueness, both for single columns and
combinations of them. SQL is, again, what tools leverage behind
the scenes.
Schema-related checks.Low-level functionalities in this cate-
gory include applying constraints on the data types’ distribution
of a column values, ensuring values in a column are of specific
data types and columns exist and are placed in the expected order.
Checking for schema-level or data-types discrepancies is strictly
connected with both compliance and accessibility dimensions, since
parsing wrong data formatting can make data inaccessible to end
users. In Deequ, the check’s result is a histogram with the data
types distribution. It allows filtering both by relative and absolute
fractions. Soda Core implements schema-level checks, including
presence, absence or order of a column in a dataset. It can also be
checked whether a column has the expected data type. An interest-
ing implementation detail is the fact that the column names defined
by the user can contain wildcards, such as % or★, depending on
the wildcards that are supported in each data source. GX provides
a dedicated check for date data.
Recentness.Lastly, we subsume here various low-level func-
tionalities that are directly related to the currentness dimension. In
particular, the checks operate on a column that contains timestamps
and tries to enforce that all values in the column are at least as
recent as a given time interval:∀푖∈ [0, 푁), 푡
## 푖
## +푡
## 푖푛푡푒푟푣푎푙
## ≥푡
## 푐푢푟푟푒푛푡
## ,
where푁is the total number of values in the timestamp column,
## 푡
## 푖
is the timestamp value at index푖,푡
## 푖푛푡푒푟푣푎푙
is the user-defined
timeliness interval and푡
## 푐푢푟푟푒푛푡
is the current system time.
Different variations of this functionality were found. The main
difference among them has to do with the way the reference times-
tamp is considered. When current timestamp is considered, we talk
about “freshness” of data. When the latest timestamp of a source
dataset is used, we talk about “latency”, depicting how quickly data
flow from target to source, regardless of current timestamp.
## 4  RELATED WORK
DQ management has been an active research area. Ehrlinger &
Woß [5] have conducted a large-scaled systematic survey on 13 DQ
tools, including both open-source and commercial ones. Among
other contributions, they provide insights regarding the DQ metrics
and dimensions supported by the tools they examined. There are
significant differences in our approaches, since they highlight data
profiling and automated DQ monitoring as focal points of their se-
lection (i.e., inclusion and exclusion) criteria. On the other hand, we
do not impose such strict criteria, resulting to different and newer
tools. Among the 6 tools examined in the current survey and the
13 tools discussed in [5], only two of them (MobyDQ and Apache
Griffin) are in common. The main point our approach differentiates
is the thorough gathering, grouping and mapping oflow-levelDQ
functionalities to DQ dimensions, focusing more on engineering
aspects, closer to the programming implementation, while the au-
thors in [5] opt for a detailed, yet more abstract classification of
functionalities. Goknin et al. [6] study the problem of DQ mea-
surement from the scope of CPS and IoT (Industry 4.0), providing
insights, taxonomies and paradigms about various aspects of how
DQ mechanisms are adapted into industrial settings. Laranjeiro et
al. [8] on the other hand provide a mapping, with the difference
that they start from DQ problems towards dimensions, while we
opt for starting from DQ solutions being used in real-life scenarios.
The main reason for this choice has been to attempt to capture the
materialization of DQ dimensions in practice.
## 5  CONCLUSION AND FUTURE WORK
In this report, we have investigated six open-source DQ tools in
terms of the low-level functionalities they offer. We comment on
the implementation of these functionalities, mapping them with the
higher-level DQ dimensions they are closely related to. Regarding
future steps, more research effort should be devoted to identify the
connection between theoretical models of DQ and how challenges
are solved in practice with a view to extracting quantifiable DQ
metrics in a more systematic way.
Bypassing the discrepancies in terminology and standardizing
the DQ management implementation aspects would be of great
benefit in designing DQ solutions that address modern challenges
effectively. Last but not least, the vast majority of open-source tools
to date do not deal with streaming data, and thus, adapting DQ
solutions to online settings should attract more attention.
## REFERENCES
[1]   2024. Apache Griffin.   https://griffin.apache.org/
[2]2024. Deequ’s Approximate Quantiles.   https://github.com/awslabs/deequ/blob/
master/src/main/scala/com/amazon/deequ/analyzers/ApproxQuantile.scala#L50
[3]2024. ISO/IEC 25012.  https://iso25000.com/index.php/en/iso-25000-standards/iso-
## 25012
[4]2024.   Open-source data quality tools.https://atlan.com/open-source-data-
quality-tools/
[5]Lisa Ehrlinger and Wolfram Wöß. 2022. A Survey of Data Quality Measurement
and Monitoring Tools.Frontiers in Big Data5 (2022).   https://doi.org/10.3389/
fdata.2022.850611
[6]Arda Goknil, Phu Nguyen, Sagar Sen, Dimitra Politaki, Harris Niavis, Karl John
Pedersen, Abdillah Suyuthi, Abhilash Anand, and Amina Ziegenbein. 2023.  A
Systematic Review of Data Quality in CPS and IoT for Industry 4.0.ACM Comput.
Surv.55, 14s, Article 327 (jul 2023), 38 pages.   https://doi.org/10.1145/3593043
[7]Zohar Karnin, Kevin Lang, and Edo Liberty. 2016. Optimal Quantile Approximation
in Streams. In2016 IEEE 57th Annual Symposium on Foundations of Computer
Science (FOCS). 71–78.  https://doi.org/10.1109/FOCS.2016.17
[8]Nuno Laranjeiro, Seyma Nur Soydemir, and Jorge Bernardino. 2015. A Survey on
Data Quality: Classifying Poor Data. In2015 IEEE 21st Pacific Rim International
Symposium on Dependable Computing (PRDC). 179–188.  https://doi.org/10.1109/
## PRDC.2015.41

A survey of open-source data quality tools: shedding light on the materialization of data quality dimensions in practice
Low-level functionalityFunction name(s)
anomaly detection based on comparison with saved statisticsDeequ (isNewestPointNonAnomalous)
max / min / mean / median / std / sum / z-score of values of
a column
Deequ (hasMin,hasMax,hasMean,hasSum,hasStandardDeviation), Soda Core (avg,max,min,sum,stdev,stdev_pop,stdev_samp,variance,
var_pop,var_samp),  GX  (expect_column_max_to_be_between,expect_column_mean_to_be_between,expect_column_median_to_be_-
between,expect_column_min_to_be_between,expect_column_stdev_to_be_between,expect_column_sum_to_be_between,expect_-
column_value_z_scores_to_be_less_than,expect_column_values_to_be_between,expect_multicolumn_sum_to_equal)
values in a column are not all the samedbt Core (not_constant)
values in a column are sequential / increasing /decreasingdbt Core (sequential_values), GX (expect_column_values_to_be_increasing,expect_column_values_to_be_decreasing)
distribution histogram of values of a columnDeequ (Maximum,Minimum,Mean,Sum)
(approximate) quantile(s) of distributionDeequ (hasExactQuantile,hasApproxQuantile,ApproxQuantiles,kllSketchSatisfies), Soda Core (percentile), GX (expect_column_-
quantile_values_to_be_between)
changes in distribution of the values of a column, based on
historic data
## Soda Core (distribution)
a column takes values from a specific range or setDeequ   (isContainedIn,)   dbt   Core   (accepted_values,not_accepted_values,accepted_range),   GX   (expect_column_distinct_-
values_to_be_in_set,expect_column_distinct_values_to_contain_set,expect_column_distinct_values_to_equal_set,expect_-
column_most_common_value_to_be_in_set
## ,expect_column_pair_values_to_be_in_set,expect_column_values_to_be_in_set,
expect_column_values_to_not_be_in_set)
values in a column satisfy length restrictionsSoda Core (avg_length,min_length,max_length), GX (expect_column_value_lengths_to_be_between,expect_column_value_lengths_-
to_equal)
compliance with a given SQL expressionDeequ (satisfies), dbt Core (expression_is_true), MobyDQ (validity), Apache Griffin (SparkSQL)
fraction of rows that comply with a given regexDeequ  (hasPattern),  Soda  Core(invalid_count,invalid_percent),  GX  (expect_column_values_to_match_like_pattern,expect_-
column_values_to_match_like_pattern_list,expect_column_values_to_match_regex,expect_column_values_to_match_regex_-
list,expect_column_values_to_not_match_like_pattern,expect_column_values_to_not_match_like_pattern_list,expect_-
column_values_to_not_match_regex,expect_column_values_to_not_match_regex_list)
comparison  between  respective  values  of  two  different
columns
GX (expect_column_pair_values_a_to_be_greater_than_b,expect_column_pair_values_to_be_equal)
Pearson correlation between two columnsDeequ (hasCorrelation)
mutual information between two columnsDeequ (hasMutualInformation)
entropy / relative entropy of a column’s valuesDeequ (hasEntropy), GX (expect_column_kl_divergence_to_be_less_than)
range columns have not overlapping valuesdbt Core (mutually_exclusive_ranges)
referential integritydbt Core (relationships,relationships_where), Soda Core (reference)
presence of values in a columndbt Core (at_least_one)
number of rows/columns in a column or datasetDeequ  (hasSize),  Soda  Core  (row_count),  GX  (expect_table_column_count_to_be_between,expect_table_column_count_to_equal,
expect_table_row_count_to_be_between,expect_table_row_count_to_equal)
number of rows in a column or dataset, compared to another
dataset
dbt Core (equal_rowcount,fewer_rows_than), Soda Core (cross), GX (expect_table_row_count_to_equal_other_table)
cardinality comparison of two different columns of different
datasets
dbt Core (cardinality_equality)
difference between a measure computed in a source and a
target dataframe
MobyDQ (completeness), Soda Core (reconciliation)
matching between a source and a target datasetDeequ (doesDatasetMatch), dbt Core (equality), Griffin (accuracy)
fraction of non-NULL valuesDeequ (hasCompleteness, isComplete, areComplete, areAnyComplete, haveAnyCompleteness), dbt Core (not_null,not_empty_-
string,not_null_proportion),  Soda  Core  (missing_count,missing_percent),  GX  (expect_column_values_to_be_null,expect_-
column_values_to_not_be_null), Apache Griffin (completeness)
number / fraction of distinct valuesDeequ (hasNumberOfDistinctValues,hasDistinctness), Soda Core (duplicate_count,duplicate_percent)
approximate number of distinct valuesDeequ (hasApproxCount Distinct)
fraction of unique values over total number of values or only
distinct ones
Deequ  (hasUniqueness,isUnique,isPrimaryKey,hasUniqueValueRatio),  dbt  Core(unique,unique_combination_of_columns),  GX
(expect_column_proportion_of_unique_values_to_be_between,expect_column_unique_value_count_to_be_between,expect_-
column_values_to_be_unique,expect_compound_columns_to_be_unique,expect_multicolumn_values_to_be_unique,expect_-
select_column_values_to_be_unique_within_record), Apache Griffin (duplication)
distribution of data types of the column valuesDeequ (DataType), Soda Core (schema)
presence / absence / order of columnsSoda  Core  (schema),  GX  (expect_column_to_exist,expect_table_columns_to_match_ordered_list,expect_table_columns_to_-
match_set)
values in a column are of specific data type(s)GX (expect_column_values_to_be_dateutil_parseable,expect_column_values_to_be_of_type,expect_column_values_to_be_in_-
type_list,expect_column_values_to_be_json_parseable,expect_column_values_to_match_json_schema,expect_column_values_-
to_match_strftime_format), Apache Griffin (schema_conformance)
timestamp column is at least as recent as a given time intervaldbt Core (recency), MobyDQ (freshness,latency), Soda Core (freshness)
Table 2: Appendix: The exact function names employed by the tools that implement the studied DQ low-level functionalities.