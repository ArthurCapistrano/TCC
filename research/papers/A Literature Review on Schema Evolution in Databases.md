

A Literature Review on Schema Evolution in Databases
## Zouhaier Brahmia
## *
## ,
## §
## , Fabio Grandi
## †
## ,¶
and Barbara Oliboni
## ‡
## ,
## ||
## *
Department of Computer Science,
Faculty of Economics and Management, University of Sfax,
Road of the Aerodrome, Km 4.5, P.O. Box 1088, 3018 Sfax, Tunisia
## †
Dipartimento di Informatica–Scienza e Ingegneria,
Alma Mater Studiorum–Universit
## 
adi Bologna,
## Viale Risorgimento 2, I-40136 Bologna, Italy
## ‡
Department of Computer Science,
University of Verona, Ca' Vignal 2,
## Strada Le Grazie 15, I-37134 Verona, Italy
## §
zouhaier.brahmia@fsegs.rnu.tn; brahmiazouhaier@yahoo.fr
## ¶
fabio.grandi@unibo.it
## ||
barbara.oliboni@univr.it
## Received 22 March 2024
## Revised 19 May 2024
## Accepted 6 June 2024
## Published 12 July 2024
Changing a database schema is a fact of life in information systems, as a response to changes
inside the enterprise (e.g., new users' requirements, correction of errors in the current database
schema) or outside it (e.g., new regulations, new partners' requirements). In the database
research  ̄eld, a well-known technique has been proposed for managing schema changes, called
schema evolution. It allows the database to survive schema changes by adapting existing data to
conform to the new schema. A lot of research e®orts addressed the topic of schema evolution, in
both conventional (i.e., relational) and advanced (e.g., XML, stream, NoSQL) databases,
providing a plethora of heterogeneous approaches and solutions making up a quite large liter-
ature. Since there is no research work that extensively deals with di®erent proposals and
compares them, the purpose of this paper is to  ̄ll this gap by reviewing the available schema
evolution literature. For that,  ̄rst we collected and summarized the contributions of research
papers dealing with database schema evolution. Then we organized their presentation in a
chronological order, also giving a historical perspective on the topic development. Finally, we
de ̄ned a list of six comparison criteria (database model, implementation, schema change
semantics, schema change propagation, integrity constraints, and software evolution) that have
helped us to categorize and compare the di®erent database schema evolution proposals. In sum,
our paper (i) provides an overview of the state-of-the-art research approaches on database
schema evolution, with tables that compare such approaches based on some proposed criteria,
## §
Corresponding author.
This is an Open Access article published by World Scienti ̄c Publishing Company. It is distributed under
the terms of theCreative Commons Attribution 4.0 (CC BY) Licensewhich permits use, distribution and
reproduction in any medium, provided the original work is properly cited.
## OPEN ACCESS
## Computing Open
Vol. 2 (2024) 2430001 (54 pages)
## #
## .
c
## The Author(s)
## DOI:10.1142/S2972370124300012
## 2430001-1
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

(ii) studies the support of schema evolution in commercial DataBase Management Systems
(DBMSs), and (iii) points out some possible future research directions in this area.
Keywords: Database schema; schema change; schema change semantics; schema change
propagation; schema evolution; database evolution; relational database; object-oriented
database; XML database; NoSQL database; multi-model database.
## 1. Introduction
Context of Work.The schema of a database
## 1
is a formal structure, de ̄ned by
using a data de ̄nition language (e.g., SQL-DDL for relational databases, ODMG-
ODL for object-oriented databases, \XML Schema" for XML databases, \JSON
Schema" for JSON-based NoSQL databases) before populating the database.
Database schemata are useful for querying,
## 2
## ,
## 3
updating,
## 4
integrating,
## 5
## ,
## 6
and con-
verting
## 7
## ,
## 8
data. During the lifetime of the database, not only do extant data change
over time, but also the database schema is often required to be modi ̄ed.
## 9
The data
de ̄nition language is used again and again by database designers or administrators
to respond to changes inside the information system (e.g., evolution of users'
requirements, correction of errors in the current schema or its improvement with the
addition of new constraints, re-organizations aimed at optimizing the execution of
important queries), inside the enterprise (e.g., business process reengineering,
changes in the organizational structure, new marketing strategies or production
techniques) or outside it (e.g., compliance to new regulations, new requirements
induced by customers or suppliers). Such changes generally consist of modi ̄cations
to the database structure (e.g., new schema components could be added, and existing
schema components could be modi ̄ed, dropped, split, or merged), which likely have
an impact on the database content. Hence, for most database applications, changing
the schema without loss of existing data is a signi ̄cant challenge: it is usually a time-
consuming and error-prone task which must be done carefully and requires advanced
skills. In the literature,
## 10
## –
## 14
schema evolutionhas been de ̄ned as the modality for the
management of schema changes that relieves database programmers and adminis-
trators from such a burden, by automatically recovering extant data and possibly
adapting them to the new schema.
Problems.The correct execution of schema changes involves the solution of two
important problems: (i)semantics of change, which studies the e®ects of this change
at schema level (i.e., on the modi ̄ed schema) in order to preserve the schema con-
sistency after any schema change, and (ii)change propagation, which studies the
e®ects of this change at data/instance level (i.e., on the database whose schema is
being modi ̄ed), in order to guarantee the consistency of already existing instances
with regard to the new (modi ̄ed) schema.
Thus, since changing database schema is a fundamental aspect of information
systems, schema modi ̄cation and schema evolution techniques have been investi-
gated widely by researchers of the database community, both in the context of
classical (i.e., relational) and advanced (e.g., object-oriented, XML, stream, NoSQL)
## Z. Brahmia, F. Grandi & B. Oliboni
## 2430001-2
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

databases. Several data models, query/update languages, approaches, and proto-
types, for managing an evolving database schema have been proposed during the
three last decades. However, to the best of our knowledge, while schema changes are
inevitable during the life of a database and several good research work have been
carried out in order to solve problems related to schema evolution, most of the
existing \DataBase Management Systems" (DBMSs) unfortunately only provide a
limited support for schema changes and schema evolution is only partially supported
by some relational DBMSs, such as Oracle, IBM DB2 and Microsoft SQL Server.
Therefore, faced with the lack of suitable tools, database administrators still have to
try to solve the problem of evolving a database schema in anad hocmanner.
A research  ̄eld closely related to schema evolution in databases is ontology
evolution in the Semantic Web,
## 15
although di®erences have been evidenced.
## 16
## With
the consolidation of implementation solutions for the former and development of the
latter, we will likely see a convergence between these two worlds in the future.
Motivation.Although schema evolution management is an important task of
the database administrator or designer, to the best of our knowledge there is no
recent literature review on schema evolution in databases. Except some relatively old
encyclopedia entries dealing with this issue, like Refs.10,13,14, and219, there is no
recent, comprehensive, and detailed study of the topic, published in a journal article.
Hence, in our article, we have tried to  ̄ll this gap in the current literature of database
schema evolution.
Challenges and Trends.When the database schema evolves, by applying a
sequence of schema change operations or by replacing it with a new full database
schema, it will have an impact on several already existing components related to such
a schema, like the database instances, database queries and updates that are written
while considering such a schema, schema mappings involving the evolved schema,
and any program (procedure, function,...) that is de ̄ned while taking into account
such a schema. Thus, in the reality, the evolution of a database schema is similar to a
\revolution" or an \earthquake" in such a database and in all software components
depending on it. It is a time-consuming and error-prone task. Hence, the database
administrator and the application developer should be helped in correctly and con-
sistently propagating database schema changes to all depending components. In an
ideal environment, the evolution of a database schema will be completely taken into
account by the DBMS and correctly propagated to all components depending on the
evolved schema, in a transparent manner to all database users.
Besides, managing database schema changes becomes more complex and more
di±cult in emerging non-relational (e.g., XML, NoSQL) databases that are being
used by modern applications (e.g., social networks, cloud computing, mobile com-
puting, IoT, grid computing, smart cities). However, existing DBMSs provide only
limited support for managing schema evolution in databases. In particular, relational
DBMSs (e.g., Oracle, MS SQL Server, IBM DB2, MySQL, PostgreSQL), which are
currently the most predominant DBMSs used for the back-ends of business
Review on Schema Evolution in Databases
## 2430001-3
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

applications, provide only few schema change operations that correspond to a subset
of those allowed by standard SQL-DDL language (e.g., CREATE TABLE, ALTER
TABLE  ADD/DROP/RENAME/MODIFY  column,  ALTER  TABLE  ADD/
DROP constraint, DROP TABLE).
Contributions.For the reasons mentioned above (the importance of database
schema evolution in the life of enterprise information systems from one hand, and the
lack of a detailed study of the topic, from the other hand), the main goal of this paper
is to present a review of the literature concerning (i) the state-of-the-art of research
approaches for the management of schema evolution in databases, and (ii) the
support of those techniques in existing DBMSs. We think that our paper provides an
annotated roadmap which could help researchers and scholars navigate the large
scienti ̄c literature available, being guided through the development of the topic.
Paper organization.The remainder of this paper is structured as follows.
Section2describes our research methodology. Section3provides some background
on the considered topics. Section4presents the di®erent research proposals dealing
with schema evolution in (relational, object-oriented, XML, relational-XML,
emerging and NoSQL, and multi-model) databases. Section5deals with the support
provided by existing DBMSs for managing an evolving database schema. Section6
gives conclusions and future research directions.
## 2. Research Methodology
In order to review the existing database schema evolution literature, we have begun
by collecting research papers dealing with this technique that have been published in
main journals (including ACM TODS, IEEE TKDE, Information Systems, Data &
Knowledge Engineering, and VLDB Journal), proceedings of main conferences (in-
cluding ACM SIGMOD, PODS, VLDB, ER, EDBT, ICDT, ICDE, ADBIS, DAS-
FAA, and DEXA) and a±liated workshops, specialized in databases and information
systems, since the late 1980s. Then we extended our literature search to also less
widely-known scholarly journals and conferences, where original important con-
tributions to the development of the  ̄eld could anyway be found. We consider this as
an important part of our work, which was aimed at providing an almost exhaustive
coverage of the topic, also tributing recognition to papers published in sources that
are less readily accessible to the big community of database scientists and practi-
tioners. In practice, the only exclusion criteria we adopted is not to reference papers
whose contribution can be found elsewhere (e.g., preliminary works or conference
papers for which an extended journal version exists). The tools we have used in this
phase are the DBLP Computer Science Bibliography, the Google Scholar search
engine, the ACM Digital Library, the SpringerLink collection, the ScienceDirect
platform, and the IEEE Xplore service, while using the following search expression:
\database" AND (\schema evolution" OR \schema change" OR \schema mod-
i ̄cation" OR \schema migration" OR \change propagation" OR \conversion
function") OR \database evolution" OR \database transformation" OR \database
## Z. Brahmia, F. Grandi & B. Oliboni
## 2430001-4
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

conversion" OR \database migration" OR \database update" OR \data migration".
References contained in the papers directly retrieved in this way were also a valuable
input to deepen our search.
The inclusion criteria of a returned paper are as follows: (i) an electronic copy of
each considered paper is available and accessible online; (ii) each considered paper is
published either in an issue or a volume of a peer-reviewed computer science journal
or in the proceedings of a refereed computer science conference or workshop; (iii) the
paper is not a republication of another paper; (iv) the paper deals with any aspect of
database schema evolution.
As for the exclusion criteria of a returned paper, they were as follows: (i) the paper
does not include any signi ̄cant contribution related to the topic; (ii) the paper is a
conference/workshop, which has been extended to a journal article and the latter is
already published and accessible; (iii) the results provided by the paper are not
convincing (e.g., due to lack of necessary information); (vi) the paper deals only with
data updates or data transformations, while the database schema is static; (v) the
paper is outside the database  ̄eld.
The search procedure was conducted in February 2024. We considered only the
̄rst 300 research items returned by each scienti ̄c database or digital library. The
Scopus database was used to validate the relevance of the collected papers, in par-
ticular journal papers.
After that, we individuated the contributions of each paper and organized their
critical presentation in a chronological order, also giving an historical perspective on the
topic development. Finally, we classi ̄ed the works according to their contents and, as a
result, de ̄ned a list of six comparison criteria (\Database model," \Implementation,"
\Schema change semantics," \Schema change propagation," \Integrity constraints,"
and \Software evolution") that have helped us to better categorize and compare the
di®erent database schema evolution proposals. Note that we assign, to these criteria,
the following labels:
.Database model: The database model in which schema evolution has been studied
in the collected research work. We assigned, to this criterion, the following labels:
\Rel" for the relational database model, \OO" for the object-oriented database
model, \XML" for the XML database model, \Rel-XML" for the relational-XML
database model, \Stream" for the stream database model, \Embed" for the em-
bedded database model, \NoSQL" for the NoSQL database model, and \MM" for
a multi-model database.
(1)  As for research works that have dealt with the XML data model, we distinguish
between works labeled as \XML/DTD", which have studied the evolution of
XML schemas that are speci ̄ed as Document Type De ̄nition (DTD), works
labeled as \XML/XSD", which have focused on the evolution of XML schemas
that are de ̄ned using the XML Schema language, and works, labeled as
\XML/gen", which have investigated the evolution of generic XML schemas
that could be de ̄ned either using the DTD or the XML Schema language.
Review on Schema Evolution in Databases
## 2430001-5
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

(2)  As for research proposals that have dealt with the NoSQL data model, we
distinguish between proposals, labeled as \NoSQL/col," which have studied
schema evolution in a column-oriented NoSQL database, proposals labeled as
\NoSQL/doc," which have investigated schema evolution in a document-ori-
ented NoSQL database environment, proposals labeled as \NoSQL/k-v,"
which have focused on schema evolution in a \key-value"-oriented NoSQL
database setting and proposals labeled as \NoSQL/graph," which have worked
on schema evolution in a graph-oriented NoSQL database.
.Implementation: It deals with the implementation of the proposal in the collected
research work. We assigned, to this criterion, the following values: \No" if no
information on the implementation issue, \Prototype" if a research prototype has
been developed, or \System" if some solutions for extending an existing DBMS
have been provided.
.Schema change semantics, with values \Yes" or \No" depending on whether
e®ects of schema changes at schema level have been considered or not in the
collected research work.
.Schema change propagation, with values \Yes" or \No" depending on whether
e®ects of schema changes at instance level have been considered or not in the
collected research work. Explicit labels (e.g., \Immediate", \Deferred", etc.) are
used if some particular propagation methods have been considered.
.Integrity constraints, with values \Yes" or \No" depending on whether evolution
of semantic/integrity constraints (e.g., primary key, foreign key, unique, and not
null integrity constraints) that are part of the schema has been considered or not in
the collected research work.
.Software evolution, with values \Yes" or \No" depending on whether the e®ects of
schema changes on the code of application software exploiting such a schema have
been considered or not in the collected research work.
## 3. Background
In this section, we use a simple example for illustrating the functioning of schema
evolution, contrasting it with the lowest level of schema change support that can be
embedded in a database, that is the modality of schema modi ̄cation.
## 11
## ,
## 12
## Assume
that we have a relational database that contains only a JOURNAL relation with the
attributes ID (primary key), TITLE, and RANK. The  ̄rst state of this database is
presented as follows:
## S1IDTITLE   RANK
## JOURNAL(
ID, TITLE, RANK)1Journal1A
2Journal2B
The catalogues store information on the schema S1 of the JOURNAL relation.
The table JOURNAL contains two tuples carrying information about two journals.
## Z. Brahmia, F. Grandi & B. Oliboni
## 2430001-6
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

Now, let us consider the following schema changes for removing the column
RANK (SC1) and adding the column 5YEAR
## IF (SC2):
## ALTER TABLE JOURNAL(SC1)
## DROP COLUMN RANK;
## ALTER TABLE JOURNAL(SC2)
## ADD COLUMN 5YEAR
## IF FLOAT;
The schema modi ̄cation basic modality allows users to e®ect changes to the
database schema but neither the previous schema nor its underlying extant data are
preserved: the old schema is replaced by the new one, which is initially empty as the
data populating the old schema are discarded. In such a case, a poor man's approach
to schema evolution is to create a new table T with the desired schema, then copy the
contents of the original table into this new table, drop the old table and rename T as
the old table to substitute it. In our example, this would mean the execution of the
following operation sequence:
## CREATE TABLE T (ID INT PRIMARY KEY, TITLE VARCHAR2(255),
## 5YEAR
## IF FLOAT);
## INSERT INTO T
SELECT ID, TITLE, Null
## FROM JOURNAL;
## DROP TABLE JOURNAL;
## ALTER TABLE T
## RENAME TO JOURNAL;
The schema evolution technique allows indeed applying changes to the data-
base schema avoiding as much as possible the loss of existing data, without
requiring an explicit (and error prone) user action. After a schema change, the
old schema is replaced by the new one and old data are automatically recovered
and adapted to the new schema if necessary. Hence, in a system supporting
schema evolution, the e®ects of schema changes SC1 and SC2 are represented as
follows:
## S2IDTITLE    5YEAR
## IF
## JOURNAL(
ID, TITLE, 5YEARIF)1Journal1Null
2Journal2Null
In this case, the information carried by unchanged attributes (i.e., ID, and
TITLE) is automatically recovered after executing schema changes. New columns
are initially padded with null values. The new  ̄ve-year impact factor information
Review on Schema Evolution in Databases
## 2430001-7
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

could then be inserted through the following SQL statements:
## UPDATE JOURNAL(SQL-STMT1)
## SET 5YEAR
## IF = 2.321
## WHERE ID = 1;
## UPDATE JOURNAL(SQL-STMT2)
## SET 5YEAR
## IF = 1.567
## WHERE ID = 2;
The (SQL-STMT1) and (SQL-STMT2) statements could be executed within the
same transaction containing (SC1) and (SC2) or with an independent one. The new
state of the database can be represented as follows:
## S2IDTITLE    5YEAR
## IF
## JOURNAL(
ID, TITLE, 5YEARIF)1Journal12.321
2Journal21.567
Note that this technique could lead anyway to a partial loss of information.
In fact, dropped columns and their data are lost. The change of the type of a column
could lead to loss of its data if the new type is not compatible with the previous one or
is compatible but some extant data do not  ̄t in it (e.g., a 20-character long string
value with the type changed to 15-character string). Furthermore, the schema
evolution technique does not guarantee continued functioning of existing applica-
tions, since programs compiled with the old schema that use dropped columns or
columns having changed types become obsolete after a schema change. Such short-
comings can be only avoided with theschema versioningtechnique,
## 12
by means of
which also the old schema and its extant data are kept. We survey the management
of schema versioning in a companion paper.
## 17
The distinction between schema modi ̄cation and schema evolution (and also
schema versioning) modalities has been formally introduced by Roddick
## 12
and sub-
sequently included in the consensual temporal database glossary.
## 11
Strictly related to database schema evolution is what in the practice has been
calleddatabase refactoring,
## 18
which is de ̄ned as a simple change to a database
schema that improves its design while retaining both its behavioral and informa-
tional semantics. Some useful schema changes such as the addition of a new column
or table are not a database refactoring because they extend the design. In an agile
software development perspective, database refactoring is an iterative and incre-
mental approach to improve the database schema by applying a few small changes at
a time. It consists ofad hocsolutions, to be used in DBMSs without schema evolution
support.
## Z. Brahmia, F. Grandi & B. Oliboni
## 2430001-8
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

- Research on Database Schema Evolution
Schema evolution
## 10
## ,
## 12
## –
## 14
has been an active research area during the last two dec-
ades,  ̄rst for relational databases, then for object-oriented databases, and after that
for semi-structured and XML databases. More recent approaches also consider
schema evolution issues in emerging and NoSQL databases. Managing database
schema evolution is complicated because schema changes must be propagated to
underlying instances as well as to other dependent components (e.g., other schemata,
views, indexes, stored procedures, database queries, and updates embedded in ap-
plication programs).
Two interesting previous surveys on database schema evolution can be found in
the literature: Refs.19and20. In Ref.19, the authors  ̄rst study three activities
related to schema evolution, that is core schema evolution, version management and
application management, using three types of data models: object-oriented, rela-
tional, and semantic data models. Then, they deal with schema evolution in het-
erogeneous DBMSs,
## 21
which is more complex than in single, standalone databases.
Finally, they discuss the implications of automating the dynamic schema evolution
process in heterogeneous databases. Hartunget al.
## 20
̄rst propose and discuss in
detail a set of seven main requirements for e®ectively evolving database schemata
and ontologies: \Rich set of simple and complex changes, Backward compatibility,
Mapping support, Automatic instance migration, Propagation of schema changes to
related mappings, and schemata, Versioning support, and Powerful schema evolu-
tion infrastructure." Then, the authors brie°y survey the state-of-the-art, as of
September 2010, of schema evolution in both relational and XML databases, and on
ontology evolution: they studied more than 20 recent approaches and compared most
of these approaches against the proposed main requirements. The authors claim that
their methodology could be similarly used to study and compare other approaches for
schema or ontology evolution.
Note that, as considered in those works, a research  ̄eld closely related to schema
evolution in databases is ontology evolution (e.g., in the Semantic Web),
## 15
## ,
## 22
although di®erences have been evidenced.
## 16
With the consolidation of implementa-
tion solutions for the former and development of the latter, we will likely see a
convergence between these two worlds in the next future. The convergence is also
accompanied by the (partial) adoption of the closed world assumption (CWA),
typical of databases, in the study of ontology-based data access.
## 23
## ,
## 24
However, as
ontologies and databases can still be considered separate worlds, at least from the
viewpoint of their deployment in real-world data-intensive applications, we will not
consider ontologies in this literature review.
Brahmiaet al.
## 10
brie°y review, in a dedicated encyclopedia entry (published in
2015), the di®erent research proposals dealing with schema evolution in relational,
object-oriented, and XML databases, and discuss the support of schema evolution in
mainstream DBMSs. In another encyclopedia entry
## 219
(published in 2018), the same
authors extend
## 10
by brie°y studying schema evolution in NoSQL databases.
Review on Schema Evolution in Databases
## 2430001-9
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

This work extends that analysis (i.e., Ref.219) to a broader literature, also including
recent approaches, with more details and deeper insight. In particular, with respect
to Ref.219, our paper (i) presents the research methodology (at Sec.2) that we have
followed to review the literature of schema evolution in databases, (ii) reviews several
new research work published in 2018 or later (until this year, 2024), concerning
schema evolution in relational, object-oriented, or NoSQL databases, (iii) deals with
schema evolution in environments not covered by Ref.219: \schema evolution in
relational-XML databases" (Sec.4.4) and \schema evolution in mutli-model
databases" (Sec.4.6), (iv) provides, at the end of each subsection dealing with
schema evolution in a given database environment, a table that classi ̄es and com-
pares the di®erent research papers reviewed in that subsection, based on a set of
comparison criteria de ̄ned in the \Research Methodology" section (Sec.2),
(v) provides several new future research directions, in Sec.6, and (vi) presents a list
of 219 references whereas
## 10
presents only 40 references.
Moreover, Rahm and Bernstein
## 25
present an online bibliography for papers on
schema evolution, as of October 2006, and propose to divide these papers into seven
research categories: \Database schema evolution, XML schema evolution, Ontology
evolution, Software evolution, Work°ow evolution, Schema versioning and Model
and mapping management."
Schema evolution is partially supported by some commercial DBMSs, since only
some features of this technique are supported, as will be brie°y surveyed in Sec.5.
In the rest of this section, we provide a review of the state of the art about schema
evolution in databases. We classify the approaches proposed by the research com-
munity into six sets, based on the model of the considered databases: relational
(Sec.4.1), object-oriented (Sec.4.2), XML (Sec.4.3), relational-XML (Sec.4.4),
emerging and NoSQL (Sec.4.5), and multi-model (Sec.4.6) databases. A comparison
of the surveyed approaches, in a summary reference table, will be presented at the
end of each one of these six subsections.
4.1.Schema evolution in relational databases
McKenzie and Snodgrass
## 26
de ̄ne an algebraic language for database query and
update that subsumes the relational algebra, can accommodate an arbitrary his-
torical algebra and supports both snapshot and historical rollback expressions. The
language also has a simple semantics and supports evolution both of database con-
tents and schema, in the context of general support for transaction time.
In Ref.27, the author presents an extension to SQL, called SQL/SE, that adds
query language support to databases with an evolving schema. In particular, dis-
cussions on issues related to the introduction of null values, on the adoption of
multiple time dimensions and on the notion of completed relations can also be found
in this Roddick's 1992 work.
To e±ciently deal with schema evolution in web information systems (like
Wikipedia), the Carlo Zaniolo's team has proposed the Panta Rhei Framework
## Z. Brahmia, F. Grandi & B. Oliboni
## 2430001-10
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

which aims at providing a uni ̄ed solution for smooth maintenance of a database
allowing for schema changes and management of the transaction-time history of
databases under schema evolution. This framework is composed of four tools: (i)
## PRISM,
## 28
## ,
## 29
a tool that helps the database administrator to de ̄ne a new schema and
then automatically rewrites legacy queries to comply with it; (ii) ArchIS,
## 30
a
transaction-time DBMS that e±ciently supports temporal queries on the archived
history of a database with time-invariant schema; (iii) PRIMA,
## 31
a tool that extends
ArchIS by introducing complex temporal query support over a database with
evolving schema; (iv) HMM,
## 32
a tool provided with archiving and querying capa-
bilities over rich metadata histories. Both PRISM and PRIMA systems, in order to
explicitly exploit the semantics of schema evolution, use \Schema Modi ̄cation
Operators" (SMO), a new data de ̄nition language equipped with schema change
operators.
A threefold extension to the Panta Rhei Frameweork was presented in Ref.33,
where the authors: (i) propose ICOM, a new language of integrity constraint mod-
i ̄cation operators, that completes SMO; (ii) introduce an approach for rewriting
queries and updates after changes to integrity constraints; (iii) present PRISM++, a
system that implements this approach. The e®ectiveness of PRISM++ has been
validated on evolution histories of the database of a web information system,
Wikipedia (with more than 240 schema versions in 6 years),
## 34
and the database of a
Big-Science project, the Genetic DB Ensembl (with more than 410 schema versions
in 9 years). In Ref.35, which is an extended version of Ref.33, the authors present
the PRISM/PRISM++ system and the technology that made it possible, and extend
this system with two tools: one for automatically collecting and providing statistics
on schema evolution histories, and the other for deriving equivalent sequences of
SMO operations from migration scripts used for upgrading schema.
Considering schema changes in the context of database evolution, De Vries and
## Roddick
## 36
## ,
## 37
distinguisheddomain evolution, involving changes in the speci ̄cation,
semantics or range of admissible values for attributes, fromstructural changes, in-
volving addition and deletion of attributes and relations. In order to alleviate the
burden of change propagation in the case of attribute domain evolution, the concept
ofmesodatahas been introduced as an intermediate layer between extant data and
metadata de ̄ning the schema level. Mesodata
## 38
consist of the de ̄nition of
\intelligent" domains, adding structure and semantics to basic data types.
A mesodata type (e.g., Weighted Graph or List) represents the structure of the
domain, di®erently from an abstract data type which de ̄nes the structure of data
values. With the adoption of mesodata, some schema changes involving attribute
representation, domain constraints or domain perception can be handled without the
need for changing data and/or applications and without the information loss which
can be unavoidable with data coercion or conversion.
## 36
In such cases, a mesodata
type can be used to map values and their relationships from the domain before to the
domain after the change.
Review on Schema Evolution in Databases
## 2430001-11
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

In Ref.39, the authors propose an on-demand schema evolution approach based
on virtual views (constructed with mapping inversion), which only deals with the
schemata a®ected by the changes, and aims at overcoming the impacts of schema
evolution on existing applications and queries that have been written against the
schema.
Raeet al.
## 40
study schema evolution inF1,
## 41
a distributed relational database built
on top of a distributed key-value store. They propose a protocol that allows users to
evolve the schema without loss of availability, loss of global synchronization and risk
of data corruption. Information about the implementation of the proposed protocol
in production servers is also provided.
Moreover, Desantiet al.
## 42
propose an approach for schema evolution based on a
rewriting algorithm which removes possible redundancies in a set of schema change
operations (i.e., a set of SQL DDL statements) speci ̄ed on a relational database
schema. A schema change operation is a \create", \drop", or \modify" operation.
The proposed approach generates a delta version (i.e., a set of SQL DDL commands)
with the di®erence between two schemata provided by a development team member
and, after identifying and removing redundancies, merges a set of delta versions in a
single redundancy-free delta, which is executed when the database administrator
decides to generate a new version of the database schema. By optimizing the sets of
SQL DDL instructions, the proposed approach reduces the number of these
instructions and the required system downtime, on the one hand, and increases the
system availability, on the other hand. As far as experimental results are concerned,
the authors make a comparison between the prototype which implements their ap-
proach and two known tools, Rmenu and ApgDi®,
## 43
with focus on response time and
reliability parameters. Such a comparison shows that the proposed approach sig-
ni ̄cantly reduces the time consumed for performing schema changes, while pro-
ducing the same schema.
As an answer to the lack of testing strategies and tools for database schema
evolution, Grolinger and Capretz
## 45
propose a unit test approach which accesses
databases in order to locate the application code that should be revised due to
schema changes. When a database schema is evolved, this approach determines the
list of all SQL data manipulation statements (i.e., SELECT, INSERT, UPDATE,
and DELETE) which require updates. The proposed approach is validated through
the implementation of a unit-testing framework, using Java 1.5 for the application
code, JUnit 4 as a traditional testing framework,
## 46
and Oracle 10 g for the relational
database. The authors present the validation results which show that their approach
̄nds all SELECT statements and most of other SQL statements that need mod-
i ̄cations.
Cleveet al.
## 47
propose a systematic approach to understand how developers deal
with database schema evolution in practice. It is based on an automatic four-step
process in order to derivate the global historical schema of an evolving relational
database: (i) SQL code extraction, (ii) schema extraction, (iii) schema comparison,
## Z. Brahmia, F. Grandi & B. Oliboni
## 2430001-12
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

and (iv) visualization and exploitation. The produced schema contains all schema
components that belonged (in past versions) or belong (in the current version) to the
schema of the studied database, annotated with historical metadata (e.g., commit
date, committer id). The authors present a tool suite (composed of three tools: a
schema extractor, a historical schema derivator, and a history visualizer), developed
to support their approach and to analyze the evolution history of very large database
schemata over a long period. These tools have been used to analyze the schema
evolution history of the MySQL relational database of a complex medical informa-
tion system (OSCAR, Open Source Clinical Application Resource) in Canada, over a
period of ten years. According to their analysis, the authors have detected 670
schema versions created during such a period: the  ̄rst database schema version (July
22, 2003) contains 88 tables whereas the last database schema version (June 27,
2013) contains 445 tables. Moreover, the authors mention that among the weak-
nesses of their work is the consideration of only 16 distinct schema change operations,
when identifying schema changes; the proposed approach does not support opera-
tions like renaming an attribute, splitting a table into several tables or merging tables
into one table.
Recently, Herrmannet al.
## 48
propose CoDEL, a relationally complete database
evolution language, which is built on the PRISM++ language.
## 28
## ,
## 33
CoDEL is
intended to be a declarative language that allows specifying consistent changes to the
database schema and/or changes to stored data. Unlike PRISM++, CoDEL sup-
ports all possible schema change operations on tables. Relationally complete means
that for any (relational) SQL script which includes a sequence of SQL data de ̄nition
and data manipulation statements, a semantically equivalent sequence of CoDEL
operations (i.e., SMO
## 28
operations) exists. For each CoDEL operation, the authors
formalize its operational semantics and provide an SQL-like syntax. Moreover, the
authors use the relational algebra,
## 49
with some extensions (e.g., the extended pro-
jection, aggregation, and outer joins), for proving the relational completeness of this
new language.
Vassiliadiset al.
## 50
study schema evolution in eight relational databases that be-
long to public and large open source projects, in order to understand which tables are
evolving and how. Their study individuates four patterns for schema evolution:
(i) thepattern stating that tables with large schema sizes typically have long
durations; (ii) the Comet pattern saying that tables which undergo most schema
changes are the ones with medium schema sizes; (iii) the Inversepattern suggesting
that tables with medium or small durations typically undergo amounts of schema
changes lower than expected; (iv) the empty triangle pattern stating that removals
are often applied on tables with small durations and with few or no schema changes,
whereas tables with long durations are rarely removed.
In Ref.51, the authors deal with foreign keys evolution. To this end, they study
schema evolution involving foreign keys in six free open-source relational databases
and conclude that, in real projects, foreign keys can evolve in three di®erent ways:
Review on Schema Evolution in Databases
## 2430001-13
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

(i) in some databases, foreign keys always evolve in a synchronous manner with the
schema evolution of their corresponding tables; (ii) in some other databases, foreign
keys have two behaviors: only a subset of foreign keys is evolving in sync with the
evolution of their table schemata; the other foreign keys are either evolving in a
di®erent way or not evolving at all; (iii) in a third set of databases, foreign keys are
removed, after some amount of schema changes.
Recently, Bhattacherjeeet al.
## 190
propose a system, named BullForg, which is an
extension of the PostgreSQL relational DBMS to support single step, online schema
evolution by applying lazy (or deferred) schema migrations, whether backwards
compatible or non-backwards compatible, without downtime. By immediately
deploying schema changes to a web-based or mobile service, this system avoids
delayed deployment of new schemata, migration restrictions, and database decay.
4.1.1.Summary overview
In Table1, we summarize the main approaches proposed by the research community
for schema evolution in relational databases, while considering the six comparison
criteria mentioned at the end of Sec.2(i.e., \Database model", \Implementation",
\Schema change semantics", \Schema change propagation", \Integrity constraints",
and \Software evolution").
4.2.Schema evolution in object-oriented databases
In a pioneering work, Banerjeeet al.
## 52
deal with schema evolution support in the
OODBMS ORION (base for the commercial product ITASCA) in three ways: (i) by
Table 1.  Summary of schema evolution approaches in relational databases.
## Approach
## Database
## Model   Implementation
## Schema
## Change
## Semantics
## Schema
## Change
## Propagation
## Integrity
## Constraints
## Software
## Evolution
McKenzie and Snodgrass
## 26
RelNoYesYesNoNo
## Roddick
## 27
RelNoYesYesNoNo
Curinoet al.,
## 28
## ,
## 29
RelPrototypeYesYesNoYes
Wanget al.
## 30
RelPrototypeYesYesNoNo
Moonet al.
## 31
RelPrototypeYesYesNoNo
Curinoet al.
## 32
RelPrototypeYesNoNoNo
Curinoet al.
## 33
RelPrototypeYesYesYesYes
Curinoet al.
## 35
RelPrototypeYesYesYesYes
De Vries and Roddick
## 36
## ,
## 37
RelNoYesYesYesNo
Xueet al.
## 39
RelNoYesYesNoNo
Raeet al.
## 40
Relsystem (F1)YesYesNoNo
Desantiet al.
## 42
RelPrototypeYesYesNoNo
Grolinger and Capretz
## 45
RelPrototypeYesYesNoYes
Cleveet al.
## 47
RelPrototypeYesNoNoNo
Herrmannet al.
## 48
RelNoYesYesNoNo
Vassiliadiset al.
## 50
RelNoYesNoYesNo
Vassiliadiset al.
## 51
RelPrototypeYesNoYesNo
Bhattacherjeeet al.
## 190
RelPrototypeYesDeferredYesNo
## Z. Brahmia, F. Grandi & B. Oliboni
## 2430001-14
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

presenting a classi ̄cation of over 20 schema change operations under the ORION
object-oriented data model; (ii) by de ̄ning the semantics of each schema change
operation, through the identi ̄cation of a set of invariant properties of an object
oriented schema that must be preserved across schema changes and a set of rules for
selecting the most meaningful way to preserve the invariant properties for each of the
schema change operations (to be used when the invariant properties can theoretically
be preserved in more than one way); and (iii) by developing an implementation
strategy for the proposed schema changes, which does not require database re-or-
ganization or system shutdown.
In Ref.53, the authors propose an extension to the prototype object-oriented
knowledge base system \Sherpa", which enables it to fully support schema change
operations and control their e®ects on the instances. Such an extension is based on a
dynamic inheritance and classi ̄cation scheme that propagates any schema change
operation to all the classes involved and along with their corresponding instances.
The method provides for both immediate and deferred update and supports top-
down as well as bottom-up design of composite objects.
Staudt Lerner and Habermann
## 54
present the design of OTGen, a tool that helps
the database administrator in the development of °exible transformations of object-
oriented databases when their schemata evolve. OTGen supports both simple and
complex schema changes, database re-organization and arbitrarily complex trans-
formations both on the contents of individual objects and on the entire database.
Since the database re-organization is an expensive operation and does not allow
the reuse of existing software, Tresch and Scholl
## 55
propose a method for schema
transformation that avoids re-organizations whenever possible. Their idea is based
on the concept of data independence, which is well known in relational databases and
neglected in object-oriented systems. To this end, the authors propose two concepts,
views (virtual classes) and subschemata (subsets of classes and views), to implement
data independence in object-oriented DBMSs and to enable the execution of any
schema transformation of type which is capacity preserving (i.e., a schema trans-
formation which preserves the same potential set of objects after transformation)
or capacity reducing (i.e., a schema transformation which potentially leads to
data loss).
Ferrandina and Zicari
## 56
present the two alternative strategies that can be used to
implement database conversion functions when the database schema is changed: (i)
conversion functions implemented as immediate database updates (i.e., the DBMS
executes the conversion functions on all objects of the modi ̄ed classes immediately
after the commitment of the schema change) and (ii) conversion functions imple-
mented as lazy (or deferred) database updates (i.e., the DBMS executes conversion
functions on the concerned objects only when they are physically accessed). After
that, the authors show, through an example, that these two strategies are not always
equivalent, since the database state obtained by adopting the  ̄rst strategy does not
always correspond to that obtained by adopting the second strategy.
Review on Schema Evolution in Databases
## 2430001-15
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

In Ref.57, the authors propose their approach for implementing user-de ̄ned
conversion functions as lazy database updates in an object-oriented DBMS. They
describe the data structures and the basic algorithms that can be used for the im-
plementation of the lazy approach. Furthermore, they show how also immediate
database updates could be implemented by means of the basic algorithms proposed
for lazy database updates. Ferrandinaet al.
## 58
de ̄ne correctness criteria for the
implementation of conversion functions via lazy database updates and demonstrate
that the basic algorithms proposed in Ref.57are correct.
An alternative approach to the use of invariants for the solution of the semantics
of change problem has been proposed in Ref.59and developed in the context of the
TIGUKAT system.
## 60
Such an approach is based on the introduction of a sound and
complete set of axioms (equipped with an inference mechanism), which formalizes
thedynamic schema evolution, which is the actual management of schema changes in
a system in operation. The compliance of the available primitive schema changes
with the axioms automatically ensures schema consistency, without the need for
explicit checking, since incorrect schema versions cannot be generated.
In Ref.61, the authors propose a declarative instance update language, a basic
schema update language (its syntax is similar to the language presented in Ref.52),
and a database evolution mechanism which combines the two languages. This pro-
posal allows a designer to write programs for updating the database schema and the
database instance at the same time. Before applying the changes, the DBMS informs
the designer whether the database obtained at the end of the database evolution
process will be consistent (i.e., both the database schema and its instance are con-
sistent) or not.
Since the seamless evolution of an object-oriented schema is a relevant feature not
only for application developers but also for software reuse, Liuet al.
## 62
propose the
adoption of polymorphic reuse mechanisms in object-oriented database speci ̄cations
to achieve such seamlessness. More precisely, they introduce an approach for the
incremental design involving the reuse of object-oriented methods and query speci-
̄cations. They show that their approach avoids or minimizes manual reprogram-
ming of methods and queries required by schema evolution, through the use of
\propagation patterns" and a mechanism for their re ̄nement. Propagation patterns
are a kind of behavioral abstraction of application programs, which could allow
database designers and programmers to de ̄ne object methods and queries without a
detailed knowledge of the data structure and in a way transparent to its evolution.
The propagation pattern re ̄nement is an e±cient mechanism for specifying and
reusing propagation patterns.
In Ref.63, the authors propose the adoption of the multi-object mechanism for an
e±cient management of schema evolution in object-oriented databases. Such a
mechanism allows the implementation of specialization in an object-oriented data-
base and supports multiple instantiation, automatic classi ̄cation and object mi-
gration. The multi-object mechanism is better suited to the execution of schema
## Z. Brahmia, F. Grandi & B. Oliboni
## 2430001-16
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

changes than the mechanism usually adopted in most object-oriented DBMSs: it is
easier to implement and more e±cient, since it avoids copying objects or propagating
schema changes, and also easier to understand, since it does not require complex
change propagation rules. The proposed mechanism has been implemented in the
## F2 DBMS.
## 64
## Li
## 65
surveys the main research proposals in schema evolution of object-oriented
databases, up to the year 1997, with regards to three requirements: database se-
mantic integrity, schema evolvability, and application compatibility.
## Staudt Lerner
## 66
proposes a model of type changes, which not only supports local
changes involving single types but also complex changes involving multiple types.
The latter are de ̄ned after a study of encountered changes in maintenance histories
of some real systems. The author also provides algorithms which support such type of
changes and derives conversion rules used for adapting data conforming to an
existing database schema to a new database schema. Furthermore, the author pre-
sents \Type Evolution Software System" (TESS), a prototype which implements the
proposed model and associated algorithms.
An axiomatic model for schema change propagation in object databases is also
introduced in Ref.67. Such a model identi ̄es, in a declarative manner, the set of
objects concerned by a schema change. Furthermore, this model can be combined
with any one of the four approaches previously proposed for change propagation,
that is (i) the immediate conversion (or coercion) approach, used for instance in
GemStone,
## 68
(ii) the deferred conversion (lazy updates, or screening) approach, used
for instance in ORION,
## 52
(iii) the  ̄ltering approach, used for instance in CLOSQL,
## 69
and (iv) the hybrid approach, used for instance in Sherpa
## 53
and O2.
## 70
## The  ̄ltering
approach is based on keeping the existing objects compatible with the new schema
and discarding the non-compatible ones, whereas the hybrid approach is de ̄ned as a
combination of the others.
Rundensteiner, who has been for years a very active scientists in  ̄elds of schema
evolution and versioning, and her colleagues have made several work that deserve a
particular attention. First, they developed a transparent schema change technology
that allows on-line modi ̄cation of databases without disturbing existing applica-
tions.
## 71
Then, they proposed an extensible, re-usable and °exible framework
## 72
based
on the integration of a  ̄xed set of invariant-preserving primitive change operations
(with the use of the standard OQL language for object migration).
## 73
Finally, they
provided a direct optimization strategy for complex sequences of schema evolution
operations.
## 74
Moreover, as a kind of alternative to schema evolution, Coulondre and Libourel
## 75
propose an approach based on roles, which allows the evolution of object structure
and behavior without changing the database schema. Note that a role, also called an
object dynamics, is the combination of structure and behavior in a particular con-
text. The main idea defended by the authors is that, while the class concept is
required for several practical reasons, it should be modi ̄ed if it is to model the notion
Review on Schema Evolution in Databases
## 2430001-17
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

of evolution. The proposed approach provides an ODMG-conservative database
model for role handling and extended associated mechanisms (including attribute
access, method resolution, lookup, etc.), where multiple inheritance is supported at
class and role levels, together with associated languages and validation by a proto-
type.
4.2.1.Summary overview
In Table2, we summarize the main approaches proposed by the research community
for schema evolution in object-oriented databases, while considering the six com-
parison criteria mentioned at the end of Sec.2.
4.3.Schema evolution in XML databases
Although XML schema have some similarities with object-oriented schema,
researchers working on XML schema evolution had neither adopted the same
approaches proposed for evolution of object-oriented schema nor adapted these
Table 2.  Summary of schema evolution approaches in object-oriented databases.
## Approach
## Database
## Model   Implementation
## Schema
## Change
## Semantics
## Schema
## Change
## Propagation
## Integrity
## Constraints
## Software
## Evolution
Banerjeeet al.
## 52
OO    System (ORION)    YesYesNoNo
Nguyen and
## Rieu
## 53
OO    System (Sherpa)YesImmediate,
## Deferred
NoNo
## Staudt Lerner
and Haber-
mann
## 54
OOPrototypeYesYesNoNo
Tresch and
## Scholl
## 55
OONoYesYesNoNo
Ferrandina and
## Zicari
## 56
OONoYesImmediate,
## Deferred
NoNo
## Ferrandina
et al.,
## 57
## ,
## 58
OONoYesImmediate,
## Deferred
NoNo
Peters and
## Özsu
## 59
OONoYesYesNoNo
Lagorceet al.
## 61
OONoYesYesNoNo
Liuet al.
## 62
OOPrototypeYesYesNoYes
Al-Jadir and
## L
## 
eonard
## 63
OOSystem (F2)YesYesNoNo
## Staudt Lerner
## 66
OOPrototypeYesYesNoNo
Peters and
## Barker
## 67
OONoYes    Immediate, Deferred,
## Filtering, Hybrid
NoNo
Ra and Runden-
steiner
## 71
OOPrototypeYesYesNoNo
Claypoolet al.
## 72
OOPrototypeYesYesNoNo
Claypoolet al.
## 74
OOPrototypeYesYesNoNo
Coulondre and
## Libourel
## 75
OOPrototypeYesYesNoNo
## Z. Brahmia, F. Grandi & B. Oliboni
## 2430001-18
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

approaches to the XML context. This is due to the basic di®erences which exist
between the XML data model and the object-oriented data model.
An annotated bibliography on research works dealing with XML schema evolu-
tion published until 2004 has been presented in Ref.76. Guerrini and Mesiti
## 77
pro-
vide a study in which they present and compare the support of XML schema
evolution in four commercial DBMSs (SQL Server, DB2, Oracle 11g, and Tamino)
and a selection of the most relevant approaches and prototypes proposed by
researchers to manage XML schema evolution.
In the literature, several formalisms have been proposed to specify XML database
schemata,
## 78
the most widely-used of which are the DTD
## 79
and the XML Schema
language.
## 80
The expressive power of DTD and XML Schema has been studied and
characterized using formal language theory in Refs.81and82. Hence, XML schema
evolution had been investigated for schemata de ̄ned either as DTDs and as XML
Schemas. Some other proposals for schema evolution do not consider a precise
XML schema language and are intended to be applicable to both DTD-based and
XML Schema-based XML databases.
In the following three subsections, we present the di®erent research proposals for
DTD evolution, XML Schema evolution and evolution of XML schemata either
de ̄ned as DTD or as XML Schema speci ̄cations.
4.3.1.DTD evolution
The \XML Evolution Manager" (XEM) framework has been proposed in Ref.83for
the management of the evolution of both DTD (i.e., the schema) and XML docu-
ments (i.e., the instances). XEM supports a minimal and complete set of change
primitives, which are classi ̄ed as either DTD changes or XML document changes.
These primitives are also quali ̄ed as consistency-preserving: after a schema change,
they ensure the validity of the resulting DTD and the conformance of suitably
transformed existing XML documents; after a data change, they ensure the con-
formance of the changed XML document to the structure and constraints contained
in its DTD. Furthermore, the authors show that the proposed taxonomy of DTD
changes is complete and brie°y describe the implementation of a prototype system
which shows the feasibility of the XEM framework, using PSE Pro as a backend
storage system.
Bertinoet al.
## 84
study the problem of evolving DTDs, to which the XML docu-
ments already present in a repository conform, so that they can be adapted to the
structure of new XML documents that have to be added to the repository.
## Coox
## 85
proposes an XML data model and a set of axioms, which allow the
maintenance of the integrity of the XML database when the schema is changed.
The suggested axiomatic data model is an implementation of the ideas used in the
TIGUKAT system
## 60
for semi-structured data.
In Ref.86, the authors provide solutions for the management of evolving DTDs
through the proposal of twenty- ̄ve DTD change operations. The semantics of such
Review on Schema Evolution in Databases
## 2430001-19
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

operations is de ̄ned via preconditions and post-actions aimed at ensuring the va-
lidity of the resulting DTD, the conformance of extant XML documents to the new
DTD and, as much as possible, avoidance of existing data loss. Invariants that must
be safeguarded during DTD changes have also been de ̄ned. The proposed approach
allows performing complex and high-level schema change operations (e.g., making
composite an atomic element, transforming an attribute into a subelement, changing
a group of content particles to an element; inverting parent-child relationships),
while the underlying XML documents are accordingly transformed in a lossless way.
In Ref.87, the authors augment the set of schema change primitives already
proposed in Ref.83with a set of three high-level DTD evolution operators (namely
SubtreeMoveUp, SubtreeMoveDown and RelationshipInverse), and de ̄ne their se-
mantics by specifying their e®ects on a DTD. Moreover, they introduce algorithms
for generating \Extensible Stylesheet Language Transformations" (XSLT)
## 88
scripts
to transform existing XML documents that were valid with respect to the changed
DTD so that they become valid with respect to the new DTD.
References89and90propose a framework which assists the designer to specify an
XML schema update in an intuitive way and, in case the validity of the extant XML
documents has to be preserved, present an update algorithm that produces a new
schema that both meets all changes speci ̄ed by the designer and can be considered a
conservative extension of the initial schema (i.e., initially valid existing XML
documents continue to be valid after the schema update). In this work, the authors
consider an XML schema as a set of rules, such that each rule uses a regular ex-
pression to de ̄ne the legal sub-elements of an XML element; thus, updates to an
XML schema can be considered as changes to the corresponding set of regular
expressions, and the problem of XML schema evolution becomes a problem of regular
expression evolution.
Amaviet al.
## 91
propose a set of tools for conservative XML schema evolution and
compatible XML document adaptation. They propose an algorithm which generates
mappings that allow transforming an original schema into a conservative extension
of it (and vice versa), via composition and inversion, in addition to a method for
translating each XML document which is valid with respect to the initial schema into
a document which is valid with respect to the extended schema.
4.3.2.XML schema evolution
The problem of evolving XML Schema
## 80
has been studied in Ref.92. The authors
̄rst present a set of change primitives to be applied to the basic components of a
schema (i.e., elements and types), being them local or global.
a
Then, they propose a
technique to optimize the XML document revalidation under schema evolution. The
main idea is to save the changes applied to the schema and to individuate the
portions of the schema that, because of these changes, have to be revalidated.
a
Global declarations appear as direct children of the ¡schema¿ element and can be reused throughout the
XML Schema. Local declarations can only used be in their speci ̄c context.
## Z. Brahmia, F. Grandi & B. Oliboni
## 2430001-20
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

The document portions a®ected by these changes can then be identi ̄ed and reva-
lidated. Thus, a costly revalidation of the whole documents is avoided. Guerrini and
## Mesiti
## 93
present an approach to XML Schema evolution, prototyped in a Web-based
system named X-Evolution. This system makes the modi ̄cation primitives proposed
in Ref.92available to the designer through a graphical interface: X-evolution allows
the execution and veri ̄cation of schema modi ̄cations speci ̄ed by means of a
graphical representation of an XSD schema. Transparent adaptation of valid XML
documents to the evolved schema is automatically performed. Schema revalidation
during schema evolution is performed only when strictly necessary and impacts
minimal portions of documents a®ected by the modi ̄cations only.
The authors of Refs.94and95present a language (XSUpdate) and a tool (EXup)
for managing modi ̄cations to an XML Schema and their e®ects on underlying XML
documents. XSUpdate is a SQL-like language that allows users to identify a set of
components in an XML schema, named the evolution objects, to specify a modi ̄-
cation operation to apply on them and to de ̄ne an adaptation approach for asso-
ciated documents. The authors show how each XSUpdate statement can be
translated into two XQuery Update Facility
## 96
expressions whose e®ects, on the XML
Schema and the associated XML documents, are the intended e®ect of the original
statement in terms of schema modi ̄cation and document adaptation, respectively.
EXup is a Java application for the speci ̄cation, translation and evaluation of
XSUpdate statements. It o®ers two user interfaces, one applet-based for Web use and
one stand-alone for local use. Furthermore, EXup allows validating XML documents
or portions of them.
Cavalieriet al.
## 97
address the problem of reducing sequences of change operations
on XML Schema and XML documents, consisting in deriving a shorter sequence of
change operations with the same e®ect. First, the authors consider an XML Schema
or an XML document as a tree and a sequence of change operations as applied to the
corresponding tree. Then, they propose a set of binary reduction rules. Finally, they
introduce an algorithm which relies on the application of such a set of rules to reduce
any sequence of XML Schema or XML documents changes.
## Klettke
## 98
proposes an approach for the design of a new XML Schema and for the
evolution of an existing one. It has been implemented in a research prototype called
\Conceptual Design and Evolution for XML Schema" (CoDEX). For the design of a
new XML Schema, the designer  ̄rst speci ̄es the schema graphically according to the
conceptual model called \Entity Model for XML-Schema" (EMX).
## 99
Then, CoDEX
checks the completeness and the correctness of the conceptual EMX schema and
generates the corresponding XML Schema code. For evolving an existing XML
Schema, the designer speci ̄es his/her changes graphically on the conceptual EMX
schema. The prototype CoDEX performs six actions: it (i) collects all the changes
resulting from the interaction of the designer with the EMX model; (ii) logs and
reduces these changes as far as possible when the same component is changed more
than one time; (iii) generates a sequence of XML Schema evolution steps from the
Review on Schema Evolution in Databases
## 2430001-21
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

logged and reduced XML Schema changes; (iv) changes physically the XML Schema
code corresponding to the modi ̄ed conceptual model according this sequence of
changes; (v) automatically generates a sequence of XML document evolution steps,
from the sequence of XML Schema evolution steps, for adapting the associated XML
documents; (vi) accordingly adapts these documents by using XSLT.
## 88
Recently, the CoDEX approach has been extended with \Evolution Language for
XML-Schema" (ELaX),
## 100
a domain-speci ̄c language aimed at handling modi ̄ca-
tions on an XML Schema and expressing such modi ̄cations formally. ELaX allows
the speci ̄cation of complex modi ̄cations by combining the add, delete and update
operations, which are logged in order to be later used to adapt the XML documents
associated to the modi ̄ed XML Schema. The CoDEX tool is extended with an ELaX
interface which allows direct manipulation of an XML Schema. Since an XML
Schema designer using the ELaX language could store a sequence of ELaX opera-
tions in a log for a long time period and execute it when required, N
## €
osingeret al.
## 101
propose a \Rule-based Optimizer for ELaX" (ROfEL) algorithm, which enables a
reduction of the number of logged operations before submitting them for execution.
The reduction is based on three steps: (i) merging the content of some operations, (ii)
deleting unnecessary or redundant operations, (iii) correcting, if possible, or re-
moving invalid operations. The ROfEL algorithm applies a set of heuristic rules in
order to identify unnecessary and redundant operations.
In Ref.102, the authors study the evolution of families of XML schemata. In fact,
since a single change in the real world may a®ect more than one XML Schema
belonging to a family at the same time, the designer needs to determine the complete
set of XML Schemas involved in such a change in order to ensure that they can be
evolved in a mutually consistent way to respond to the change. More precisely, the
authors propose a new approach, inspired by the \Model-Driven Development"
(MDD) philosophy, to manage the evolution of XML schemata at conceptual and
logical MDD levels. A designer applies changes only once in a conceptual schema of
the application domain, while the introduced approach guarantees, in a semi-auto-
matic and bidirectional way, a consistent propagation to all the concerned XML
Schemas. They also provide a formal model capturing all the possible change
operations and detailing their propagation mechanism. The proposed solutions have
been tested in a real-world evolving application scenario.
In Ref.103, the authors propose eXolutio, a tool which uses the principles of \Model
Driven Architecture" (MDA)
## 104
to design and evolve an XML Schema. It allows a
designer to specify a \Platform Independent Model" (PIM) schema and multiple
\Platform Speci ̄c Model" (PSM)schemata, each representing a part ofa PIM schema,
with a mapping from PSM schemata to the PIM one. Furthermore, eXolutio allows the
designer to evolve the set of speci ̄ed schemata consistently, thanks to the mappings
between the two levels and which allow the propagation of schema changes made at one
level to all the a®ected schemata at the other level. To this purpose, the authors adopt
the mechanism of schema change propagation described in Ref.102.Klímeket al.
## 105
## Z. Brahmia, F. Grandi & B. Oliboni
## 2430001-22
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

experimentally evaluate the methodology proposed in Ref.102and the tool (eXolutio)
presented in Ref.103in the eHealth domain (using the Data Standard for eHealth in
the Czech Republic). The experimental results prove both the feasibility of the pro-
posed approach and the e±ciency of eXolutio.
Domínguezet al.
## 106
propose a UML-to-XML framework for schema evolution,
called the \Generic Evolution Architecture" (GEA). It is considered as the only
proposal for XML schema evolution that incorporates the four following features.
First, it performs the schema evolution operations at a conceptual level encoded in
## UML.
## 107
Second, it supports a procedure for the transformation into XML schemata
of the pro ̄les belonging to UML class models. Third, the GEA framework auto-
matically propagates schema changes on any existing stereotyped UML class model
to the corresponding previously generated XML schema and to all the related
existing XML documents (this task of adapting XML documents to their updated
XML schema is called \target incrementality"
## 108
). Fourth, the proposed framework
follows a traceable approach, considered as the key feature for achieving the other
three features. This approach creates explicit links between the components of
the UML model and the components of the generated XML schema, which allow the
simultaneous evolution of both UML class models and derived XML schema and the
adaptation of XML documents, in a seamless manner. Mutual consistency of all
involved components (i.e., UML models, XML schemata and XML documents) is
automatically preserved throughout the course of evolution.
In Ref.109, the authors present a system as a solution to the XML schema
evolution problem and focus on the issue of how transforming XML documents, in
response to the evolution of their XML schemata, so that they conform to the
changed schema. The proposed system is composed of four modules: schema
matcher, transform generator, data migration, and XSLT
## 88
visualizing editor. The
schema matcher module implements an algorithm that takes as input two XML
trees, representing the old and the new schema, applies a set of matching rules, like
identity and linguistic similarity, and returns the two trees with matching between
their related XML elements. The transform generator module uses the output of the
schema matcher module (i.e., the two trees and matching information) as input and
generates an XSLT executable stylesheet which implements transformation actions.
Once executed on an XML document which is valid with respect to the old schema,
the generated XSLT stylesheet produces a new XML document which is valid to the
new schema and which physically replaces the previous XML document. The data
migration module allows converts data from the old format (or schema) to the new
one. The XSLT visualizing editor has three functions: (i) it shows a graph that
represents the execution of an XSLT stylesheet, enabling the designer to visualize the
format of the XSLT output; (ii) it generates the XML schema of the documents
resulting from the XSLT transformation, giving the designer the possibility to
compare it with the new intended schema; (iii) it allows to  ̄x possible errors in the
XSLT stylesheet if it does not provide the output desired by the designer.
Review on Schema Evolution in Databases
## 2430001-23
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

Brahmiaet al.
## 110
## ,
## 111
recently dealt with changes involving the so called design
styles of an XML Schema, that is Russian Doll, Salami Slice, Venetian Blind, and
Garden of Eden. In the \Garden of Eden" style, all declarations are global, which
maximizes reusability of speci ̄cations. The \Russian Doll" style, where most
schema details are hidden as local declarations, can be used to safeguard the
intellectual property of design. The \Venetian Blind" and \Salami Slice" styles
provide intermediate reusability and protection levels. The authors have proposed
an approach, named StyleVolution, which allows designers to convert an XML
Schema  ̄le from any source design style to any target design style and to deal
with the possible e®ects of the conversion on the underlying XML instance
documents.
4.3.3.Evolution of XML schema expressed in DTD or in XML schema
## Genev
## 
eset al.
## 112
propose a (unifying) framework for determining the consequences of
XML schema changes on the validity of existing XML documents which are valid
with respect to the original schema and on XPath queries embedded in programs
working on XML documents whose structure is described by the initial schema. The
proposed framework can be used to overcome some challenging problems caused by
XML schema evolution and faced by XML programmers (i.e., forward/backward
incompatibility issues and identi ̄cation and rewriting of queries which do not pro-
duce the expected results after a schema change).
Picalausaet al.
## 113
propose XEvolve, a unifying framework which allows validation
of XML documents and e±cient testing of semantic equivalence and inclusion of
XML schemata de ̄ned using the DTD,
## 79
XML Schema
## 80
and RELAX NG
## 114
formalisms. To this end, XEvolve relies on \Visibly Pushdown Automata" (VPA)
## 115
as a unifying model for the various schema languages. XEvolve  ̄rst converts XML
schemata into VPA and then applies standard VPA algorithms for streaming vali-
dation of XML data and constraining XML schema evolution with respect to
backward compatibility, forward compatibility, refactoring and migration.
As an XML schema evolves over time, XML documents known to conform to an
initial version of a schema may need to be veri ̄ed with respect to its new version
after a schema change. To this purpose, such documents need to be revalidated
against the new schema and two approaches proposed in the literature can be
exploited: the naïve or brute-force revalidation approach and the incremental re-
validation approach.
## 116
The naïve approach revalidates existing XML documents by
applying a standard validation algorithm like \Microsoft XML Core Services"
(MSXML), Apache Xerces or \XML Schema Validator" (XSV), that is a brute-force
validation of updated documents from scratch. On the other hand, the incremental
approach revalidates only the portions of existing XML documents that have been
directly a®ected by the evolution.
In Ref.117, the authors propose an algorithm for transforming XPath
## 118
expressions according to XML schema evolution. For a given XML schema S1, an
## Z. Brahmia, F. Grandi & B. Oliboni
## 2430001-24
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

XPath expression XP1 de ̄ned under S1, a schema change operation OP acting
on S1 and the XML schema S2 produced by applying OP to S1, the proposed
algorithm transforms XP1 into an XPath expression XP2, equivalent to XP1
whenever possible, such that the result of XP2 under S2 coincides with that of
XP1 under S1. However, the algorithm does not support some XPath expressions
like those involving sibling and parent axes and attribute and entity declarations
in schemata.
4.3.4.Summary overview
In Table3, we summarize the main approaches proposed by the research community
for schema evolution in XML databases, while considering the six comparison criteria
mentioned at the end of Sec.2.
Table 3.  Summary of schema evolution approaches in XML databases.
## Approach
## Database
## Model    Implementation
## Schema
## Change
## Semantics
## Schema
## Change
## Propagation
## Integrity
## Constraints
## Software
## Evolution
Suet al.
## 83
XML/DTD    PrototypeYesYesNoNo
Bertinoet al.
## 84
XML/DTDNoYesYesNoNo
## Coox
## 85
XML/DTDNoYesYesNoNo
Al-Jadir and El-
## Moukaddem
## 86
XML/DTDNoYesYesNoNo
Prashant and
## Kumar
## 87
XML/DTDNoYesYesNoNo
Bouchouet al.,
## 89
Bouchou and
## Duarte
## 90
XML/DTDNoYesYesNoNo
Amaviet al.
## 91
XML/DTD    PrototypeYesYesNoNo
Guerriniet al.
## 92
XML/XSDNoYesYesNoNo
Guerrini and
## Mesiti
## 93
XML/XSDPrototypeYesYesNoNo
## Cavalieri,
## 94
Cavalieriet al.
## 95
XML/XSDPrototypeYesYesNoNo
Cavalieriet al.
## 97
XML/XSDNoYesYesNoNo
## Klettke
## 98
XML/XSDPrototypeYesYesNoNo
## N
## €
osingeret al.
## 100
XML/XSDPrototypeYesNoNoNo
## N
## €
osingeret al.
## 101
XML/XSDNoYesNoNoNo
Nečaskýet al.
## 102
## ,
Klímeket al.,
## 103
Klímeket al.
## 105
XML/XSDPrototypeYesImmediateNoNo
Domínguezet al.
## 106
XML/XSDPrototypeYesImmediateNoYes
## Kwietniewski
et al.
## 109
XML/XSDPrototypeYesYesNoNo
Brahmiaet al.
## 110
## ,
## 111
XML/XSDPrototypeYesImmediateNoNo
## Genev
## 
eset al.
## 112
XML/genPrototypeYesYesNoYes
Picalausaet al.
## 113
XML/genPrototypeYesYesNoNo
Guerriniet al.
## 116
XML/genPrototypeYesYesNoNo
Hasegawaet al.
## 117
XML/genPrototypeYesYesNoNo
Review on Schema Evolution in Databases
## 2430001-25
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

4.4.Schema evolution in relational-XML databases
Relational-XML databases
## 44
## ,
## 206
have been mainly proposed to manage XML docu-
ments on top of a relational database platform, in order to support advanced
applications requiring large XML data collections by relying though on the storage
and management solutions provided by the consolidated relational technology.
Wang and Zaniolo
## 119
present an XML-based approach for representing and
querying the histories of data and schemata in relational databases. This approach
uses a temporally-grouped data model to represent the histories of database relations
as XML documents, called H-documents (H for historical). The contents of these
documents, without any change to existing standards, can be transformed and
published on the Web, using the XSLT language or directly queried using the
XQuery language. Moreover, the authors show that, by representing and publishing
the database history as H-documents, they can also represent and query the history
of the relational schema evolution, using XML and its query languages. In fact, since
the schema evolution history is stored in the H-documents, the designer or the
developer could use XQuery to access the schema history, detect changes performed
on schema, and visualize snapshots of the schema as of any desired time. Further-
more, the authors discuss the implementation of their approach either by using a
native XML database (i.e., by directly storing and querying H-documents) or by
using a relational DBMS (i.e., by shredding the H-documents for storing them into a
set of temporal relational tables, and translating XQuery queries into equivalent
SQL queries). Finally, the authors show that their approach is so general that can be
applied also to arbitrary XML documents, from strictly structured data-centric XML
documents to loosely structured text-centric Web XML documents.
In Ref.120, the authors propose a model for managing schema evolution in a
hybrid relational-XML DBMS, which includes three types of schema: relational,
XML, and XML stored in relational tables. In the proposed hybrid model, they
provide an architecture which supports two types of schema changes (i.e., document-
based changes, e®ected through XQuery statements to update the XML schema, and
table-based changes, e®ected through updates to relational schema with ALTER
statements in SQL) and a set of three operations (Create data element, Add data
element, and Destroy data attribute) for changing XML-relational schema.
Loet al.
## 121
brie°y deal with schema evolution in the interactive \VIsual REla-
tional to XML" (VIREX) system, which allows end-users, be they professionals or
non-experts, to query relational databases in a visual way, and converts the results of
visual queries into XML documents accompanied with their corresponding XML
Schemas. VIREX supports the notion of materialized view
## 122
and allows users to
de ̄ne materialized XML views over relational data. To be consistent with respect to
its database source, each materialized view is maintained in VIREX according to the
deferred update approach (i.e., modi ̄cations performed on the data sources are
applied to the view only when it is accessed). Since the capability to manage schema
evolution is one of the properties that must be enjoyed by any system that supports
## Z. Brahmia, F. Grandi & B. Oliboni
## 2430001-26
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

materialized views, VIREX implements three functions (addition, deletion, and
renaming of an attribute) for schema evolution support. The authors claim that
these functions o®er great °exibility to the maintenance of views and to their ma-
terialization.
4.4.1.Summary overview
In Table4, we summarize the main approaches proposed by the research community
for schema evolution in relational-XML databases, while considering the six com-
parison criteria mentioned at the end of Sec.2.
4.5.Schema evolution in emerging and NoSQL databases
Since contemporary applications, like multimedia, geographical information systems,
digital libraries, and mobile applications, require new database models with new
query languages for managing new types of data, new types of databases have
emerged in the last few years. Among these emerging database paradigms, we could
cite as examples multimedia, spatial, temporal, stream, biological/genome, embed-
ded, mobile, grid and, in particular, NoSQL/NewSQL databases. In the following
paragraphs, we present contributions dealing with schema evolution in stream,
embedded and NoSQL databases, where the evolution support is a more stringent
requirement.
Terwilligeret al.
## 123
deal with schema evolution in data stream management
systems. They propose to introduce into data streams a new element, called an
accent, which announces evolutions to operators in a continuous query, and de ̄ne a
set of six common stream query operators (Select, Project, Union, Join, Window, and
Aggregate) that can process data and schema evolution accents, considering three
evolution primitives: \Add Attribute, Drop Attribute, and Alter Data". Hence, the
proposed framework allows data stream systems to support schema evolution
without interrupting the evaluation of continuing queries (i.e., such queries auto-
matically respond to evolution), whenever the evolution does not a®ect the query
semantics. Furthermore, this framework allows the gradual and graceful manage-
ment of evolution, by allowing simultaneous data streams, arriving from di®erent
sources, to evolve independently on each other.
As more and more applications (like mobile, desktop, and server applications) use
embedded databases for data storage, dynamic updating systems (like Ginseng,
## 124
Table 4.  Summary of schema evolution approaches in relational-XML databases.
## Approach
## Database
## Model   Implementation
## Schema
## Change
## Semantics
## Schema
## Change
## Propagation
## Integrity
## Constraints
## Software
## Evolution
Wang and Zaniolo
## 119
Rel-XML    PrototypeYesYesNoNo
Baqasah and Pardede
## 120
Rel-XMLNoYesYesNoNo
Loet al.
## 121
Rel-XML    PrototypeYesYesNoYes
Review on Schema Evolution in Databases
## 2430001-27
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

## Upstare,
## 125
and Jvolve
## 126
) have to cope with changes to embedded database sche-
mata. However, these systems do not natively provide any support for performing
online upgrades to applications that require updates to the embedded database
schema; they only allow on-the-°y updates of code and in-memory data. Wu and
## Neamtiu
## 127
propose an approach for automatically extracting embedded database
schemata from regular applications (e.g., written in C or C++) and for detecting
changes of these schemata as applications evolve. In fact, they have presented a tool,
called \Schema extraCtion and eVolution analysis for embedded Databases"
(SCVD), proving the feasibility of their approach in the following way: given a set of
releases of an application, SCVD automatically retrieves the source code for all these
releases, extracts the database schemata embedded in each version of the application
code and, by comparing the extracted schema versions, produces the underlying
schema evolution steps organized in a useful manner. They also use SCVD to study
schema evolution in four popular applications which use embedded databases, that is
Firefox, Monotone, BiblioteQ and Vienna, for a period of more than 18 cumulative
years. The results of their study show that embedded database schemata change less
frequently than enterprise-class database schemata and that, in embedded data-
bases, deletions are more frequent.
Liuet al.
## 128
are the  ̄rst to study data evolution in column-oriented NoSQL data
stores, which are considered more suitable to support data adaptation in response to
an evolving schema than traditional databases. In particular, they propose a novel
framework for the e±cient management of data evolution, which directly exploits the
column-oriented compressed storage scheme. They show that the advantages
brought by the adoption of this framework for data evolution support are manifold:
access to the portion of data only that is a®ected by evolution, avoidance of SQL
query execution, reconstruction of indexes from the query result, e±cient data de-
compression and compression. The authors present experimental evaluations that
show how the proposed framework is much more e±cient and scalable than the
query-level data evolution solutions usually adopted in both row and column
storages.
In Ref.129, the authors aim at providing a generic interface for managing schema
evolution in NoSQL data stores.
## 130
## –
## 132
To this end, they propose a declarative
NoSQL schema evolution language (i.e., a set of basic common practical schema
change operations that deal with most of the typical cases which are discussed in
developer forums), and a generic and abstract NoSQL database programming lan-
guage for accessing NoSQL data stores. The latter language distinguishes the current
state of the data store from the state of the objects available in the application space,
and implements the proposed set of schema evolution operations. With their ap-
proach, the authors show how the proposed set of schema evolution operations can
be implemented for a large class of NoSQL data stores. Furthermore, the authors
study safety of execution for each of the proposed schema evolution operations (i.e.,
adding, deleting, renaming, moving, and copying properties of entities). Finally, they
## Z. Brahmia, F. Grandi & B. Oliboni
## 2430001-28
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

show that the schema evolution process can be handled not only eagerly (i.e., by
executing the speci ̄ed schema evolution operations directly on all involved entities)
but also lazily (i.e., by executing the speci ̄ed schema evolution operations on the
concerned entities the next time they are fetched into the application space).
In Ref.133, the authors propose Cleager, a web-based system prototype that
allows eager schema evolution support in schema-less NoSQL document stores (e.g.,
MongoDB,
## 134
## Google Cloud Datastore
## 135
## ,
## 136
) by means of the declarative NoSQL
schema evolution language presented in Ref.129. Cleager provides a web-based
console for specifying eager SMO using the Cleager language
## 129
and translates the
speci ̄ed operations to be executed as MapReduce
## 137
jobs in the Google Cloud
## Platform.
## 138
Nowadays, NoSQL data stores are popular thanks to their capability to manage
huge data volumes and to their schema-less or schema-°exible property. However, a
standard query language which allows manipulation of NoSQL data is lacking. Thus,
application developers are usually using Object-NoSQL Mappers when accessing
NoSQL data stores, as a middleware layer between the application and the under-
lying data store. In Ref.139, the authors study, among others, schema evolution
support in state-of-the-art Object-NoSQL Mappers: Hibernate OGM,
## 140
## Kundera,
## 141
DataNucleus,
## 142
EclipseLink,
## 143
and Morphia.
## 144
They conclude that current Object-
NoSQL Mappers provide support for basic schema evolution operations (e.g., addi-
tion or deletion of an attribute or a relationship between entities), but when several
schema changes or complex schema change operations must be performed on the
NoSQL data store, application developers have to produce a customized code to
satisfy their requirements.
In Ref.145, the authors present ControVol, an Eclipse plugin which aids devel-
opers in resolving problems related to schema evolution during the development of
Big Data applications on top of schema-less NoSQL data stores. In fact, although
these stores do not impose the speci ̄cation of a schema for managed data, current
\Integrated Development Environments" (IDEs) are relying on well-structured data
both in the application source code (where data structures are called objects) and in
the NoSQL data store (where data structures are called entities). Furthermore, due
to the lack of tools provided by (schema-less or schema-°exible) NoSQL data stores
for managing schema, software developers have to deal with schema evolution pro-
blems programmatically and in anad hocmanner and, as a consequence, schema
changes are managed by the code of the application. In this context, developers are
being helped by Object-NoSQL Mappers that allow converting objects into entities
and vice versa. However, when some objects (at the application code level) are
changed, the new version of the corresponding application is likely not able to e±-
ciently manage legacy entities (at the NoSQL data store level) associated to these
objects, especially in the case of dropping and renaming some class attributes or
changing their types; such a new application version will give rise to problems like
data loss and runtime errors, when deployed in the production environment.
Review on Schema Evolution in Databases
## 2430001-29
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

Thus, during the development phase, existing IDEs lack support for detecting pro-
blems that can result from schema evolution and for helping developers to e±ciently
resolve them. Moreover, since Object-NoSQL Mappers are being used for lazily mi-
grating entities when their structures are changed, developers should be sure that
migrations are performed safely. The plugin ControVol has been proposed to  ̄ll this
lack of support in IDEs and to guarantee safe lazy schema migrations. In fact, at
development time, it statically performs type checking
## 146
on object mapper class
declarations by comparing them with their previous versions stored in the application
code repository
## 147
; ControVol can detect changes involving the schema (e.g., addi-
tion, renaming or deletion of attributes) in the application code, which are not
compatible with legacy data stored in the NoSQL data store; reports in the IDE
warnings to developers and proposes automatic and quick  ̄xes to work around the
warnings in order to avoid the problems that could happen during lazy schema
migration. Consequently, not only ControVol guarantees, in the production envi-
ronment, that legacy data will be compatible with the structures utilized in the new
application code version, but also ensures that the new application version will also be
running on legacy data. ControVol has been developed on top of the NoSQL data
store Google Cloud Datastore,
## 135
using the Object-NoSQL Mapper Objectify
## 148
for
storing and loading entities. Objectify provides life-cycle annotations which allow lazy
schema migration. In Ref.149, the authors present a new version of the ControVol
prototype which also deals with the management of problems that could result from
reintroducing attributes that have been eliminated from the application code in a
previous application version but that are still persisting in some legacy entities.
Recently, Sauret al.
## 150
propose \Key-Value store evolution" (KVolve) as an
approach and a tool for evolving a key-value NoSQL database
## 151
without downtime.
KVolve is implemented on top of a Redis
## 152
NoSQL database which stores
## JSON
## 153
## ,
## 154
objects. It makes available a domain-speci ̄c language to developers,
which allows them to express changes to data formats (i.e., JSON objects) and to
specify how legacy data are transformed to a new data format version. Such changes
are applied to the NoSQL database lazily, in order to avoid downtime and database
locking; objects that are stored according to a previous format are migrated on-the-
°y to the new format only when accessed by applications. The developed tool sup-
ports changes to the  ̄elds of a JSON object (addition of new  ̄elds, and deletion or
modi ̄cation of existing  ̄elds) and also to the names of the keys. The authors claim
that this tool does not require updates to the Redis database since it employs
wrappers for performing lazy data migration. Furthermore, experimental results
show that KVolve minimizes pause time during both data migration and application
of necessary changes to applications, although it introduces a small overhead (be-
tween 5% and 9%, due to the extra code in wrappers) when an update is not being
executed.
Scherzingeret al.
## 155
use a tool prototype, named Datalution and support the
operations previously proposed by Scherzingeret al.,
## 129
in order to experimentally
## Z. Brahmia, F. Grandi & B. Oliboni
## 2430001-30
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

assess the two techniques usually adopted for migrating a JSON-based NoSQL da-
tabase when its schema evolve: eager/immediate migration and lazy/deferred mi-
gration. They highlight the advantages of the lazy migration strategy, which is
proved preferable when legacy JSON entities have to be converted on-the-°y, one at-
a-time, and only when they are called by the application. As far as the eager mi-
gration strategy is concerned, the authors state that it is preferable only when legacy
JSON entities have to be converted in one pass.
In Ref.156, the authors deal with long-term schema evolution, involving chains of
pending schema change operations that have to be executed together. Changes
concerning legacy entities pile up in such chains while an application using them
undergoes multiple modi ̄cations and have  ̄nally to be processed when such entities
are actually accessed by the application. More precisely, the authors have introduced
a rule-based composition method for building such chains. As far as implementation
issues are concerned, a tool has been developed on top of MongoDB to support long-
term schema evolution, based on four strategies for lazy migration: lazy stepwise,
lazy composed, predictive, and incremental data migration. In the experimental
evaluation of their proposals, the authors show that the data migration process can
be optimized by reducing the number of migration operations.
## St
## €
orlet al.
## 157
propose Darwin, a middleware layer between the applications and
the NoSQL DBMSs, which allows schema management support in two ways after the
de ̄nition of an initial schema: explicitly, through the schema change language of
Scherzingeret al.,
## 129
or implicitly and in an incremental manner after each update of
the entities in the database. Moreover, Darwin supports both eager and lazy data
migration and, therefore, the developers can choose the most suitable migration
strategy for any application. In addition, due to its nature as a middleware, Darwin
provides a GUI that facilitates its integration with any NoSQL DBMS. Note that,
although in theory Darwin can support all NoSQL DBMSs, in practice only three
DBMSs are actually supported: MongoDB and Couchbase as document-oriented
NoSQL systems, and Cassandra as column-based NoSQL system. An extended
version of Ref.157has been presented in Ref.191by dealing with two new tools that
have been built on top of Darwin: MigCast,
## 192
## ,
## 193
which is a NoSQL data migration
advisor, and EvoBench,
## 194
## ,
## 195
which is a benchmark for evaluating NoSQL schema
evolution approaches and tools.
In Ref.158, a development environment named ControVol Flex is described.
It has been designed to satisfy the following  ̄ve requirements: (i) storing all schema
versions, (ii) alerting application programmers about possible schema con°icts when
changes speci ̄ed on some class declarations are not compatible with legacy entities
of such classes, (iii) lazily correcting all detected schema con°icts in an automatic
manner, (iv) also supporting eager migration of legacy entities, (v) allowing both
eager and lazy data migration to be performed concurrently. The last requirement is
important for the continuous deployment of zero-downtime and high-availability
applications, and results in starting an eager migration in the background, while
Review on Schema Evolution in Databases
## 2430001-31
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

lazily migrating legacy entities if the application requests access to them and the
eager migration has not reached them yet. Note that ControVol Flex is an extension
of the ControVol plugin
## 145
## ,
## 147
## ,
## 149
which has been presented above.
Bonifatiet al.
## 159
show how schema validation can be enforced through homo-
morphisms between property graphs schemas and property graphs instances, by
leveraging a concise schema data de ̄nition language inspired by the syntax of Cy-
pher,
## 160
which is an evolving query language for property graphs. They also deal with
schema evolution of property graphs, with a solution based on graph rewriting
rules
## 161
that allow considering both prescriptive and descriptive schemata. Note that
a prescriptive schema is a well-developed one and all new data are expected to
comply with it, whereas a descriptive schema is not yet in its  ̄nal version (in par-
ticular, in early development phases), which is being improved incrementally and
new data could force its adaptation when they are not conforming to it.
In Ref.162, the authors have proposed a methodology for self-adapting data
migration when schemata evolve in a NoSQL data store. Such a methodology au-
tomatically adjusts migration strategies (eager, lazy, incremental, predictive, and
adaptive) and its parameters accordingly, in order to support agile software devel-
opment while saving costs of unnecessary migration of legacy entities. The adapta-
tion strategy takes into account the following aspects: the query workload to be
handled, the number and type of changes in the data model resulting from schema
evolution, and the application requirements with regard to the tradeo® between
latency and migration costs during data accesses. An extended version of Ref.162
has been presented in Ref.196by focusing on how the precision and recall metrics
can be used in self-adaptive data migration strategies.
Chillónet al.
## 197
de ̄ne a taxonomy of schema changes operations for NoSQL data
stores, based on the uni ̄ed logical data model U-Schema,
## 198
and a domain-speci ̄c
language, named Orion, which implements such operations and allows database
administrators and application developers to specify scripts for changing NoSQL
schemas, at a high-level and in a database-independent way. The authors have also
dealt with the development of an Orion engine for three NoSQL DBMSs: MongoDB,
Cassandra, and Neo4j.
In Ref.214, the authors propose an approach, named CoDEvo and based on
model-driven engineering, for managing schema evolution in column-oriented
NoSQL databases, via model transformations.
## 215
In fact, when the conceptual data
model of the database evolves (as a result of the execution of some changes to such a
data model), CoDEvo applies model transformation rules to guarantee conformity
between this conceptual model and the (logical) database schema. As for the vali-
dation issue, the authors have applied CoDEvo on nine real open-source software
projects each one of them is using the column-oriented NoSQL DBMS Apache
Cassandra. They obtain good results since in 87.1% of the analyzed real schema
versions, CoDEvo generates a database schema that is the same or equivalent to the
schema built by the project developers; only in 12.9% of the analyzed schema
## Z. Brahmia, F. Grandi & B. Oliboni
## 2430001-32
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

versions, the schema produced by CoDEvo is di®erent from the already existing
database schema.
4.5.1.Summary overview
In Table5, we summarize the main approaches proposed by the research community
for schema evolution in emerging and NoSQL databases, while considering the six
comparison criteria mentioned at the end of Sec.2.
4.6.Schema evolution in multi-model databases
A multi-model database
## 207
## ,
## 208
is a database that supports several heterogeneous data
models and is managed by a single multi-model DBMS
## 216
(e.g., ArangoDB, Open-
Link Virtuoso, OrientDB, CortexDB, or PostgreSQL
## 209
) which is equipped with a
uni ̄ed multi-model query language.
## 210
## ,
## 211
Note that a multi-model database can also
be managed by a polystore
## 217
(i.e., a system based on the idea of polyglot persistence,
which consists in using a mediator for the management of a set of underlying DBMSs,
each of them is considered as the best suitable one for a supported data model).
In Ref.199, the authors deal with schema evolution in hybrid polystores
## 200
which
are also called heterogeneous databases (i.e., a combination of several, possibly
overlapping, relational, NoSQL and NewSQL databases). More precisely, they pro-
pose an approach that introduces an intermediate layer between the programs and
the databases of the polystore and considers two polystore languages: TyphonML,
## 201
Table 5.  Summary of schema evolution approaches in emerging and NoSQL databases.
## Approach
## Database
ModelImplementation
## Schema
## Change
## Semantics
## Schema
## Change
## Propagation
## Integrity
## Constraints
## Software
## Evolution
Terwilligeret al.
## 123
StreamNoYesYesNoNo
Wu and Neamtiu
## 127
EmbedPrototypeYesNoNoYes
Liuet al.
## 128
NoSQL/colPrototypeYesYesNoNo
Scherzingeret al.
## 129
NoSQL/docNoYesImmediate, DeferredNoNo
Scherzingeret al.
## 133
NoSQL/docPrototypeYesImmediateNoNo
Scherzingeret al.,
## 145
## Cerqueus
et al.
## 147
## ,
## 149
NoSQL/docPrototypeYesDeferredNoYes
Sauret al.
## 150
NoSQL/k-vPrototypeYesDeferredNoYes
Klettkeet al.
## 156
NoSQL/docPrototypeYesDeferredNoYes
Scherzingeret al.
## 155
NoSQL/docPrototypeYesImmediate, DeferredNoYes
## St
## €
orlet al.
## 157
## ,
## 191
NoSQL/docPrototypeYesImmediate, DeferredNoNo
Hauboldet al.
## 158
NoSQL/docPrototypeYesImmediate, DeferredNoYes
Bonifatiet al.
## 159
NoSQL/
graph
PrototypeYesYesNoNo
Hillenbrandet al.
## 162
## ,
## 196
NoSQL/doc,
k-v, col
PrototypeYesImmediate, Deferred,
## Incremental,
## Predictive,
## Adaptive
NoNo
Chillónet al.
## 197
NoSQL/doc,
col, grah
PrototypeYesImmediateNoNo
## Su
## 
arez-Oteroet al.
## 214
NoSQL/colPrototypeYesImmediateYesNo
Review on Schema Evolution in Databases
## 2430001-33
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

which is a conceptual modeling language that allows to specify a uni ̄ed conceptual
schema for (various) databases that belong to a hybrid polystore, and TyphonQL,
## 201
which is a polystore query language that allows to formulate queries on top of a
polystore schema de ̄ned in TyphonML. The functioning of such an approach is as
follows: given a source polystore schema S1 de ̄ned in TyphonML, a set of input
TyphonQL queries formulated on S1, and a list of schema change operators LO
speci ̄ed on S1, then the proposed approach (i) determines input queries that could
not be converted into equivalent output queries written against the target polystore
schema S2 (i.e., the schema that results from the execution of LO on S1), (ii) au-
tomatically converts input queries that can be adapted to S2, and (iii) produces
warnings for output queries that require further manual checking.
In Ref.204, the authors propose a query-based recommendation approach for
schema evolution in hybrid polystores. It is based on the conceptual modeling language
TyphonML.
## 201
## ,
## 205
Given (i) the conceptual schema of the polystore, de ̄ned in
TyphonML, and its mapping to the underlying databases, (ii) the history of the queries
executed on the polystore and their duration, and (iii) the size of each polystore entity,
then the recommended schema changes will concern (among others) index creations,
entity merging, and entity migrations from a database to di®erent one.
Stiemeret al.
## 223
propose a work-in-progress approach, named PolyMigrate, for
schema evolution and data migration in a distributed polystore database, named
Polypheny-DB.
## 224
The authors try to give answers to the \why", \where", \what",
\when", and \how" questions concerning schema evolution and data migration in
such a database environment. In particular, they study global schema changes, local
schema changes, and physical level schema changes, and their respective impact on
the di®erent layers of a distributed polystore. It is worth mentioning that Polypheny-
DB is composed of two data distribution layers: (i) the global layer, which covers all
interconnected instances of Polypheny-DB (each instance is located in a di®erent site
of the network), and (ii) the local layer, which covers only a single instance of
Polypheny-DB, in some given site; an instance of this polystore locally manages
heterogeneous data stores. Hence, in Polypheny-DB, we have three kinds of schemas:
(i) the global schema, which is the schema for all instances of the polystore and is
intended for all applications, (ii) a local schema, which is the schema of a single
instance of the polystore and is resulting from the application of some data distri-
bution operations (e.g., fragmentation, replication) on the global schema, and (iii) a
physical schema, which is the real schema of a single data store that is managed by an
instance of the polystore.
In Ref.225, Holubovaet al.study several aspects related to the topic of evolution
management of multi-model data, like modeling of multi-model data (through some
concepts like \Record", \Kind", and \Property"), schema change operations, schema
change propagation or multi-model database migration (lazy migration, and eager
migration), and inference of multi-model schema (e.g., based on single-model infer-
ence techniques already proposed in the literature for XML, RDF, and JSON data).
## Z. Brahmia, F. Grandi & B. Oliboni
## 2430001-34
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

In particular, the authors propose a schema evolution language, named MMSEL
(Multi-Model Schema Evolution Language), which is de ̄ned as an extension of the
NoSQL schema evolution language of Scherzingeret al.
## 129
A schema change operation
of MMSL could be either an intra-model operation (like the \add" operation), which
has an e®ect on only one data model, or an inter-model operation (like the \delete",
\rename", \copy", and \move" operations), which has an e®ect on more than one
model. Furthermore, the authors of Ref.225distinguish between (i) global schema
evolution operations, which are speci ̄ed for an abstract global schema/model and
should be converted and propagated to a set of local schema/models, and (ii) local
schema evolution operations, which are de ̄ned for a speci ̄c local schema/model
(e.g., a relational schema, or a JSON-based document-oriented NoSQL data model)
and could be executed only at local level.
Holubovaet al.
## 202
and Vavreket al.
## 203
propose a tool, named MM-evolver, for the
management of schema evolution in a multi-model database. MM-evolver allows a
user to specify schema change operations via the MMSEL language.
## 225
In MM-
evolver, schema change operations, which are executed in the model-independent
layer, are automatically propagated to all involved underlying data models after
translating each operation to the speci ̄c language of each data model it a®ects. This
tool also supports reference evolution, that is each time a property is changed (e.g.,
moved, renamed, deleted), the tool accordingly updates all references to such a
property.
In Ref.212, the authors propose a tool, called MM-evocat, which is based on the
category theory
## 213
and allows (among others) to manage schema evolution in multi-
model databases; the currently supported DBMSs are PostgreSQL (version 12.11)
and MongoDB (version 4.4). The category theory is used for uni ̄cation and ab-
straction of the underlying di®erent data models. Two important concepts have been
proposed by the authors in this context: \schema category," which is a uni ̄ed and
abstract representation that describes several di®erent logical data models, and
\instance category," which is a uni ̄ed structure that stores data imported from all
the underlying databases. Hence, it is easy to automatically convert data from any
database db1 to any other database db2, by using instance category, in a 2-step
process:  ̄rst, to transform data from db1 to the instance category, and then to
transform data from the instance category to db2. Note that a wrapper should be
developed for each underlying DBMS, which is devoted to the management of the
platform-speci ̄c requirements of the considered database. Note also that each logical
data model is transformed to the schema category through its own mapping. It is
worth mentioning that MM-evocat is an extension of another tool, named MM-cat
## 218
and based on the category theory, for multi-model data modeling and transformation.
Recently, Chillónet al.
## 222
propose a generic approach for managing schema
evolution in both NoSQL (i.e., document, key-value, columnar, and graph) and
relational databases. It is based on (i) the uni ̄ed data model U-Schema,
## 198
which
Review on Schema Evolution in Databases
## 2430001-35
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

covers the four NoSQL data models and the relational one, and (ii) the Orion lan-
guage,
## 197
which provides a taxonomy of schema change operations for U-Schema.
4.6.1.Summary overview
In Table6, we summarize the main approaches proposed by the research community
for schema evolution in multi-model databases, while considering the six comparison
criteria mentioned at the end of Sec.2.
- DBMS Support for Schema Evolution
In this section, we review the  ̄ndings of recent papers dealing with recognition of
schema evolution support in DBMSs available on the market.
As of 2000, the schema evolution support is studied in Ref.163. The author  ̄rst
presents the set of operations provided in the standard SQL-99 language to manage
schema evolution: operations for creating, altering and removing a domain, a user-
de ̄ned type, a table or a routine (i.e., a procedure or a function); operations for
creating and removing a view, an assertion, a trigger or a role; operations for granting
and revoking a privilege. Then, he compares these operations with those provided by
available commercial (object-)relational DBMSs: Oracle8i Server (Release 8.1.6),
IBM DB2 Universal Database (Version 7), Informix Dynamic Server.2000 (Version
9.2), Microsoft SQL Server (Version 7.0), Sybase Adaptive Server (Version 11.5),
and Ingres II (Release 2.0).
The latest consolidated version of the SQL standard, SQL:2011,
## 164
provides only
support for data versioning, and more precisely for temporal versioning of data,
through system-versioned period tables for versioning data along transaction time,
application-time period tables for versioning data along valid time, and system-
versioned application-time period tables for bitemporal versioning of data. Note that
the transaction time of data is de ̄ned as the time when data are current in the
database, and the valid time of data is de ̄ned as the time when data are valid in
the real-world.
## 11
Furthermore, also considering new non-temporal features of
## SQL:2011,
## 165
support for schema evolution cannot be found in the language standard.
Table 6.  Summary of schema evolution approaches in multi-model databases.
## Approach
## Database
## Model   Implementation
## Schema
## Change
## Semantics
## Schema
## Change
## Propagation
## Integrity
## Constraints
## Software
## Evolution
Finket al.
## 199
MMPrototypeYesYesYesYes
Benatset al.
## 204
MMPrototypeYesYesNoYes
Stiemeret al.
## 223
MMNoYesYesNoNo
## Holubov
## 
aet al.
## 225
MMNoYesImmediateYesNo
## Holubov
## 
aet al.,
## 202
Vavreket al.
## 203
MMPrototypeYesImmediateYesNo
Koupilet al.
## 212
MMPrototypeYesImmediateYesNo
Chillónet al.
## 222
MMPrototypeYesImmediateNoNo
## Z. Brahmia, F. Grandi & B. Oliboni
## 2430001-36
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

The new SQL:2016
## 166
standard under review does not present novelties concerning
schema evolution either.
Colazzoet al.
## 167
study and compare the support for updates of XML document and
XML schema, infourmainstreamcommercialDBMSs:Microsoft SQL Server2008, IBM
DB2 version 9.5, Oracle 11g, and Tamino. As to the supported XML schema language,
the authors show that DB2 and Oracle support the whole XML Schema language,
## 80
whereas SQL Server and Tamino only support a subset of it. As far as schema modi ̄-
cationand schema evolution are concerned, the results ofthe comparative study are that
XML schema modi ̄cation is supported only by Tamino, whereas XML schema evolu-
tion is supported by Oracle, DB2 and Tamino. However, Oracle is the only system that
supports schema evolution without requiring backward compatibility.
Hartunget al.
## 20
survey the support of relational schema evolution in three
commercial relational DBMSs, that is Oracle, Microsoft SQL Server, and IBM DB2.
The authors conclude that the three considered commercial DBMSs support only
schema changes provided by the SQL data de ̄nition language, but require though a
lot of manual tasks for revising other dependent schema components and guaran-
teeing backward compatibility. Only Oracle allows changing the schema of a table by
providing a new version of it and a column mapping. Moreover, the authors have also
studied and compared the support for XML schema evolution in  ̄ve commercial
tools: the three DBMSs mentioned above, the native XML DBMS Tamino, and the
XML tool Altova's Di®Dog (which allows XML schema matching and comparison).
These tools support evolution of XML schema and revalidation of underlying XML
documents with respect to the new schema. However, only Oracle allows the data-
base administrator to write XSLT scripts for data migration. Furthermore, the
authors claim that there is a lack of a uni ̄ed or standard language for changing XML
schema, and of support for propagating changes applied on an XML schema to all
other related XML schema and mappings.
Curinoet al.
## 35
provide (among other things) a comparative table on the support
of database schema evolution in several available proprietary and open-source tools:
DB2 Change Management Expert,
## 168
## Oracle Change Management Pack,
## 169
MySQL
Workbench for Schema Change,
## 170
SwisSQL DBChangeManager,
## 171
Idera SQL
## Change,
## 172
## Embarcadero Change Manager,
## 173
Red Gate SQL Compare,
## 174
## DTM
## Database Tools,
## 175
and Liquibase.
## 176
The authors notice that although none of these
tools supports schema evolution in a complete way, some partially deal with this
problem. However, all of them allow the de ̄nition of the schema and the migration of
data, and provide documentation on these tasks. It is worth mentioning that there
are some other tools, not covered in Ref.35, which try to provide some support for
schema evolution in relational databases, like Flyway,
## 220
which is a tool for SQL
database migration, and QuantumDB,
## 221
which is a method for evolving SQL da-
tabase schemas with neither downtime nor access impede to SQL clients.
In Ref.177, the authors examine (among other things) XML schema change
support in some commercial tools that are proposed by their vendors to deal with
Review on Schema Evolution in Databases
## 2430001-37
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

XML documents: Altova's XMLSpy and Di®Dog, DeltaXML Sync, LiquidXML
Studio, OXygen's XML Editor, Stylus Studio, SysOnyx's xmlDraft, and XMLmind's
XML Editor. Moreover, only SysOnyx's xmlDraft and Altova's XMLSpy and Di®-
Dog allow updating XML schema for existing documents, but this support is limited
for the tools of Altova. Furthermore, the authors also analyze the support of XML
schema evolution in four commercial DBMSs (DB2, Oracle 11g, Microsoft SQL
Server, and Tamino). They obtain similar results to those previously found by
Colazzoet al.,
## 167
presented above.
Scherzingeret al.
## 129
study (among other things) schema evolution support in
state-of-the-art NoSQL data stores (Redis
## 152
and Riak
## 178
as key-value stores,
MongoDB
## 134
and Couchbase
## 179
as document stores, and BigTable,
## 180
HBase,
## 181
## ,
## 182
## App Engine Datastore
## 183
and Cassandra
## 184
as extensible record stores) and present
the results that follows. First, most NoSQL DBMSs do not provide a schema de ̄-
nition language (exception for some systems like Cassandra which supports a
\CREATE TABLE" statement). Note here that although NoSQL data stores are
schema-less or schema-°exible (i.e., the schema or structure of introduced entities is
not de ̄ned in advance), persisted entities have an implicit schema which is repre-
sented by the class declarations used in the application source code. Further, in order
to simplify the management of NoSQL schema, two interesting proposals (that deal
only with JSON-based NoSQL data stores) could be mentioned: JSON schema,
## 185
which is proposed by the JSON community, as an explicit schema description lan-
guage and the technique of Klettkeet al.
## 186
for extracting the schema of a NoSQL
database that stores JSON documents. Second, all existing NoSQL systems do not
provide support for migrating legacy entities to a new schema speci ̄cation and
delegate such a task to the application logic layer (i.e., to developers who have to
write custom programs that perform eager or lazy migration of involved entities).
Third, there is a lack of a schema evolution interface in all available NoSQL data
store systems, which helps in the maintenance of entities' structures; currently, all
schema changes have to be programmed by developers. Fourth, only Cassandra
## 184
supports explicit modi ̄cation of the schema through its \ALTER TABLE" state-
ment. For this reason, it is not considered as a schema-less or schema-°exible NoSQL
system. Fifth, NULL values, which result from some schema evolution operations
(like adding a new  ̄eld or column), are managed di®erently by NoSQL systems.
Three strategies are distinguished: the  ̄rst one adopts the same semantics of NULL
values as in relational databases
## 187
and is supported by some systems like Mon-
goDB
## 188
; the second strategy supports the storage of NULL values but does not allow
them in query predicates and it is applied by some other systems like Cassandra and
App Engine Datastore; the third strategy does not support these values, since it
considers them as useless values which only cause a waste of storage space, and is
implemented in some other systems like HBase.
In Ref.139, the authors survey the state-of-the-art of Object-NoSQL Mappers,
which are currently used by application developers to deal with schema evolution
## Z. Brahmia, F. Grandi & B. Oliboni
## 2430001-38
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

problems in schema-less NoSQL data stores, since available NoSQL systems do not
provide any support for evolving the schema of these data stores. Note here that the
lack of such a support is a consequence of the nature of these databases, which are
designed to be schema-less or schema-°exible.
In Ref.226, Delplanqueet al.show, via a real industrial example of a database
schema evolution, that existing relational DBMSs (and in particular PostgreSQL) do
not provide tools that help database administrators or database architects to
smoothly manage database schema evolutions. Consequently, and in order to address
this lack of schema evolution tools, the authors consider the \database schema
evolution" problem as a \software evolution" problem and try to  ̄nd a suitable
solution in the software engineering world. More precisely, they propose tools that
should be developed to better deal with schema evolution in relational databases;
such tools are de ̄ned based on ideas and techniques coming from the software
engineering community, and also on the experience of the authors in the manage-
ment of software evolution.
- Conclusions and Future Research Directions
In this literature review, we provided a summary of the di®erent research approaches
that have been proposed for managing schema evolution in databases. We have
organized them according to the database model considered by the approach (i.e.,
relational, object-oriented, XML, relational-XML, emerging and NoSQL, or multi-
model databases). We also provided an overview of schema evolution support in
current DBMSs through the conclusions of papers dealing with it.
Despite the large research e®ort, the extensive literature and the wide range of
well-founded and proved scienti ̄c proposals, state-of-the-art DBMS technology do
not o®er an e®ective support for managing schema evolution. Thus, database
administrators and application developers are being forced to proceed manually and
in anad hocmanner each time they have to apply changes to the schema of a
populated database, in a production environment where an evolving schema has to
be managed. Typically, the database administrators must manually migrate data
conforming to the previous version of the schema toward the newer one. Moreover,
applications developers have to carefully maintain the program source code of all
applications that include queries or updates involving the changed schema, so that
they can be adapted to correctly work with the new schema.
On the other hand, our study lets us conclude that several research issues still
need further and special attention. They are as follows:
(i) E®ectively managing schema changes is a challenging task that requires to
correctly and consistently propagate these changes not only to underlying data
but also to all dependent components (e.g., stored procedures, functions, views,
indexes, triggers, application code involving queries and updates, and map-
pings). Current schema evolution approaches almost focus only on propagating
Review on Schema Evolution in Databases
## 2430001-39
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

schema changes to the underlying instances and ignore all other dependent
components. Thus, it would be interesting to devise an approach which handles
schema changes in a broader perspective and in an integrated environment,
while taking into account all possible e®ects on all dependent database and
software components and ensuring a safe and graceful evolution/versioning
process.
(ii) There is no e±cient technical support for schema evolution in the state-of-the-
art of the database technology. Therefore, it would be very interesting to de-
velop practical tools which may assist database administrators in managing an
evolving schema.
(iii) The standard SQL language, used for de ̄ning and altering a relational data-
base schema, provides a limited support for schema evolution. Since relational
databases are the most popular ones and SQL, as it is, could not be used to
easily manage relational databases with an evolving schema (e.g., to create a
new schema version, to migrate and adapt existing data, to propagate changes
to dependent components), it would be very useful to extend SQL in order to
explicitly and e±ciently support the schema evolution process. Moreover,
whereas standard SQL extensions have been provided in order to support
querying of object-relational, XML or JSON data, no features have been con-
sidered for the management of their schema.
(iv) Today, a great number of popular data-intensive applications are interactive,
web-based and distributed (e.g., Facebook, Youtube, Wikipedia). New releases
of these applications appear very frequently
## 189
due to the rapid change of user
requirements, regulations and technologies. As a consequence, in such appli-
cations, changes to database schemata are performed monthly, weekly or even
daily; for example, Raeet al.
## 40
talk about daily schema changes to the Google's
database, which are managed by the Google's DBMSF1.
## 41
Hence, it will be
quite interesting to deal with schema evolution (and schema versioning) in
these high-availability web-based and distributed applications.
(v) By reading the above six comparative tables, we notice that semantic/integrity
constraints and software evolution have not received enough attention in the
literature of database schema evolution. Hence, we think that it is interesting to
focus on these issues in all database models.
(vi) The study of schema evolution in databases could encourage the study of the
same topic in data warehouses, whose contents are mainly coming from data-
bases and consequently when a database evolve the data warehouse that is
linked to it should evolve accordingly. Although a good set of papers dealing
with schema evolution in data warehouses have been published in the last two
decades (e.g., Refs.227–229), a lot of aspects have not been e±ciently inves-
tigated, like evolution of OLAP queries under data warehouse schema evolu-
tion. Moreover, since new types of advanced databases or advanced data
warehouses appeared in the last period, like data lakes, data lakehouses,
## 230
and
## Z. Brahmia, F. Grandi & B. Oliboni
## 2430001-40
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

data mesh, we think that it is also interesting to focalize on schema evolution in
these new advanced and complex data collections. Note that Refs.231and232
could be a good starting point for working on schema evolution in data lakes
and data lakehouses, respectively.
## ORCID
## Zouhaier Brahmia
https://orcid.org/0000-0003-0577-1763
## Fabio Grandi
https://orcid.org/0000-0002-5780-8794
## Barbara Oliboni
https://orcid.org/0000-0003-4395-0893
## References
-  C. J. Date,An Introduction to Database Systems(Addison-Wesley Longman, Massa-
chusetts, USA, 2003).
## 2.  H. Bj
## €
orklund, W. Martens and T. Schwentick, Optimizing conjunctive queries over trees
using schema information, inProc. 33rd Int. Symp. Mathematical Foundations of
Computer Science (MFCS 2008),25–29 August 2008, Torun, Poland, pp. 132–143.
-  G. Wang, M. Liu, J. X. Yu, B. Sun, G. Yu, J. Lv and H. Lu, E®ective schema-based
XML query optimization techniques, inProc. 7th Int. Database Engineering and
Applications Symp. (IDEAS 2003),16–18 July 2003, Hong Kong, China, pp. 230–235.
-  G. R. Wang and X. L. Zhang, Declarative XML update language based on a higher data
model,J. Comput. Sci. Technol.20(3) (2003) 373–377.
-  M. Lenzerini, Data integration: A theoretical perspective, inProc. 21st ACM SIGACT-
SIGMOD-SIGART Symp. Principles of Database Systems (PODS 2002),3–5 June 2002,
Madison, Wisconsin, USA, pp. 233–246.
-  T. Milo and S. Zohar, Using schema matching to simplify heterogeneous data transla-
tion, inProc. 24th Int. Conf. Very Large Data Bases (VLDB 1998),24–27 August 1998,
New York City, New York, USA, pp. 122–133.
## 7.  S. Cluet, C. Delobel, J. Sim
## 
eon and K. Smaga, Your mediators need data conversion!, in
Proc. 1998 ACM SIGMOD Int. Conf. Management of Data (SIGMOD 1998),2–4 June
1998, Seattle, Washington, USA, pp. 177–188.
-  J. Fong, Converting relational to object-oriented databases,SIGMOD Record26(1)
## (1997) 53–58.
-  D. Sjøberg, Quantifying schema evolution,Inf. Softw. Technol.35(1) (1993) 35–44.
-  Z. Brahmia, F. Grandi, B. Oliboni and R. Bouaziz, Schema evolution inEncyclopedia of
Information Science and Technology, 3rd edn., ed. M. Khosrow-Pour (IGI Global,
Hershey, PA, USA, 2015), pp. 7641–7650.
## 11.  C. S. Jensen, C. E. Dyreson (eds.), M. B
## €
ohlen, J. Cli®ord, R. A. Elmasri, S. K. Gadia, F.
Grandi, P. Hayes, S. K. Jajodia, W. Käfer, N. Kline, N. Lorentzos, Y. Mitsoupoulos, A.
Montanari, D. Nonen, E. Peressi, B. Pernici, J. F. Roddick, N. L. Sarda, M. R. Scalas, A.
Segev, R. T. Snodgrass, M. D. Soo, A. U. Tansel, P. Tiberio and G. Wiederhold, The
consensus glossary of temporal database concepts—February 1998 Version,Temporal
Databases: Research and Practice, Lecture Notes in Computer Science 1399, eds.
O. Etzion, S. Jajodia and S. Sripada (Springer-Verlag, Berlin, Germany, 1998),
pp. 367–405.
-  J. F. Roddick, A survey of schema versioning issues for database systems,
## Inf. Softw.
## Technol.37(7) (1995) 383–393.
Review on Schema Evolution in Databases
## 2430001-41
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

-  J. F. Roddick, Schema evolution, inEncyclopedia of Database Systems, eds. L. Liu and
M. T.Özsu (Springer US, New York, NY, USA, 2009), pp. 2479–2481.
-  J. F. Roddick, Schema evolution, inEncyclopedia of Database Systems, 2nd edn., eds. L.
Liu and M. T.Özsu (Springer, New York, NY, USA, 2018), pp. 3287–3289.
-  F. Grandi, Introducing an annotated bibliography on temporal and evolution aspects in
the semantic web,ACM SIGMOD Record41(4) (2012) 18–21.
-  N. F. Noy and M. Klein, Ontology evolution: Not the same as schema evolution,Knowl.
## Inf. Syst.6(4) (2004) 428–440.
-  Z. Brahmia, F. Grandi and B. Oliboni, A systematic literature review on schema ver-
sioning in databases, in preparation.
-  S. Ambler and P. Sadalage,Refactoring Databases: Evolutionary Database Design
(Addison-Wesley, Boston, MA, 2006).
-  S. Ram and G. Shankaranarayanan, Research issues in database schema evolution: The
road not taken, Technical Report #2003-15, The University of Arizona, Tucson, AZ,
## USA.
-  M. Hartung, J. F. Terwilliger and E. Rahm, Recent advances in schema and ontology
evolution, inSchema Matching and Mapping, eds. Z. Bellahsene, A. Bonifati and E.
Rahm (Springer-Verlag, Berlin, Germany, 2011), pp. 149–190.
-  A.  P.  Sheth  and  J.  A.  Larson,  Federated  database  systems  for  managing
distributed, heterogeneous, and autonomous databases,ACM Comput. Surv.22(3)
## (1990) 183–236.
-  F. Zablith, G. Antoniou, M. d'Aquin, G. Flouris, H. Kondylakis and E. Motta, Ontology
evolution: A process-centric survey,Knowl. Eng. Rev.30(1) (2015) 45–75.
-  C. Lutz, I. Seylan and F. Wolter, Mixing open and closed world assumption in ontology-
based data access: Non-uniform data complexity, inProc. 2012 Int. Workshop on De-
scription Logics (DL 2012), paper 17, 7–10 June 2012, Rome, Italy.
-  I. Seylan, E. Franconi and J. De Bruijn, E®ective query rewriting with ontologies over
DBoxes, inProc. 21st Int. Joint Conf. Arti ̄cial Intelligence (IJCAI 2009),11–17 July
2009, Pasadena, CA, USA, pp. 923–929.
-  E. Rahm and P. A. Bernstein, An online bibliography on schema evolution,SIGMOD
## Record35(4) (2006) 30–31.
-  L. E. McKenzie and R. T. Snodgrass, Schema evolution and the relational algebra,Inf.
## Syst.15(2) (1990) 207–232.
-  J. F. Roddick, SQL/SE—a query language extension for databases supporting schema
evolution,ACM SIGMOD Record21(3) (1992) 10–16.
-  C. Curino, H. J. Moon and C. Zaniolo, Graceful database schema evolution: The PRISM
workbench,Proc. VLDB Endow. (PVLDB)
## 1(1) (2008) 761–772.
-  C. Curino, H. J. Moon, M. Ham and C. Zaniolo, The PRISM workbench: Database
schema evolution without tears, inProc. 25th Int. Conf. Data Engineering (ICDE 2009),
29 March–2 April 2009, Shanghai, China, pp. 1523–1526.
-  F. Wang, C. Zaniolo and X. Zhou, ArchIS: An XML-based approach to transaction-time
temporal database systems,VLDB J.17(6) (2008) 1445–1463.
-  H. J. Moon, C. Curino, M. Ham and C. Zaniolo, PRIMA: Archiving and querying
historical data with evolving schemas, inProc. ACM SIGMOD Int. Conf. Management
of Data (SIGMOD 2009), 29 June–2 July 2009, Providence, Rhode Island, USA,
pp. 1019–1022.
-  C. Curino, H. J. Moon and C. Zaniolo, Managing the history of metadata in support for
DB archiving and schema evolution, inProc. 5th Int. Workshop on Evolution and
Change in Data Management (ECDM 2008), 23 October 2008, Barcelona, Catalonia,
Spain, pp. 78–88.
## Z. Brahmia, F. Grandi & B. Oliboni
## 2430001-42
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

-  C. A. Curino, H. J. Moon, A. Deutsch and C. Zaniolo, Update rewriting and integrity
constraint maintenance in a schema evolution support system: PRISM++,Proc. VLDB
Endow. (PVLDB)4(2) (2010) 117–128.
-  C. A.Curino, H.J.Moon, L. Tanca and C. Zaniolo, Schema evolutionin Wikipedia: Toward
a web information system benchmark, inProc. 10th Int. Conf. Enterprise Information
Systems (ICEIS 2008),VolumeDISI,13–16 June 2008, Barcelona, Spain, pp. 323–332.
-  C. Curino, H. J. Moon, A. Deutsch and C. Zaniolo, Automating the database schema
evolution process,VLDB J.22(1) (2013) 73–98.
-  D. De Vries and J. F. Roddick, Facilitating database attribute domain evolution using
mesodata, inProc. 3rd Int. Workshop on Evolution and Change in Data Management
(ECDM 2004), 9 November 2004, Shanghai, China, pp. 429–440.
-  D. De Vries and J. F. Roddick, The case for mesodata: An empirical investigation of an
evolving database system,Inf. Softw. Technol.49(9–10) (2007) 1061–1072.
-  D. De Vries, S. Rice and J. F. Roddick, In support of mesodata in database management
systems, inProc. 15th Int. Conf. Database and Expert Systems Applications (DEXA
2004), 30 August–3 September 2004, Zaragoza, Spain, pp. 663–674.
-  J. Xue, D. Shen, T. Nie, Y. Kou and G. Yu, A transparent approach for database schema
evolution using view mechanism, inProc. 13th Int. Conf. Web-Age Information Man-
agement (WAIM 2012),18–20 August 2012, Harbin, China, pp. 405–418.
-  I. Rae, E. Rollins, J. Shute, S. Sodhi and R. Vingralek, Online, asynchronous schema
change inF1,Proc. VLDB Endow. (PVLDB)6(11) (2013) 1045–1056.
-  J. Shute, R. Vingralek, B. Samwel, B. Handy, C. Whipkey, E. Rollins, M. Oancea, K.
Little ̄eld, D. Menestrina, S. Ellner, J. Cieslewicz, I. Rae, T. Stancescu and H. Apte,F1:
A distributed SQL database that scales,Proc. VLDB Endow. (PVLDB)6(11) (2013)
## 1068–1079.
-  C. Desanti, M. Bernardelli, M. Fuckner and R. K. Stasiu, A redundancy-free approach to
schema evolution, inProc. 28th Brazilian Symp. Databases (SBBD 2013), short papers,
paper 7, 30 September–3 October 2013, Recife, PE, Brazil, short papers, paper 7,
https://sbbd2013.cin.ufpe.br/Proceedings/artigos/pdfs/sbbd
shp07.pdf (accessed on
## 29 March 2024).
-  StartNet, Another PostgreSQL di® tool (apgdi®) free database schema di® tool, http://
apgdi®.com/ (accessed on 29 March 2024).
-  M. M. Moro, L. Lim and Y. C. Chang, Schema advisor for hybrid relational-XML
DBMS, inProc. 2007 ACM SIGMOD Int. Conf. Management of Data (SIGMOD 2007),
12–14 June 2007, Beijing, China, pp. 959–970.
-  K. Grolinger and M. A. M. Capretz, A unit test approach for database schema evolution,
## Inf. Softw. Technol.53(2) (2011) 159–170.
-  P. Hamill,Unit Test Frameworks(O'Reilly Media, CA, USA, 2004).
-  A. Cleve, M. Gobert, L. Meurice, J. Maes and J. Weber, Understanding database schema
evolution: A case study,Sci. Comput. Programm.97(1) (2015) 113–121.
-  K. Herrmann, H. Voigt, A. Behrend and W. Lehner, CoDEL—a relationally complete
language for database evolution, inProc. 19th East European Conf. Advances in
Databases and Information Systems (ADBIS 2015),8–11 September 2015, Poitiers,
France, pp. 63–76.
-  E. F. Codd, A relational model of data for large shared data banks,Commun. ACM
## 13(6) (1970) 377–387.
-  P. Vassiliadis, A. V. Zarras and I. Skoulis, Gravitating to rigidity: Patterns of schema
evolution—and its absence—in the lives of tables,Inf. Syst.63(2017) 24–46.
Review on Schema Evolution in Databases
## 2430001-43
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

-  P. Vassiliadis, M. R. Kolozo®, M. Zerva and A. V. Zarras, Schema evolution and foreign
keys: A study on usage, heartbeat of change and relationship of foreign keys to table
activity,Computing101(2019) 1431–1456.
-  J. Banerjee, W. Kim, H. J. Kim and H. F. Korth, Semantics and implementation of
schema evolution in object-oriented databases,SIGMOD Record16(3) (1987) 311–322.
-  G. T. Nguyen and D. Rieu, Schema change propagation in object-oriented databases, in
Proc. IFIP 11th World Computer Congress (IFIP Congress 1989), 28 August–1 Sep-
tember 1989, San Francisco, USA, pp. 815–820.
-  B. S. Lerner and A. N. Habermann, Beyond schema evolution to database reorganiza-
tion, inProc. Conf. Object-Oriented Programming Systems, Languages, and Applica-
tions/European Conf. Object-Oriented Programming (OOPSLA/ECOOP 1990),21–25
October 1990, Ottawa, Canada, pp. 67–76.
-  M. Tresch and M. H. Scholl, Schema transformation without database reorganization,
SIGMOD Record22(1) (1993) 21–27.
-  F. Ferrandina and R. Zicari, Object database schema evolution: Are lazy updates always
equivalent to immediate updates? inProc. OOPSLA'1993 Workshop on Supporting
the Evolution of Class De ̄nitions, 26 September–1 October 1993, Washington, DC,
## USA.
-  F. Ferrandina, T. Meyer and R. Zicari, Implementing lazy database updates for an
object database system, inProc. 20th Int. Conf. Very Large Data Bases (VLDB 1994),
12–15 September 1994, Santiago de Chile, Chile, pp. 261–272.
-  F. Ferrandina, T. Meyer and R. Zicari, Correctness of lazy database updates for an
object database system, inProc. 6th Int. Workshop on Persistent Object Systems (POS
1994),5–9 September 1994, Tarascon, Provence, France, pp. 284–301.
-  R. J. Peters and M. T.Özsu, An axiomatic model of dynamic schema evolution in object
base systems,ACM Trans. Database Syst.22(1) (1997) 75–114.
-  M. T.Özsu, R. J. Peters, D. Szafron, B. Irani, A. Lipka and A. Muñoz, TIGUKAT: A
uniform behavioral objectbase management system,VLDB J.4(3) (1995) 445–492.
-  J. Lagorce, A. Stockus and E. Waller, Object-oriented database evolution, inProc.
6th Int. Conf. Database Theory (ICDT 1997),8–10 January 1997, Delphi, Greece,
pp. 379–393.
-  L. Liu, R. Zicari, W. L. Hürsch and K. J. Lieberherr, The role of polymorphic reuse
mechanisms in schema evolution in an object-oriented database,IEEE Trans. Knowl.
## Data Eng.9
## (1) (1997) 50–67.
-  L. Al-Jadir and M. L
## 
eonard, Multiobjects to ease schema evolution in an OODBMS, in
Proc. 17th Int. Conf. Conceptual Modeling (ER 1998),16–19 November 1998, Singa-
pore, pp. 316–333.
-  L. Al-Jadir, T. Estier, G. Falquet and M. L
## 
eonard, Evolution features of the
F2 OODBMS, inProc. 4th Int. Conf. Database Systems for Advanced Applications
(DASFAA 1995),11–13 April 1995, Singapore, pp. 284–291.
-  X. Li, A survey of schema evolution in object-oriented databases, inProc. 31st Int. Conf.
Technology of Object-Oriented Languages and Systems (TOOLS 1999),22–25 Sep-
tember 1999, Nanjing, China, pp. 362–371.
-  B. S. Lerner, A model for compound type changes encountered in schema evolution,
ACM Trans. Database Syst.25(1) (2000) 83–127.
-  R. J. Peters and K. Barker, Change propagation in an axiomatic model of schema
evolution for objectbase management systems, inProc. 9th Int. Workshop on Founda-
tions of Models and Languages for Data and Objects (FoMLaDO/DEMM 2000)
(Springer-Verlag, Berlin, Heidelberg, 2001), Selected Papers, Lecture Notes in Com-
puter Science 2065, 18–21 September 2000, Dagstuhl Castle, Germany, pp. 142–162.
## Z. Brahmia, F. Grandi & B. Oliboni
## 2430001-44
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

-  D. J. Penney and J. Stein, Class modi ̄cation in the GemStone object-oriented DBMS, in
Proc. 2nd Conf. Object-Oriented Programming Systems, Languages and Applications
(OOPSLA'87),4–8 October 1987, Orlando, Florida, USA, pp. 111–117.
-  S. R. Monk and I. Sommerville, A model for versioning of classes in object-oriented
databases, inProc. 10th British National Conf. Databases (BNCOD 1992),6–8 July
1992, Aberdeen, Scotland, pp. 42–58.
-  F. Ferrandina, T. Meyer, R. Zicari, G. Ferran and J. Madec, Database evolution in the
O2 object database system, inProc. 21st Int. Conf. Very Large Data Bases (VLDB
1995),11–15 September 1995, Zurich, Switzerland, pp. 170–181.
-  Y. G. Ra and E. A. Rundensteiner, A transparent schema-evolution system based on
object-oriented view technology,IEEE Trans. Knowl. Data Eng.9(3) (1997) 600–624.
-  K. T. Claypool, J. Jin and E. A. Rundensteiner, SERF: Schema evolution through an
extensible, re-usable and °exible framework, inProc. 1998 ACM Int. Conf. Information
and Knowledge Management (CIKM 1998),3–7 November 1998, Bethesda, Maryland,
USA, pp. 314–321.
-  H. Su, K. T. Claypool and E. A. Rundensteiner, Extending the object query language for
transparent metadata access, inProc. 9th Int. Workshop on Foundations of Models and
Languages for Data and Objects (FoMLaDO/DEMM 2000)(Springer-Verlag, Berlin,
Heidelberg, 2001), Selected Papers, Lecture Notes in Computer Science 2065, 18–21
September 2000, Dagstuhl Castle, Germany, pp. 68–84.
-  K. T. Claypool, C. Natarajan and E. A. Rundensteiner, Optimizing performance of
schema evolution sequences, inProc. Int. ECOOP'2000 Symp. Objects and Databases,
13 June 2000, Sophia-Antipolis, France, pp. 114–127.
-  S. Coulondre and T. Libourel, An integrated object-role oriented database model,Data
## Knowl. Eng.42(1) (2002) 113–141.
-  F. Grandi, Introducing an annotated bibliography on temporal and evolution aspects in
the world wide web,SIGMOD Record33(2) (2004) 84–86.
-  G. Guerrini and M. Mesiti, XML schema evolution and versioning: Current approaches
and future trends,Open and Novel Issues in XML Database Applications: Future
Directions and Advanced Technologies, ed. E. Pardede (Information Science Reference
—IGI Global, Hershey, PA, 2009), pp. 66–87.
-  D. Lee and W. W. Chu, Comparative analysis of six XML schema languages,SIGMOD
## Record29(3) (2000) 76–87.
-  W3C,Extensible Markup Language (XML) 1.0, 5th edn., W3C Recommendation, 26
November 2008, http://www.w3.org/TR/2008/REC-xml-20081126/ (accessed on 29
## March 2024).
-  W3C,XML Schema Part 0: Primer Second Edition, W3C Recommendation, 28 Octo-
ber,  http://www.w3.org/TR/2004/REC-xmlschema-0-20041028/  (accessed  on  29
## March 2024).
-  W. Martens, F. Neven, T. Schwentick and G. J. Bex, Expressiveness and complexity of
XML schema,ACM Trans. Database Syst.31(3) (2006) 770–813.
-  M. Murata, D. Lee, M. Mani and K. Kawaguchi, Taxonomy of XML schema
languages using formal language theory,ACM Trans. Internet Technol.5(4) (2005)
## 660–704.
-  H. Su, D. Kramer, L. Chen, K. T. Claypool and E. A. Rundensteiner, XEM: Managing
the evolution of XML documents, inProc. 11th Int. Workshop on Research Issues in
Data Engineering Document Management for Data Intensive Business and Scienti ̄c
Applications (RIDE-DM 2001),1–2 April 2001, Heidelberg, Germany, pp. 103–110.
-  E. Bertino, G. Guerrini, M. Mesiti and L. Tosetto, Evolving a set of DTDs according to a
dynamic set of XML documents, inProc. EDBT 2002 Workshops XMLDM, MDDE, and
Review on Schema Evolution in Databases
## 2430001-45
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

YRWS(Springer, 2002), Revised Papers, Lecture Notes in Computer Science 2490,
24–28 March 2002, Prague, Czech Republic, pp. 45–66.
-  S. V. Coox, Axiomatization of the evolution of XML database schema,Programm.
## Comput. Softw.29(3) (2003) 1–7.
-  L. Al-Jadir and F. El-Moukaddem, Once upon a time a DTD evolved into another
DTD ..., inProc. 9th Int. Conf. Object Oriented Information Systems (OOIS 2003),2–5
September 2003, Geneva, Switzerland, pp. 3–17.
-  B. V. N. Prashant and P. S. Kumar, Managing XML data with evolving schema, in
Proc. 13th Int. Conf. Management of Data (COMAD'2006),14–16 December 2006,
Delhi, India, pp. 174–177.
-  W3C,XSLTransformations(XSLT)Version2.0.W3Crecommendation,23January 2007,
http://www.w3.org/TR/2007/REC-xslt20-20070123/ (accessed on 29 March 2024).
-  B. Bouchou, D. Duarte, M. Halfeld Ferrari Alves, D. Laurent and M. A. Musicante,
Schema evolution for XML: A consistency-preserving approach, inProc. 29th Int. Symp.
Mathematical Foundations of Computer Science (MFCS 2004),22–27 August 2004,
Prague, Czech Republic, pp. 876–888.
-  B. Bouchou and D. Duarte, Assisting XML schema evolution that preserves validity, in
Proc. 22nd Brazilian Symp. Databases (SBBD 2007),15–19 October 2007, João Pessoa,
Paraíba, Brasil, pp. 270–284.
-  J. Amavi, J. Chabin, M. H. Ferrari and P. R
## 
ety, A ToolBox for conservative XML
schema evolution and document adaptation, inProc. 25th Int. Conf. Database and
Expert Systems Applications (DEXA 2014), Part I, 1–4 September 2014, Part I, Munich,
Germany, pp. 299–307.
-  G. Guerrini, M. Mesiti and D. Rossi, Impact of XML schema evolution on valid docu-
ments, inProc. 7th ACM Int. Workshop on Web Information and Data Management
(WIDM 2005), 5 November 2005, Bermen, Germany, pp. 39–44.
-  G. Guerrini and M. Mesiti, X-evolution: A comprehensive approach for XML schema
evolution, inProc. 3rd Int. DEXA Workshop on XML Data Management Tools and
Techniques (XANTEC'08),1–5 September 2008, Turin, Italy, pp. 251–255.
-  F. Cavalieri, EXup: An engine for the evolution of XML schemas and associated
documents, inProc. 2010 EDBT/ICDT Workshops (Updates in XML),22–26 March
2010, Lausanne, Switzerland, 10 pages.
-  F. Cavalieri, G. Guerrini and M. Mesiti, Updating XML schemas and associated
documents through EXup, inProc. 27th Int. Conf. Data Engineering (ICDE 2011),
11–16 April 2011, Hannover, Germany, pp. 1320–1323.
-  W3C,XQuery Update Facility 1.0. W3C recommendation, 17 March, http://www.w3.
org/TR/2011/REC-xquery-update-10-20110317/ (accessed on 29 March 2024).
-  F. Cavalieri, G. Guerrini, M. Mesiti and B. Oliboni, On the reduction of sequences of
XML document and schema update operations, inProc. 1st Int. ICDE Workshop on
Managing Data Throughout its Lifecycle (DaLi 2011),11–16 April 2011, Hannover,
Germany, pp. 77–86.
-  M. Klettke, Conceptual XML schema evolution—the CoDEX approach for design and
redesign, inWorkshop Proc. Datenbanksysteme in Business, Technologie und Web
(BTW 2007),5–9 March 2007, Aachen, Germany, pp. 53–63.
## 99.  T. N
## €
osinger, M. Klettke and A. Heuer, A conceptual model for the XML schema evo-
lution, inProc. 25th GI-Workshop on Foundations of Databases (Grundlagen von
Datenbanken 2013),28–31 May 2013, Ilmenau, Germany, pp. 28–33.
## 100.  T. N
## €
osinger, M. Klettke and A. Heuer, XML schema transformations—The ELaX
approach, inProc. 24th Int. Conf. Database and Expert Systems Applications (DEXA
2013), Part I, 26–30 August 2013, Prague, Czech Republic, pp. 293–302.
## Z. Brahmia, F. Grandi & B. Oliboni
## 2430001-46
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

## 101.  T. N
## €
osinger, M. Klettke and A. Heuer, Optimization of sequences of XML schema
modi ̄cations—the ROfEL approach, inProc. 26th GI-Workshop on Foundations of
Databases (Grundlagen von Datenbanken 2014),21–24 October 2014, Bozen-Bolzano,
Italy, pp. 11–16.
-  M. Nečaský,J.Klímek and I. Mlýnkov
## 
a, Evolution and change management of XML-
based systems,J. Syst. Softw.85(3) (2012) 683–707.
-  J. Klímek, J. Malý,I.Mlýnkov
## 
aand M. Nečaský, eXolutio: Tool for XML schema and
data management, inProc. 12th Annual Int. Workshop on DAtabases, TExts, Speci ̄-
cations and Objects (DATESO 2012),18–20 April 2012, Zernov, Rovensko pod Tros-
kami, Czech Republic, pp. 69–80.
-  J. Miller and J. Mukerji,MDA Guide Version 1.0.1. (Object Management Group, 2003).
-  J. Klímek, J. Malý,M.Nečaskýand I. Holubov
## 
a, eXolutio: Methodology for design
and evolution of XML schemas using conceptual modeling,Inf. (Lithuanian Acad. Sci.)
## 26(3) (2015) 453–472.
## 106.  E. Domínguez, J. Lloret, B. P
## 
erez,
## 
A. Rodríguez, A. L. Rubio and M. A. Zapata, Evo-
lution of XML Schemas and documents from stereotyped UML class models: A traceable
approach,Inf. Softw. Technol.53(1) (2011) 34–50.
-  OMG,Uni ̄ed Modeling Language (UML) 2.4.1. OMG Speci ̄cation, August 2011,
http://www.omg.org/spec/UML/2.4.1/ (accessed on 29 March 2024).
-  I. Galvao and A. Goknil, Survey of traceability approaches in model-driven engineering,
in
Proc. 11th IEEE Int. Enterprise Distributed Object Computing Conf. (EDOC 2007),
15–19 October 2007, Annapolis, Maryland, USA, pp. 313–324.
-  M. Kwietniewski, J. Gryz, S. Hazlewood and P. Van Run, Transforming XML docu-
ments as schemas evolve,Proc. VLDB Endow. (PVLDB)3(2) (2010) 1577–1580.
-  Z. Brahmia, F. Grandi and R. Bouaziz, Normalization of XML schema de ̄nitions, in
Proc. ACM—7th Int. Conf. Software Engineering and New Technologies (ACM-
ICSENT'2018),26–28 December 2018, Hammamet, Tunisia, Article No. 2, doi: 10.1145/
## 3330089.3330097.
-  Z. Brahmia, F. Grandi and R. Bouaziz, Conversion of XML schema design styles with
StyleVolution,Int. J. Web Inf. Syst.16(1) (2020) 23–64.
## 112.  P. Genev
## 
es, N. Layaïda and V. Quint, Impact of XML schema evolution,ACM Trans.
## Internet Technol.11(1) (2011) 4.
-  F. Picalausa, F. Servais and E. Zim
## 
anyi, XEvolve: An XML schema evolution frame-
work, inProc. 2011 ACM Symp. Applied Computing (SAC 2011),21–24 March 2011,
Taichung, Taiwan, pp. 1645–1650.
-  J. Clark and M. Makoto,RELAX NG Speci ̄cation. The Organization for the Ad-
vancement of Structured Information Standards (OASIS), 3 December 2001, https://
www.oasis-open.org/committees/relax-ng/spec.html (accessed on 29 March 2024).
-  R.AlurandP.Madhusudan,Visiblypushdownlanguages,inProc.36thAnnualACMSymp.
Theory of Computing (STOC 2004),13–15 June 2004, Chicago, IL, USA, pp. 202–211.
-  G. Guerrini, M. Mesiti and D. Sorrenti, XML schema evolution: Incremental validation
and e±cient document adaptation, inProc. 5th Int. XML Database Symp. (XSym 2007),
23–24 September, Vienna, Austria, pp. 92–106.
-  K. Hasegawa, K. Ikeda and N. Suzuki, An algorithm for transforming XPath expressions
according to schema evolution, inProc. Int. Workshop on Document Changes: Model-
ing, Detection, Storage and Visualization (DChanges 2013), paper 4, 10 September 2013,
## Florence, Italy.
-  W3C,XML Path Language (XPath)Version 1.0. W3C Recommendation, 16 November
1999, http://www.w3.org/TR/1999/REC-xpath-19991116/ (accessed on 29 March
## 2024).
Review on Schema Evolution in Databases
## 2430001-47
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

-  F. Wang and C. Zaniolo, An XML-based approach to publishing and querying the
history of databases,World Wide Web: Web Inf. Syst. Eng.8(3) (2005) 233–259.
-  A. Baqasah and E. Pardede, Managing schema evolution in hybrid XML-relational
database systems, inProc. 24th IEEE Int. Conf. Advanced Information Networking and
Applications Workshops (WAINA 2010),20–23 April 2010, Perth, Australia, pp. 455–
## 460.
-  A. Lo, T.Özyer, R. Tahboob, K. Kianmehr, J. Jida and R. Alhajj, XML materialized
views and schema evolution in VIREX,Inf. Sci.180(24) (2010) 4940–4957.
-  D. Quass and J. Widom, On-line warehouse view maintenance, inProc. 1997 ACM
SIGMOD Int. Conf. Management of Data (SIGMOD 1997),13–15 May 1997, Tucson,
Arizona, USA, pp. 393–404.
## 123.  J. F. Terwilliger, R. Fern
## 
andez-Moctezuma, L. M. L. Delcambre and D. Maier, Support
for schema evolution in data stream management systems,J. Univ. Comput. Sci.16(20)
## (2010) 3073–3101.
-  I. Neamtiu, M. W. Hicks, G. Stoyle and M. Oriol, Practical dynamic software updating for
C, inProc. ACM SIGPLAN 2006 Conf. Programming Language Design and Implemen-
tation (PLDI 2006), Tucson, Arizona, USA, Ottawa, Ontario, Canada, pp. 72–83.
-  K. Makris. and R. A. Bazzi, Immediate multi-threaded dynamic software updates using
stack reconstruction, inProc. 2009 USENIX Annual Technical Conf. (USINEX'09),14–
19 June 2009, San Diego, CA, USA,https://www.usenix.org/legacy/events/usenix09/
tech/full
papers/makris/makris.pdf(accessed on 29 March 2024).
-  S. Subramanian, M. W. Hicks and K. S. McKinley, Dynamic software updates: A VM-
centric approach, inProc. 2009 ACM SIGPLAN Conf. on Programming Language
Design and Implementation (PLDI 2009),15–21 June 2009, Dublin, Ireland, pp. 1–12.
-  S. Wu and I. Neamtiu, Schema evolution analysis for embedded databases, inProc. 3rd
ICDE Workshop on Hot Topics in Software Upgrades (HotSWUp 2011),11–16 April
2011, Hannover, Germany, pp. 151–156.
-  Z. Liu, B. He, H. I. Hsiao and Y. Chen, E±cient and scalable data evolution with column
oriented databases, inProc. 14th Int. Conf. Extending Database Technology (EDBT
2011),21–24 March, Uppsala, Sweden, pp. 105–116.
-  S. Scherzinger, M. Klettke and U. St
## €
orl, Managing schema evolution in NoSQL data
stores, inProc. 14th Int. Symp. Database Programming Languages (DBPL 2013),30
August 2013, Riva del Garda, Trento, Italy,http://arxiv.org/pdf/1308.0514v1.pdf
(accessed on 29 March 2024).
-  R. Cattell, Scalable SQL and NoSQL data stores,ACM SIGMOD Record39(4) (2010)
## 12–27.
-  J. Pokorný, NoSQL databases: A step to database scalability in web environment,Int. J.
## Web Inf. Syst.9(1) (2013) 69–82.
-  S. Tiwari,Professional NoSQL(John Wiley & Sons, Indianapolis, Indiana, USA, 2011).
-  S. Scherzinger, M. Klettke and U. St
## €
orl, Cleager: Eager schema evolution in NoSQL
document stores, inProc. 16th Conf. Database Systems for Business, Technology, and
Web (BTW 2015), Lecture Notes in Informatics, Vol. P-241, 2–6 March 2015, Hamburg,
Germany, pp. 659–662.
-  MongoDB [n.d.], https://www.mongodb.org/ (accessed on 29 March 2024).
-  Google Cloud Datastore [n.d.], https://cloud.google.com/datastore/docs/concepts/
overview (accessed on 29 March 2024).
-  D. Sanderson,Programming Google App Engine, 2nd edn. (O'Reilly Media, CA, USA,
## 2012).
## Z. Brahmia, F. Grandi & B. Oliboni
## 2430001-48
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

-  J. Dean and S. Ghemawat, MapReduce: Simpli ̄ed data processing on large clusters, in
Proc. 6th Symp. Operating System Design and Implementation (OSDI 2004),6–8 De-
cember 2004, San Francisco, California, USA, pp. 137–150.
-  Google Cloud Platform [n.d.], https://cloud.google.com/ (accessed on 29 March 2024).
## 139.  U. St
## €
orl, T. Hauf, M. Klettke and S. Scherzinger, Schemaless NoSQL data stores—
object-NoSQL mappers to the rescue? inProc. 16th Conf. Database Systems for Busi-
ness, Technology, and Web (BTW 2015), Lecture Notes in Informatics, Vol. P-241, 2–6
March 2015, Hamburg, Germany, pp. 579–599.
-  Hibernate OGM Reference Guide 4.2.0 [n.d.], http://docs.jboss.org/hibernate/ogm/
4.2/reference/en-US/pdf/hibernate
ogmreference.pdf (accessed on 29 March 2024).
-  Kundera Wiki [n.d.], https://github.com/Impetus/Kundera/wiki (accessed on 29
## March 2024).
-  DataNucleus, DataNucleus AccessPlatform 4.1 documentation: Datastore feature sup-
port,  2017,  https://www.datanucleus.org/products/accessplatform
## 41/datastores/
datastore
features.html (accessed on 29 March 2024).
-  EclipseLink, Understanding EclipseLink 2.6, 2014, http://www.eclipse.org/eclipselink/
documentation/2.6/eclipselink
otlcg.pdf (accessed on 29 March 2024).
-  Morphia Wiki [n.d.], https://github.com/mongodb/morphia/wiki (accessed on 29
## March 2024).
-  S. Scherzinger, T. Cerqueus and E. Cunha de Almeida, ControVol: A framework for
controlled schema evolution in NoSQL application development, inProc. 31st IEEE Int.
Conf. Data Engineering (ICDE 2015),13–17 April 2015, Seoul, South Korea, pp. 1464–
## 1467.
-  M. P. Atkinson and O. P. Buneman, Types and persistence in database programming
languages,ACM Comput. Surv.19(2) (1987) 105–170.
-  T. Cerqueus, E. Cunha de Almeida and S. Scherzinger, Safely managing data variety in
big data software development, inProc. 1st IEEE/ACM Int. Workshop on Big Data
Software Engineering (BIGDSE 2015), 23 May 2015, Florence, Italy, pp. 4–10.
-  Objectify [n.d.], https://github.com/objectify/objectify (accessed on 29 March 2024).
-  T. Cerqueus, E. Cunha de Almeida and S. Scherzinger, ControVol: Let yesterday's data
catch up with today's application code, inProc. 24th Int. Conf. World Wide Web
Companion (WWW 2015),18–22 May 2015, Florence, Italy, Companion Volume,
pp. 15–16.
-  K. Saur, T. Dumitraşand M. W. Hicks, Evolving NoSQL databases without downtime,
inProc. 32nd IEEE Int. Conf. Software Maintenance and Evolution (ICSME 2016),2–7
October 2016, Raleigh, North Carolina, USA, pp. 166–176.
-  J. Han, E. Haihong, G. Le and J. Du, Survey on NoSQL database, inProc. 6th Int. Conf.
Pervasive Computing and Applications (ICPCA 2011),26–28 October 2011, Port Eli-
zabeth, South Africa, pp. 363–366.
-  Redis [n.d.], http://redis.io/ (accessed on 29 March 2024).
-  Ecma International,The JSON Data Interchange Format. Ecma Standard ECMA-404,
October   2013,   http://www.ecma-international.org/publications/ ̄les/ECMA-ST/
ECMA-404.pdf (accessed on 29 March 2024).
-  Introducing JSON [n.d.], https://www.json.org/json-en.html (accessed on 29 March
## 2024).
-  S. Scherzinger, S. Sombach, K. Wiech, M. Klettke and U. St
## €
orl, Datalution: A tool for
continuous schema evolution in NoSQL-backed web applications, inProc. 2nd Int.
Workshop on Quality-Aware DevOps (QUDOS@ISSTA 2016), 21 July 2015, Saar-
brücken, Germany, pp. 38–39.
Review on Schema Evolution in Databases
## 2430001-49
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

## 156.  M. Klettke, U. St
## €
orl, M. Shenavai and S. Scherzinger, NoSQL schema evolution and big
data migration at scale, inProc. 2016 IEEE Int. Conf. Big Data (BigData 2016),5–8
December 2016, Washington DC, USA, pp. 2764–2774.
## 157.  U. St
## €
orl, D. Müller, M. Klettke and S. Scherzinger, Enabling e±cient agile software
development of NoSQL-backed applications, inProc. 17th Conf. Database Systems for
Business, Technology, and Web (BTW 2017),6–10 March 2017, University of Stuttgart,
Germany, pp. 611–614.
-  F. Haubold, J. Schildgren, S. Scherzinger and S. Deßloch, ControVol Flex: Flexible
schema evolution for NoSQL application development, inProc. 17th Conf. Database
Systems for Business, Technology, and Web (BTW 2017),6–10 March 2017, University
of Stuttgart, Germany, pp. 601–604.
-  A. Bonifati, P. Furniss, A. Green, R. Harmer, E. Oshurko and H. Voigt, Schema vali-
dation and evolution for graph databases, inProc. 38th Int. Conf. Conceptual Modeling
(ER 2019),4–7 November 2019, Salvador, Brazil, pp. 448–456.
-  N. Francis, A. Green, P. Guagliardo, L. Libkin, T. Lindaaker, V. Marsault, S. Planti-
kow, M. Rydberg, P. Selmer and Taylor, Cypher: An evolving query language for
property graphs, inProc. 2018 Int. Conf. Management of Data (SIGMOD'2018),10–15
June 2018, Houston, TX, USA, pp. 1433–1445.
-  A. Corradini, T. Heindel, F. Hermann and B. K
## €
onig, Sesqui-Pushout rewriting, inProc.
3rd Int. Conf. Graph Transformations (ICGT 2006), Lecture Notes in Computer Sci-
ence, Vol. 4178 (Springer, Berlin, 2006), 17–23 September 2006, Natal, Rio Grande do
Norte, Brazil, pp. 30–45.
## 162.  A. Hillenbrand, U. St
## €
orl, M. Levchenko, S. Nabiyev and M. Klettke, Towards self-
adapting data migration in the context of schema evolution in NoSQL databases, in
Proc. 2020 IEEE 36th Int. Conf. Data Engineering Workshops (ICDEW 2020),20–24
April 2020, Dallas, TX, USA, pp. 133–138.
-  C. Türker, Schema evolution in SQL-99 and commercial (object-) relational DBMS, in
Proc. 9th Int. Workshop on Foundations of Models and Languages for Data and Objects
(FoMLaDO/DEMM  2000),18–21  September  2001,  Dagstuhl  Castle,  Germany
(Springer-Verlag, Berlin, Heidelberg, 2001), Selected Papers, Lecture Notes in Com-
puter Science 2065, pp. 1–32.
-  K. Kulkarni and J. E. Michels, Temporal features in SQL:2011,SIGMOD Record41(3)
## (2012), 34–43.
-  F. Zemke, What's new in SQL: 2011,
SIGMOD Record41(1) (2012) 67–73.
-  J. E. Michels, K. Hare, K. G. Kulkarni, C. Zuzarte, Z. H. Liu, B. C. Hammerschmidt and
F. Zemke, The new and improved SQL: 2016 Standard,SIGMOD Record47(2) (2018)
## 51–60.
-  D. Colazzo, G. Guerrini, M. Mesiti, B. Oliboni and E. Waller, Document and schema
XML updates,Advanced Applications and Structures in XML Processing: Label Stream,
Semantics Utilization and Data Query Technologies, eds. C. Li and T. W. Ling (Infor-
mation Science Reference, IGI Global, Hershey, PA, USA, 2010), pp. 361–384.
-  DB2, Database administration and change management solutions, inDB2 Table Editor
Overview of IBM DB2 Table Editor for z/OS User's Guide, 6th edn. (Rocket Software,
2016), ftp://ftp.www.ibm.com/software/data/db2/zos/family/tools/pdf/etiugd45.pdf
(accessed on 29 March 2024).
-  Oracle,  Oracle  Change  Management  Pack,  2024,  https://docs.oracle.com/cd/
## B28359
01/license.111/b28287/options.htm#DBLIC159 (accessed on 29 March 2024).
-  MySQL, MySQL Workbench—Change Management, 2024, http://www.mysql.com/
products/workbench/design/ (accessed on 29 March 2024).
## Z. Brahmia, F. Grandi & B. Oliboni
## 2430001-50
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

-  SwisSQL, SwisSQL DBChangeManager, 2012, http://www.swissql.com/products/da-
tabase-compare-synchronize-tool/index.html (accessed on 29 March 2024).
-  Idera, Idera SQL Change, https://www.idera.com/ (accessed on 29 March 2024).
-  Embarcadero, Embarcadero DB Change Manager, 2024, https://www.embarcadero.
com/fr/db-change-manager (accessed on 29 March 2024).
-  Red Gate, Red Gate SQL Compare, http://www.red-gate.com/products/sql-develop-
ment/sql-compare/ (accessed on 29 March 2024).
-  DTM soft, DTM Database Tools, 2024, http://www.sqledit.com/index.html (accessed
on 29 March 2024).
-  Liquibase, Liquibase, 2024, http://www.liquibase.org/ (accessed on 29 March 2024).
-  S. Faisal and M. Sarwar, Temporal and multi-versioned XML documents: A survey,Inf.
## Process. Manag.50(1) (2014) 113–131.
-  Basho Technologies, Riak, 2024, http://docs.riak.com/riak/latest/ (accessed on 29
## March 2024).
-  M. Brown,Developing with Couchbase Server(O'Reilly Media, CA, USA, 2013).
-  F. Chang, J. Dean, S. Ghemawat, W. C. Hsieh, D. A. Wallach, M. Burrows, T. Chandra,
A. Fikes and R. E. Gruber, Bigtable: A distributed storage system for structured data,
ACM Trans. Comput. Syst.26(2) (2008) Article 4.
-  Apache, Apache HBase, 2024, http://hbase.apache.org/ (accessed on 29 March 2024).
-  L. George,HBase: The De ̄nitive Guide(O'Reilly Media, CA, USA, 2011).
-  Google, App Engine Datastore, 2024, https://cloud.google.com/appengine/docs/stan-
dard/java/datastore/ (accessed on 29 March 2024).
-  Apache, Apache Cassandra, 2024, http://cassandra.apache.org/ (accessed on 29 March
## 2024).
-  JSON Schema, The home of JSON schema language, 2024, http://json-schema.org/
(accessed on 29 March 2024).
## 186.  M. Klettke, U. St
## €
orl and S. Scherzinger, Schema extraction and structural outlier de-
tection for JSON-based NoSQL data stores, inProc. 16th Conf. Database Systems for
Business, Technology, and Web (BTW 2015), Lecture Notes in Informatics, Vol. P-241,
2–6 March 2015, Hamburg, Germany, pp. 425–444.
-  C. Zaniolo, Database relations with null values,J. Comput. Syst. Sci.28(1) (1984)
## 142–166.
-  K. Chodorow,MongoDB: The De ̄nitive Guide(O'Reilly Media, CA, USA, 2013).
-  S. Lightstone,Making it Big in Software(Prentice Hall, New Jersey, USA, 2010).
-  S. Bhattacherjee, G. Liao, M. Hicks and D. J. Abadi, BullFrog: Online schema evolution
via lazy evaluation, inProc. 2021 Int. Conf. Management of Data (SIGMOD'2021),
20–25 June 2021, Virtual Event, China, pp. 194–206.
## 191.  U. St
## €
orl and M. Klettke, Darwin: A data platform for NoSQL schema evolution man-
agement and data migration, inWorkshop Proc. EDBT/ICDT 2022 Joint Conf.,29
March–1 April 2022, Edinburgh, UK,http://ceur-ws.org/Vol-3135/dataplat
short3.pdf
(accessed on 29 March 2024).
## 192.  A. Hillenbrand, M. Levchenko, U. St
## €
orl, S. Scherzinger and M. Klettke, MigCast:
Putting a price tag on data model evolution in NoSQL data stores, inProc. 2019 Int.
Conf. Management of Data (SIGMOD'2019), Amsterdam, The Netherlands, 30 June - 5
July, 2019, pp. 1925–1928.
-  A. Hillenbrand, S. Scherzinger and U. St
## €
orl, Remaining in control of the impact of
schema evolution in NoSQL databases, inProc. 40th Int. Conf. Conceptual Modeling
(ER'2021), Virtual Event (Springer, Cham, 2021), 18–21 October 2021, pp. 149–159.
Review on Schema Evolution in Databases
## 2430001-51
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

## 194.  M. L. M
## €
oller, M. Klettke and U. St
## €
orl, EvoBench—a framework for benchmarking
schema evolution in NoSQL, inProc. 2020 IEEE Int. Conf. Big Data (Big Data), IEEE,
Atlanta, GA, USA, 10-13 December, 2020, pp. 1974–1984.
## 195.  A. Conrad, M. L. M
## €
oller, T. Kreiter, J. C. Mair, M. Klettke and U. St
## €
orl, EvoBench:
Benchmarking schema evolution in NoSQL, inTechnology Conf. Performance Evalu-
ation and Benchmarking(Springer, Cham, 2021), pp. 33–49.
## 196.  A. Hillenbrand, U. St
## €
orl, S. Nabiyev and M. Klettke, Self-adapting data migration in
the context of schema evolution in NoSQL databases,Distrib. Parallel Dat.40(1)
## (2022) 5–25.
-  A. H. Chillón, D. S. Ruiz and J. G. Molina, Towards a taxonomy of schema changes for
NoSQL databases: The orion language, inProc. 40th Int. Conf. Conceptual Modeling
(ER'2021), Virtual Event, St. John's, NL, Canada, 18–21 October 2021, pp. 176–185.
-  C. J. F. Candel, D. S. Ruiz and J. J. García-Molina, A uni ̄ed metamodel for NoSQL and
relational databases,Inf. Syst.104(2022) 101898.
-  J. Fink, M. Gobert and A. Cleve, Adapting queries to database schema changes in
hybrid polystores, inProc. 2020 IEEE 20th Int. Working Conf. Source Code Analysis
and Manipulation (SCAM 2020), IEEE, Adelaide, SA, Australia, 28 September, 2020,
pp. 127–131.
-  M. T.Özsu and P. Valduriez, NoSQL, NewSQL, and polystores, inPrinciples of Dis-
tributed Database Systems(Springer, Cham, 2020), pp. 519–558.
-  D. Kolovos, F. Medhat, R. Paige, D. Di Ruscio, T. Van Der Storm, S. Scholze and A.
Zolotas, Domain-speci ̄c languages for the design, deployment and manipulation of
heterogeneous databases, in2019 IEEE/ACM 11th Int. Workshop on Modelling in Soft-
ware Engineering (MiSE), IEEE, Montreal, QC, Canada, 26–27 May, 2019, pp. 89–92.
## 202.  I. Holubov
## 
a, M. Vavrek and S. Scherzinger, Evolution management in multi-model
databases,DataKnowl. Eng.136(2021) 101932.
## 203.  M. Vavrek, I. Holubov
## 
aand S. Scherzinger, MM-evolver: A multi-model evolution
management tool, inProc. 22nd Int. Conf. Extending Database Technology (EDBT
2019), Vol. 19, Lisbon, Portugal, 26–29 March 2019, pp. 586
## –589,https://open-
proceedings.org/2019/conf/edbt/EDBT19
paper310.pdf(accessed on 29 March 2024).
-  P. Benats, L. Meurice, M. Gobert and A. Cleve, Query-based schema evolution
recommendations for hybrid polystores, inProc. 41st Int. Conf. Conceptual Modeling
(ER 2022), ER'2022 Forum and Symp., Virtual Event, Hyderabad, India, 17 October
2022,http://ceur-ws.org/Vol-3211/CR
122.pdf(accessed on 29 March 2024).
-  F. Basciani, J. Di Rocco, D. Di Ruscio, A. Pierantonio and L. Iovino, TyphonML: A
modeling environment to develop hybrid polystores, inProc. 23rd ACM/IEEE Int.
Conf. Model Driven Engineering Languages and Systems (MODELS'2020): Companion
Proc., Virtual Event, Canada, 18–23 October 2020, Article No. 2, pp. 1–5.
-  D. M. Sow, L. Lim, M. Wang and K. H. Kim, Persisting and querying biometric
event streams with hybrid relational-XML DBMS, inProc. 2007 Inaugural Int. Conf.
Distributed Event-Based Systems (DEBS 2007),20–22 June 2007, Toronto, Canada,
pp. 189–197.
-  J. Lu and I. Holubov
## 
a, Multi-model data management: What's new and what's next? in
Proc. 20th Int. Conf. Extending Database Technology (EDBT'2017),21–24 March 2017,
Venice, Italy, pp. 602–605.
-  J. Lu and I. Holubov
## 
a, Multi-model databases: A new journey to handle the variety of
data,ACM Comput. Surv. (CSUR)52(3) (2019) Article No. 55, 1–38.
-  T.  Tsunakawa,  Road  to  a  multi-model  database—making  PostgreSQL  the
most popular and versatile database,PG Conf. ASIA 2017,4–6 December 2017,
## Z. Brahmia, F. Grandi & B. Oliboni
## 2430001-52
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

Tokyo, Japan,https://www.pgconf.asia/EN/2017/day-1/#B2(accessed on 29 March
## 2024).
-  Q. Guo, C. Zhang, S. Zhang and J. Lu, Multi-model query languages: Taming the
variety of big data,Distrib. Parallel Dat.42(1) (2023) 31–71, doi: 10.1007/s10619-023-
## 07433-1.
-  P. Koupil, D. Crha and I. Holubov
## 
a, MM-quecat: A tool for uni ̄ed querying of multi-
model data, inProc. 26th Int. Conf. Extending Database Technology (EDBT'2023),
Greece, 28–31 March 2023, pp. 831–834.
## 212.  P. Koupil, J. B
## 
artík and I. Holubov
## 
a, MM-evocat: A tool for modelling and evolution
management of multi-model data, inProc. 31st ACM Int. Conf. Information &
Knowledge Management (CIKM'2022),17–21 October 2022, Atlanta, GA, USA,
pp. 4892–4896.
-  P. Koupil and I. Holubov
## 
a, A uni ̄ed representation and transformation of multi-model
data using category theory,J. Big Data9(1) (2022) 61.
## 214.  P. Su
## 
arez-Otero, M. J. Mior, M. J. Su
## 
arez-Cabal and J. Tuya, CoDEvo: Column family
database evolution using model transformations,J. Syst. Softw.203(2023) 111743.
## 215.  J. B
## 
ezivin, F. Büttner, M. Gogolla, F. Jouault, I. Kurtev and A. Lindow, Model
transformations? Transformation models! inProc. 9th Int. Conf. Model-Driven Engi-
neering Languages and Systems (MoDELS 2006), Lecture Notes in Computer Science,
Vol. 4199, 1–6 October 2006, Genova, Italy, pp. 440–453.
-  Z. H. Liu, J. Lu, D. Gawlick, H. Helskyaho, G. Pogossiants and Z. Wu, Multi-model
database management systems—a look forward, inProc. VLDB 2018 Workshops, Poly
and DMAH(Springer, 2019), Revised Selected Papers, Lecture Notes in Computer
Science 11470, 31 August 2018, Rio de Janeiro, Brazil, pp. 16–29.
## 217.  B. Kolev, R. Pau, O. Levchenko, P. Valduriez, R. Jim
## 
enez-Peris and J. Pereira,
Benchmarking polystores: The CloudMdsQL experience, inProc. 2016 IEEE Int. Conf.
Big Data (Big Data),5–8 December 2016, Washington DC, USA, pp. 2574–2579.
-  P. Koupil, M. Svoboda and I. Holubov
## 
a
, MM-cat: A tool for modeling and transfor-
mation of multi-model data using category theory, inProc. 2021 ACM/IEEE Int. Conf.
Model Driven Engineering Languages and Systems Companion (MODELS-C), IEEE,
2021, 10–15 October 2021, Fukuoka, Japan, pp. 635–639.
-  Z. Brahmia, F. Grandi, B. Oliboni and R. Bouaziz, Schema evolution in conventional
and emerging databases, inEncyclopedia of Information Science and Technology, 4th
edn., ed. M. Khosrow-Pour (IGI Global, Hershey, PA, USA, 2018), pp. 2043–2053.
-  Flyway [n.d.], https://°ywaydb.org/ (accessed on 29 March 2024).
-  QuantumDB  [n.d.],  https://github.com/quantumdb/quantumdb  (accessed  on  29
## March 2024).
-  A. H. Chillón, M. Klettke, D. S. Ruiz and J. G. Molina, A generic schema evolution
approach for NoSQL and relational databases,IEEE Trans. Knowl. Data Eng.(2024)
362774–2789, doi: 10.1109/TKDE.2024.3362273.
-  A. Stiemer, M. Vogt, H. Schuldt and U. St
## €
orl, PolyMigrate: Dynamic schema evolution
and data migration in a distributed polystore, inHeterogeneous Data Management,
Polystores, and Analytics for Healthcare: VLDB Workshops, Poly 2020 and DMAH
2020, Virtual Event, (Springer International Publishing, 2020), 31 August–4 September
2020, Revised Selected Papers 6, pp. 42–53.
-  M. Vogt, A. Stiemer and H. Schuldt, Polypheny-DB: Towards a distributed and self-
adaptive polystore, inProc. 2018 IEEE Int. Conf. Big Data (Big Data), Seattle, WA,
USA, 10–13 December 2018, pp. 3364–3373.
## 225.  I. Holubov
## 
a, M. Klettke and U. St
## €
orl, Evolution management of multi-model data:
(Position Paper), inHeterogeneous Data Management, Polystores, and Analytics for
Review on Schema Evolution in Databases
## 2430001-53
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.

Healthcare: VLDB 2019 Workshops, Poly and DMAH(Springer International Pub-
lishing, 2019), 30 August 2019, Revised Selected Papers 5, Los Angeles, CA, USA,
pp. 139–153.
-  J. Delplanque, A. Etien, N. Anquetil and O. Auverlot, Relational database schema
evolution: An industrial case study, inProc. 2018 IEEE Int. Conf. Software Mainte-
nance and Evolution (ICSME), IEEE, Madrid, Spain, 23–29 September 2018, pp. 635–
## 644.
-  D. Solodovnikova, Data warehouse evolution framework, inProc. Spring Young
Researcher's Colloquium on Database and Information Systems (SYRCoDIS'07),31
May–1 June 2007, Moscow, Russia, pp. 6–12.
-  S. Faisal, M. Sarwar, K. Shahzad, S. Sarwar, W. Ja®ry and M. M. Yousaf, Temporal
and evolving data warehouse design,Sci. Programm.2017(2017) Article 7392349,
doi: 10.1155/2017/7392349.
-  J. Eder and K. Wiggisser, Data warehouse maintenance, evolution and versioning,
Encyclopedia of Database Systems, 2nd edn., eds. L. Liu and M. T.Özsu (Springer US,
New York, NY, USA, 2018), pp. 2957–2960.
-  S. A. Errami, H. Hajji, K. A. El Kadi and H. Badir, Spatial big data architecture: From
data warehouses and data lakes to the Lakehouse,J. Parallel Distrib. Comput.
## 176(2023) 70–79.
## 231.  M. Klettke, H. Awolin, U. St
## €
orl, D. Müller and S. Scherzinger, Uncovering the evolution
history of data lakes, inProc. 2017 IEEE Int. Conf. Big Data (Big Data), Boston, MA,
USA, 11–14 December 2017, pp. 2462–2471.
-  R. L'Esteve, Schema evolution, inThe Azure Data Lakehouse Toolkit: Building and
Scaling Data Lakehouses on Azure with Delta Lake, Apache Spark, Databricks, Synapse
Analytics, and Snow°ake(Apress, Berkeley, CA, USA, 2022) pp. 235–243.
## Z. Brahmia, F. Grandi & B. Oliboni
## 2430001-54
Comp. Open 2024.02. Downloaded from www.worldscientific.com
by 2804:29b8:5207:4887:89f3:c8d7:e22a:ae40 on 09/07/26. Re-use and distribution is strictly not permitted, except for Open Access articles.