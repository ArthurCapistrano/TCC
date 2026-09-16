AI Summary

## Abstract

### Abstract

Data quality can be assessed across multiple high-level concepts called *dimensions*, such as accuracy, completeness, consistency, and timeliness. While extensive research and several attempts for standardization (e.g., ISO/IEC 25012) exist for data quality dimensions, their practical application often remains unclear. In parallel to research endeavors, a large number of tools have been developed that implement functionalities for the detection and mitigation of specific data quality issues, such as missing values or outliers. With this article, we aim to bridge this gap between data quality theory and practice by systematically connecting low-level functionalities offered by data quality tools with high-level dimensions, revealing their many-to-many relationships. Through an examination of seven open-source data quality tools, we provide a comprehensive mapping between their functionalities and the data quality dimensions, demonstrating how individual functionalities and their variants partially contribute to the assessment of single dimensions. This systematic survey provides both practitioners and researchers with a unified view on the fragmented landscape of data quality checks, offering actionable insights for quality assessment across multiple dimensions.

### AI Summary

To view this AI-generated plain language summary, you must have Premium access.

## 1 Introduction

In today’s data-driven era, the importance of **data quality** (**DQ**) has become critical \[[^19], [^41], [^46], [^60]\]. Organizations increasingly rely on exponentially growing volumes of data to drive operational, tactical, and strategic decisions, either directly or through training machine/deep learning models \[[^14]\]. Consequently, the quality of these data plays a crucial role in downstream tasks across the whole operational pipeline of modern businesses and organizations. *High-quality* data are essential for ensuring the integrity of analytics \[[^37]\], empowering **machine learning** (**ML**) models \[[^13], [^40], [^42], [^44], [^57]\] and supporting **business intelligence** (**BI**) efforts \[[^32], [^63]\]. Poor DQ can lead to costly, misguided decisions, operational inefficiencies, and a loss of trust among stakeholders or end users \[[^20], [^43], [^44], [^55], [^56]\]. Managing DQ effectively becomes even more pivotal with the advent of generative artificial intelligence \[[^23], [^45], [^66], [^67]\].

Over the last decades, extensive research has been conducted on how to *assess* and *improve* DQ in terms of methodologies \[[^18], [^21]\], alongside public standards, such as the ISO/IEC 25012 standard \[[^28]\]. The literature widely acknowledges that DQ is characterized by multiple *DQ dimensions*, also known as *characteristics* or *attributes* \[[^19], [^64]\], such as, accuracy, completeness, and timeliness. These dimensions can be quantified with *DQ metrics*, which are functions that map a DQ dimension to a numerical value. Despite extensive discussions on DQ dimensions in literature, their practical implementation often remains unclear.

In parallel to academic research, many DQ tools have been developed, but these tools rarely use DQ dimensions—and when they do, it is only to group rules \[[^25]\]. These tools are software products that provide practical solutions, assisting businesses and organizations to assess and improve their DQ. Although a great amount of implementation effort has been devoted to these tools, significant heterogeneity exists in (i) the terminology used to describe the functionalities in these DQ tools, as well as (ii) the alleged—and often overlooked—connection of the functionalities with the DQ dimensions. For example, checking that all rows in a table satisfy a certain constraint can be found as *conformance*, *compliance*, or even *validity* in the tools, while all referring to the same software engineering functionality. Conversely, the same term may denote different functionalities across tools. *Completeness*, for example, can be found referring to both functionalities that count the number of rows in a table and functionalities that check for the presence of NULL values. One reason for this fragmented landscape could be the lack of consistent terminology within the DQ dimensions themselves. Despite available standards, terms like *currentness*, *freshness*, *recency*, and *timeliness* are sometimes used interchangeably \[[^19]\] and even the understanding of *accuracy* is not unified \[[^31]\]. The heterogeneous terminology and consequently inconsistent use of both DQ dimensions and concrete functionalities implemented in DQ tools implies two major challenges:

- Practitioners are left with the question on how to use DQ dimensions in practice and which DQ functionalities can be expected by which tool.
- Researchers are left with the question how specific DQ dimensions are materialized in practice.

To address these challenges, this article aims to connect the dots between DQ theory and source code implementations used in practice. We reflect the theoretical perspective through the ISO/IEC 25012 standard \[[^28]\], which defines a DQ model with 15 *high-level* DQ dimensions (characteristics), as listed in Appendix [B](#appendix-3). We reflect the practical perspective through a systematic source code examination of seven widely used open-source DQ tools.

Our investigation focuses on *DQ assessment*, defined as the act of executing checks that measure specific data properties and compare them with thresholds or reference data. Although *DQ improvement* (also called *data cleaning*) is not within the scope of this article, all the functionalities presented here serve as the integral first step of any corrective action. We refer to every piece of source code investigated in the DQ tools that implements a self-contained concrete DQ assessment task as *low-level functionality* (e.g., a function determining whether the number of NULL values in a table is greater than a fixed threshold). To the best of our knowledge, this is the first systematic survey of low-level functionalities in DQ tools, differentiating our work from surveys that examine more general concepts, such as the presence of data profiling capabilities.

**Contributions.** Our contributions can be summarized as follows:[^1]

- We conduct the first systematic source code examination of seven open-source DQ tools;
- We uncover how DQ assessment is performed in practice through a unifying list of low-level functionalities offered by these tools;
- We present detailed catalogs of variants per low-level functionality. These lists aim to offer actionable guidelines to DQ practitioners, providing answers regarding *what* error detection checks can be performed on the data at hand and *how* these checks are implemented at the *source code* level by widely used open-source tools;
- Taking a step further, we introduce a novel mapping between the low-level functionalities identified in the DQ tools and the DQ dimensions from the ISO/IEC 25012 standard revealing their many-to-many relationship. The mapping provides both researchers and practitioners with a unified view on DQ assessment and reveals the underlying connection between successfully used error detection checks in DQ tools and theoretical DQ dimensions.

**Scope.** Our survey focuses on relational data, which remains the most widely used data model in both industry and academia, e.g., \[[^54]\]. Although **relational database management systems** (**RDBMS**) already implement a set of DQ checks (e.g., checking primary key constraints), we deliberately include such low-level functionalities since they cannot be taken for granted. In CSV or XLS files, which are heavily used for data exchange, or databases with a poorly designed schema, such constraints are often violated in practice. While DQ tools exist for other data models (e.g., KGHeartBeat for knowledge graphs \[[^50]\]), these use different DQ dimensions specific to their data models (e.g., Zaveri et al. \[[^68]\]) rather than ISO/IEC 25012 \[[^28]\] and are therefore outside our scope.

**How to use this survey.** Table [1](#tab1) serves as starting point and overview of this survey. It lists all the recorded low-level functionalities with their mapping to high-level DQ dimensions (explained in detail in Section [3](#sec-3)) and provides links to navigate the content. However, we strongly encourage readers to study the detailed discussion of the low-level functionalities in Section [3](#sec-3), before moving to the wrap-up discussion in Section [4](#sec-4), since the implementation variants and the explained mapping to dimensions are meant to pave the way for a deeper understanding of the conclusions. This applies specifically to data practitioners who want to understand and implement DQ checks for their use cases. The questions at the beginning of each subsection in Section [3](#sec-3) aim to support practitioners in identifying whether the respective content aligns with their needs.

![](https://dl.acm.org/cms/10.1145/3786328/asset/6f364fe2-0f49-44ac-b348-3c5686f3f5da/assets/images/large/jdiq-2025-02-srv-0001-t01.jpg)

A Comprehensive List of the Low-Level Functionalities (Column 2) Extracted from the Investigated DQ Tools, Grouped Into Categories (Column 1)

**Outline.** The rest of this article is structured as follows. Section [2](#sec-2) presents our methodology. Our main findings, the list of low-level functionalities and their mapping to DQ dimensions, are described in Section [3](#sec-3). For each low-level functionality, a list of implementation variants is provided in Sections [3.2](#sec-3-2) to [3.6](#sec-3-6). In Section [4](#sec-4), we reexamine our findings through the lens of DQ dimensions, highlighting key observations about their materialization in practice. Related work is discussed in Section [5](#sec-5) and we conclude this article with an outlook on future work in Section [6](#sec-6).

## 2 Methodology

In this section, we explain our approach for conducting the survey, which consists of the following four stages:

- Identification and selection of DQ tools.
- Extraction of low-level functionalities from each tool independently.
- Merging and grouping of low-level functionalities.
- Mapping of low-level functionalities to high-level dimensions.

Figure [1](#fig1) illustrates the input and output of each stage, and their integration into a complete workflow. We elaborate on each stage in the rest of this section.

![](https://dl.acm.org/cms/10.1145/3786328/asset/cf7ed473-bcb0-4484-9ebe-162d5916528f/assets/images/large/jdiq-2025-02-srv-0001-f01.jpg)

The methodology used to conduct the survey.

### 2.1 Identification and Selection of DQ Tools

The foundation of our survey lies in identifying and selecting representative DQ tools based on the following predefined **selection criteria** (**SC**):

- The tool offers DQ management functionalities and is not tied to a specific task (e.g., duplicate detection only).
- The tool is an open source project and its source code is available on a publicly accessible platform (e.g., GitHub).
- The tool is actively maintained and/or extended.
- The tool is not domain-specific (e.g., DQ assessment of satellite-sourced trajectory data only).

Based on a comprehensive list of previously investigated DQ tools (cf. \[[^17], [^25], [^51], [^52]\]), the well-known Gartner Magic Quadrant for Data Quality Solutions \[[^35]\], and additional online sources,[^2] we compiled the following list of seven DQ tools (T) that meet our criteria:

- **dbt Core**,[^3] an SQL-based Python framework that offers a wide range of built-in DQ checks and integrates with many data platforms. It also enables the user to define custom template checks that can be reused with different parameters each time.
- **Deequ**,[^4] a Scala library developed on top of Apache Spark for defining and executing DQ checks on large datasets \[[^59]\]. The tool also features a Python API (PyDeequ) and rule-based suggestions for DQ checks, based on data profiling.
- **Evidently**,[^5] a Python framework focused on evaluating and monitoring the performance of AI systems, including large language models. It offers a wide range of built-in DQ metrics and result visualizations.
- **Great Expectations (GX)**,[^6] a Python library that enables users to define *expectations*, i.e., verifiable assertions about data. It combines built-in expectations with community-contributed checks.
- **Griffin**,[^7] an Apache Software Foundation framework for DQ monitoring of distributed data, built on Apache Hadoop (in Java) and Spark (in Scala). It enables the user to define DQ checks in several built-in categories and to visualize the results.
- **MobyDQ**,[^8] a desktop application offering built-in DQ *indicators*, i.e., metrics that describe the quality of data. It combines a Python-based backend with a graphical interface to define and execute DQ checks.
- **Soda Core**,[^9] a Python library for measuring and monitoring DQ on a variety of data platforms. The checks are written in a domain-specific language, porting a low-code approach that enables both technical and non-technical collaborators within organizations to define checks.

We believe that this selection of DQ tools is representative enough to support the conclusions drawn in this article. All seven tools have a large open-source community and decades of contributors. Three tools have been developed by leading technology companies; specifically, Deequ was developed at Amazon and is currently part of AWS Glue’s functionality, MobyDQ’s initial (closed source) version was developed at Ubisoft, and Apache Griffin was deployed at eBay. Other tools maintain active partnerships with major industry companies (e.g., GX with Snowflake and Databricks among others \[[^30]\]).

### 2.2 Extraction of Low-Level Functionalities

Following tool selection, we conducted a thorough examination of each tool’s official documentation and source code, accessed through their websites and GitHub repositories respectively. Our target for this stage was to extract the low-level functionalities offered by each tool *independently*. This implies producing a separate list of functionalities per DQ tool, i.e., seven different lists, regardless of exact or near duplicate functionalities among the tools. No grouping or merging of functionalities was performed at this stage.

The decision to let the tool’s implementations guide our analysis without having a predefined list of expected functionalities (as for example done in \[[^25]\]) was a strategic one. This approach allowed to collect any low-level functionalities from the tools from an *unbiased perspective*. The outcome comprised seven lists of low-level functionalities, each annotated with the specific terminology used within that tool.

### 2.3 Merging and Grouping of Low-Level Functionalities

Here, we focused on identifying and reconciling exact and near duplicate functionalities among DQ tools that were intentionally overlooked in the previous stage. The goal was to combine the separate lists into a single comprehensive list meeting the following **merging criteria** (**MC**):

- Lossless merging: every low-level functionality present in at least one tool must be represented in the combined list.
- Concise representation: each distinct low-level functionality should appear exactly once in the combined list, in sufficient depth but without redundancy.

Meeting these criteria proved challenging, primarily due to the diverse and sometimes conflicting terminology across tools. To overcome this challenge, we conducted detailed source code examinations. In particular, we tracked and thoroughly studied the exact source code fragments that are executed when each one of these functionalities is used (alternatively, called) by the end user. In software engineering terms, our strategy resembles a careful source code review, aiming to uncover the core functionality and implementation patterns. The heterogeneity in programming languages and architectures across tools required systematic effort to thoroughly understand both the implementation details and the underlying software engineering decisions made by the developers. We provide insights into such choices wherever applicable in the rest of our work. The main actions performed in this stage are *merging* and *grouping* of low-level functionalities. More specifically, during the compilation of the combined list:

- we **merge** functionalities when their implementations indicate that they are exact or near duplicates. For example, we merge Evidently’s TestValueRange with dbt Core’s accepted\_range since they are exact duplicates. For near duplicates, we consider one functionality as an *implementation variant* of the other, as detailed in Section [3](#sec-3). For example, Deequ’s isContainedIn (membership) is a near duplicate of GX’s expect\_column\_values\_to\_not\_be\_in\_set (*not* membership), so we report them as implementation variants.
- we **group** functionalities that are closely related with regards to their aim. For example, we group checks on distinct and on unique values in the same category, since they both relate to data volume and cardinality. We base our classification on the functionality description, as detailed in Section [3.1](#sec-3-1). The grouping phase starts after no further merging of functionalities can be performed. Its main target is to ease the presentation of the functionalities, adding an orthogonal viewpoint to the analysis of their spectrum.

The outcome of this stage is a comprehensive list of low-level functionalities that *sufficiently* and *concisely* cover the spectrum of low-level functionalities extracted separately from the tools.

### 2.4 Mapping of Low-Level Functionalities to High-Level Dimensions

This stage aims to systematically connect the identified low-level functionalities with six selected ISO/IEC 25012 high-level DQ dimensions. The selection was made on the grounds that these dimensions are mainly targeted by the aforementioned tools in an application-agnostic manner. These DQ dimensions broadly represent *inherent* data quality according to the standard’s terminology, i.e., the intrinsic potential of data to meet defined needs, independently of the downstream application that consumes this data.

The connection between low-level functionalities and high-level DQ dimensions is neither trivial, nor straightforward. It turns out that the mapping between real-world implementations and DQ dimensions is an N:M (many-to-many) relation, as detailed in Section [3](#sec-3). The main challenge of this stage was to (1) conceptualize and (2) apply a *systematic* approach for identifying the most closely related DQ dimensions for each functionality. We base our analysis on the definitions from ISO/IEC 25012 as shown in Table [2](#tab2) for the DQ dimensions used in this survey. Appendix [B](#appendix-3) lists all the dimensions defined in ISO/IEC 25012. We establish a connection when the purpose of a functionality directly or indirectly aligns with the textual definition of a DQ dimension. Detailed justifications for these connections are provided in Section [3](#sec-3).

| Dimension | Definition |
| --- | --- |
| Accuracy | The degree to which data has attributes that correctly represent the true value of the intended attribute of a concept or event in a specific context of use. It has two main aspects, namely *Syntactic* and *Semantic* accuracy. |
| Completeness | The degree to which subject data associated with an entity has values for all expected attributes and related entity instances in a specific context of use. |
| Consistency | The degree to which data has attributes that are free from contradiction and are coherent with other data in a specific context of use. It can be either or both among data regarding one entity and across similar data for comparable entities. |
| Currentness | The degree to which data has attributes that are of the right age in a specific context of use. |
| Accessibility | The degree to which data can be accessed in a specific context of use, particularly by people who need supporting technology or special configuration because of some disability. |
| Compliance | The degree to which data has attributes that adhere to standards, conventions or regulations in force and similar rules relating to data quality in a specific context of use. |

The ISO/IEC 25012 \[[^28]\] Dimensions Used in This Survey

## 3 Survey Findings

Table [1](#tab1) summarizes the main findings of our survey: a comprehensive mapping between low-level functionalities and high-level DQ dimensions. The **second column** lists all *low-level functionalities* (i.e., error detection data checks) identified in the examined tools. Each low-level functionality is linked to its detailed discussion in the corresponding Subsection(indicated between parentheses) for easy navigation. The functionalities are grouped into broader *categories*, shown in the **first column**, facilitating the joint presentation of related functionalities. However, our primary focus remains on revealing the connection between *functionalities*, rather than *categories*, and DQ dimensions, as functionalities within the same category may relate to different dimensions.

**Columns 3–6** represent the data granularity level(s) (e.g., row, column) at which each functionality operates, as already used to classify data errors in \[[^36], [^47]\]. **Columns 7–12** represent the selected ISO/IEC 25012 dimensions that are affected by these low-level functionalities. Out of the 15 dimensions defined by the standard, we were able to identify six that relate to the recorded functionalities, broadly, those addressing *inherent* DQ.

**Columns 13–19** represent the examined DQ tools, indicating whether a tool *directly* implements a functionality through built-in checks. Note that unmarked functionalities might still be achievable through indirect or user-defined way. Our survey’s objective is *not* to compare the tools. Instead, we treat these tools as representatives of the current error detection landscape, through their built-in low-level functionalities.

A comprehensive list of the *exact names* by which the functionalities are found in the tools is presented in Appendix [A](#appendix-2). In the rest of the section, we elaborate on each identified functionality, beginning with an overview of their categories.

### 3.1 Categories of DQ Low-Level Functionalities

We describe here the categories of low-level functionalities in Table [1](#tab1). These categories are meant to group conceptually related low-level functionalities and help readers comprehend the content.

Our classification comprises five categories: (1) Conformance checks; (2)Distribution-based checks; (3) Volume- and Cardinality-based checks; (4) Correlation-based checks; and (5) ML-oriented checks.

Conformance checks are further subdivided in Table [1](#tab1) based on their operational scope: single value, row, column, table schema, or entire table, respectively.

In Table [1](#tab1), we decouple the conceptual similarity of the observed functionalities from the data granularity level (e.g., row, column) at which they operate. This choice enables us to capture low-level functionalities that, along with their *implementation variants*, cover a broad spectrum of error detection operations.

Note that our categorization does not distinguish between functionalities that operate on the actual data values or on metadata (which can be either inherent, such as the schema, or derived, such as distinct value counts). Derived metadata is typically obtained using *data profiling* techniques, which are an integral part of successful DQ assessment \[[^16], [^24], [^61]\]. Our findings show that many low-level functionalities operate on profiling results, rather than raw data values, for example, comparing the minimum, maximum or number of unique values in a column against thresholds. These functionalities appear across multiple categories, suggesting that this distinction represents an independent classification dimension. We incorporate this perspective when analyzing each category’s functionalities in our subsequent discussions (Section [4](#sec-4)), where we shift our focus towards the mapping of low-level functionalities to high-level DQ dimensions.

### 3.2 Conformance Checks at the Value Level

This category includes low-level functionalities for error detection that address the question *“What checks can be executed on single data values (i.e., on the cell level) to assess their quality?”* Most checks produce a binary output (*pass* or *fail*) for each input value, determinable by examining the value in isolation. We explicitly note any exceptions to this pattern where applicable.

Although pertaining to single values, the low-level functionalities in this category consider these values as part of a data table. For this reason, a common feature among the examined DQ tools is their support for column- or table-level aggregations. A *column-level* aggregation computes the number or fraction of column values for which the check is successful, over the total number of column values. A *table-level* aggregation identifies rows for which the check fails, optionally presenting a sample for manual inspection.

Table-level aggregations are typically implemented using SQL SELECT queries (or equivalents, e.g., pandas.DataFrame operations in Python). The WHERE clause contains the negation of the value-level check, thereby identifying failing rows. When only a sample of the failing rows is required, most tools use simple LIMIT clauses, though some implement more sophisticated sampling strategies. Column-level aggregations are readily achieved by adding COUNT functions on top of these queries. In total, value checks can be summarized as follows:

- a single data value (i.e., a data cell)
- pass/fail
- column-level aggregation, table-level aggregation
- simple SQL SELECT-WHERE-COUNT queries or equivalent

Table [3](#tab3) presents the low-level functionalities in this category with their implementation variants, as identified across the examined tools.

<table><thead><tr><th>Low-level functionality</th><th>Implementation variants</th></tr></thead><tbody><tr><td rowspan="9"><i>f- 01.</i> values fall within range or set</td><td><i>f- 01 <span><math><msub><mrow><mi>a</mi></mrow></msub></math></span></i>. range of allowed values with inclusive/exclusive endpoints</td></tr><tr><td><i>f- 01 <span><math><msub><mrow><mi>b</mi></mrow></msub></math></span></i>. dynamic range endpoints with row-level scope</td></tr><tr><td><i>f- 01 <span><math><msub><mrow><mi>c</mi></mrow></msub></math></span></i>. set of allowed values</td></tr><tr><td><i>f- 01 <span><math><msub><mrow><mi>d</mi></mrow></msub></math></span></i>. set of allowed pairs with row-level scope</td></tr><tr><td><i>f- 01 <span><math><msub><mrow><mi>e</mi></mrow></msub></math></span></i>. set of <i>not</i> allowed values</td></tr><tr><td><i>f- 01 <span><math><msub><mrow><mi>f</mi></mrow></msub></math></span></i>. referential integrity</td></tr><tr><td><i>f- 01 <span><math><msub><mrow><mi>g</mi></mrow></msub></math></span></i>. only <i>distinct</i> values are checked (independent)</td></tr><tr><td><i>f- 01 <span><math><msub><mrow><mi>h</mi></mrow></msub></math></span></i>. execution of WHERE clause before the check (independent)</td></tr><tr><td><i>f- 01 <span><math><msub><mrow><mi>i</mi></mrow></msub></math></span></i>. only the <i>most frequent</i> value is checked (independent)</td></tr><tr><td rowspan="3"><i>f- 02.</i> string values are of right length</td><td><i>f- 02 <span><math><msub><mrow><mi>a</mi></mrow></msub></math></span></i>. equality to a desired value</td></tr><tr><td><i>f- 02 <span><math><msub><mrow><mi>b</mi></mrow></msub></math></span></i>. threshold-based comparisons</td></tr><tr><td><i>f- 02 <span><math><msub><mrow><mi>c</mi></mrow></msub></math></span></i>. simple statistics on values’ lengths</td></tr><tr><td rowspan="5"><i>f- 03.</i> values comply with regex</td><td><i>f- 03 <span><math><msub><mrow><mi>a</mi></mrow></msub></math></span></i>. user-defined regex</td></tr><tr><td><i>f- 03 <span><math><msub><mrow><mi>b</mi></mrow></msub></math></span></i>. built-in regex for common cases, e.g., email, URL, etc.</td></tr><tr><td><i>f- 03 <span><math><msub><mrow><mi>c</mi></mrow></msub></math></span></i>. regex to <i>not</i> match</td></tr><tr><td><i>f- 03 <span><math><msub><mrow><mi>d</mi></mrow></msub></math></span></i>. list of allowed/disallowed regexes</td></tr><tr><td><i>f- 03 <span><math><msub><mrow><mi>e</mi></mrow></msub></math></span></i>. comparison against reference data (independent)</td></tr><tr><td><i>f- 04.</i> timestamp values are recent</td><td><i>f- 04 <span><math><msub><mrow><mi>a</mi></mrow></msub></math></span></i>. recentness based on current system time (freshness)</td></tr><tr><td></td><td><i>f- 04 <span><math><msub><mrow><mi>b</mi></mrow></msub></math></span></i>. recentness based on reference data (latency)</td></tr><tr><td></td><td><i>f- 04 <span><math><msub><mrow><mi>c</mi></mrow></msub></math></span></i>. execution of WHERE clause before the check (independent)</td></tr><tr><td></td><td><i>f- 04 <span><math><msub><mrow><mi>d</mi></mrow></msub></math></span></i>. execution of GROUP BY clause before the check (independent)</td></tr></tbody></table>

The Low-Level Functionalities in the Category of Value Checks with Their Implementation Variants Found in the Tools Examined.

Variants that can independently be combined with others are marked as *independent*.

#### 3.2.1 Values Fall Within Range or Set \[f-01\].

This low-level functionality verifies that values either fall within a user-defined range or belong to a set of accepted values. For instance, it can ensure that an employee count for a project stays within bounds (e.g., non-negative and not exceeding fifty for a fifty-person company), or that a payment transaction status is strictly one of “Completed”, “Declined”, or “Pending”.

*Variants*. For *range* -based checks, endpoints can be either inclusive or exclusive. They can also be dynamically determined with a row-level scope. Consider a table storing product order data: each row contains both shipped and returned (defected) product counts for a specific order. Rather than applying fixed range endpoints across all orders, dynamic endpoints allow meaningful constraints—for example, ensuring the defective count never exceeds the shipped count for each specific order.

For *set* -based checks, variants include checking value *pairs* with row-level scope against accepted set of pairs, or alternatively, defining sets of *not* allowed values. The latter proves particularly useful in several scenarios. Consider an organization’s document sharing system where each document has a security classification. To prevent unauthorized access, views for “intern” roles could explicitly exclude documents classified as “secret” or “top-secret”-especially valuable when dealing with varying classification protocols or multiple data sources. Another variant ensures referential integrity, where allowed values are sourced from another column, typically in a different table.

The independent variants of this functionality include column-level aggregations or row filtering before the actual check. Checking only distinct values can improve efficiency, particularly when distinct value retrieval can be performed in sublinear time w.r.t. the number of checked values (e.g., they are indexed or precomputed). Applying a WHERE clause pre-filters rows before the check, so that the error detection runs only on a subset of the initial data. Focusing on just the most frequent value can reduce the computational resources required, while providing a relaxed form of compliance checking.

*Mapping to Dimensions*. All variants primarily relate to *accuracy*, since out-of-range or disallowed values misrepresent real-world attributes. *Compliance* is highly relevant, due to the existence of some physical restriction (e.g., fifty employees in total) or business rule (e.g., agreed transaction statuses), defining acceptable values. The referential integrity variant additionally connects to *consistency*, ensuring coherence with other data, i.e., the set of accepted references.

#### 3.2.2 String Values are of Right Length \[f-02\].

This low-level functionality verifies user-defined string length constraints. For example, ensuring phone numbers contain exactly 10 digits. Note that this check operates on a derived attribute (string length) rather than the actual value content.

*Variants*. Beyond exact length matching, tools support threshold-based comparisons, validating that the lengths of data values are smaller/greater than a threshold or in between. The most generic variant lets the user define a callback function that receives the length of the checked value and returns a binary output (i.e., pass or fail), encapsulating the logic that decides whether a value length is valid or not. Another variant performs checks on length-based descriptive statistics, which is more relevant to the discussion about statistic-based checks (cf. Section [3.4.1](#sec-3-4-1)).

*Mapping to Dimensions*. String values of incorrect length may fail to accurately represent the modeled domain, connecting this functionality to *accuracy* both syntactically and semantically. The functionality also relates to *compliance* when length restrictions stem from physical constraints or business rules; for example, security protocols that require all employees having a strong password of 10+ characters for system access.

#### 3.2.3 Values Comply with Regex \[f-03\].

This low-level functionality verifies whether data values match specified regular expressions or patterns. For instance, it can ensure product identifiers follow a specific format-starting with “p”, followed by six digits, and ending with three capital letters. This low-level functionality is a generalized version of \[f-02\], since length constraints can also be checked via regular expressions. Thus, it provides more powerful, yet more complex, especially for non-technical users, error detection capabilities.

*Variants*. Beyond user-defined expressions, several tools provide built-in patterns for common cases (e.g., credit card numbers, e-mail addresses, URLs). While these patterns are predefined by tool developers, they ultimately resolve to regular expressions at the source code level. Another variant supports negative matching, ensuring patterns are *not* matched. Consider products available only for in-store purchase ending with the letter “X”-this variant could ensure that customers browsing products at the firm’s website are not presented with such products, since they are not expected to appear in online catalogs. A more generic variant accepts *lists* of allowed or disallowed patterns. This provides syntactic sugar, abstracting the complexity of composite regular expressions with multiple disjunctions.

An independent variant enables comparison against reference data (also found in literature as *gold standard*). This computes matched/mismatched value counts for corresponding columns in both current and reference tables, allowing threshold based comparisons of the differences. This effectively quantifies how closely the data adhere to patterns observed in ideal or desired data.

*Mapping to Dimensions*. This functionality primarily connects to *accuracy*, as pattern-mismatched values often misrepresent reality-for example, a malformed e-mail address missing an “@” symbol can never correspond to an actual person. *Compliance* becomes relevant when patterns enforce business rules, such as specific product identifier formats.

#### 3.2.4 Timestamp Values are Recent \[f-04\].

This low-level functionality assesses whether timestamp values are sufficiently recent for the intended use. Consider a real-time routing service; data must reflect conditions within the last few minutes to provide actionable insights for drivers. People usually do not care about how busy a road segment was an hour ago, when they are late for an appointment, even if the information is completely accurate.

*Variants*. Recency assessment follows two main approaches. The first, termed *freshness*, compares recency against the current system time – broadly what the user understands as *now*. This suits real-time applications like the traffic routing example. The second, termed *latency*, compares recency against reference data timestamps. This variant quantifies data flow delays between source (reference) and destination (data at hand) tables by comparing their latest timestamps, regardless of the current time.

Two independent variants were found for this low-level functionality. Both of them include the execution of some operation before the actual recency check. The first filters several rows of the table at hand by applying an SQL WHERE clause. For example, we could check that the routing application processes only the latest data for users under paid subscription, while accepting looser recency constraints for free-tier users. The second variant executes a GROUP BY clause before the check. This approach groups the data and retains only the most recent value from each group, then compares these values against a threshold. For instance, we could verify that every region where the routing application operates has received a traffic update within the last 5 minutes.

*Mapping to Dimensions*. This functionality primarily relates to *currentness*, since it directly assesses whether data are of the right age. The *context* (e.g., task, system, humans involved) \[[^26], [^62]\] typically determines whether the *freshness* or the *latency* variant is more suitable.

### 3.3 Conformance Checks at the Row Level

This category addresses the question “ *What DQ checks can be executed on the rows of a table?*”. These functionalities operate on complete rows (also termed *records* or *tuples*), each containing multiple values (also termed *attributes*). Like value-level checks, they produce binary output (*pass* or *fail*) based solely on the examined row.

On top of these checks, the tools typically offer two types of table-level aggregations: computing the pass rate (i.e., number or fraction of passing rows), and identifying failing rows (all or a sample) for manual inspection by the user. Implementation-wise, these checks utilize simple SQL SELECT queries (or equivalents) with the negated condition in the WHERE clause, optionally adding COUNT operations for pass rate calculations. Row checks can be summarized as:

- a data row (i.e., record)
- pass/fail
- table-level aggregation (number/fraction, failing rows)
- SQL SELECT-WHERE-COUNT queries or equivalent

Table [4](#tab4) presents the low-level functionalities in this category with their implementation variants.

| Low-level functionality | Implementation variants |
| --- | --- |
| *f- 05.* row values satisfy comparison | \- |
| *f- 06.* row satisfies SQL expression | *f- 06 $$*. execution of WHERE clause before the check |

The Low-Level Functionalities in the Category of Row Checks with Their Implementation Variants Found in the Tools Examined

#### 3.3.1 Row Values Satisfy Comparison \[f-05\].

This low-level functionality validates simple, predefined relationships between values within the same row through simple comparisons. For instance, ensuring that one column value is greater than another, across all table rows.

*Mapping to Dimensions*. This functionality connects to multiple dimensions: *accuracy*, as violations often indicate erroneous representation of attributes of a real-world entity; *consistency*, when values within a row contradict with each other; and *compliance*, when business rules or policies dictate specific relationships between column values.

#### 3.3.2 Row Satisfies SQL Expression \[f-06\].

This low-level functionality generalizes row-level comparisons by allowing custom SQL expressions. For example, extending the previous example of \[f-05\], one can ensure that one column value is greater than another, except for the rows where a third column is zero, for which the two values must be equal. It essentially provides a flexible mechanism for enforcing complex constraints and detecting errors that may not be captured by the limited expressiveness of simple comparisons between row values. Users can leverage SQL-like syntax to express logical conditions, mathematical operations, and string operations tailored to specific requirements.

*Variants*. The data verification scope can be restricted through the execution of WHERE clauses before the actual check.

*Mapping to Dimensions*. As a generalization of row-value comparisons, this functionality similarly relates to *accuracy*, *consistency*, and *compliance*.

### 3.4 Conformance Checks at the Column Level

This category addresses the question “ *What checks can run on columns of data values to assess their quality?*”. These functionalities operate at column granularity, examining a single column of a table. While most checks produce a binary outcome (*pass* or *fail*), few may also report the fraction of compliant values.

A key distinction from column-aggregated value checks (Section [3.2](#sec-3-2)) is that checks in the current category require examining the entire column rather than individual values. For instance, validating that all column values are in increasing order inherently requires considering all values collectively, because neither single-value examination nor individual compliance is sufficient. Implementation-wise, these checks focus on computing column-wide measures or constraints, typically evaluating these results against defined thresholds. In summary, column checks are characterized by:

- a single column
- primarily pass/fail
- computation of column measure or constraint; threshold comparison

Table [5](#tab5) presents the low-level functionalities in this category along with their implementation variants as identified across the examined tools.

<table><thead><tr><th>Low-level functionality</th><th>Implementation variants</th></tr></thead><tbody><tr><td rowspan="3"><i>f- 07.</i> simple descriptive statistic checks</td><td><i>f- 07 <span><math><msub><mrow><mi>a</mi></mrow></msub></math></span></i>. equality to a desired value</td></tr><tr><td><i>f- 07 <span><math><msub><mrow><mi>b</mi></mrow></msub></math></span></i>. threshold-based comparisons</td></tr><tr><td><i>f- 07 <span><math><msub><mrow><mi>c</mi></mrow></msub></math></span></i>. statistic measure computed on a sample (independent)</td></tr><tr><td rowspan="5"><i>f- 08.</i> values satisfy ordering</td><td><i>f- 08 <span><math><msub><mrow><mi>a</mi></mrow></msub></math></span></i>. increasing/decreasing ordering</td></tr><tr><td><i>f- 08 <span><math><msub><mrow><mi>b</mi></mrow></msub></math></span></i>. non-strict ordering (i.e., equality accepted between consecutive values)</td></tr><tr><td><i>f- 08 <span><math><msub><mrow><mi>c</mi></mrow></msub></math></span></i>. fixed step of increase/decrease</td></tr><tr><td><i>f- 08 <span><math><msub><mrow><mi>d</mi></mrow></msub></math></span></i>. relaxed compliance to ordering (independent)</td></tr><tr><td><i>f- 08 <span><math><msub><mrow><mi>e</mi></mrow></msub></math></span></i>. execution of GROUP BY clause before the check (independent)</td></tr></tbody></table>

The Low-Level Functionalities in the Category of Column Checks with Their Implementation Variants Found in the Tools Examined

Variants that can independently be combined with others are marked as *independent*.

#### 3.4.1 Simple Descriptive Statistic Checks \[f-07\].

This widely-implemented functionality performs checks on column-level statistical measures, covering a wide spectrum of descriptive statistical analysis, which is also part of data profiling. For example, in a fifty-person company’s project management system, it could verify that employee assignments across projects sum to exactly fifty, assuming every employee works on exactly one project. The examined tools support various statistics including minimum, maximum, mean, median, standard deviation, variance, and z-scores. For z-scores specifically, tools may also report the fraction of values passing the check. A comprehensive list of supported statistics can be derived from the exact names of source code elements for this functionality, presented in Appendix [A](#appendix-2).

*Variants*. Check outcomes are determined in several ways after computing the respective statistics. The first approach requires exact equality to a user-defined value. The second enables threshold-based comparisons (greater than. less than, between values). The generalization of these approaches allows custom callback functions that implement specific validation logic on the computed statistics. An independent variant reduces the computational resources required by computing statistics on data *samples*, rather than entire columns. While currently implemented only for standard deviation and variance calculations, this approach could extend to other statistics, particularly when the assessment result is crucial to be computed quickly, with tolerable accuracy tradeoffs. This variant could be an option for use cases where an approximate result delivered faster is preferred over an exact result that requires more time to be computed.

*Mapping to Dimensions*. Descriptive statistics provide indirect insights into how accurately data represent reality. For instance, negative minimum values in a product quantity column indicate compromised *accuracy*. Additionally, computing the mean value of a column requires the examination of all the values in that column. This means data values have to be coherent with other data in some context of use, in order for the check to be successful, making *consistency* relevant. *Compliance* applies when statistical constraints stem from business rules, such as the requirement that every employee in the fifty-person company is involved in exactly one project.

#### 3.4.2 Values Satisfy Ordering \[f-08\].

This low-level functionality checks whether all consecutive values in a column satisfy a user-defined ordering, such as increasing or decreasing. It operates directly on the data values. For instance, in an IoT scenario measuring hourly household energy consumption, we expect the cumulative sum readings within a single day to be increasing.

*Variants*. The variants primarily differ in how ordering is defined and enforced. The basic ordering can be either increasing or decreasing, with additional options for strict or non-strict ordering. A more restrictive variant requires fixed increments or decrements between consecutive pairs, e.g., ensuring that the cumulative energy consumption increases by exactly 10 units hourly. Two independent variants offer flexibility in application of the check. One allows for *relaxed* compliance by requiring only a specified fraction of values to satisfy ordering (e.g., at least 80% of column values must increase). The other enables pre-grouping of data through SQL GROUP BY clauses before the actual ordering check. In this case, the check is performed within groups, retaining the original order of values, i.e., similar to a GROUP BY operation that retains the original order of the grouped values.

*Mapping to Dimensions*. This functionality primarily connects to *accuracy*, as ordering violations often indicate unrealistic data patterns, such as decreasing cumulative consumption readings. It also relates to *consistency*, since values that violate the expected ordering contradict with the rest of column values. *Compliance* becomes relevant when ordering requirements stem from business rules or regulations. For instance, consider a company’s policy to assign increasing transaction identifiers to every new transaction generated. The identifier column is expected to have strictly increasing values, or else the business rule is violated.

### 3.5 Conformance Checks at the Schema Level

This category addresses the question “What error detection checks can be executed on the schema of a database to assess its quality?”. The functionalities in this category primarily operate at the table level, i.e., investigating (all or part of) the table columns to verify that schema is correctly reflected in the data. Some variants, however, particularly those involving data type validation (cf. Section [3.5.2](#sec-3-5-2)), interfere with the column level as well.

Table [6](#tab6) presents the low-level functionalities in the schema checks category with the implementation variants as identified across the examined tools.

<table><thead><tr><th>Low-level functionality</th><th>Implementation variants</th></tr></thead><tbody><tr><td rowspan="6"><i>f- 09.</i> columns match schema</td><td><i>f- 09 <span><math><msub><mrow><mi>a</mi></mrow></msub></math></span></i>. number of columns in a dataset</td></tr><tr><td><i>f- 09 <span><math><msub><mrow><mi>b</mi></mrow></msub></math></span></i>. expected columns are present in the dataset</td></tr><tr><td><i>f- 09 <span><math><msub><mrow><mi>c</mi></mrow></msub></math></span></i>. unexpected columns are not present in the dataset</td></tr><tr><td><i>f- 09 <span><math><msub><mrow><mi>d</mi></mrow></msub></math></span></i>. columns’ indices satisfy ordering</td></tr><tr><td><i>f- 09 <span><math><msub><mrow><mi>e</mi></mrow></msub></math></span></i>. use of regexes to specify column names (independent)</td></tr><tr><td><i>f- 09 <span><math><msub><mrow><mi>f</mi></mrow></msub></math></span></i>. comparison against reference data (independent)</td></tr><tr><td rowspan="5"><i>f- 10.</i> data types match schema</td><td><i>f- 10 <span><math><msub><mrow><mi>a</mi></mrow></msub></math></span></i>. values are of specific data type(s) and/or format(s)</td></tr><tr><td><i>f- 10 <span><math><msub><mrow><mi>b</mi></mrow></msub></math></span></i>. distribution of data types in a column</td></tr><tr><td><i>f- 10 <span><math><msub><mrow><mi>c</mi></mrow></msub></math></span></i>. all table columns match schema</td></tr><tr><td><i>f- 10 <span><math><msub><mrow><mi>d</mi></mrow></msub></math></span></i>. data types are inferred if no schema information (independent)</td></tr><tr><td><i>f- 10 <span><math><msub><mrow><mi>e</mi></mrow></msub></math></span></i>. comparison against reference data (independent)</td></tr></tbody></table>

The Low-Level Functionalities in the Category of Schema Checks with Their Implementation Variants Found in the Tools Examined

Variants that can independently be combined with others are marked as *independent*.

#### 3.5.1 Columns Match Schema \[f-09\].

This low-level functionality verifies the presence, absence, and ordering of columns in a table against an expected schema. It detects structural discrepancies, such as missing or extraneous columns, that might arise during data ingestion, integration, or pre-processing. For example, in a table used for financial reporting, it can verify that critical columns, such as the account’s identifier, the transaction amount and date are present and appear in the sequence required by reporting standards.

*Variants*. The simplest variant validates just the number of columns against a desired value or threshold. Note that this is also discussed from another perspective in the low-level functionality about data element counts \[f-15\] (Section [3.8.1](#sec-3-8-1)). A more expressive variant allows the user to define a set of the exact *column names* the table at hand must have. The complementary variant uses a set of *unexpected* columns that must *not* be present. In a stricter flavor, the column indices are also checked, i.e., the *ordering* of the columns, besides just their presence in the table. This variant is only applicable for a set of expected columns. Two independent variants enhance flexibility. One enables the user to specify regular expressions for columns, rather than exact names, while the other allows for comparison against reference data.

*Mapping to Dimensions*. Since table columns represent real-world entity attributes, ensuring their presence highly relates to *completeness*. *Accessibility* becomes relevant with missing columns, since absent attributes are unavailable to users or downstream tasks. *Compliance* applies when business rules or standards dictate column ordering or restrictions; for instance, reporting standards requiring specific column sequences or access policies prohibiting the presence of certain columns.

#### 3.5.2 Data Types Match Schema \[f-10\].

This low-level functionality ensures data type conformance with the table schema. It can prevent downstream data processing errors by ensuring that fields are correctly typed, e.g., numeric, string, or dates. While primarily operating at the table level, some variants focus on the column level as well, i.e., checking compliance to data types for single columns.

*Variants*. The simplest variant verifies type matching of (all or part of) the table columns, with tools supporting specialized formats (e.g., strftime or dateutil for dates). More details about the supported types and formats can be derived from the source code elements’ names appearing in Appendix [A](#appendix-2). Implementation typically involves attempted value parsing (conversion) in the specified format, keeping track of failing values. Note that compliance to regular expressions and patterns is also discussed from another perspective in \[f-03\] (Section [3.2.3](#sec-3-2-3)). Advanced variants include analyzing the distribution of data types within columns (e.g., ensuring at least 80% type compliance) and table-wide schema validation using JSON type specifications targeting all table columns. In this case, the JSON specification has key-value pairs where the key is the column name and the value is the expected data type of the respective column. Independent variants include automated type inference when schema information is missing, and comparison against reference data, where an additional option supports checking respective columns one by one via column mapping.

*Mapping to Dimensions*. Type conformance primarily connects to *accessibility*, as non-compliant values often fail to be properly displayed to humans or processed by downstream tasks; thus, they become inaccessible. The expected schema itself, though, is frequently derived from business-internal standards or communication protocols between systems (steps) in a pipeline, making *compliance* also relevant. From another perspective, a mismatched data type can also indicate that the respective value cannot be corresponding to a real-world entity. For instance, non-numeric quantity values cannot represent actual quantities indicating *accuracy* issues.

### 3.6 Conformance Checks at the Table Level

This category addresses the question “ *What data quality checks can be executed on an entire table?*” The low-level functionalities in this category operate on complete tables (also termed *datasets* in ML contexts). While the check outcome is primarily binary (*pass* or *fail*), some variants may also report the number or fraction of failing rows, or even present them to the user for manual inspection. Table [7](#tab7) presents the low-level functionalities in this category along with their implementation variants as identified across the examined tools.

<table><thead><tr><th>Low-level functionality</th><th>Implementation variants</th></tr></thead><tbody><tr><td rowspan="3"><i>f- 11.</i> matching between source & target</td><td><i>f- 11 <span><math><msub><mrow><mi>a</mi></mrow></msub></math></span></i>. strict (complete) matching</td></tr><tr><td><i>f- 11 <span><math><msub><mrow><mi>b</mi></mrow></msub></math></span></i>. user-defined fraction of matching</td></tr><tr><td><i>f- 11 <span><math><msub><mrow><mi>c</mi></mrow></msub></math></span></i>. custom precision for numeric comparisons (independent)</td></tr><tr><td rowspan="3"><i>f- 12.</i> adjacent intervals do not overlap</td><td><i>f- 12 <span><math><msub><mrow><mi>a</mi></mrow></msub></math></span></i>. gaps between consecutive intervals allowed/disallowed/required</td></tr><tr><td><i>f- 12 <span><math><msub><mrow><mi>b</mi></mrow></msub></math></span></i>. zero-span interval allowed/disallowed</td></tr><tr><td><i>f- 12 <span><math><msub><mrow><mi>c</mi></mrow></msub></math></span></i>. execution of PARTITION BY clause before the check</td></tr></tbody></table>

The Low-Level Functionalities in the Category of Table Checks with Their Implementation Variants Found in the Tools Examined

Variants that can independently be combined with others are marked as *independent*.

#### 3.6.1 Matching between Tables \[f-11\].

This low-level functionality compares the table at hand (termed *target*) to a reference table (termed *source*) at a granularity level of values (i.e., table cells). If column names differ in source and target, users can specify mappings to establish one-to-one relationships between them. This functionality computes the number or fraction of matching (or mismatching) values, which can then be evaluated against user-defined thresholds. Implementation-wise, most tools use SQL joins (or key-value equivalents) to quantify the matching.

*Variants.* Three variants offer different matching requirements. The strictest demands *complete* matching between tables. A more flexible variant allows users to specify a threshold in range $\left(0 , 1\right)$, against which the computed fraction of matching values is evaluated. An independent variant enables custom precision for numeric comparisons; for example, matching values up to their 4 <sup>th</sup> decimal place.

*Mapping to Dimensions*. This low-level functionality connects to multiple dimensions, depending on the context. When the source table represents ground truth (*gold standard*), matching relates to *accuracy*. *Consistency* becomes relevant as mismatching values are not coherent with reference (source) data. The functionality also addresses *completeness* by identifying values present in the source but missing from the target. From another perspective, assuming that data are expected to flow from source to target, such mismatches can indicate *currentness* issues serving as (indirect) latency assessment at the target end. Additionally, missing values from the target may signal *accessibility* problems, as data become unavailable to end users or downstream tasks fed with the target data.

#### 3.6.2 Adjacent Intervals Do Not Overlap \[f-12\].

This low-level functionality validates that intervals defined by two columns (e.g., lower and upper bounds) do not overlap across table rows. For instance, in hotel room reservations, where each row contains check-in and check-out dates for some room, preventing overlapping bookings for the same room is crucial. In general, such overlaps could indicate logical errors, resource conflicts, or misconfigured time periods across various domains. Implementation-wise, the functionality first sorts the rows by the lower bound column, then leverages the SQL LEAD window function to simultaneously access adjacent rows.

*Variants*. The first variant manages gaps between adjacent intervals. The gaps can be allowed (e.g., room reservations), disallowed (e.g., shifts in a production schedule), or required (e.g., mandatory cleaning period between bookings). The second variant controls whether zero-span intervals within single rows are permitted. The third enables interval validation within distinct groups (e.g., room numbers) independently. Rows are partitioned by a specified column, and overlap validation is applied only within each group, leveraging internally an SQL PARTITION BY clause.

*Mapping to Dimensions*. This functionality connects to *accuracy*, as overlapping intervals often indicate incorrect real-world representation. *Consistency* becomes relevant because interval validation requires examining relationships between adjacent ranges, not just individual values. The functionality also relates to *compliance* when domains enforce specific interval policies, such as non-overlapping booking rules.

### 3.7 Distribution-Based Checks

This category addresses the question “ *”How can the investigation of the distribution of data be used to draw conclusions about their quality?*” We introduce this category due to the prevalence of distribution-related functionalities across the examined tools. These checks primarily operate at the column level, i.e., investigating the distribution of single columns. The unifying characteristic is their focus on distribution analysis, rather than direct value examination. Most functionalities produce binary outcomes (*pass* or *fail*). Distribution checks can be characterized by:

- single columns
- pass/fail
- distribution computation followed by threshold comparison

Table [8](#tab8) presents the low-level functionalities in this category along with their implementation variants as identified across the examined tools.

<table><thead><tr><th>Low-level functionality</th><th>Implementation variants</th></tr></thead><tbody><tr><td rowspan="3"><i>f- 13.</i> histogram checks</td><td><i>f- 13 <span><math><msub><mrow><mi>a</mi></mrow></msub></math></span></i>. only the <i>k</i> most frequent values are considered</td></tr><tr><td><i>f- 13 <span><math><msub><mrow><mi>b</mi></mrow></msub></math></span></i>. execution of UDF on column values before the check (independent)</td></tr><tr><td><i>f- 13 <span><math><msub><mrow><mi>c</mi></mrow></msub></math></span></i>. execution of WHERE clause before the check (independent)</td></tr><tr><td rowspan="5"><i>f- 14.</i> quantiles checks</td><td><i>f- 14 <span><math><msub><mrow><mi>a</mi></mrow></msub></math></span></i>. user-defined single/multiple quantile(s)</td></tr><tr><td><i>f- 14 <span><math><msub><mrow><mi>b</mi></mrow></msub></math></span></i>. equality to a desired value</td></tr><tr><td><i>f- 14 <span><math><msub><mrow><mi>c</mi></mrow></msub></math></span></i>. threshold-based comparison</td></tr><tr><td><i>f- 14 <span><math><msub><mrow><mi>d</mi></mrow></msub></math></span></i>. approximate computation of quantiles (independent)</td></tr><tr><td><i>f- 14 <span><math><msub><mrow><mi>e</mi></mrow></msub></math></span></i>. comparison against reference data (independent)</td></tr></tbody></table>

The Low-Level Functionalities in the Category of Distribution Checks with Their Implementation Variants Found in the Tools Examined

Variants that can independently be combined with others are marked as *independent*.

#### 3.7.1 Histogram Checks \[f-13\].

This low-level functionality operates in two stages: first computing a column’s distribution histogram in a single pass on the data, then enabling user queries and threshold-based checks on the resulting distribution object. Designed primarily for categorical data, it creates bins corresponding to the distinct column values. For example, consider IoT devices reporting measurements along with their operation status (e.g., “Healthy”, “Unhealthy”, or “Unknown”). The functionality could verify that at any minute, at least 50% of devices report “Healthy” status and fewer than 10% report “Unknown”, ensuring reliability for downstream analysis.

*Variants*. While the functionality is primarily targeting categorical data, one variant offers the flexibility to discretize continuous values. Discretization is achieved through **user-defined functions** (**UDFs**) which are called on every column value, applying the transformation before distribution computation. Another variant allows users to specify a parameter *k* to consider only the top- *k* most frequent items, ignoring less frequent values in the distribution. An independent variant enables pre-filtering through SQL WHERE clauses, excluding specific rows from distribution computation.

*Mapping to Dimensions*. Distribution analysis connects to *accuracy* by providing indirect insights into how well the data represents the real-world. *Consistency* becomes relevant as distribution checks require coherence of single values with the rest of column values. The functionality also relates to *compliance* when distribution requirements stem from business rules or **key performance indicators** (**KPIs**), as in the IoT monitoring example.

#### 3.7.2 Quantiles Checks \[f-14\].

This low-level functionality computes and validates user-defined quantiles of column values. For instance, it can verify that the 95 <sup>th</sup> percentile of the column values matches a desired value.

*Variants*. The basic variants support single or multiple quantile checks, typically specified by the user in the form of *percentiles*. Validation can require either exact equality to desired value or threshold-based comparisons (greater or smaller than thresholds, or within a low and a high one).

Two independent variants enhance functionality. The first enables *approximate* quantile computation, improving performance at the cost of result accuracy. This approximation is implemented in two alternatives: the first leverages the ApproximatePercentile class of Apache Spark’s sql.catalyst optimizer,[^10] while the second leverages the KLL sketching algorithm \[[^38]\]. The second independent variant enables comparison against reference data, quantifying differences between computed and reference quantiles. Users can subsequently specify maximum acceptable differences, either as absolute or percentage values.

*Mapping to Dimensions*. Like distribution histogram checks, this functionality connects to *accuracy*, *consistency,* and *compliance*.

### 3.8 Volume- and Cardinality-Based Checks

This category addresses the question ” *What error detection checks on the quantity of the data serve as quality indicators?*”. We introduce this category to encompass the numerous functionalities, found across the tools that assess DQ through volume and cardinality.

While primarily operating at the column level, several checks in this category span multiple granularity levels, as shown in Table [1](#tab1). The result of the check can be binary (*pass* or *fail*), absolute counts, or relative measures (e.g., fraction of elements meeting specific criteria). Table [9](#tab9) presents the low-level functionalities in this category along with their implementation variants as identified across the examined tools.

<table><thead><tr><th>Low-level functionality</th><th>Implementation variants</th></tr></thead><tbody><tr><td><i>f- 15.</i> checks on the number of elements</td><td><i>f- 15 <span><math><msub><mrow><mi>a</mi></mrow></msub></math></span></i>. number of values in a column</td></tr><tr><td></td><td><i>f- 15 <span><math><msub><mrow><mi>b</mi></mrow></msub></math></span></i>. existence of at least one value in a column</td></tr><tr><td></td><td><i>f- 15 <span><math><msub><mrow><mi>c</mi></mrow></msub></math></span></i>. number of rows in a dataset</td></tr><tr><td></td><td><i>f- 15 <span><math><msub><mrow><mi>d</mi></mrow></msub></math></span></i>. number of columns in a table</td></tr><tr><td></td><td><i>f- 15 <span><math><msub><mrow><mi>e</mi></mrow></msub></math></span></i>. equality to a desired value (independent)</td></tr><tr><td></td><td><i>f- 15 <span><math><msub><mrow><mi>f</mi></mrow></msub></math></span></i>. threshold-based comparison (independent)</td></tr><tr><td></td><td><i>f- 15 <span><math><msub><mrow><mi>g</mi></mrow></msub></math></span></i>. comparison against reference data (independent)</td></tr><tr><td><i>f- 16.</i> distinct elements checks</td><td><i>f- 16 <span><math><msub><mrow><mi>a</mi></mrow></msub></math></span></i>. number of distinct values in a column (cardinality)</td></tr><tr><td></td><td><i>f- 16 <span><math><msub><mrow><mi>b</mi></mrow></msub></math></span></i>. fraction of distinct values in a column</td></tr><tr><td></td><td><i>f- 16 <span><math><msub><mrow><mi>c</mi></mrow></msub></math></span></i>. distinct values in a column cover/equal set of values</td></tr><tr><td></td><td><i>f- 16 <span><math><msub><mrow><mi>d</mi></mrow></msub></math></span></i>. approximate computation of distinct values (independent)</td></tr><tr><td></td><td><i>f- 16 <span><math><msub><mrow><mi>e</mi></mrow></msub></math></span></i>. comparison against reference data (independent)</td></tr><tr><td><i>f- 17.</i> unique elements checks</td><td><i>f- 17 <span><math><msub><mrow><mi>a</mi></mrow></msub></math></span></i>. number of unique values in a column</td></tr><tr><td></td><td><i>f- 17 <span><math><msub><mrow><mi>b</mi></mrow></msub></math></span></i>. fraction of unique values in a column over all values (uniqueness)</td></tr><tr><td></td><td><i>f- 17 <span><math><msub><mrow><mi>c</mi></mrow></msub></math></span></i>. fraction of unique values in a column over distinct ones (unique value ratio)</td></tr><tr><td></td><td><i>f- 17 <span><math><msub><mrow><mi>d</mi></mrow></msub></math></span></i>. values in a column are all unique (primary key verification)</td></tr><tr><td></td><td><i>f- 17 <span><math><msub><mrow><mi>e</mi></mrow></msub></math></span></i>. number/fraction of <i>duplicate</i> values in a column</td></tr><tr><td></td><td><i>f- 17 <span><math><msub><mrow><mi>f</mi></mrow></msub></math></span></i>. number/fraction of duplicate rows in a table</td></tr><tr><td></td><td><i>f- 17 <span><math><msub><mrow><mi>g</mi></mrow></msub></math></span></i>. number of duplicate columns in a table</td></tr><tr><td></td><td><i>f- 17 <span><math><msub><mrow><mi>h</mi></mrow></msub></math></span></i>. comparison against reference data (independent)</td></tr><tr><td><i>f- 18.</i> most common elements checks</td><td><i>f- 18 <span><math><msub><mrow><mi>a</mi></mrow></msub></math></span></i>. column values are not identical</td></tr><tr><td></td><td><i>f- 18 <span><math><msub><mrow><mi>b</mi></mrow></msub></math></span></i>. fraction of most common value over all values</td></tr><tr><td></td><td><i>f- 18 <span><math><msub><mrow><mi>c</mi></mrow></msub></math></span></i>. number of columns in a table with constant values</td></tr><tr><td></td><td><i>f- 18 <span><math><msub><mrow><mi>d</mi></mrow></msub></math></span></i>. execution of GROUP BY clause before the check (independent)</td></tr><tr><td></td><td><i>f- 18 <span><math><msub><mrow><mi>e</mi></mrow></msub></math></span></i>. comparison against reference data (independent)</td></tr><tr><td><i>f- 19.</i> missing elements checks</td><td><i>f- 19 <span><math><msub><mrow><mi>a</mi></mrow></msub></math></span></i>. a column has no missing values</td></tr><tr><td></td><td><i>f- 19 <span><math><msub><mrow><mi>b</mi></mrow></msub></math></span></i>. a column has only NULL values</td></tr><tr><td></td><td><i>f- 19 <span><math><msub><mrow><mi>c</mi></mrow></msub></math></span></i>. number/fraction of missing values in a column</td></tr><tr><td></td><td><i>f- 19 <span><math><msub><mrow><mi>d</mi></mrow></msub></math></span></i>. number/fraction of rows with missing values in a dataset</td></tr><tr><td></td><td><i>f- 19 <span><math><msub><mrow><mi>e</mi></mrow></msub></math></span></i>. number/fraction of empty rows in a rows</td></tr><tr><td></td><td><i>f- 19 <span><math><msub><mrow><mi>f</mi></mrow></msub></math></span></i>. number/fraction of rows with missing values in all/any columns of a set</td></tr><tr><td></td><td><i>f- 19 <span><math><msub><mrow><mi>g</mi></mrow></msub></math></span></i>. number/fraction of missing values in a table</td></tr><tr><td></td><td><i>f- 19 <span><math><msub><mrow><mi>h</mi></mrow></msub></math></span></i>. number of columns with missing values (empty or at least one)</td></tr><tr><td></td><td><i>f- 19 <span><math><msub><mrow><mi>i</mi></mrow></msub></math></span></i>. calculation of <i>non-missing</i> values, instead of missing (independent)</td></tr><tr><td></td><td><i>f- 19 <span><math><msub><mrow><mi>j</mi></mrow></msub></math></span></i>. custom-defined representation(s) of missing values (independent)</td></tr><tr><td></td><td><i>f- 19 <span><math><msub><mrow><mi>k</mi></mrow></msub></math></span></i>. execution of WHERE clause before the check (independent)</td></tr><tr><td></td><td><i>f- 19 <span><math><msub><mrow><mi>l</mi></mrow></msub></math></span></i>. execution of GROUP BY clause before the check (independent)</td></tr><tr><td></td><td><i>f- 19 <span><math><msub><mrow><mi>m</mi></mrow></msub></math></span></i>. comparison against reference data (independent)</td></tr><tr><td rowspan="2"><i>f- 20.</i> checks on representations<br>for missingness</td><td><i>f- 20 <span><math><msub><mrow><mi>a</mi></mrow></msub></math></span></i>. custom-defined representation(s) of missing values (independent)</td></tr><tr><td><i>f- 20 <span><math><msub><mrow><mi>b</mi></mrow></msub></math></span></i>. comparison against reference data (independent)</td></tr></tbody></table>

The Low-Level Functionalities in the Category of Volume- and Cardinality-Based Checks with Their Implementation Variants Found in the Tools Examined

Variants that can independently be combined with others are marked as *independent*.

#### 3.8.1 Checks on the Number of Elements \[f-15\].

This low-level functionality quantifies data elements at various granularity levels (*rows*, *columns*, or *table*), enabling comparison against expected counts or threshold-based constraints.

*Variants*. Variants of this low-level functionality offer different perspectives in evaluating the quantification of data elements across granularity levels:

- *column* level: number of values in a column or verification that at least one value exists in a column. The latter ensures bare minimum availability of the respective attribute;
- *row* level: number of columns (i.e., attributes) per row;
- *table* level: number of columns in the table.

An independent variant enables reference data comparison, where constraints apply to the difference between actual and reference quantities, rather than direct value counts.

*Mapping to Dimensions*. Volume-based checks primarily connect to *completeness*, providing insights into whether data adequately represent all expected real-world attributes or entities. They also relate to *accessibility*, particularly its availability aspect, as absent elements are inherently inaccessible to users or downstream tasks.

#### 3.8.2 Distinct Elements Checks \[f-16\].

This low-level functionality computes the number of *distinct* data elements, primarily operating at the column level, i.e., distinct values in a column. Tools frequently term this functionality as (column) *cardinality*. Here, *distinct* refers to elements appearing at least once (cf. *unique* elements in Section [3.8.3](#sec-3-8-3) has a slightly different meaning). For example, in sequence $\left[a , a , b\right]$ the distinct values are *a* and *b*. The computed cardinality can then be validated against user-defined counts or thresholds.

*Variants*. Beyond basic distinct value counts, the *fraction* of distinct values relative to total column values can be computed. A stricter variant validates set relationships, ensuring distinct values either cover or exactly match a specified value set (improper or proper subset, respectively). One independent variant employs the HyperLogLog++ sketching algorithm \[[^34]\] for approximate computation, trading accuracy for reduced computational cost. The other enables comparison against reference data, validating cardinality against ideal or desired states.

*Mapping to Dimensions*. Verifying the number of distinct values adds more specific requirements on top of the basic volume checks towards data *completeness*; not only the data volume has to meet the specified requirements, but also the data cardinality needs to meet constraints. The functionality also connects to *accessibility* as cardinality violations indicate non-represented (thus inaccessible) real-world entities. It also relates to *consistency*, as cardinality checks require coherence across all values; individual values, though correct in isolation, must collectively satisfy cardinality requirements.

#### 3.8.3 Unique Elements Checks \[f-17\].

This functionality quantifies *unique* data elements, i.e., those appearing *exactly* once. For instance in sequence $\left[a , a , b\right]$, only *b* is unique. This concept is directly linked to duplicate detection, redundant information, and validating primary key constraints in relational tables.

*Variants*. The functionality variants operate at multiple granularity levels:

- *column* level: The simplest variant verifies constraints on the number of unique values in a column. Other variants compute the fraction of unique values over all column values $\frac{\left|u n i q u e\right|}{n_{c o l}}$ (termed *uniqueness*) or over only distinct ones $\frac{\left|u n i q u e\right|}{\left|d i s t i n c t\right|}$ (termed *unique value ratio*). Primary key verification can be considered a stricter version of these variants, asking for *all* column values to be unique (i.e., $u n i q u e n e s s = u n i q u e v a l u e r a t i o = 1$). Another variant implements checks on the number or fraction of *duplicate* values in the column.
- *table* level: The number of duplicate rows is computed, or their fraction over the total number of rows in the table. Another variant computes the number of duplicate *columns* in the table, examining all-to-all pairs.

All these variants can be combined with comparisons against reference data.

*Mapping to Dimensions*. *Completeness*, *consistency,* and *accessibility* are the connected dimensions in descending order of connection strength, similarly to distinct value checks. Consistency, though, has a heightened relevancy, especially with the primary key verification variant. In some cases, *accuracy* can also become relevant, particularly when unexpected duplicate values indicate erroneous representation of the real world; for example, when a distinct entity of the real-world is mistakenly mapped to an existing key of another entity.

#### 3.8.4 Most Common Elements Checks \[f-18\].

This functionality focuses on the frequency of most common data elements, primarily at the column level. It helps to detect dominant categories and assess data uniformity. For example, in a customer feedback analysis, it can ensure that the column representing feedback type has not an overwhelming majority of “Positive” responses, which could indicate sampling bias.

*Variants*. This functionality offers several validation approaches. The basic variant ensures that column values are not identical. The generic form of this variant is verifying constraints on the fraction of the most common column value over the total number of column values. The difference between them is that the former fails if the fraction result is other than 1 (i.e., the frequency of the most common value equals the number of values in total), while in the latter, the user can define a custom threshold (e.g., the check fails if fraction $> 0.8$). At the table level, another variant counts columns containing constant values, comparing it with a user-defined threshold.

Two independent variants enhance functionality. One enables pre-processing through an SQL GROUP BY clause, which groups rows and potentially produces aggregated fields. The other supports comparison against reference data, enabling user to specify thresholds on the difference.

*Mapping to Dimensions*. This functionality primarily connects to *completeness*, as the frequency of most common data elements can directly reflect the degree to which real-world entities or attributes are represented in the data. *Consistency* becomes relevant because frequency patterns require coherence across values. The functionality can also relate to *accuracy*, particularly when unusual frequency patterns suggest data issues. For instance, in healthcare records, placeholder values such as “999” might be used to indicate missing or unknown blood pressure readings. If this placeholder appears with an unusually high frequency, it could point to problematic data entry or equipment malfunctions during data collection, compromising the accurate representation of patient health states.

#### 3.8.5 Missing Elements Checks \[f-19\].

This low-level functionality quantifies and checks the number of missing data elements across multiple granularity levels.

*Variants*. The following variants were found across the examined tools:

- *column level*: Some implemented checks offer support for verifying that a column has no missing values or is completely empty. The generic form these variants can take is verifying constraints on the number or fraction of missing values in the column.
- *row level*: The first variant calculates the number or fraction of rows with at least one missing value in any column (attribute). The second variant differentiates in searching for *completely* empty rows, e.g., records with all attributes missing (blank) in a CSV file. A compromise approach in-between them enables users to define a set of *important* columns, i.e., columns that must not have missing values. The two alternatives for the latter check relate to whether it fails when missing values occur in either *all* or *any* of the important columns.
- *table level*: The first variant measures the number of missing values in the table overall, regardless of rows and columns. In this case, the table is treated as a collection of individual data cells. The second variant focuses on the number of *columns* with missing values, with the two extreme cases to be empty columns on the one hand, and columns with at least one missing value on the other.

Several independent variants enhance functionality. The first inverts the measure of missing data, counting *non-missing* values. The second variant offers flexibility in terms of what is treated as missing. While some tools support only universally accepted representations for missing values, such as “NULL”, “NaN”, and so on, other tools enable users to define custom representations, such as empty strings, “-”, or any case-specific ones. Another two independent variants enable data preprocessing through SQL WHERE and GROUP BY clauses, respectively, before the actual check. Comparing missing data elements against reference data remains an option, as well.

*Mapping to Dimensions*. This functionality primarily connects to *completeness* through direct missing value quantification. It also relates to *accuracy*, as missing values denote absent or unknown real-world attributes that fail to be truthfully represented. *Accessibility* also becomes relevant since missing values are unavailable to users or downstream tasks.

#### 3.8.6 Checks on Representations for Missingness \[f-20\].

This functionality counts the number of distinct representations used to denote missing values in a table and compares it to user-defined values or thresholds. Note that besides the trivial detection of *explicitly* missing values (i.e., $⊥$, NULL, NaN), the more challenging task is detecting *implicitly* or *disguised* missing values. Disguised missing values are non-responses encoded in valid data values with diverse representations (e.g., “MISSING”, “unknown”, “111111”, 2000/01/01, -99, or 0) and are often caused by a user that did not want to provide the correct information or information that was unknown at the time of data entry \[[^49], [^53]\]. Detecting different representations for missing values helps to identify inconsistent practices about how missing or undefined data are handled.

*Variants*. The first variant allows users to define custom placeholders for missing values that are also detected besides “NULL” or “NaN” values. The second variant compares the number of representations found in the data at hand to the respective measurement in a reference table. Both variants are independent.

*Mapping to Dimensions*. Ensuring uniform representation(s) for missing information is clearly a step towards improved data *consistency*. Data values that represent absent information have to be coherent with the rest of the data at hand. Note that while, according to the implementation of \[f-20\] in tools, handling of disguised missing values can clearly be attributed to *consistency* (cf. Table [14](#tab14)), the same topic is investigated under the umbrella of *completeness* in research \[[^53]\].

<table><thead><tr><th>Low-level functionality</th><th>Implementation variants</th></tr></thead><tbody><tr><td rowspan="8"><i>f- 21.</i> correlation checks</td><td><i>f- 21 <span><math><msub><mrow><mi>a</mi></mrow></msub></math></span></i>. Pearson correlation</td></tr><tr><td><i>f- 21 <span><math><msub><mrow><mi>b</mi></mrow></msub></math></span></i>. Spearman’s rank correlation</td></tr><tr><td><i>f- 21 <span><math><msub><mrow><mi>c</mi></mrow></msub></math></span></i>. Kendall’s <span><math><mi>τ</mi></math></span></td></tr><tr><td><i>f- 21 <span><math><msub><mrow><mi>d</mi></mrow></msub></math></span></i>. Cramér’s <i>V</i></td></tr><tr><td><i>f- 21 <span><math><msub><mrow><mi>e</mi></mrow></msub></math></span></i>. automated discovery of highly correlated columns (independent)</td></tr><tr><td><i>f- 21 <span><math><msub><mrow><mi>f</mi></mrow></msub></math></span></i>. correlation between target & prediction (ML-specific, orthogonal)</td></tr><tr><td><i>f- 21 <span><math><msub><mrow><mi>g</mi></mrow></msub></math></span></i>. correlation between target & features (ML-specific, orthogonal)</td></tr><tr><td><i>f- 21 <span><math><msub><mrow><mi>h</mi></mrow></msub></math></span></i>. comparison against reference data (independent)</td></tr><tr><td><i>f- 22.</i> mutual information checks</td><td>-</td></tr></tbody></table>

The Low-Level Functionalities in the Category of Correlation-Based Checks with Their Implementation Variants Found in the Tools Examined

Variants that can independently be combined with others are marked as *independent*.

<table><thead><tr><th>Low-level functionality</th><th>Implementation variants</th></tr></thead><tbody><tr><td><i>f- 23.</i> anomaly detection</td><td>-</td></tr><tr><td><i>f- 24.</i> targets do not conflict</td><td>-</td></tr><tr><td rowspan="6"><i>f- 25.</i> data drift detection</td><td><i>f- 25 <span><math><msub><mrow><mi>a</mi></mrow></msub></math></span></i>. ad-hoc (<span><math><mi>μ</mi> <mo>±</mo> <mi>n</mi> <mi>σ</mi></math></span>)</td></tr><tr><td><i>f- 25 <span><math><msub><mrow><mi>b</mi></mrow></msub></math></span></i>. statistical testing (Kolmogorov-Smirnov, Chi-squared)</td></tr><tr><td><i>f- 25 <span><math><msub><mrow><mi>c</mi></mrow></msub></math></span></i>. distance between distributions (PSI, SWD, KL diverg., Jensen–Shannon)</td></tr><tr><td><i>f- 25 <span><math><msub><mrow><mi>d</mi></mrow></msub></math></span></i>. drift detection on embeddings data (classification, distance, MMD)</td></tr><tr><td><i>f- 25 <span><math><msub><mrow><mi>e</mi></mrow></msub></math></span></i>. automated selection of method, based on data type, size, cardinality</td></tr><tr><td><i>f- 25 <span><math><msub><mrow><mi>f</mi></mrow></msub></math></span></i>. number/fraction of columns with data drift</td></tr></tbody></table>

The Low-Level Functionalities in the Category of ML-Oriented Checks with Their Implementation Variants Found in the Tools Examined

Variants that can independently be combined with others are marked as *independent*.

### 3.9 Correlation-Based Checks

This category addresses the question “ *What are error detection checks about relationships between columns of a table?*”. These functionalities primarily operate at the column level, examining pairs of columns, with few variants extending to the table level, as shown in Table [1](#tab1). Typically, the input to these checks is two columns of the same table and the output is binary, *pass* or *fail*. Table [10](#tab10) presents the low-level functionalities in this category along with their implementation variants.

#### 3.9.1 Correlation \[f-21\] and Mutual Information \[f-22\] Checks.

We present together the low-level functionalities about correlation and mutual information since there is a significant degree of similarity between them. Mutual information is a statistic measure that quantifies the amount of information obtained about the values in a column by observing the values of another column (cf. \[[^22]\] for details).Their difference lies in the computed measure of relationship between the input columns (correlation and mutual information respectively). Both functionalities operate on derived measures rather than raw values, validating these measures against user-defined constraints.

*Variants*. We present here the variants for the correlation functionality, since no variants were found for the mutual information one. These variants primarily feature different correlation alternatives, computed on pairs of the input columns. *Pearson*, *Spearman’s* (rank), *Kendall’s* (rank), and *Cramér’s* correlation alternatives were found across the examined tools. Users can specify either exact target values or thresholds for these measures.

Four independent variants extend functionality. The first offers automated discovery of highly correlated columns, accepting a whole table as input (table-level check). Two other variants offer functionality tailored to ML scenarios through calculating the correlation between the target column and either the prediction, or the features respectively. We note that the correlation between target and prediction can provide insights about the performance of an ML model, while the correlation between target and features can reveal columns (attributes) strongly coupled with the ground truth the model is expected to predict. The last variant supports comparisons against reference data, enabling the user to specify thresholds on the computed difference.

*Mapping to Dimensions*. These functionalities connect to *accuracy*, as inter-column relationships often reflect real-world associations. They also relate to *consistency*, as failed checks indicate contradictions between column values.

### 3.10 ML-Oriented Checks

The low-level functionalities in this category share their close relation to ML downstream tasks. They can provide insights into the question “What error detection checks can be executed on a dataset, before it is fed to some ML downstream application to ensure its integrity?”. While primarily operating at the table granularity level, some variants, especially related to data drift detection, can also operate on standalone columns (column-level). Table [11](#tab11) lists the low-level functionalities in this category along with their implementation variants.

#### 3.10.1 Anomaly Detection \[f-23\].

This low-level functionality detects anomalies in the table at hand, by comparing either the raw data values or measures computed on them against user-defined thresholds or historical reference data. Only one tool was found to offer anomaly detection functionality, while several other tools claim to incorporate it as an advanced feature in their premium version, which is subject to paid subscription.[^11] The recorded anomaly detection functionality is based on a wide range of built-in (heuristic, non-ML) anomaly detection strategies, covering both absolute and relative comparisons, and offering support for batch (primarily) and streaming data.

*Mapping to Dimensions*. This functionality connects to *accuracy*, since anomalies are ultimately erroneous or unexpected values that fail to truthfully represent the intended real-world attribute. It also relates to *consistency*, because an anomaly is apparently incoherent and contradicting with the rest of the data at hand.

#### 3.10.2 No Conflicts in Target Label/Value \[f-24\].

This low-level functionality ensures the absence of conflicts within the target labels (classification) or values (regression) in a table (dataset) used for model training. Here, a *conflict* is defined as the existence of different labels or target values for the same set of attribute values, i.e., rows with exactly the same column values except for the one defined as target by the user. Note that this functionality is different than row-level uniqueness. In a violating case, between two conflicting rows, the column that represents the label or target has different values; thus, a uniqueness check at the row level is not capable of detecting the issue.

*Mapping to Dimensions*. This functionality primarily connects to *consistency*, since conflicting rows are not coherent with the rest of the data at hand. *Accuracy* becomes also relevant, particularly when rows represent real-world entities, since conflicts indicate untruthful capturing of real-world attributes in at least one of the involved rows.

#### 3.10.3 Data Drift Detection \[f-25\].

This low-level functionality aims to detect data drift (i.e., significant change in data distribution) on the data at hand and requires the existence of reference data; it can also be seen as an anomaly detection functionality. The latter are considered as the ideal or desired state the data at hand are expected to be. For instance, this low-level functionality could be used in a predictive maintenance (PdM) industrial scenario, where the utter goal is to detect failures before they actually occur. Suppose that several sensors are spread across the multiple components of a production line, taking measures periodically about temperature, vibration, and so on, on the respective component. These measurements are gathered and analyzed centrally in order to detect anomalies that can lead to failures. In PdM scenarios, it is common that some change (e.g., repair) in one component of the production line causes significant changes in the measurements taken at neighboring components that have not undergone any change \[[^69]\]. Provided that some reference data about standard operation of each component are available, this low-level functionality could be employed to detect that untouched components have measurements that are probably from another distribution than the normal, expected one; raising timely alerts for manual inspection or system restart, and so on.

*Variants*. Several variants regarding the way data drift is detected were found in the source code of the examined tools. The first variant detects data drift *ad-hoc* by computing the number of standard deviations the current mean value differs from the mean value of the reference data. In particular, data drift is detected iff $\mu > \mu_{r e f} + n \sigma_{r e f} \text{or} \mu < \mu_{r e f} - n \sigma_{r e f} ,$ where $\mu$ is the mean value of the data at hand, $\mu_{r e f}$ is the mean value of the reference data, $\sigma_{r e f}$ is the standard deviation of the reference data and *n* is a user-defined positive integer.

The second variant uses statistical testing to define how likely is that the data at hand and the reference data are drawn from the same distribution. **Kolmogorov–Smirnov** (**KS**) and Chi-squared tests are both found in terms of implementation, letting the user define an upper threshold on the test result. The third variant uses distribution distance measures to quantify the difference between the distribution of the data at hand and the distribution of the reference data. **Population Stability Index** (**PSI**), **Sliced Wasserstein Distance** (**SWD**), **Kullback–Leibler** (**KL**) divergence, and Jensen–Shannon divergence are the distribution distance measures employed by the tools implementing this alternative.

The fourth variant is tailored to embeddings, i.e., vectors representing real objects, such as text, images, and so on, and are designed to be consumed by ML applications. The following three methods were found for detecting data drift in embeddings data:

- *Binary classification*: a linear binary classifier is trained from scratch to distinguish between the data at hand and the reference data. The **area under curve** (**AUC**) of the classifier’s ROC curve is considered as the “data drift score”, enabling the user to define thresholds on this value.
- *Distance of mean embeddings*: the mean embedding is calculated on the data at hand and the reference data and the distance between them is computed. The available distance/similarity metrics between the two vectors are *euclidean*, *manhattan*, *chebysev* distances and *cosine* similarity. The user can define thresholds on the distance result.
- *Maximum Mean Discrepancy (MMD)*: MMD is computed between the data at hand and the reference data. The user can define thresholds on the result.

Independent variants of this low-level functionality include automated selection of the data drift detection method, based on the type (e.g., categorical), size and cardinality of the data at hand. This hides from the user the complexity of defining the data drift detection method and the varying parameters required for each method to properly execute the check. In this case, the tool developers have a predefined set of default parameters and execution falls back to them, unless otherwise specified by the user. Lastly, an independent variant that is more relevant to the *table* granularity level, rather than the column one, is computing the number or fraction of columns for which data drift is detected. In this variant, a reference *table* is required and is compared against the *table* at hand. There is also the option for the user to define a mapping between the columns of the table at hand and the reference table. After the mapping establishment, the tool examines for data drift all the respective column pairs among the tables and reports the number or fraction of columns with data drift detected. We consider this variant as independent, since the drift detection method can be any of the aforementioned variants.

*Mapping to Dimensions*. *Accuracy*, *consistency,* and *compliance* are closely related to distribution-based checks, as explained in Section [3.7](#sec-3-7).

## 4 Discussion: Materialization of DQ Dimensions

In this section, we reflect on the findings of our survey by starting from the six selected DQ dimensions towards the identified low-level functionalities to shed light on the materialization of DQ dimensions in practice in terms of the checks involved. Recall that the reason we focus on these dimensions is that they correspond to the inherent DQ data properties and are targeted in an application-independent manner by the examined tools. For each selected dimension, we connect the dots between their theoretical definitions and the low-level functionalities that contribute to their materialization. As presented in the previous section, several functionalities are shared across multiple dimensions. Across these functionalities, we identified two different approaches:

- *Direct assessment*: checking actual data values against specific criteria, e.g., validating an e-mail format to assess accuracy, or checking for missing values to assess completeness;
- *Indirect assessment*: checking metadata or patterns derived from the data (i.e., data profiling results), e.g., examining cardinalities to assess completeness.

Also, for several checks, a reference dataset representing the ground truth is employed. In alignment to the categorization from Table [1](#tab1), the materialization can progress through increasing granularity levels: from *value level*, over *row* and *column* level, to *table* level assessment. Starting from single values and gradually expanding the validation scope towards the whole table can add contextual information crucial for uncovering DQ issues that went unnoticed at the previous level.

### 4.1 Accuracy

Data accuracy is defined as “ *the degree to which data has attributes that correctly represent the true value of the intended attribute of a concept or event in a specific context of use. It has two main aspects, syntactic and semantic accuracy* ” \[[^28]\]. Note that other definitions for accuracy also exist in literature (e.g., \[[^31]\]), but the essence remains the same.

*Direct Assessment*. At the value level, direct accuracy assessment can be achieved through functionalities that examine either the syntax or semantics of individual values. Regular expressions, formats/patterns \[f-03\] \[f-02\], and data types \[f-10\] are the most common ways to check the syntax, while ranges or sets of accepted values \[f-01\]. are most common to check semantics. Although many DQ problems occur at the value level (e.g., wrong data entry), contextual information from the *row level* \[f-05\] \[f-06\] (e.g., match of city and zip code) or *column level* \[f-08\] (e.g., comparison of distribution) is often required for successful detection. The spectrum of direct accuracy assessment also entails *table level* validations \[f-11\] \[f-12\] \[f-24\], which can provide even semantically richer insights on data accuracy. Note that the existence of a reference table, treated as the source of truth, may be required \[f-11\].

*Indirect Assessment*. Here, the most common checks are on *single-column* data profiling results, including statistics \[f-07\], distribution \[f-13\] \[f-14\], and data drift detection \[f-25\], as well as cardinalities \[f-17\] \[f-18\] \[f-19\]. Inter-column relations \[f-21\] \[f-22\] can also indirectly point to accuracy issues, extending the scope of investigation in-between the column and table level. Anomaly detection \[f-23\] completes the spectrum of accuracy assessment from the table perspective.

### 4.2 Completeness

Data completeness is defined as “ *the degree to which subject data associated with an entity has values for all expected attributes and related entity instances in a specific context of use* ” \[[^28]\].

*Direct Assessment*. Quantification and verification of data volume \[f-15\] and dimensionality \[f-09\], or identification of missing values \[f-19\] can directly assess completeness. Note that missing values can sometimes be represented by placeholders \[f-18\] such as “NaN”, “0000”, or “January 1st, 1970”. In scenarios where a ground truth data source is available, e.g., similar to those typically employed in data integration and entity resolution pipelines to reconcile differences in the representation of the same entity, completeness assessment at the *table* level can rely on comparative results \[f-11\]. This is particularly useful in data integration and transformation workflows, ensuring no data loss or omissions during the process.

*Indirect Assessment*. Our findings reveal a family of functionalities that indirectly target completeness assessment by operating on data profiling results, such as distinct \[f-16\] or unique & duplicate \[f-17\] values. These checks aim to add more depth and capture subtler gaps in the data at hand. For instance, although missing values (part of direct assessment) clearly indicate non-present information (i.e., an apparent gap in the data), quantifying the unique elements can capture errors even when the overall data volume matches the expected, due to duplicates (i.e., subtler gaps).

### 4.3 Consistency

Data consistency is defined as “ *the degree to which data has attributes that are free from contradiction and are coherent with other data in a specific context of use. It can be either or both among data regarding one entity and across similar data for comparable entities* ” \[[^28]\]. While consistency can be assessed (in accordance with the other dimensions) at different granularity levels, our findings indicate an increased importance of the assessment at the *column* level.

*Direct Assessment*. Consistency of single values can be assessed through ensuring referential integrity \[f-01\]., where a set of accepted references is required. Simple \[f-05\] or more complex \[f-06\] relationships between row values directly target consistency at the *row level*, while verifying the ordering of column values \[f-08\] extends to the *column level*. At the *table level*, consistency can be translated to non-overlapping intervals between adjacent rows \[f-12\], capturing logical or temporal continuity. Complex logic for managing gaps between intervals can be tailored to fit various use cases. Additionally, particularly for ML applications, consistency may take the form of non-contradicting training examples \[f-24\].

*Indirect Assessment*. Descriptive statistics \[f-07\], distribution insights \[f-13\] \[f-14\] \[f-25\] and cardinality-related data profiling \[f-16\] \[f-17\] \[f-18\] can serve as indirect consistency indicators. Note that especially quantifying unique data elements \[f-17\] can be crucial for the consistency of primary keys. Standardized handling of missing values \[f-20\] can partially contribute to achieving consistency, as well. Inter-column relationships \[f-21\] \[f-22\] extend this assessment to multiple columns, offering a richer context for understanding coherence.

### 4.4 Currentness

Data currentness is defined as “ *the degree to which data has attributes that are of the right age in a specific context of use* ” \[[^28]\] and typically requires a reference timestamp against which the data is compared to.

*Direct Assessment*. Checking if data values align with expected timeframes \[f-04\] squarely assesses currentness. The recorded variants indicate that subtle modifications to the reference timestamp, against which data are compared, can tailor the assessment towards data *freshness* or *latency*.

*Indirect Assessment*. Especially for latency, the degree of matching between two tables \[f-11\] can provide insights from a workflow perspective, taking into account contexts where data are expected to flow seamlessly from one source to another.

### 4.5 Accessibility

Data accessibility is defined as *“the degree to which data can be accessed in a specific context of use, particularly by people who need supporting technology or special configuration because of some disability”* \[[^28]\]. In our analysis, we primarily focus on the first part of the definition, since it can inherently be quantified in an application-agnostic manner. Unfortunately, although of heightened importance, accessibility in the context of people with disabilities is not as straightforward. Thus, here, accessibility relates to whether data can be retrieved, interpreted, and used effectively by users or downstream tasks. Our findings reveal that accessibility can be assessed with functionalities that check whether data is physically present and also properly structured. Note that while the first aspect has a high overlap with the completeness dimension, the second one relates to compliance.

*Direct Assessment*. Checking conformance to data types and specific formats \[f-10\] can directly point to potential accessibility issues from the *structural* perspective. This can be of great benefit to downstream systems expecting to ingest the data in a specific format. Other schema information, such as the presence, absence, and/or order of columns \[f-09\], also contribute to the assessment of accessibility. However, non-present data are also inaccessible after all. Checking the quantity of the present data elements \[f-15\] or the missing ones \[f-19\] can provide insights about gaps that impede data retrieval from this perspective. At the table level, accessibility can be assessed through the successful matching between tables \[f-11\]; useful for ensuring that data tables preserve their structure and are compatible with downstream tasks during transformations, or integrations from various sources.

*Indirect Assessment*. Quantifying the distinct \[f-16\] and unique \[f-17\] data elements can also shed light on accessibility (primarily the non-present information aspect) as part of a more in-depth, indirect approach.

### 4.6 Compliance

Data compliance is defined as “ *the degree to which data has attributes that adhere to standards, conventions or regulations in force and similar rules relating to data quality in a specific context of use* ”\[[^28]\] and is therefore inherently rule-driven.

*Direct Assessment*. Adherence to specific formats \[f-02\], patterns \[f-03\], predefined data types \[f-10\], or accepted ranges/sets \[f-01\]. directly assess compliance, ensuring the alignment of individual data *values* with expected regulatory or domain constraints. At the *row* level, compliance is assessed through logical expressions \[f-05\] \[f-06\] such as ranges, dependencies, or calculated fields that must meet predefined criteria. At the *column* level, it can take the form of verifying ordering of values \[f-08\]. Verifying relationships between rows, such as checking non-overlapping intervals \[f-12\] extend to the *table level*, along with functionalities that validate the presence of mandatory columns \[f-09\], ensuring that a table meets schema requirements dictated by external standards or agreements.

*Indirect Assessment*. Examination of descriptive statistics \[f-07\], distribution \[f-13\] \[f-14\] \[f-25\], cardinality \[f-16\], and uniqueness \[f-17\] can indirectly point to compliance violations, primarily at the *column level*.

### 4.7 Synthesis of Findings

Based on our findings, we draw the following conclusions (C):

- **Fragmented landscape of DQ checks**. Each examined DQ tool implements a diverse subset of low-level functionalities, with significant overlap between them, but no tool covers the entire spectrum of functionalities observed. Attaining a comprehensive understanding of data verification capabilities available in current tools can be time- and effort-consuming, especially for practitioners selecting the right tool for a given use case.
- **Non-standardized terminology**. Similar functionalities at the source code level are found under diverse names across tools (e.g., *recency* and *freshness* for \[f-04\]). Conversely, similar terms do not necessarily correspond to the same low-level functionality (e.g., *invalid* as part of value-level regex matching \[f-03\] and *validation* as part of row-wise SQL expressions \[f-06\]). Transferring experiences and understanding can therefore be very challenging between practitioners. For our survey, detailed source code examination was required to manually align the diverse terms to the same functionalities.
- **Perspective-dependent mappings**. Since each DQ dimension can be viewed from many perspectives (e.g., completeness in terms of missing values or population completeness), connecting the dots to the low-level functionalities is heavily dependent on the respective perspective from which each functionality is considered. This leads to a many-to-many relationship, which however provides valuable insights for the refinement of scientific DQ assessment models.
- **Relationships between dimensions**. Reflecting on the way DQ dimensions are materialized in current DQ tools, some dimensions are inter-connected in a non-intuitive way. For example, completeness and accessibility share a close relation to physically non-present information, while accessibility and compliance inherently connect to conformance of values to formats or rules. These findings contribute to the further research on DQ dimensions and potentially trigger a critical reflection on the general idea to “start a DQ program by selecting DQ dimensions”.
- **Current DQ tools do not comprehensively implement DQ dimensions.** Our survey found that most tools ignore DQ dimensions entirely, with some exceptions like completeness in Apache Griffin. We believe this happens due to C1–C4, and more specifically, because DQ dimensions do not map clearly to low-level functionalities, making them hard to be implemented. Hence, the use of DQ dimensions in practical tools is limited to simple grouping of low-level functionalities (with can be either data profiling tasks or error detection tasks), without a comprehensive set of directly applicable DQ metrics. Figure [2](#fig2) illustrates this gap between what research promotes (cf. \[[^33], [^65]\]) and what practical tools implement.

![](https://dl.acm.org/cms/10.1145/3786328/asset/d4804bac-b4f2-4461-99cb-9afc88e6b1bb/assets/images/large/jdiq-2025-02-srv-0001-f02.jpg)

Use of DQ dimensions in tools: research versus reality.

## 5 Related Work

In this section, we first compare our work to other surveys that investigate DQ tools (cf. Section [5.1](#sec-5-1)) and second, provide an overview on relevant research aiming to define DQ dimensions and putting them in a practical context (cf. Section [5.2](#sec-5-2)).

### 5.1 Related Surveys of DQ Tool Functionalities

In 2005, Barateiro and Galhardas \[[^17]\] compared the technical functionalities of 9 academic and 28 commercial DQ tools. Pushkarev et al. \[[^52]\] evaluated 7 open-source or freely available DQ tools in terms of *performance criteria and core functionalities* in 2010. Pulla et al. \[[^51]\] published a revised version of \[[^52]\] in 2016, with an extended list of 10 open-source DQ tools. All three surveys differ from our work in that they investigate the availability of general functionalities, such as, support for different data source connectors, a metadata repository, data lineage, or whether the tools have a GUI. However, these surveys do not investigate the existence of certain low-level functionalities, such as “f-01. values fall within range or set” (cf. Section [3.5](#sec-3-5)) nor do they map these functionalities to DQ dimensions. Also, \[[^17], [^51], [^52]\] do not reflect recent developments in DQ tools due to their publication date.

The closest work to ours is a large-scaled, systematic survey, conducted by Ehrlinger and Wöß \[[^25]\], who investigated 8 commercial and 5 open-source ones. The authors requested fully functional trial licenses via customer support for each commercial tools and also evaluated the functionality of the open-source tools. Among other contributions, they provide insights regarding the coverage of DQ metrics and dimensions supported by the examined tools. In contrast to \[[^25]\], we focus on the investigation of *open-source* tools only. This choice enables us to investigate the source code of the examined tools directly, uncovering the actual functionalities. Hence, in this survey we are able to investigate *low-level* functionalities from a *technical* perspective, while \[[^25]\] investigated the functionalities of DQ tools from a *user* perspective.

Another difference is the absence of predefined functionality requirements in our survey. While Ehrlinger and Wöß \[[^25]\] propose a comprehensive catalog of *expected* functionalities, focusing on data profiling and automated DQ monitoring, we deliberately start with no predefined requirements, which enables us to investigate the functionalities that are actually used in practice from an *unbiased* perspective. Due to the time that has passed, we were also able to investigate newer tools, only two of them (MobyDQ and Apache Griffin) overlapping with \[[^25]\]. Note that also for these two tools, we investigated a newer version.

Ehrlinger and Wöß \[[^25]\] conclude that (especially commercial) DQ tools often do not use the concept of DQ dimensions and metrics as suggested by research, and when they do, it is mainly for grouping different data validation checks. We build upon this observation by investigating this connection between concrete data validation checks and high-level DQ dimensions more closely, enabling further research in how DQ dimensions are implemented in DQ tools.

### 5.2 Related Research on DQ Dimensions

Wang and Strong \[[^65]\] were one of the first to argue that DQ is a multifaceted concept and presented the first classification of DQ dimensions and their hierarchical structure. In the meantime, a lot of research on DQ dimensions, different definitions, and possible classifications have been proposed \[[^21], [^39], [^45], [^58]\]. Despite this large body of knowledge and several standards that have been developed (e.g., ISO/IEC 25012 \[[^28]\] or ISO/IEC 25024 \[[^29]\]), there is still no agreement on which DQ dimensions are essential to use for a specific DQ project \[[^60]\]. Mohammed et al. \[[^45]\] even go so far as to claim that a new perspective on DQ assessment is needed, because of the fragmented landscape of DQ dimensions. There has also been attempts to provide a mapping between DQ dimensions and specific DQ problems. While Almutiry et al. \[[^15]\] provide a domain-specific mapping for electronic health records, Laranjeiro et al. \[[^39]\] map related research about DQ problems to DQ dimensions. In contrast, we start from widely used DQ tools and investigate data validation checks in form of low-level functionalities implemented. To the best of our knowledge, this is the first work that (i) compiles a uniform view on functionalities for data validation and (ii) maps them to DQ dimensions. We therefore believe that this research offers insights into the practical implementation of DQ dimensions with results that support a common vision on how to assess DQ.

## 6 Conclusion and Future Work

In this survey, we have investigated the low-level functionalities of seven open-source DQ tools, highlighted their implementation variants, and mapped them to the most closely related DQ dimensions. In alignment with prior work, we found that DQ dimensions are not widely used in current DQ tools \[[^25]\]. Hence, we go one step further and analyze the connection of the low-level functionalities implemented in the tools with the high-level DQ dimensions. We show how single functionalities can be viewed from multiple perspectives and how different functionalities contribute to each DQ dimension. We believe that the presented results are of interest to both practitioners and researchers, since they offer a unified view of the fragmented landscape of DQ checks, while providing insights into what aspects are involved in the assessment of DQ dimensions.

Regarding future work, more research should be devoted to resolve the current inconsistent terminology of DQ dimensions (cf. \[[^45]\]). A unified view on DQ assessment would enable the development of standardized data verification checks for DQ tools. In addition, we observed that the vast majority of open-source tools perform DQ assessment on relational data and do not support other data formats such as data streams or graphs. Hence, we would like to investigate the extent to which current tools and their DQ assessment capabilities are suitable to assess the quality of data streams. Considering additional challenges such as time-related dependencies and distribution in data streams, we believe that the development of new methods will be required.

[^1]: A preliminary short version of our work has appeared in \[[36](#Bib0036)\] as a technical report.

[Return to text](#core-fn9-1)

[^2]: [https://atlan.com/open-source-data-quality-tools/](https://atlan.com/open-source-data-quality-tools/)

[Return to text](#core-fn10-1)

[^3]: [https://github.com/dbt-labs/dbt-core](https://github.com/dbt-labs/dbt-core)

[Return to text](#core-fn11-1)

[^4]: [https://github.com/awslabs/deequ](https://github.com/awslabs/deequ)

[Return to text](#core-fn12-1)

[^5]: [https://github.com/evidentlyai/evidently](https://github.com/evidentlyai/evidently)

[Return to text](#core-fn13-1)

[^6]: [https://github.com/great-expectations/great\_expectations](https://github.com/great-expectations/great_expectations)

[Return to text](#core-fn14-1)

[^7]: [https://github.com/apache/griffin](https://github.com/apache/griffin)

[Return to text](#core-fn15-1)

[^8]: [https://github.com/ubisoft/mobydq](https://github.com/ubisoft/mobydq)

[Return to text](#core-fn16-1)

[^9]: [https://github.com/sodadata/soda-core](https://github.com/sodadata/soda-core)

[Return to text](#core-fn17-1)

[^10]: [https://github.com/apache/spark/blob/master/sql/catalyst/src/main/scala/org/apache/spark/sql/catalyst/expressions/aggregate/ApproximatePercentile.scala](https://github.com/apache/spark/blob/master/sql/catalyst/src/main/scala/org/apache/spark/sql/catalyst/expressions/aggregate/ApproximatePercentile.scala)

[Return to text](#core-fn18-1)

[^11]: We were not able to verify the exact anomaly detection functionality offered in these cases, since the scope of our survey was examining the source code of the investigated functionalities.

[Return to text](#core-fn19-1)

[^12]: Some names are hyphenated to fit in the line width. In these cases, the actual name does not contain a hyphen.

[Return to text](#core-fn20-1)

[^13]: Mohamed Abdelaal, Christian Hammacher, and Harald Schöning. 2023. REIN: A Comprehensive Benchmark Framework for Data Cleaning Methods in ML Pipelines. *ArXiv* abs/2302.04702, (2023). Retrieved from [https://api.semanticscholar.org/CorpusID:256697649](https://api.semanticscholar.org/CorpusID:256697649)

[Go to Citation](#core-Bib0001-1)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=REIN%3A+A+Comprehensive+Benchmark+Framework+for+Data+Cleaning+Methods+in+ML+Pipelines&author=Mohamed+Abdelaal&author=Christian+Hammacher&author=Harald+Sch%C3%B6ning&publication_year=2023)

[^14]: Anastasia Ailamaki, Samuel Madden, Daniel Abadi, Gustavo Alonso, Sihem Amer-Yahia, Magdalena Balazinska, Philip A. Bernstein, Peter Boncz, Michael Cafarella, Surajit Chaudhuri, Susan Davidson, David DeWitt, Yanlei Diao, Xin Luna Dong, Michael Franklin, Juliana Freire, Johannes Gehrke, Alon Halevy, Joseph M. Hellerstein, Mark D. Hill, Stratos Idreos, Yannis Ioannidis, Christoph Koch, Donald Kossmann, Tim Kraska, Arun Kumar, Guoliang Li, Volker Markl, Renée Miller, C. Mohan, Thomas Neumann, Beng Chin Ooi, Fatma Ozcan, Aditya Parameswaran, Ippokratis Pandis, Jignesh M. Patel, Andrew Pavlo, Danica Porobic, Viktor Sanca, Michael Stonebraker, Julia Stoyanovich, Dan Suciu, Wang-Chiew Tan, Shiv Venkataraman, Matei Zaharia, and Stanley B. Zdonik. 2025. The Cambridge Report on Database Research. DOI:

[Go to Citation](#core-Bib0002-1)

[Crossref](https://doi.org/10.48550/ARXIV.2504.11259)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=The+Cambridge+Report+on+Database+Research&publication_year=2025&doi=10.48550%2FARXIV.2504.11259)

[^15]: Omar Almutiry, Gary Wills, and Richard Crowder. 2015. Dimension-oriented taxonomy of data quality problems in electronic health record. *IADIS International Journal on WWW/Internet* 13, 2 (2015), 1–17.

[Go to Citation](#core-Bib0003-1)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=Dimension-oriented+taxonomy+of+data+quality+problems+in+electronic+health+record&author=Omar+Almutiry&author=Gary+Wills&author=Richard+Crowder&publication_year=2015&journal=IADIS+International+Journal+on+WWW%2FInternet&pages=1-17)

[^16]: Otmane Azeroual, Gunter Saake, and Eike Schallehn. 2018. Analyzing data quality issues in research information systems via data profiling. *International Journal of Information Management* 41 (2018), 50–56. DOI:

[Go to Citation](#core-Bib0004-1)

[Crossref](https://doi.org/10.1016/j.ijinfomgt.2018.02.007)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=Analyzing+data+quality+issues+in+research+information+systems+via+data+profiling&author=Otmane+Azeroual&author=Gunter+Saake&author=Eike+Schallehn&publication_year=2018&journal=International+Journal+of+Information+Management&pages=50-56&doi=10.1016%2Fj.ijinfomgt.2018.02.007)

[^17]: José Barateiro and Helena Galhardas. 2005. A survey of data quality tools. *Datenbank-Spektrum* 14 (2005), 15–21.

[Google Scholar](https://scholar.google.com/scholar_lookup?title=A+survey+of+data+quality+tools&author=Jos%C3%A9+Barateiro&author=Helena+Galhardas&publication_year=2005&journal=Datenbank-Spektrum&pages=15-21)

[^18]: Carlo Batini, Cinzia Cappiello, Chiara Francalanci, and Andrea Maurino. 2009. Methodologies for data quality assessment and improvement. *ACM Computing Surveys* 41, 3 (2009), 16:1–16:52.

[Go to Citation](#core-Bib0006-1)

[Digital Library](https://dl.acm.org/doi/10.1145/1541880.1541883)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=Methodologies+for+data+quality+assessment+and+improvement&author=Carlo+Batini&author=Cinzia+Cappiello&author=Chiara+Francalanci&author=Andrea+Maurino&publication_year=2009&journal=ACM+Computing+Surveys&pages=16%3A1%E2%80%9316%3A52&doi=10.1145%2F1541880.1541883)

[^19]: Carlo Batini and Monica Scannapieco. 2016. *Data and Information Quality: Dimensions, Principles and Techniques*. Springer International Publishing, Cham, Switzerland. DOI:

[Crossref](https://doi.org/10.1007/978-3-319-24106-7)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=Data+and+Information+Quality%3A+Dimensions%2C+Principles+and+Techniques&author=Carlo+Batini&author=Monica+Scannapieco&publication_year=2016&doi=10.1007%2F978-3-319-24106-7)

[^20]: Eric Breck, Marty Zinkevich, Neoklis Polyzotis, Steven Whang, and Sudip Roy. 2019. Data validation for machine learning. In *Proceedings of SysML*, Vol. 1. Systems and Machine Learning Foundation, 334–347. Retrieved from [https://mlsys.org/Conferences/2019/doc/2019/167.pdf](https://mlsys.org/Conferences/2019/doc/2019/167.pdf)

[Go to Citation](#core-Bib0008-1)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=Data+validation+for+machine+learning&author=Eric+Breck&author=Marty+Zinkevich&author=Neoklis+Polyzotis&author=Steven+Whang&author=Sudip+Roy&publication_year=2019&pages=334-347)

[^21]: Corinna Cichy and Stefan Rass. 2019. An overview of data quality frameworks. *IEEE Access* 7 (2019), 24634–24648.

[Crossref](https://doi.org/10.1109/ACCESS.2019.2899751)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=An+overview+of+data+quality+frameworks&author=Corinna+Cichy&author=Stefan+Rass&publication_year=2019&journal=IEEE+Access&pages=24634-24648&doi=10.1109%2FACCESS.2019.2899751)

[^22]: Thomas M. Cover and Joy A. Thomas. 2005. *Entropy, Relative Entropy, and Mutual Information*. John Wiley & Sons, Ltd, Chapter 2, 13–55. DOI:

[Go to Citation](#core-Bib0010-1)

[Crossref](https://doi.org/10.1002/047174882X.ch2)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=Entropy%2C+Relative+Entropy%2C+and+Mutual+Information&author=Thomas+M.+Cover&author=Joy+A.+Thomas&publication_year=2005&pages=13-55&doi=10.1002%2F047174882X.ch2)

[^23]: Thomas H. Davenport and Rean Bean. 2024. Data and AI leadership executive survey. (2024), 1–22. Retrieved from [https://www.randybeandata.com/s/DataAI-ExecutiveLeadershipSurveyFinalAsset.pdf](https://www.randybeandata.com/s/DataAI-ExecutiveLeadershipSurveyFinalAsset.pdf)

[Go to Citation](#core-Bib0011-1)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=Data+and+AI+leadership+executive+survey&author=Thomas+H.+Davenport&author=Rean+Bean&publication_year=2024&pages=1-22)

[^24]: Lisa Ehrlinger and Felix Naumann. 2025. Data quality for enterprise AI. In *Enterprise AI*. Springer, 91–128.

[Go to Citation](#core-Bib0012-1)

[Crossref](https://doi.org/10.1007/978-3-032-01940-0_4)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=Data+quality+for+enterprise+AI&author=Lisa+Ehrlinger&author=Felix+Naumann&publication_year=2025&pages=91-128&doi=10.1007%2F978-3-032-01940-0_4)

[^25]: Lisa Ehrlinger and Wolfram Wöß. 2022. A survey of data quality measurement and monitoring tools. *Frontiers in Big Data* 5 (2022), 1–30. DOI:

[Crossref](https://doi.org/10.3389/fdata.2022.850611)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=A+survey+of+data+quality+measurement+and+monitoring+tools&author=Lisa+Ehrlinger&author=Wolfram+W%C3%B6%C3%9F&publication_year=2022&journal=Frontiers+in+Big+Data&pages=1-30&doi=10.3389%2Ffdata.2022.850611)

[^26]: Hadi Fadlallah, Rima Kilany, Houssein Dhayne, Rami El Haddad, Rafiqul Haque, Yehia Taher, and Ali Jaber. 2023. Context-aware big data quality assessment: A scoping review. *Journal of Data and Information Quality* 15, 3, Article 25 (Aug.2023), 33 pages. DOI:

[Go to Citation](#core-Bib0014-1)

[Digital Library](https://dl.acm.org/doi/10.1145/3603707)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=Context-aware+big+data+quality+assessment%3A+A+scoping+review&author=Hadi+Fadlallah&author=Rima+Kilany&author=Houssein+Dhayne&author=Rami+El+Haddad&author=Rafiqul+Haque&author=Yehia+Taher&author=Ali+Jaber&publication_year=2023&journal=Journal+of+Data+and+Information+Quality&doi=10.1145%2F3603707)

[^27]: International Organization for Standardization. 2004. ISO/IEC 13335-1: Information technology — Security techniques — Management of information and communications technology security. Part 1: Concepts and models for information and communications technology security management.

[Go to Citation](#core-Bib0015-1)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=ISO%2FIEC+13335-1%3A+Information+technology+%E2%80%94+Security+techniques+%E2%80%94+Management+of+information+and+communications+technology+security.+Part+1%3A+Concepts+and+models+for+information+and+communications+technology+security+management&author=International+Organization+for+Standardization&publication_year=2004)

[^28]: International Organization for Standardization. 2008. ISO/IEC 25012: Software Engineering: Software Product Quality Requirements and Evaluation (SQuaRE): Data Quality Model. Retrieved from [https://iso25000.com/index.php/en/iso-25000-standards/iso-25012](https://iso25000.com/index.php/en/iso-25000-standards/iso-25012)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=ISO%2FIEC+25012%3A+Software+Engineering%3A+Software+Product+Quality+Requirements+and+Evaluation+%28SQuaRE%29%3A+Data+Quality+Model&author=International+Organization+for+Standardization&publication_year=2008)

[^29]: International Organization for Standardization. 2015. ISO/IEC 25024:2015 Systems and software engineering — Systems and software Quality Requirements and Evaluation (SQuaRE) — Measurement of data quality. Retrieved from [https://www.iso.org/standard/35749.html](https://www.iso.org/standard/35749.html)

[Go to Citation](#core-Bib0017-1)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=ISO%2FIEC+25024%3A2015+Systems+and+software+engineering+%E2%80%94+Systems+and+software+Quality+Requirements+and+Evaluation+%28SQuaRE%29+%E2%80%94+Measurement+of+data+quality&author=International+Organization+for+Standardization&publication_year=2015)

[^30]: Great Expectations. 2025. Great Expectations’ Official Partners. Retrieved January 14, 2026 from [https://greatexpectations.io/partners/](https://greatexpectations.io/partners/)

[Go to Citation](#core-Bib0018-1)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=Great+Expectations%E2%80%99+Official+Partners&author=Great+Expectations&publication_year=2025)

[^31]: Tom Haegemans, Monique Snoeck, and Wilfried Lemahieu. 2016. Towards a precise definition of data accuracy and a justification for its measure. In *Proceedings of the International Conference on Information Quality*. MIT Information Quality (MITIQ) Program, Alarcos Research Group (UCLM), Ciudad Real, Spain, 16–16.

[Google Scholar](https://scholar.google.com/scholar_lookup?title=Towards+a+precise+definition+of+data+accuracy+and+a+justification+for+its+measure&author=Tom+Haegemans&author=Monique+Snoeck&author=Wilfried+Lemahieu&publication_year=2016&pages=16-16)

[^32]: Karin Hartl and Olaf Jacob. 2016. The role of data quality in business intelligence - An empirical study in German medium-sized and large companies.

[Go to Citation](#core-Bib0020-1)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=The+role+of+data+quality+in+business+intelligence+-+An+empirical+study+in+German+medium-sized+and+large+companies&author=Karin+Hartl&author=Olaf+Jacob&publication_year=2016)

[^33]: Bernd Heinrich, Diana Hristova, Mathias Klier, Alexander Schiller, and Michael Szubartowicz. 2018. Requirements for data quality metrics. *Journal of Data and Information Quality* 9, 2, Article 12 (January2018), 32 pages.

[Go to Citation](#core-Bib0021-1)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=Requirements+for+data+quality+metrics&author=Bernd+Heinrich&author=Diana+Hristova&author=Mathias+Klier&author=Alexander+Schiller&author=Michael+Szubartowicz&publication_year=2018&journal=Journal+of+Data+and+Information+Quality)

[^34]: Stefan Heule, Marc Nunkesser, and Alexander Hall. 2013. HyperLogLog in practice: Algorithmic engineering of a state of the art cardinality estimation algorithm. In *Proceedings of the 16th International Conference on Extending Database Technology (EDBT ’13)*. ACM, New York, NY, USA, 683–692. DOI:

[Go to Citation](#core-Bib0022-1)

[Digital Library](https://dl.acm.org/doi/10.1145/2452376.2452456)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=HyperLogLog+in+practice%3A+Algorithmic+engineering+of+a+state+of+the+art+cardinality+estimation+algorithm&author=Stefan+Heule&author=Marc+Nunkesser&author=Alexander+Hall&publication_year=2013&pages=683-692&doi=10.1145%2F2452376.2452456)

[^35]: Ankush Jain and Melody Chien. 2022. *Magic Quadrant for Data Quality Solutions*. Technical Report. Gartner, Inc.

[Go to Citation](#core-Bib0023-1)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=Magic+Quadrant+for+Data+Quality+Solutions&author=Ankush+Jain&author=Melody+Chien&publication_year=2022)

[^36]: João Marcelo Borovina Josko, Marcio Katsumi Oikawa, and João Eduardo Ferreira. 2016. A formal taxonomy to improve data defect description. In *Proceedings of the International Conference on Database Systems for Advanced Applications* (Lecture Notes in Computer Science, Vol. 9645). Springer, 307–320. DOI:

[Go to Citation](#core-Bib0024-1)

[Crossref](https://doi.org/10.1007/978-3-319-32055-7_25)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=A+formal+taxonomy+to+improve+data+defect+description&author=Jo%C3%A3o+Marcelo+Borovina+Josko&author=Marcio+Katsumi+Oikawa&author=Jo%C3%A3o+Eduardo+Ferreira&publication_year=2016&pages=307-320&doi=10.1007%2F978-3-319-32055-7_25)

[^37]: Rajesh Jugulum. 2016. *Importance of Data Quality for Analytics*. Springer International Publishing, 23–31. DOI:

[Go to Citation](#core-Bib0025-1)

[Crossref](https://doi.org/10.1007/978-3-319-21332-3_2)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=Importance+of+Data+Quality+for+Analytics&author=Rajesh+Jugulum&publication_year=2016&pages=23-31&doi=10.1007%2F978-3-319-21332-3_2)

[^38]: Zohar Karnin, Kevin Lang, and Edo Liberty. 2016. Optimal quantile approximation in streams. In *Proceedings of the 2016 IEEE 57th Annual Symposium on Foundations of Computer Science (FOCS)*. 71–78. DOI:

[Go to Citation](#core-Bib0026-1)

[Crossref](https://doi.org/10.1109/FOCS.2016.17)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=Optimal+quantile+approximation+in+streams&author=Zohar+Karnin&author=Kevin+Lang&author=Edo+Liberty&publication_year=2016&pages=71-78&doi=10.1109%2FFOCS.2016.17)

[^39]: Nuno Laranjeiro, Seyma Nur Soydemir, and Jorge Bernardino. 2015. A survey on data quality: Classifying poor data. In *Proceedings of the 2015 IEEE 21st Pacific Rim International Symposium on Dependable Computing (PRDC)*. IEEE, Zhangjiajie, China, 179–188. DOI:

[Digital Library](https://dl.acm.org/doi/10.1109/PRDC.2015.41)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=A+survey+on+data+quality%3A+Classifying+poor+data&author=Nuno+Laranjeiro&author=Seyma+Nur+Soydemir&author=Jorge+Bernardino&publication_year=2015&pages=179-188&doi=10.1109%2FPRDC.2015.41)

[^40]: Ga Young Lee, Lubna Alzamil, Bakhtiyar Doskenov, and Arash Termehchy. 2021. A Survey on Data Cleaning Methods for Improved Machine Learning Model Performance. DOI:

[Go to Citation](#core-Bib0028-1)

[Crossref](https://doi.org/10.48550/ARXIV.2109.07127)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=A+Survey+on+Data+Cleaning+Methods+for+Improved+Machine+Learning+Model+Performance&author=Ga+Young+Lee&author=Lubna+Alzamil&author=Bakhtiyar+Doskenov&author=Arash+Termehchy&publication_year=2021&doi=10.48550%2FARXIV.2109.07127)

[^41]: Yang Lee, Stuart E. Madnick, Richard Y. Wang, Forea Wang, and Hongyun Zhang. 2014. *A Cubic Framework for the Chief Data Officer: Succeeding in a World of Big Data*. Technical Report CISL# 2014-01. Massachusetts Institute of Technology, Cambridge, MA, USA.

[Go to Citation](#core-Bib0029-1)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=A+Cubic+Framework+for+the+Chief+Data+Officer%3A+Succeeding+in+a+World+of+Big+Data&author=Yang+Lee&author=Stuart+E.+Madnick&author=Richard+Y.+Wang&author=Forea+Wang&author=Hongyun+Zhang&publication_year=2014)

[^42]: Peng Li, Xi Rao, Jennifer Blase, Yue Zhang, Xu Chu, and Ce Zhang. 2021. CleanML: A study for evaluating the impact of data cleaning on ML classification tasks. In *Proceedings of the 2021 IEEE 37th International Conference on Data Engineering (ICDE)*. IEEE, 13–24.

[Go to Citation](#core-Bib0030-1)

[Crossref](https://doi.org/10.1109/ICDE51399.2021.00009)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=CleanML%3A+A+study+for+evaluating+the+impact+of+data+cleaning+on+ML+classification+tasks&author=Peng+Li&author=Xi+Rao&author=Jennifer+Blase&author=Yue+Zhang&author=Xu+Chu&author=Ce+Zhang&publication_year=2021&pages=13-24&doi=10.1109%2FICDE51399.2021.00009)

[^43]: David Loshin. 2011. *Business Impacts of Poor Data Quality*. Elsevier, 1–16. DOI:

[Go to Citation](#core-Bib0031-1)

[Crossref](https://doi.org/10.1016/b978-0-12-373717-5.00001-4)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=Business+Impacts+of+Poor+Data+Quality&author=David+Loshin&publication_year=2011&pages=1-16&doi=10.1016%2Fb978-0-12-373717-5.00001-4)

[^44]: Sedir Mohammed, Lukas Budach, Moritz Feuerpfeil, Nina Ihde, Andrea Nathansen, Nele Noack, Hendrik Patzlaff, Felix Naumann, and Hazar Harmouch. 2025. The effects of data quality on machine learning performance on tabular data. *Information Systems* 132 (2025), 102549.

[Digital Library](https://dl.acm.org/doi/10.1016/j.is.2025.102549)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=The+effects+of+data+quality+on+machine+learning+performance+on+tabular+data&author=Sedir+Mohammed&author=Lukas+Budach&author=Moritz+Feuerpfeil&author=Nina+Ihde&author=Andrea+Nathansen&author=Nele+Noack&author=Hendrik+Patzlaff&author=Felix+Naumann&author=Hazar+Harmouch&publication_year=2025&journal=Information+Systems&pages=102549&doi=10.1016%2Fj.is.2025.102549)

[^45]: Sedir Mohammed, Lisa Ehrlinger, Hazar Harmouch, Felix Naumann, and Divesh Srivastava. 2025. The five facets of data quality assessment. *SIGMOD Record* 54, 2 (2025), 18–27.

[Digital Library](https://dl.acm.org/doi/10.1145/3749116.3749120)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=The+five+facets+of+data+quality+assessment&author=Sedir+Mohammed&author=Lisa+Ehrlinger&author=Hazar+Harmouch&author=Felix+Naumann&author=Divesh+Srivastava&publication_year=2025&journal=SIGMOD+Record&pages=18-27&doi=10.1145%2F3749116.3749120)

[^46]: Tadhg Nagle, Tom Redman, and Sammon. 2020. Assessing data quality: A managerial call to action. *Business Horizons* 63, 3 (2020), 325–337. DOI:

[Go to Citation](#core-Bib0034-1)

[Crossref](https://doi.org/10.1016/j.bushor.2020.01.006)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=Assessing+data+quality%3A+A+managerial+call+to+action&author=Tadhg+Nagle&author=Tom+Redman&author=Sammon&journal=Business+Horizons&pages=325-337&doi=10.1016%2Fj.bushor.2020.01.006)

[^47]: Paulo Oliveira, Fátima Rodrigues, Pedro Henriques, and Helena Galhardas. 2005. A taxonomy of data quality problems. In *Proceedings of the 2nd Int. Workshop on Data and Information Quality*. 219–233.

[Go to Citation](#core-Bib0035-1)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=A+taxonomy+of+data+quality+problems&author=Paulo+Oliveira&author=F%C3%A1tima+Rodrigues&author=Pedro+Henriques&author=Helena+Galhardas&publication_year=2005&pages=219-233)

[^48]: Vasileios Papastergios and Anastasios Gounaris. 2024. A survey of open-source data quality tools: Shedding light on the materialization of data quality dimensions in practice. arXiv:2407.18649. Retrieved from [https://arxiv.org/abs/2407.18649](https://arxiv.org/abs/2407.18649) DOI:

[Go to Citation](#core-Bib0036-1)

[Crossref](https://doi.org/10.48550/ARXIV.2407.18649)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=A+survey+of+open-source+data+quality+tools%3A+Shedding+light+on+the+materialization+of+data+quality+dimensions+in+practice&author=Vasileios+Papastergios&author=Anastasios+Gounaris&publication_year=2024&doi=10.48550%2FARXIV.2407.18649)

[^49]: Ronald K. Pearson. 2006. The problem of disguised missing data. *ACM SIGKDD Explorations Newsletter* 8, 1 (2006), 83–92.

[Go to Citation](#core-Bib0037-1)

[Digital Library](https://dl.acm.org/doi/10.1145/1147234.1147247)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=The+problem+of+disguised+missing+data&author=Ronald+K.+Pearson&publication_year=2006&journal=ACM+SIGKDD+Explorations+Newsletter&pages=83-92&doi=10.1145%2F1147234.1147247)

[^50]: Maria Angela Pellegrino, Anisa Rula, and Gabriele Tuozzo. 2024. KGHeartBeat: An open source tool for periodically evaluating the quality of knowledge graphs. In *Proceedings of the International Semantic Web Conference*. Springer, 40–58.

[Go to Citation](#core-Bib0038-1)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=KGHeartBeat%3A+An+open+source+tool+for+periodically+evaluating+the+quality+of+knowledge+graphs&author=Maria+Angela+Pellegrino&author=Anisa+Rula&author=Gabriele+Tuozzo&publication_year=2024&pages=40-58)

[^51]: Venkata Sai Venkatesh Pulla, Cihan Varol, and Murat Al. 2016. Open source data quality tools: Revisited. In *Information Technology: New Generations: Proceedings of the 13th International Conference on Information Technology*. Shahram Latifi (Ed.), Springer International Publishing, Cham, Switzerland, 893–902.

[Crossref](https://doi.org/10.1007/978-3-319-32467-8_77)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=Open+source+data+quality+tools%3A+Revisited&author=Venkata+Sai+Venkatesh+Pulla&author=Cihan+Varol&author=Murat+Al&publication_year=2016&pages=893-902&doi=10.1007%2F978-3-319-32467-8_77)

[^52]: Val Pushkarev, Henry Neumann, Cihan Varol, and John R. Talburt. 2010. An overview of open source data quality tools. In *Proceedings of the 2010 International Conference on Information & Knowledge Engineering, IKE 2010, July 12-15, 2010*. CSREA Press, Las Vegas, NV, USA, 370–376.

[Google Scholar](https://scholar.google.com/scholar_lookup?title=An+overview+of+open+source+data+quality+tools&author=Val+Pushkarev&author=Henry+Neumann&author=Cihan+Varol&author=John+R.+Talburt&publication_year=2010&pages=370-376)

[^53]: Abdulhakim A. Qahtan, Ahmed Elmagarmid, Raul Castro Fernandez, Mourad Ouzzani, and Nan Tang. 2018. FAHES: A robust disguised missing values detector. In *Proceedings of the 24th ACM SIGKDD International Conference on Knowledge Discovery & Data Mining*. ACM, New York, NY, USA, 2100–2109.

[Digital Library](https://dl.acm.org/doi/10.1145/3219819.3220109)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=FAHES%3A+A+robust+disguised+missing+values+detector&author=Abdulhakim+A.+Qahtan&author=Ahmed+Elmagarmid&author=Raul+Castro+Fernandez&author=Mourad+Ouzzani&author=Nan+Tang&publication_year=2018&pages=2100-2109&doi=10.1145%2F3219819.3220109)

[^54]: Anirban Rahut, Vinaykumar Bhat, Abhinav Sharma, Yichen Shen, Bartlomiej Pelc, Chi Li, Ahsanul Haque, Yash Botadra, Xi Wang, Michael Percy, et al. 2024. MyRaft: High availability in MySQL using raft. In *Proceedings of the 27th International Conference on Extending Database Technology, EDBT*. OpenProceedings.org, 743–752. DOI:

[Go to Citation](#core-Bib0042-1)

[Crossref](https://doi.org/10.48786/edbt.2024.64)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=MyRaft%3A+High+availability+in+MySQL+using+raft&author=Anirban+Rahut&author=Vinaykumar+Bhat&author=Abhinav+Sharma&author=Yichen+Shen&author=Bartlomiej+Pelc&author=Chi+Li&author=Ahsanul+Haque&author=Yash+Botadra&author=Xi+Wang&author=Michael+Percy&publication_year=2024&pages=743-752&doi=10.48786%2Fedbt.2024.64)

[^55]: Nripendra P. Rana, Sheshadri Chatterjee, Yogesh K. Dwivedi, and Shahriar Akter. 2021. Understanding dark side of artificial intelligence (AI) integrated business analytics: Assessing firm’s operational inefficiency and competitiveness. *European Journal of Information Systems* 31, 3 (Aug.2021), 364–387. DOI:

[Go to Citation](#core-Bib0043-1)

[Crossref](https://doi.org/10.1080/0960085x.2021.1955628)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=Understanding+dark+side+of+artificial+intelligence+%28AI%29+integrated+business+analytics%3A+Assessing+firm%E2%80%99s+operational+inefficiency+and+competitiveness&author=Nripendra+P.+Rana&author=Sheshadri+Chatterjee&author=Yogesh+K.+Dwivedi&author=Shahriar+Akter&publication_year=2021&journal=European+Journal+of+Information+Systems&pages=364-387&doi=10.1080%2F0960085x.2021.1955628)

[^56]: Thomas C. Redman. 1998. The impact of poor data quality on the typical enterprise. *Communications of the ACM* 41, 2 (Feb.1998), 79–82. DOI:

[Go to Citation](#core-Bib0044-1)

[Digital Library](https://dl.acm.org/doi/10.1145/269012.269025)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=The+impact+of+poor+data+quality+on+the+typical+enterprise&author=Thomas+C.+Redman&publication_year=1998&journal=Communications+of+the+ACM&pages=79-82&doi=10.1145%2F269012.269025)

[^57]: Valerie Restat, Indra Diestelkämper, Meike Klettke, and Uta Störl. 2025. FONDUE—fine-tuned optimization: Nurturing data usability & efficiency. *Journal of Big Data* 12, 1 (2025), 131.

[Go to Citation](#core-Bib0045-1)

[Crossref](https://doi.org/10.1186/s40537-025-01158-x)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=FONDUE%E2%80%94fine-tuned+optimization%3A+Nurturing+data+usability+%26+efficiency&author=Valerie+Restat&author=Indra+Diestelk%C3%A4mper&author=Meike+Klettke&author=Uta+St%C3%B6rl&publication_year=2025&journal=Journal+of+Big+Data&pages=131&doi=10.1186%2Fs40537-025-01158-x)

[^58]: Monica Scannapieco and Tiziana Catarci. 2002. Data quality under the computer science perspective. *Archivi & Computer* 2 (2002), 1–15.

[Go to Citation](#core-Bib0046-1)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=Data+quality+under+the+computer+science+perspective&author=Monica+Scannapieco&author=Tiziana+Catarci&publication_year=2002&journal=Archivi+%26+Computer&pages=1-15)

[^59]: Sebastian Schelter, Dustin Lange, Philipp Schmidt, Meltem Celikel, Felix Biessmann, and Andreas Grafberger. 2018. Automating large-scale data quality verification. *Proceedings of the VLDB Endowment* 11, 12 (Aug.2018), 1781–1794. DOI:

[Go to Citation](#core-Bib0047-1)

[Digital Library](https://dl.acm.org/doi/10.14778/3229863.3229867)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=Automating+large-scale+data+quality+verification&author=Sebastian+Schelter&author=Dustin+Lange&author=Philipp+Schmidt&author=Meltem+Celikel&author=Felix+Biessmann&author=Andreas+Grafberger&publication_year=2018&journal=Proceedings+of+the+VLDB+Endowment&pages=1781-1794&doi=10.14778%2F3229863.3229867)

[^60]: Laura Sebastian-Coleman. 2013. *Measuring Data Quality for Ongoing Improvement: A Data Quality Assessment Framework*. Elsevier, Waltham, MA, USA.

[Crossref](https://doi.org/10.1016/B978-0-12-397033-6.00020-1)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=Measuring+Data+Quality+for+Ongoing+Improvement%3A+A+Data+Quality+Assessment+Framework&author=Laura+Sebastian-Coleman&publication_year=2013&doi=10.1016%2FB978-0-12-397033-6.00020-1)

[^61]: Marcian Seeger and Thorsten Papenbrock. 2025. DPQL: Applications for holistic data profiling. In *Datenbanksysteme für Business, Technologie und Web (BTW 2025)*. Gesellschaft für Informatik, Bonn, 177–190.

[Go to Citation](#core-Bib0049-1)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=DPQL%3A+Applications+for+holistic+data+profiling&author=Marcian+Seeger&author=Thorsten+Papenbrock&publication_year=2025&pages=177-190)

[^62]: Flavia Serra, Verónika Peralta, Adriana Marotta, and Patrick Marcel. 2024. Use of context in data quality management: A systematic literature review. *Journal of Data and Information Quality* 16, 3, Article 19 (Oct.2024), 41 pages. DOI:

[Go to Citation](#core-Bib0050-1)

[Digital Library](https://dl.acm.org/doi/10.1145/3672082)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=Use+of+context+in+data+quality+management%3A+A+systematic+literature+review&author=Flavia+Serra&author=Ver%C3%B3nika+Peralta&author=Adriana+Marotta&author=Patrick+Marcel&publication_year=2024&journal=Journal+of+Data+and+Information+Quality&doi=10.1145%2F3672082)

[^63]: Russell Torres and Anna Sidorova. 2019. Reconceptualizing information quality as effective use in the context of business intelligence and analytics. *International Journal of Information Management* 49 (2019), 316–329. DOI:

[Go to Citation](#core-Bib0051-1)

[Digital Library](https://dl.acm.org/doi/10.1016/j.ijinfomgt.2019.05.028)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=Reconceptualizing+information+quality+as+effective+use+in+the+context+of+business+intelligence+and+analytics&author=Russell+Torres&author=Anna+Sidorova&publication_year=2019&journal=International+Journal+of+Information+Management&pages=316-329&doi=10.1016%2Fj.ijinfomgt.2019.05.028)

[^64]: Richard Y. Wang. 1998. A product perspective on total data quality management. *Communications of the ACM* 41, 2 (1998), 58–65.

[Go to Citation](#core-Bib0052-1)

[Digital Library](https://dl.acm.org/doi/10.1145/269012.269022)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=A+product+perspective+on+total+data+quality+management&author=Richard+Y.+Wang&publication_year=1998&journal=Communications+of+the+ACM&pages=58-65&doi=10.1145%2F269012.269022)

[^65]: Richard Y. Wang and Diane M. Strong. 1996. Beyond accuracy: What data quality means to data consumers. *Journal of Management Information Systems* 12, 4 (1996), 5–33.

[Digital Library](https://dl.acm.org/doi/10.1080/07421222.1996.11518099)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=Beyond+accuracy%3A+What+data+quality+means+to+data+consumers&author=Richard+Y.+Wang&author=Diane+M.+Strong&publication_year=1996&journal=Journal+of+Management+Information+Systems&pages=5-33&doi=10.1080%2F07421222.1996.11518099)

[^66]: Yanqing Wang. 2023. Generative AI in operational risk management: Harnessing the future of finance. *SSRN Electronic Journal* (2023), 1–11. DOI:

[Go to Citation](#core-Bib0054-1)

[Crossref](https://doi.org/10.2139/ssrn.4452504)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=Generative+AI+in+operational+risk+management%3A+Harnessing+the+future+of+finance&author=Yanqing+Wang&publication_year=2023&journal=SSRN+Electronic+Journal&pages=1-11&doi=10.2139%2Fssrn.4452504)

[^67]: Manuel Wörsdörfer. 2023. Mitigating the adverse effects of AI with the European Union’s artificial intelligence act: Hype or hope? *Global Business and Organizational Excellence* 43, 3 (Nov.2023), 106–126. DOI:

[Go to Citation](#core-Bib0055-1)

[Crossref](https://doi.org/10.1002/joe.22238)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=Mitigating+the+adverse+effects+of+AI+with+the+European+Union%E2%80%99s+artificial+intelligence+act%3A+Hype+or+hope%3F&author=Manuel+W%C3%B6rsd%C3%B6rfer&publication_year=2023&journal=Global+Business+and+Organizational+Excellence&pages=106-126&doi=10.1002%2Fjoe.22238)

[^68]: Amrapali Zaveri, Anisa Rula, Andrea Maurino, Ricardo Pietrobon, Jens Lehmann, and Sören Auer. 2012. Quality assessment for linked data: A survey. *Semantic Web* 7, 1 (2012), 63–93. DOI:

[Go to Citation](#core-Bib0056-1)

[Crossref](https://doi.org/10.3233/SW-150175)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=Quality+assessment+for+linked+data%3A+A+survey&author=Amrapali+Zaveri&author=Anisa+Rula&author=Andrea+Maurino&author=Ricardo+Pietrobon&author=Jens+Lehmann&author=S%C3%B6ren+Auer&publication_year=2012&journal=Semantic+Web&pages=63-93&doi=10.3233%2FSW-150175)

[^69]: Jan Zenisek, Florian Holzinger, and Michael Affenzeller. 2019. Machine learning based concept drift detection for predictive maintenance. *Computers and Industrial Engineering* 137 (Nov.2019), 106031. DOI:

[Go to Citation](#core-Bib0057-1)

[Crossref](https://doi.org/10.1016/j.cie.2019.106031)

[Google Scholar](https://scholar.google.com/scholar_lookup?title=Machine+learning+based+concept+drift+detection+for+predictive+maintenance&author=Jan+Zenisek&author=Florian+Holzinger&author=Michael+Affenzeller&publication_year=2019&journal=Computers+and+Industrial+Engineering&pages=106031&doi=10.1016%2Fj.cie.2019.106031)