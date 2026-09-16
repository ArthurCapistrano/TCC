# Data Quality Assessment in large
Enterprises
A practical Evaluation
DIPLOMA THESIS
submitted in partial fulfillment of the requirements for the degree of
Diplom-Ingenieur
in
Software Engineering and Internet Computing
by
Christoph Doppelhammer, BSc
Registration Number 51824287
to the Faculty of Informatics
at the TU Wien
```
Advisor: MSc PhD Reka Marta Sabou
```
```
Assistance: Dr.techn. Mag. Fajar Juang Ekaputra
```
Vienna, 3rd January, 2023
Christoph Doppelhammer Reka Marta Sabou
Technische Universität Wien
A-1040 Wien Karlsplatz 13 Tel. +43-1-58801-0 www.tuwien.at
Data Quality Assessment in large
Enterprises
A practical Evaluation
DIPLOMARBEIT
zur Erlangung des akademischen Grades
Diplom-Ingenieur
im Rahmen des Studiums
Software Engineering and Internet Computing
eingereicht von
Christoph Doppelhammer, BSc
Matrikelnummer 51824287
an der Fakultät für Informatik
der Technischen Universität Wien
```
Betreuung: MSc PhD Reka Marta Sabou
```
```
Mitwirkung: Dr.techn. Mag. Fajar Juang Ekaputra
```
Wien, 3. Jänner 2023
Christoph Doppelhammer Reka Marta Sabou
Technische Universität Wien
A-1040 Wien Karlsplatz 13 Tel. +43-1-58801-0 www.tuwien.at
Erklärung zur Verfassung der
Arbeit
Christoph Doppelhammer, BSc
Hiermit erkläre ich, dass ich diese Arbeit selbständig verfasst habe, dass ich die verwen-
deten Quellen und Hilfsmittel vollständig angegeben habe und dass ich die Stellen der
Arbeit – einschließlich Tabellen, Karten und Abbildungen –, die anderen Werken oder
dem Internet im Wortlaut oder dem Sinn nach entnommen sind, auf jeden Fall unter
Angabe der Quelle als Entlehnung kenntlich gemacht habe.
Wien, 3. Jänner 2023
Christoph Doppelhammer
v
Danksagung
Zu Beginn möchte ich meiner Betreuerin Marta Sabou danken, welche es mir überhaupt
ermöglicht hat, diese Arbeit zu Schreiben und in Folge dessen auch mein Studium
erfolgreich zu beenden. Trotz der Kooperation mit einem Unternehmen, nahm sich
Marta meinem Thema an, obwohl dies öfters schon zu Problemen führte bei anderen
Dimplomarbeiten. Marta war immer sehr empathisch und verständnisvoll und half mir
bei jeder Gelegenheit.
Außerdem möchte ich Fajar Ekaputra danken, welcher mir neben Marta mit Rat und
Tat zur Seite stand und besonders in der Finalisierungsphase oft seine Zeit mir widmete.
Des Weiteren möchte ich Martin Hillinger danken, der bei dem Unternehmen arbeitete,
mit dem diese Diplomarbeit in Kooperation geschrieben wurde. Er begleitete mich von
Beginn an und unterstützte mich durchgehend. Durch ihn lernte ich, wie ein solches
Projekt gemanaged wird und nicht den Fokus und Antrieb auf halbem Weg verliert.
Eine weitere Person, ohne die ich diese Arbeit nicht abschließen hätte können, ist Lisa
Ehrlinger. Sie nahm sich Zeit für mehrere Video Calls, um meine Fragen zu ihrer For-
schungsarbeit und dem Thema Datenqualität zu beantworten. Ihre Hilfe war unabdingbar
in der Themenfindung und Konkretisierung meiner Ziele.
Abschließend möchte ich hier noch meiner Familie danken, welche mir ermöglicht hat,
zu Studieren und nach Wien zu ziehen. Am Ende möchte ich auch noch meiner Freun-
din danken, die mich durchgehend emotional unterstützt hat, während ich an dieser
Diplomarbeit gearbeitet habe.
vii
Acknowledgements
First, I want to thank my advisor Marta Sabou, who made it possible for me to write
this thesis in the first place. She was willing to take over my patronage and diploma
thesis, even though the thesis was written in cooperation with a company. Marta was
always very understanding and helpful if I needed something from her, even though the
thesis was written over a long time.
I also want to thank Fajar Ekaputra, who helped me as an assistant advisor during this
thesis’s writing and finalization phase.
Furthermore, I want to thank Martin Hillinger, my thesis supervisor at the company
I worked for. He provided a lot of feedback, ideas and, most importantly, advice on
managing a big project such as this thesis and how not to lose focus. He always was
available if I needed advice, and it did not matter what.
Another person who was detrimental to completing this thesis was Lisa Ehrlinger. She
was not only willing to answer questions about her work regarding data quality tools,
but more importantly, she made time for multiple calls. She helped me a lot with finding
and narrowing down concrete approaches to my thesis. Without her, I could not have
finished this thesis.
I also want to thank my family, which provided me with the financial support to live in
Vienna and study at the Technical University in Vienna. Finally, a big thank you goes
out to my girlfriend, who gave me a lot of emotional support while writing this thesis.
ix
Kurzfassung
Der Erfolg von Unternehmen ist in der heutzutage stark von Informationen abhängig.
Um so genauer, vollständiger und zuverlässiger diese Daten sind, desto besser können kri-
tische Entscheidungen getroffen werden. Typische Datenqualitätsprobleme wie veraltete,
unvollständige, oder fehlende Informationen sollten unbedingt vermieden werden. Solche
Probleme können den Betrieb von verschiedensten Unternehmensbereichen negativ beein-
flussen, wenn diesen nichts entgegen gesetzt wird. Mit Datenqualitätsmanagement können
solche Probleme von Daten eingegrenzt und idealerweise vermieden werden. Für große
Konzerne mit tausenden Angestellten können die selben Probleme noch viel schlimmere
Auswirkungen haben, da diese oft geographisch und organisatorisch in Sub-Unternehmen
oder -Organisationen aufgeteilt sind und pro Einheit solche Probleme auftreten können.
Datenqualität ist ein relevantes Forschungsthema seit der Einführung von digitalen
Informationen. Verschiedenste Methodologien wurden bereits entworfen um mit dem
Verwalten, Messen, Evaluieren und Verbessern solcher Informationen zu helfen. Diese
Datenqualitätsmethodologien wurden entworfen um verschiedene Aspekte abzudecken
und verwenden unterschiedliche Zugänge um Datenqualität zu gewährleisten. Manche
Methodologien wurden entworfen als universall Methode, um auf verschiedenste Bereiche
anwendbar zu sein. Andere sind für spezielle Anwendungsbereiche, wie zum Beispiel den
Medizinbereich, die öffentliche Verwaltung, oder Unternehmen in der Privatwirtschaft
entworfen worden.
Diese Diplomarbeit versucht die Lücke an Forschungsergebnissen in Bezug auf Datenqua-
litätsmethodologien mit dem Fokus auf große Unternehmen und Konzerne zu schließen.
Die folgenden beiden Forschungsfragen wurden in dieser Arbeit beantwortet: Erstens,
welche Datenqualitätsmethodologien können für den Anwendungsbereich von großen
Unternehmen und Konzernen empfohlen werden. Zweitens, welche Softwareapplikationen
sind aktuell am Markt verfügbar and können Unternehmen empfohlen werden um die
Messung und Evaluierung von Datenqualität zu erleichtern. Um diese Fragen zu beant-
worten wurde eine Anforderungserhebung durchgeführt, welche die Herausforderungen
im Bereich Datenqualität in Unternehmen untersucht hat. Diese wissenschaftliche Arbeit
hat sich hauptsächlich mit der Messung und Evaluierung von Datenqualität beschäftigt,
aber auch andere Aspekte wie zum Beispiel Verbesserung von Datensätzen wurden be-
rücksichtigt. Die resultierenden Anforderungen aus der Erhebung wurden als Basis für die
Evaluierung von den Datenqualitätsmethodologien verwendet. Diese Evaluierung führte
xi
zu einer Vergleichstabelle, wo alle Anforderungen pro Methodologie bewertet wurden, ob
diese erfüllt oder nicht erfüllt werden können. Die gleiche Evaluierungsmethodik wurde
auf die Softwareapplikationen für Datenqualitäts angewendet und es ergab sich daraus
eine weitere Vergleichstabelle.
Die Datenqualitätsmethodologie Data Quality In Cooperative Information Systems
```
(DaQuinCIS) ist die passendste Methodologie für große Unternehmen und Konzerne, weil
```
diese unter anderem konkrete Implementierungsempfehlungen bietet und die wichtigsten
Anforderungen erfüllt. Die passendsten Softwareapplikationen für große Unternehmen
```
sind Experian Aperture Data Studio (EADS) und Great Expectations (GX), weil diese
```
die meisten Anforderungen erfüllen. Die genauen Empfehlungen inklusive Begründungen
zu den Datenqualitätsmethodologien und Softwareapplikationen werden am Ende der
Diplomarbeit detailiert aufgelistet und erklärt.
Abstract
Data has become one of the most important driving factors for successful enterprises.
Companies with reliable, complete and detailed data on their business can make informed
decisions. Relying on sound data for decision-making is imperative and therefore the
following data quality problems need to be avoided: outdated, incomplete or, even worse,
completely missing data. These problems can accumulate over time if no data and data
quality management methods are in place. Large companies with hundreds or thousands
of employees can experience these problems entirely on another scale because, often, such
organisations can be regionally distributed and split up into multiple sub-organisations,
making managing data even more challenging.
Research in the area of data quality and how to manage data in business contexts
has started since data is stored digitally by companies. Different methodologies were
designed to help manage data, measure its quality, and improve data. These data quality
methodologies differ in their approaches and focus. Some try to be general-purpose
methodologies, while others focus on a specific application area, such as enterprises. Only
limited research regarding data quality methodologies, which apply to enterprise-specific
requirements, can be found that compares such methodologies and tries to recommend
them.
This diploma thesis aims to address this gap in the literature by investigating two research
```
questions: first, which data quality methodologies regarding enterprise requirements can
```
be recommended, and second, which software tools exist and can be recommended to
enterprises regarding their needs. To answer these questions, a requirement elicitation
process was executed in cooperation with a large enterprise, which resulted in requirements
regarding their challenges with data quality. The process of assessing data quality stands
in the foreground of this thesis, but other aspects, such as improving data were also
considered. The acquired requirements were checked against the capabilities of different
data quality methodologies and resulted in a comparison table of fulfilled, partially or
not fulfilled requirements per methodology. After assessing data quality methodologies,
the same comparison process was performed for data quality tools.
Based on the research done in this thesis, the data quality methodology Data Quality
```
In Cooperative Information Systems (DaQuinCIS) is the most appropriate one for
```
large enterprises because it includes concrete recommendations for implementations and
also covers the most important requirements. In terms of best-fitting tools, Experian
xiii
```
Aperture Data Studio (EADS) and Great Expectations (GX) fulfilled most of the defined
```
requirements. A detailed recommendation on best-fitting data quality methodologies and
tools is given at the end of this thesis.
Contents
Kurzfassung xi
Abstract xiii
Contents xv
1 Introduction 1
1.1 Aim of the Work . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 2
1.2 Challenges and Scope . . . . . . . . . . . . . . . . . . . . . . . . . . . 4
1.3 Methodology . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 5
1.4 Contributions . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 7
1.5 Structure of the Work . . . . . . . . . . . . . . . . . . . . . . . . . . . 7
2 State of the Art 9
2.1 Basics of Data Quality . . . . . . . . . . . . . . . . . . . . . . . . . . . 9
2.2 Cooperative Information Systems . . . . . . . . . . . . . . . . . . . . . 11
2.3 Data Quality Management . . . . . . . . . . . . . . . . . . . . . . . . . 12
2.4 Data Quality Dimensions and Metrics . . . . . . . . . . . . . . . . . . 15
2.5 Data Quality Methodologies applicable to Enterprises . . . . . . . . . 20
2.6 Data Quality Tools . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 44
3 Requirement Elicitation 49
3.1 Elicitation Process . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 49
3.2 Enterprise Requirements . . . . . . . . . . . . . . . . . . . . . . . . . . 50
3.3 Methodology Requirements . . . . . . . . . . . . . . . . . . . . . . . . 55
3.4 Tool Requirements . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 60
4 Assessment of Data Quality Methodologies 65
4.1 Enterprise and CIS Requirements . . . . . . . . . . . . . . . . . . . . . 65
4.2 Data Quality Assessment Requirements . . . . . . . . . . . . . . . . . 68
4.3 Data Quality Improvement Requirements . . . . . . . . . . . . . . . . 70
5 Assessment of Data Quality Tools 73
5.1 Data Management Requirements . . . . . . . . . . . . . . . . . . . . . 73
xv
5.2 Metrics Requirements . . . . . . . . . . . . . . . . . . . . . . . . . . . 76
5.3 Data Quality Requirements . . . . . . . . . . . . . . . . . . . . . . . . 77
5.4 Support and Usability Requirements . . . . . . . . . . . . . . . . . . . 79
6 Conclusions, Recommendations and Future Work 81
6.1 Conclusions . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 82
6.2 Methodology Recommendation . . . . . . . . . . . . . . . . . . . . . . 87
6.3 Tool Recommendation . . . . . . . . . . . . . . . . . . . . . . . . . . . 89
6.4 Summary and Future Work . . . . . . . . . . . . . . . . . . . . . . . . 90
List of Figures 91
List of Tables 93
Acronyms 95
Bibliography 97
CHAPTER 1
Introduction
Decision-makers and stakeholders in enterprises and large organisations require high-
quality data for making the correct business decisions. The efficiency of how well a
business process can be executed relies on well-organised and well-maintained data sets.
Incomplete, incorrect, redundant or missing information can negatively impact business
processes. Furthermore, the quality of data must be evaluated and assessed regularly
to ensure the ideal execution of business processes. This can be ensured with different
data processing approaches without requiring employees to perform this work manually.
```
Poor Data Quality (DQ) can mean that a lot of resources need to be spent additionally
```
to counter its negative effects, customer dissatisfaction, increased costs in general, and
lower employee job satisfaction. A positive effect of ensuring DQ is that employees can
fulfil more meaningful tasks without worrying about redundant data correction tasks
[85, 82, 46, 32].
Relying on manual identification and correcting faulty data elements increases the
```
probability of error occurrences. Variance in Data Quality (DQ) can result from manual
```
operations or automated erroneous data inputs. This kind of variance in DQ can be
measured and reduced by implementing DQ assessment operations, which control the
state of all data regularly [9, 71, 12].
Errors, which can reduce the overall quality of a company’s database, do not only occur in
single manually created data entries but can also result from wrong or incomplete relations
between data objects. Such inconsistencies and errors can accumulate if distributed over
multiple databases and even worse if different kinds of data sources are used [12].
Both, legacy and current data sets, can be a source of problems for large enterprises
due to their possibly decade-old history of data accumulation and missing awareness of
```
the importance of proper DQ management (see Section 2.3 for more details). Such data
```
objects are often distributed over multiple loosely-, or maybe not even, related databases.
1
1. Introduction
All these factors make it challenging to execute business processes as efficiently and
effectively [82, 65].
```
Departments (also self-managed sub-companies) of large enterprises can employ hundreds
```
or thousands of employees. Therefore these departments can be seen as organisations,
```
which are (partially) independent of other departments/organisations but need to work
```
together to achieve common goals. These organisations can include their individual data
infrastructure such as databases. Such databases can include various information, such
as employee, contract, finance and technical data. Without proper DQ management and
present awareness in this area, these data structures can potentially lead to redundancies
and inconsistencies across organisational borders over time. If, for example, multiple
organisations require data about the same employee to fulfil specific business processes,
this can lead to DQ problems if data is distributed over multiple databases.
```
As an example, to better illustrate such problems, let’s assume two departments (or organ-
```
```
isations) exist, which are Service and Finance, as seen in Figure 1.1. Both departments
```
are self-managed structures and maintain their own databases. To simplify this example,
Figure 1.1 only shows contract data with one specific data set including an address for
each organisation. Finance needs a combination of customer data, such as addresses,
and service contracts, to check if their customers pay their service contracts on time.
In contrast, Service is more focused on the practical aspects of these service contracts.
Their main goal is to fulfil all the required maintenance and service work on time, which
was agreed upon in the service contracts with the customer. Due to organisational and
historical reasons, both organisations store entities of the same customers and contracts.
```
Each contract object has an Identifier (ID) and an address field as seen in Figure 1.1.
```
The same contract ID is stored in both databases, but the stored addresses are different
```
(i.e. data inconsistency). The address of the contract element in Service is marked red
```
because it is an old address and not corresponding with the updated address in Finance,
highlighted green. If the contract address is not updated in time and no one becomes
aware of this problem, the next service technician will probably drive to the wrong
address and this can produce unnecessary costs and problems for all stakeholders.
This simple use case, shown in Figure 1.1, clarifies what can happen if no proper DQ
management is in place. Such problems can lead to unnecessary costs, time and resources
wasted and reduced customer satisfaction, but this is avoidable if specific DQ mechanics
are in place [82].
1.1 Aim of the Work
This thesis is written in cooperation with a big corporation whose identity must be
kept anonymous due to confidentiality considerations. This company owns hundreds
of thousands of data objects distributed over multiple databases worldwide. This vast
amount of distributed data leads to DQ concerns such as inconsistencies, redundancies,
incompleteness and missing links between equivalent data objects located in different data
sources. The company provided insight into its domain model and real-world use cases
2
1.1. Aim of the Work
Figure 1.1: Two departments, Service and Finance, which each own a data object relating
to a real-word entity named Contract. Both Contract objects are independent of each
other.
and used for this thesis to formulate problems for large enterprises. The term domain
model describes the data architecture, which includes databases, file storage systems,
big data storage, and how data is structured on an enterprise level. Stakeholders of
the company also provided internally consolidated requirements, which regard their
digitalisation needs and problems with DQ.
```
The aim of this thesis is to provide the company’s decision-makers with (i) an under-
```
```
standing of the topic DQ in general, (ii) which factors can cause poor Data Quality
```
```
(DQ), (iii) which scientific approaches are available to measure and improve DQ, and (iv)
```
which software solutions are available for their use cases. The focus of this thesis is also
```
on exploring Cooperative Information System (CIS), which describes big information
```
```
systems, distributed over multiple (partially) autonomous organisations which share data
```
with each other to reach their shared goals [ 69]. CIS are explained in more detail in
Section 2.2.
Therefore, the main research question of this thesis is: Which data quality assessment
methodologies are best applicable to large enterprises and their specific requirements, and
which DQ tools can be recommended? Specifically, the following problems are addressed:
RQ-I. What are relevant data quality requirements for large enterprises?
Before further research is done, it is essential to understand the specific requirements
large enterprises have to meet in terms of DQ. These requirements have been gathered
by decision-makers of the corporation and were consolidated beforehand. Additionally,
literature regarding CISs will be considered for a more diverse view of the typical
problems of big corporations or cooperating organisations. The acquired requirements
will be translated into “DQ methodology requirements” and “DQ tool requirements”.
3
1. Introduction
DQ methodologies can be compared and evaluated via this translation process based
on relevant requirements, see RQ-II. Additionally, DQ tools will be compared with the
translated “tool requirements” in the same way as methodologies, see RQ-III.
RQ-II. Which DQ methodologies are best suitable for large enterprises, especially in the
context of CIS?
First, a selection of methodologies must apply to general CIS and enterprise use cases
to answer this question. This general selection is made by checking if a methodology
supports distributed data sets and if it supports objective assessment methods. These
are essential aspects which must be fulfilled beforehand. After the first selection process,
all methodologies are described in detail, and their unique characteristics are highlighted.
Then, based on the results of RQ-I, these methodologies can be compared and evaluated
on how well they fit the use cases of CISs. This does not mean that a methodology must
explicitly support CIS, but only if it could be applied to the concept of it. As mentioned
before, this comparison will be made by using the previously acquired requirements
and applying them to all methodologies. After evaluating these methodologies, the two
best-fitting methodologies get recommended. This recommendation gives an idea of what
DQ methodologies are designed for in practice, where they show strengths or weaknesses,
and how well they are designed for a real-world application.
RQ-III. Which DQ tools can be recommended to decision makers?
As Ehrlinger et al. [ 35] showed, every available DQ tool is limited in a certain way, and
no methodology can be fully implemented with any desired tool. Since many open-source
and enterprise solutions are available for measuring, assessing and improving data, it
is crucial to give decision-makers a curated selection of tools. This thesis provides a
selection of fitting tools and compares them based on the defined “tool requirements”
from RQ-I. Decision-makers can look at this evaluation and decide which tools should be
evaluated in more detail.
1.2 Challenges and Scope
Many techniques are available to “assess [...] the quality of data”, as explained by Batini
et al. [ 12]. After researching current DQ methodologies, as seen in [ 12, 26], it is clear that
this application field is very complex. This complexity is primarily due to the diversity
in information and distributed data management. In the planning phase of this thesis,
first, the idea was to cover an in-depth overview of different DQ methodologies, which
best fit the domain model and context of CISs and provide a prototype implementation,
which can be used to apply one or more methodologies to a domain model. Quickly
it was apparent that this would go beyond the scope of a diploma thesis, and a few
scoping assumptions had to be made to make the thesis feasible. The assumption that
these two major tasks were too much for a diploma thesis was made because [ 33, 35, 26]
pointed out the complexity of implementing standard DQ methodologies in practice.
Many methodologies are theoretically applicable but lack concrete directions on how
4
1.3. Methodology
to implement them in practice. Methodologies often do not consider aspects such as
data ownership, audits, data creation, variance over time, data lifecycles and availability,
and technical aspects, such as analysing databases [ 33]. This leads to a lot of work
required by the persons implementing these methodologies in a real-world environment.
A prototype implementation with specific DQ metrics from different methodologies was
also considered. Still, because most enterprises base their DQ assessment on rules and
not metrics, this idea was also dismissed. Therefore, the decision was made to focus on
a thorough overview of appropriate methodologies and evaluate them in the context of
the company and CIS requirements. This diploma thesis aims to provide enterprises
with a starting point for decision-makers to further investigate commercial solutions by
highlighting essential aspects of assessing DQ, as well as the benefits and shortcomings
of standard approaches.
1.3 Methodology
The methodological approach of this thesis is described in this section.
Figure 1.2 visualizes the methodological approach of this thesis. Each research question
```
(RQ) is shown with the abbreviation RQ-x, where x stands for the number of RQ. The
```
yellow boxes represent research work done and the green boxes branch from these yellow
boxes, which show the results gathered from them. The RQ are dependent on each other
and done in the order RQ-1, RQ-2 and RQ-3.
Chapter 3 establishes requirements which are needed as a basis for assessing the DQ
methodologies and tools later in this thesis. During a requirement elicitation process
defined in Section 3.1, all relevant requirements of the cooperating company’s stakeholders
were determined. This requirement elicitation process was created for this thesis because
enterprise requirements were at the beginning of this thesis abstract and often needed to
be more concrete for scientific research. During the research process for this thesis, the
original requirements formulated by stakeholders were expanded and adapted based on new
findings and information regarding DQ in enterprises. The final enterprise requirements
```
were then converted into two requirement catalogues, one for methodologies (see Section
```
```
3.3) and one for tools (see Section 3.4). In total, three requirement catalogues were
```
defined, one for enterprise requirements in Table 3.1, one for methodology requirements
in Table 3.2 and one for tools requirements in Table 3.3. Detailed descriptions of each
requirement follow up each table.
These requirement catalogues are used for assessing the capabilities and limitations of
DQ methodologies and tools. The methodologies were assessed in Chapter 4. These
methodologies were described in more detail in Section 2.5. The DQ tools were assessed
in detail in Chapter 5, which were described beforehand in Section 2.6. Assessing both,
methodologies and tools, was done by checking each requirement for each methodology
and tool. Each requirement can either be fully, partially or not at all fulfilled. All
requirements are discussed in the assessment one after the other and why certain aspects
are more important in the assessment.
5
1. Introduction
Figure 1.2: Methodology overview of this thesis
6
1.4. Contributions
The discussion of all the acquired results is done in Chapter 6. In this chapter, the
previously formulated research questions are answered, and a recommendation is given
on which methodologies and tools can be of interest to large enterprises. The discussion
summarises all the knowledge acquired by comparing the methodologies and tools based
on the relevant requirements.
1.4 Contributions
Answering the research questions of this thesis provides the following contributions to the
current research area of DQ methodologies and tools focusing on enterprise applications:
• Collecting relevant requirements for enterprise stakeholders and creating requirement
catalogues for DQ methodologies and tools.
• Defining a selection of matching DQ methodologies for large enterprises and assessing
their capabilities.
• Assessing DQ tools for a better understanding of their capabilities concerning
enterprise application areas.
1.5 Structure of the Work
The structure of this diploma thesis is as follows:
Chapter 2 introduces all the relevant concepts and literature required for the rest of this
```
thesis. It includes (i) the definition of the most essential terms and concepts in DQ, (ii)
```
```
a detailed description of DQ methodologies, and (iii) short descriptions of all DQ tools
```
assessed in this thesis.
In Chapter 3 the requirements of enterprise stakeholders in regards to DQ methodologies
```
and tools are explained in detail. This includes (i) the enterprise requirements, (ii)
```
methodology requirements, which are derived from the enterprise requirements, and
```
(iii) tool requirements, which are also derived from the enterprise requirements. All
```
requirements include a detailed description.
The assessment of all the introduced DQ methodologies is performed in Chapter 4.
Assessment is done by validating all methodology requirements.
Similarly, the assessment of the DQ tools, which were introduced earlier, is covered in
Chapter 5. The evaluation process is executed based on the tool requirements catalogue.
The results are discussed and put into perspective in Chapter 6. A recommendation for
DQ methodologies and tools fit for large enterprises is also given in this chapter. An
outcast on possible future research topics is given at the end of the thesis.
7
CHAPTER 2
State of the Art
The following chapter presents all relevant information for understanding DQ in general,
DQ assessment and improvement, and which DQ methodologies and tools were assessed.
Section 2.1 introduces the basics of DQ, causes for bad DQ, and how data can be
categorized.
```
Section 2.2 presents the concept of Cooperative Information System (CIS), which defines
```
information systems in cooperations and large organisations as parties working together
to achieve a common goal. The concept of CIS is used in this thesis as a way to verify if
DQ methodologies can be used in an enterprise environment.
Section 2.3 covers important aspects such as making sense of data, measuring, analysing,
improving data sets and monitoring changes over time. These activities are the basis for
the rest of the thesis and are verified for each assessed methodology.
Section 2.4 introduces all relevant DQ dimensions and metrics found in the literature.
These dimensions and metrics are the most cited and used in DQ assessment research.
The evaluation of the methodologies covers how many and which of these dimensions
and metrics are supported.
Section 2.5 introduces all assessed DQ methodologies in this thesis. Each methodology
is described in varying detail, which depends on the information available in research
papers.
Section 2.6 gives an insight into the assessed DQ tools in this thesis and why they were
chosen.
2.1 Basics of Data Quality
Data Quality is not universally defined, but one of the most accepted definitions is the
“fitness for use” [ 12, 90, 100 , 97] principle. All these definitions argue that context is
9
2. State of the Art
essential to understand the acquired data well [ 58, 97]. Otherwise, an evaluation and
analysis of the state of stored data with the correct context are possible. Even though
most definitions talk about the same general aspects of “fitness for use”, they differ in
certain viewpoints. Research from Strong et al. [ 100 ] and De Feo [ 29] focus more on the
customer-centric views, [ 57] defines DQ as characteristics which should fulfil requirements
and expectations.
Data generally refers to any “information, especially facts or numbers, collected to be
examined and considered and used to help decision-making” [ 20]. In informatics, it can
be seen as a definition and description of real-world objects used to store, transmit and
enhance software processes [ 64]. This definition shows the importance of excellent and
reliable data for businesses because they are centrepieces in all decisions and business
processes.
2.1.1 Causes of Poor Data Quality
Apel et al. [ 3] points out, that recognizing and understanding causes for poor DQ
are critical factors for proper DQ management of companies. As surveys show, higher
awareness for quality in general leads often to more willingness to deal with DQ. Open
discussions about DQ “lead in most cases to fewer DQ issues in the entire organisation”
[3]. The following typical causes for DQ problems can be identified [3, 33]:
• Data collection: A significant source of DQ errors can be the process of collecting
data. Manual data collection is especially error-prone, i.e. badly designed forms or
lack of attention while entering data. Automated collection processes can also be
problematic if the implementation is not well thought through or devices are not
```
operating as they should (i.e. sensor misbehaviour).
```
```
• Processes: Unclear or undefined (business) processes regarding data management,
```
i.e. data storage, collection or analysis, can lead to poor DQ.
• Data architecture: Data or technological infrastructure supports processes working
with data and is essential for achieving high DQ. This architecture can be composed
```
of different DB systems or Extract Transform Load (ETL) data flows between
```
different sources and analytical operations. ETL is a process of “combining data
from multiple data sources into a single, consistent data storage system” [51].
• Uniform definitions: Inconsistent or completely missing definitions of data objects
or attributes are, especially in large organisations, an often neglected problem. As
previously mentioned, an excellent example is different departments working with
the same data but looking at it from different perspectives. These different views
highlight certain aspects of information more than others and, as a result, can
create inconsistencies.
10
2.2. Cooperative Information Systems
• Data usage: Collecting data is generally done with a specific purpose in mind. Ana-
lyzing these data objects for different purposes can lead to incorrect or meaningless
results. Ignoring the data’s original context can lead to wrong conclusions.
• Data expiration: Certain information has an expiration, which must be considered
during the data lifecycles. Especially customer data, i.e. addresses, contact data
or telephone numbers, can be updated regularly and reduce the overall DQ if not
updated.
2.1.2 Types of Data
As mentioned by Cichy et al. [ 26 ] there are many ways to distinguish information based
on different data types. Most commonly used, implicitly or explicitly, is the separation
into three distinct categories [12]:
1. Structured data describes the “generalization or aggregation of items, described by
elementary attributes [...] mostly corresponding to numeric or text values”, such
as relational tables. This kind of data is used in almost all data contexts in some
form.
2. Semi-structured data introduces a degree of flexibility into predetermined structures,
```
such as XML, JSON or web pages (HTML).
```
3. Unstructured data is defined as a “generic sequence of symbols, typically coded in
natural language”, such as text files, contracts and emails.
Unstructured data is one of the biggest challenges for DQ assessment because many
methods are designed for structured or semi-structured data and cannot be applied
properly in this case. Most research contributions on DQ methodologies cover structured
data and semi-structured data [12, 26].
2.2 Cooperative Information Systems
```
Cooperative Information System (CIS) is a concept of sharing data between multiple
```
organisations and which is especially important for enterprise stakeholders. The principals
of this concept are used to verify if DQ methodologies can be used in a large enterprise
environment.
A CIS is “a large scale information system that interconnects various systems of different
and autonomous organisations, geographically distributed and sharing common objectives”
[ 69]. The relationships between organisations in a CIS are designed in a hierarchical
```
structure (head- and subsystems), such as government and bureaus, or company and
```
departments [ 30, 24]. As mentioned by Mecella et al. [ 69 ] an organisation A requires to
trust the data from an organisation B , or otherwise, it will probably not request data
11
2. State of the Art
from it. Therefore, ways to verify the correctness of data are required. This verification
process could be done by a centralized unit in the CIS and the proof of trust could be
created by issuing certificates.
In real-world use cases, data is often replicated in different organisations, i.e. different
versions of the same data objects are stored in departments such as Human Resources
```
(HR) and Technical Services. Each organisation can have different use cases for data
```
objects. This can mean in practice, that HR would focus on employee data such as
```
addresses, employee contracts, or social security information; and another department
```
Technical Services could focus their stored employee data on acquired skills, training,
assigned equipment, or assigned customers. With this distribution and replication of
partially overlapping and unique data, it is important to reconcile all the information in
one place. A CIS can help with this unification process because one characteristic is high
data replication [ 69]. With the help of centralized services data of different origins can
be compared, reconciled and improved based on the most accurate and up-to-date data
sets available [ 30]. Additionally, a centralized unit of control makes it easy to manage
all DQ rule sets and measurement tools, which are used on all data sets. Therefore, a
consistent data evaluation is possible throughout the whole CIS.
```
In theory, the main tasks of a CIS can be summarized as (i) assessment of DQ stored
```
```
in each organisation; (ii) methods to exchange quality information and data between
```
```
organisations; (iii) improving DQ in each organisation and sharing changes with each
```
```
other (if possible); and (iv) supporting heterogeneous data, because different organisations
```
store data in different semantics and forms [69].
The architecture of a CIS can be implemented in different ways. One commonly referenced
approach is from the DQ methodology DaQuinCIS, which is explained in detail in Section
2.5.2.
2.3 Data Quality Management
Data quality management is defined as the “analysis, improvement and assurance of DQ”
```
[ 75 ]. Different DQ methodologies (alternatively described as “frameworks”) have been
```
proposed to solve general and context-specific DQ problems. Although the following DQ
methodologies differ in their approach, characteristics and structure, many contain the
```
same core activities [ 13, 26, 36, 67, 33, 12]: (1) state reconstruction or data profiling, (2)
```
```
DQ assessment, (3) data cleansing or improvement, and (4) some kind of DQ monitoring.
```
These core activities are described in [ 12, 33], and this will be briefly summarized in the
```
following subsections for context. Step (1), is “aimed at collecting contextual information
```
on organisational processes and services, data collection activities [...] and quality issues”
```
[ 12]. Therefore, step (1) focuses on current data, and especially how data can be profiled
```
```
(see Section 2.3.1). In step (2), the focus lies on measuring the state of data stored in
```
any data source and the results of measuring it are evaluated and judged with the help
```
of algorithms and metrics (see Section 2.3.2). The results of this step are then utilized
```
```
by step (3), which improves, in general, the DQ of assessed data and cleanses if possible
```
12
2.3. Data Quality Management
unnecessary information. Ideally, this step is done automatically, which can be hard
to realise, due to the complexity of data sets and what is defined as a “correct” data
```
entry (see Section 2.3.3). Step (4) is described as DQ monitoring. During this step, often
```
data is checked at regular intervals or when changes in data are detected. If changes
were detected, the former steps can be executed again, such as after registering new data
```
entries in a database, the steps (2) and (3) could be applied to the new information (see
```
```
Section 2.3.4).
```
2.3.1 Step 1: Data Profiling
With data profiling, a data set can be analysed and metadata collected. This task delivers
information and insights into any data model and, therefore is an important requirement
for all DQ techniques [ 74, 2 , 1 ]. Abedjan et al. [ 1] define the following three data profiling
```
categories:
```
1. Single column metadata can be gathered by analysing a column in a table, for
example, from a relational DB. Examples of metadata, extractable from such a
```
single column, are patterns and formats (i.e. the format of telephone numbers or
```
```
postcodes), distinct or missing values (i.e. null values or min/max values) and
```
```
statistical information (i.e. value distribution).
```
2. Dependencies define relationships between columns and tables. Profiling operations
require unique identifiers within tables, as a foundation, to find dependencies in
other tables.
3. Metadata for non-relational data includes information gathered from XML, RDF
and text documents. According to Abedjan et al. [ 1 ], a lot of potential lies in
this research area, but currently, it is the hardest one to cover with current DQ
methods.
2.3.2 Step 2: Data Quality Assessment
Assessing the state of a data source can be described as the process to identify erroneous
data elements and measuring their impact on different business processes [ 67]. The
process of DQ assessment is one of the most crucial parts of managing and maintaining
data in a big organisation with multiple groups, which often have different interests in
mind [26].
The terms “assessment” and “measurement” are often used synonymously, but there
can be a distinction between these two terms. The term “measurement” is defined as
“addressing the issue of measuring the value of DQ dimensions” [ 12]. Assessment, in
contrast, goes beyond measurement and means that “such measurements are compared
to reference values [...] and enables a diagnosis of quality” [ 12]. In general, assessment
evaluates the measurement results “by drawing conclusions about the assessed object”[ 33],
which can be used to follow up on these conclusions by improving workflows, processes
13
2. State of the Art
and stored data [ 86]. In this thesis, the term “measure” is used for both, DQ assessment
and measurement activities.
The term “assessment” can be seen as a separate step next to improvement and monitoring,
which often includes measurement activities. Therefore, the focus of this research paper
will not be on the measurement process alone, but also on putting data into context to
reference data or make conclusions based on it [12].
DQ can be measured subjectively, by interviewing data consumers and experts, or
objectively, by using quantitative DQ metrics, which can be combined to get a clear
perspective on the level of DQ [ 12, 48]. In Section 2.4, these DQ dimensions and metrics
are explained in detail.
Rule-based VS dimension-oriented assessment
```
Assessing and measuring the quality of data sets and models is done either (1) by applying
```
```
rules on data objects (rule-based assessment) or with the help of (2) quality dimensions
```
```
and metrics (dimension-oriented assessment). As explained by Ehrlinger [ 33], most
```
assessment methodologies can be divided into these approaches.
```
(1) The rule-based approach measures DQ with the help of applicable empirical rules.
```
Some examples of such rules can be a min/max limit of specific values, the number
of occurrences of null or empty values, required or optional fields filled out correctly,
or the timestamp of the last most recent value is newer than a reference value. Most
software tools used for measuring DQ apply such rules. A positive aspect of this method
is the empirical expressiveness and simplicity of these results. One of the most significant
disadvantages is the required initial definition of these rules, which can be very time-
consuming and complex, depending on the data set. A negative side-effect can be
the limited information you can extract from these kinds of results because there are
subjective DQ metrics, which can not be measured with empirical methods alone. For
example, all employees have their subjective image of the current data state [ 77]. DQ
aspects like usability or interpretability can often not be assessed by objective metrics
alone, but by including other methods, such as user surveys, additional information on
data can be gathered. These are a few typical limitations of rule-based DQ perspectives.
```
(2) Another way of approaching DQ assessment is the dimension-oriented approach. This
```
perspective suggests using relevant DQ dimensions for the measurement process. These
dimensions can be measured objectively with DQ metrics, potentially leading to concrete
assessment results. In theory, this approach is more precise and better applicable to
specific domains, but in practice, it is much harder to implement. There need to be
standards defined for DQ dimensions and metrics. Another problem is the need to define
core dimensions essential for assessing DQ. Current state-of-the-art DQ tools do only
apply some metrics of some dimensions and do not capable of implementing multiple
dimensions.
Both perspectives on assessing data quality have their strengths and weaknesses, but there
are other ways to approach DQ assessment. Most DQ methodologies apply dimension-
14
2.4. Data Quality Dimensions and Metrics
oriented approaches. In contrast, most DQ software tools use rule-based approaches
because rule sets are easier to implement and verify than complex dimensions [ 35].
Software tools also implement single DQ dimensions metrics as described later in the
```
tool assessment part of this thesis (see Chapter 5).
```
2.3.3 Step 3: Data Quality Improvement
```
DQ improvement (also called cleaning or cleansing) describes the process of correcting
```
data, according to found errors in previous tasks. According to [ 12] improvement tasks can
extend from improving management, monitoring, redesigning processes, identifying causes
of errors, evaluating costs, assigning responsibilities and designing data improvement
solutions. The effectiveness of improvement activities can be measured by repeating the
```
phases (1) profiling and (2) assessment.
```
Most research on cleaning and improving DQ is done in the application area of data
mining, statistics and DBs. The research primarily focuses on concrete DQ problems,
not general and often theoretical DQ dimensions and metrics [ 28]. Due to the complexity
of improvement tasks, automated tasks can often only be applied partially because they
can produce high risks of adding new errors in data sets instead of correcting existing
ones [ 67 ]. Even though there are many use cases for automated tools. They can be
beneficial for large amounts of data when supported by users who know the domain well.
In practice, tools can be used to detect duplicates and highlight possibly missing data
parts and outliers which do not match with default formats [33].
2.3.4 Step 4: Data Quality Monitoring
DQ monitoring is continuously referenced in literature but does not have a universal
definition. The consequence is, the existence of different interpretations in scientific
research and industrial applications [ 34]. According to Gartner’s [ 25 ] “Magic Quadrant of
Data Quality Tools”, monitoring the state of your data is one of the key capabilities of every
DQ tool. DQ monitoring should “assist with the ongoing understanding and assurance
of DQ by monitoring of, and alerting to, possible DQ issues”. As mentioned in [ 12, 25],
the monitoring step in most DQ methodologies is included in DQ improvement activities,
but can also be seen as a separate phase in a DQ methodology. Monitoring different
data sets is done after the initial assessment process and is the basis for improvement
activities. Since this thesis focuses on the best-fitting assessment methodologies for large
enterprises, a detailed evaluation of different monitoring techniques is not going to be
included. An overview of improvement steps, if present, is included to provide a complete
representation of each methodology.
2.4 Data Quality Dimensions and Metrics
DQ dimensions describe certain attributes of data and illustrate the overall quality level
[ 26, 76]. In literature, DQ is usually measured by multiple dimensions [ 100 ]. Every
15
2. State of the Art
dimension describes specific aspects of data, for example, if data is correct in relation
to its real-world entity or if the data sets are “complete” representations of an object.
These DQ dimensions can refer to specific data values, for example, numeric values, or to
a schema, for example, a data structure [12].
DQ metrics are functions, which map numeric values to DQ dimensions and allow an
interpretation of the dimensions’ fulfilment level or DQ level [ 52]. Multiple metrics can
be applied to different DQ dimensions and if more metrics are combined, the result
can be more accurate [ 12 ]. Some metrics can be applied on the data level, for example
by aggregating column, table, tuple or record values [ 33]. Such aggregations can be
designed to check for minimum, maximum or number of null values. Other metrics
require reference or benchmark records for measuring DQ. These records are also called
gold standard. These gold standard records do not exist in most cases, but in practice,
existing baseline or example data sets are used as a gold standard [33].
Berti-Èquille et al. [ 16] found more than 200 DQ dimensions in literature for a variety of
data attributes. Even though DQ dimensions and metrics are such a broadly researched
topic, there are no uniformly accepted standards for either. A reason for this variation
of dimensions is the high contextual dependency [ 26, 12]. This missing consensus leads
```
to discrepancies between research work (i.e. definitions of dimensions and metrics can
```
```
differ) and practical implementations (i.e. implementations in DQ tools) [72, 86, 33].
```
Although there is high variation between DQ methodologies and their applied DQ
dimensions, there are some attributes, which appear frequently in many methodologies
[ 26]. According to [ 100 , 12, 26], the most common dimensions are Completeness, Accuracy,
and Timeliness, which are also called “hard dimensions” [ 79 ]. These hard dimensions can
be measured objectively with check routines. In contrast to that, “soft dimensions” can
only be assessed with subjective evaluation methods, but these subjective methods can
include objective activities to be executed correctly. Examples of soft dimensions are
Readability, Usability, Value-Added or Contextual-Clarity [79].
The following DQ dimensions are the ones most commonly found in the literature regarding
CIS. The listed formulas to calculate them are only examples because these can differ
across different DQ methodologies as described in the following sources [ 27, 12, 26, 14, 19].
2.4.1 Accuracy
Accuracy is one of the most cited and significant DQ dimensions [ 98, 100]. Even though
the high importance of accuracy as a dimension is clear since 1996 [ 100], there are big
differences in interpretations of this particular DQ dimension [ 45]. The most common
and general definition is: the closeness between data and the real-world equivalent, which
the data entity is supposed to depict [ 98, 45, 13]. High data accuracy means that the
stored data is the “correct” data in regard to some related data sets or external checking
methods, i.e. having access to a state-owned database, which is a third-party and can be
trusted in its correct information.
16
2.4. Data Quality Dimensions and Metrics
The following metrics are examples of commonly used ways to calculate the dimension
Accuracy but do not exhaust the possibilities of calculation variations [ 33]. These were
selected because they provide a few different approaches to the way Accuracy can be
calculated.
Equations 2.1 and 2.2 were defined by Redmann [ 83] and define two ways of calculating
Accuracy for field values and more complex data records. The field level is also called the
attribute level. A record consists of multiple fields and as mentioned by Redman reflects
better data accuracy from a customer point of view. Both equations evaluate if fields or
records are “complete”. This can be done if a reference object exists, and each field or
record can be compared with it. Ideally, a real-world counterpart to the digital entities is
available, which can be used for comparison.
```
field level accuracy = number of field judged “correct”number of fields tested [83] (2.1)
```
```
record level accuracy = number of records judged “completely correct”number of records tested [83] (2.2)
```
Fisher et al. [ 42] adopted the concept of Redman [ 83] and created the Equation 2.3 which
adds the randomness of the occurrence of an error ROE and the probability distribution
of the occurrence of an error P DOE.
```
accuracy =
```
3 NrOfCorrectValues
TotalNrOfValues , ROE, P DOE
4
```
[42] (2.3)
```
These equations are described in much more detail in their related sources.
2.4.2 Completeness
An abstract definition of the DQ dimension Completeness is “the extent to which data
are of sufficient breadth, depth and scope for the task at hand” [ 100]. Batini et al. [ 12 ]
formulated the definition as “the degree to which a given data collection includes data
describing the corresponding set of real-world objects”. Completeness is often connected
with the presence of null values or missing values, which do exist in the real world but
do not get reflected in the stored data [ 12]. Important for completeness is knowledge
about “why is data missing?”[4] and “does it exist in the real world?”[12].
Equation 2.4 is one of the most generic metrics for completeness and is listed here to get
an idea of possible calculation methods. |ec| is the number of complete elements and |e|
is the total number of elements. An element can be, for example, an attribute, a record,
a table or a complete database [ 13]. The listed formula for calculating completeness is
just one of many examples found, but it is the most generic definition found in literature
[33, 13, 81, 49, 78].
17
2. State of the Art
```
Completeness = |ec||e| (2.4)
```
A more specific way to calculate completeness is given by Hinrichs [ 49] as shown in Equa-
```
tion 2.5. |T | , which is the number of records in Table T . Qcomp ( tj ) is the completeness
```
value of the record Tj . The calculation is similarly structured to Equation 2.4, and sums
up all completeness values and divides them through the total number of records used.
```
Qcomp(T ) =
```
q|T |
```
j=1 Qcomp(tj )
```
```
|T | [49] (2.5)
```
Hinrichs calculates completeness by giving a record entry the value 0 if it is null or
equivalent to it, or 1 otherwise as shown in Equation 2.6. Equivalent values to null can
```
be for example “NaN” (Not a Number), empty strings or default values. This calculation
```
method can be applied to different aggregation levels, besides the table-level [49].
```
Qcomp(tj )
```
I
0 if tj is null or equivalent
```
1 otherwise. [49] (2.6)
```
An example, given by Batini et al. [ 12], shows the complexity behind the dimension
Completeness. Let’s consider a table Person with arbitrary fields and one of them is
```
Email In this case, different scenarios can apply: (1) the person has an email address,
```
```
and it can be found in the table; (2) the person has an email address, but a null value is
```
```
set; (3) the person does not own any email addresses and for that reason, there is a null
```
value found. These three possibilities illustrate the incompleteness of an attribute, which
can be behind missing information about a real-world entity.
As proposed in [ 12], a boolean value should be used to clearly distinguish between
complete and incomplete fields in quality assessment. By using boolean values, a ratio
between complete and incomplete values can be calculated.
2.4.3 Consistency
The DQ dimension Consistency describes to which extent data is represented in the same
format and does not conflict with other related data sets [ 100, 81, 13]. Consistency can
```
either be evaluated by (i) semantic rules, such as a value must be in a range of 0 to
```
```
150, or by (ii) attributes from different relations, which should be the same value, as for
```
example the soundtrack of a movie and the movie itself must be released in the same
year. [12, 13].
This DQ dimension can be measured by specifying constraints, relations and rules and
is applicable most of the time, due to the straightforwardness of the measuring process.
Either data can fulfil defined rules or not. It is also easy to verify if two or more related
attributes contain conflicting values.
18
2.4. Data Quality Dimensions and Metrics
Hinrichs [ 49] proposes a formula which assumes knowledge about domain-specific rules
exists. It does not include checks on contradictions between rules themselves. Consistency
is defined by Hinrichs as QKon and calculated as shown in 2.7:
```
QKon(Ê) = 1qn
```
```
j=1 rj (Ê)gj + 1
```
```
[49] (2.7)
```
Ê is the attribute value which should be verified, gj the degree of severity of the rule
```
rj ( Ê ), and rj ( Ê ) is the violation (or no violation) of the consistency rule rj . “Degree of
```
severity of a rule” means how bad the consequences of data not fulfilling this rule can be.
n is a set of consistency rules.
```
rj (Ê) is defined in Equation 2.8:
```
```
rj (Ê)
```
I
0 if Ê satisfies rj
```
1 otherwise. [49] (2.8)
```
As illustrated in 2.8, rj is 0, if Ê satisfies the consistency rule, otherwise it is 1, which
means it is in violation of the rule.
2.4.4 Timeliness, Currency and Volatility
Timeliness, Currency and Volatility are time-related DQ dimensions, for which there
does not exist an agreement on generally accepted definitions. The most used dimension
in literature is Timeliness, as shown by Batini et al. [ 12 ]. Timeliness and Currency are
often used to refer to the same concept. Currency and Volatility are sometimes defined
as separate dimensions or as complementing each other.
The following Equation 2.9 was selected as an example of an evaluation method for
Timeliness, which is used in different methodologies as mentioned in [ 13 , 12] and was
suggested by Wang et al. [ 100 ], Bovee et al. [ 19], and Liu and Chi [ 61]. Even though
there is no consensus on one single definition, in a lot of literature, Timeliness is defined
as “the extent to which the age of the data is appropriate for the task at hand” by Wang
et al. [ 100 ] and Liu and Chi [ 61]. Ballou et al. [ 7 ] proposed a definition which builds
on the one by Wang et al. [ 100] and introduced a function which considers Timeliness
as a more complex dimension consisting of Currency and Volatility. This function for
calculating a Timeliness value is shown in 2.9.
T imeliness =
```
;
```
max
5
```
1 ≠ CurrencyV olatility ; 0
```
6<s
```
[7] (2.9)
```
The Equation 2.9 measures Timeliness in a range between 0 and 1. The parameter s
controls how sensible the currency-to-volatility ratio is measured. If the function evaluates
to 0, the data set is outdated. Contrarily if the result is bigger than 0, the data is up to
19
2. State of the Art
date, depending on the distance to the maximum value of 1. Currency can be understood
as the “update frequency of data” and Volatility as “how fast data becomes irrelevant”
[7, 33]. Currency is calculated as shown in Equation 2.10.
```
Currency = DeliveryT ime ≠ InputT ime + Age[7] (2.10)
```
DeliveryTime defines the time of delivery to the customer, i.e. when the data is available
to the user, InputTime describes the time when the data set was entered in the database,
and Age gives information about the time the data existed before it was entered in the
database.
The Volatility of data is specific to each domain because depending on how data is
processed and new data is stored, older data sets can become irrelevant quicker than in
other cases [7].
As previously mentioned, different suggestions exist for calculating time-related metrics
for data relevancy. Ballou et al. [ 7 ] calculation method can be found in many of DQ
methodologies to calculate Timeliness and was therefore used as an example in this thesis.
2.5 Data Quality Methodologies applicable to Enterprises
The following section contains all DQ methodologies, which could be appropriate candi-
dates for big corporations or CISs to increase DQ levels.
The Table 2.1 shows all DQ methodologies, which were considered for this thesis. It
contains an abbreviation, full name, year of release and a reference to the main source. The
structure of the DQ methodology descriptions is slightly different for each methodology.
This originates from different structures of the primary resources and on what they focus
their research. The Subsections 2.5.1 - 2.5.6 describe these methodologies in detail.
2.5.1 CDQ - Comprehensive Data Quality Methodology for Web and
Structured Data
```
Comprehensive Data Quality Methodology for Web and Structured Data (CDQ) is a
```
general-purpose DQ methodology listed by Batini et al. [ 12] and Cichy et al. [ 26] in
their overview papers for DQ assessment methodologies. This framework is designed
for groups of multiple organisations which are supposed to cooperate to achieve a
common goal. A common name for such a communication system between different
organisations or companies is CIS, defined as multiple systems of organisations that
act with a common goal. Such groups can be, for example, a collective of government
```
institutions, multiple hospitals or subsidiary companies of larger cooperation [ 69] (see
```
```
Section 2.2 for more details on CIS). In general, CDQ is applicable in intra- and inter-
```
organisational contexts. Intra-organisational means that DQ activities can be applied to
one organisation’s data. Inter-organisational, on the other hand, describes everything
20
2.5. Data Quality Methodologies applicable to Enterprises
Abbreviation Name MainReference Year
CDQ Comprehensive Methodology forData Quality Management [11] 2006
DaQuinCIS Data Quality In CooperativeInformation Systems [84] 2004
DQA Data Quality Assessment [77] 2002
HDQM A Data Quality Methodologyfor Heterogeneous Data [23] 2011
HIQM
A Methodology for Information
Quality Monitoring, Measurement,
and Improvement
[22] 2006
TDQM Total Data Quality Management [99] 1998
TIQM Total Information Quality Management [36] 1999
Table 2.1: Overview of DQ methodologies applicable to large enterprises
happening between companies, which can be the application of DQ assessment on data
of multiple organisations.
CDQ provides measurement, assessment, and improvement concepts. It focuses heavily
on “precise guidelines and techniques to analyse business contexts [...] regarding related
DQ issues” [11]. These guidelines and techniques were emphasised because other DQ
methodologies often lacked specific descriptions of gathering contextual knowledge about
data as the methodology was designed.
The methodology supports structured, semi-structured and partially unstructured data
sets. In CDQ, the focus is not only set on structured and semi-structured data because,
according to Blumberg et al. [ 18 ], almost 85% of organisational data is unstructured
and will increase over a company’s lifetime. Therefore, Batini et al. decided to include
methods for unstructured data in CDQ to measure the quality levels of these kinds of
data sets. The main goal of CDQ is to support all types of organisational data and
address all DQ issues.
The methodology is designed with a “reasonable balance between DQ results and feasi-
```
bility” [ 11] in mind. CDQ consists of three main phases: (1) State reconstruction, “where
```
all relationships among organisational units, processes, services, data sources, and data
```
are reconstructed” and prepared for assessment processes; (2) Assessment, “where DQ
```
dimensions are measured and assessed” in order to get information about the state of
```
data; (3) Choice of the improvement process, “where improvement activities are selected
```
by evaluating their cost/benefit ratio” and the best fitting activities are executed [11].
21
2. State of the Art
State Reconstruction
```
State reconstruction focuses on (i) data and their uses, (ii) relationships between organi-
```
```
sational units and processes, and (iii) organisational macro-processes [11].
```
```
(i) Data and their uses:
```
Organisations can create and own data themself or use a set of provided data by some
other organisation to complete their processes. By linking organisational units to specific
data sets and data flows, data providers and data users can be defined. Data can originate
from internal or external data sources.
```
(ii) Relationships between organisational units and processes:
```
Each process must be assigned to at least one owner and contributing unit. This sets
the responsibility for executing assessment and improvement activities. Additionally,
```
the relationship between external (i.e. outsourced) data and internal processes can be
```
described.
```
(iii) Organizational macro-processes:
```
The last step of state reconstruction is the definition of macro-processes, which are
elementary processes of enterprises. An elementary process or macro-process consists of
a set of activities: workflows, services and norms. A workflow describes certain activities,
such as inserting new data in a database or providing notification services if errors occur.
Services are provided by the macro-process to other data clients and users and can,
for example, provide up-to-date information to specific users over a dedicated interface.
Norms define the structure of processes and can include aspects such as time windows
within a notification after updating data must be sent.
Assessment
```
The assessment phase of CDQ consists of two steps: (i) problem identification and (ii)
```
DQ measurement [11].
```
(i) Problem identification:
```
In this step, the most relevant DQ issues in regard to business processes are identified.
Users are interviewed and as a result general DQ issues can be defined. These resulting
DQ issues indicate consequences of low DQ on workflows and satisfaction with services.
For example, users could complain about the inaccuracy of requested information. Such
inaccuracies can occur if data is replicated over multiple databases and not up-to-
```
date on every instance. These quality issues can originate from service problems (i.e.
```
```
wrong information delivered to the end-user or delays in updates) or data problems (i.e.
```
```
incomplete data sets or duplicates).
```
```
(ii) DQ measurement:
```
After identifying DQ issues, a quantitative evaluation is performed on affected data
sets. First, a subset of relevant DQ dimensions and metrics must be selected. Second,
these metrics must be applied to data and data flows. The result of applying different
metrics leads to a quantitative evaluation of the related data sets. DQ dimensions and
22
2.5. Data Quality Methodologies applicable to Enterprises
metrics must be chosen in regard to the type of data. Structured and semi-structured
data can be measured with dimensions such as Accuracy, Completeness and Timeliness,
because they are context-independent and can be assessed with algorithms. Evaluating
unstructured data can be more difficult, because measuring certain dimensions like
```
Completeness or Accuracy is not always possible with algorithms (i.e. Completeness
```
of a text is not measurable on its own but requires either a sample text to compare to
```
or human interactions) [ 7 , 81, 73]. The number of updates performed on a text can be
```
measured with specific benchmarks and therefore is more easily evaluated than other
metrics which require more effort to apply.
Improvement Activities
As mentioned previously in this thesis, this work focuses on measurement and assessment
methods and not on improvement approaches. A brief overview of CDQ’s improvement
methods will be given in this part. Improving the DQ of data sets is done in multiple
steps.
Initially, target values for the following improvement steps must be calculated and
defined. During this process, target values will be defined for all DQ dimensions, which
are based on previously measured DQ values. These target values will be calculated with
a combination of improvement costs and performance metrics.
Next, a selection of different DQ improvement strategies must be made. These involve
picking the most efficient improvement strategies according to the previously defined
target values.
The selected improvement strategies provide a basis for choosing suitable tools, solutions
and methods. Finally, the improvement process can be applied to datasets with the help
of the chosen tools. In the end, the improvement result will be compared to the set target
values. Depending on the results, the improvement process can be repeated for multiple
iterations and refined over these.
2.5.2 DaQuinCIS - Data Quality In Cooperative Information Systems
Scannapieco et al. [ 84] designed the methodology Data Quality In Cooperative Infor-
```
mation Systems (DaQuinCIS) primarily for CIS and distributed data. Batini et al. [ 12]
```
listed DaQuinCIS as a promising methodology for big cooperations and large enterprises.
DaQuinCIS was created to solve two main issues of interorganisational cooperations [ 84 ]:
```
(i) There must be a trust in shared resources between organisations, i.e. an organisation
```
A can not verify if data from an organisation B is up-to-date, valid and correct, and
therefore does not trust it. This trust can be given by DQ certification, “which associates
data with corresponding quality measures that are exchanged among organisations along
the data” [12].
```
(ii) Organizations must provide high-quality data, to other organisations. Otherwise,
```
operations like statistics, evaluations, and analysis based on the provided data can
23
2. State of the Art
be riddled with errors or worse the errors can spread to other organisations. Higher
levels of DQ can be ensured by “overlapping databases owned by different cooperating
organisations” [ 12]. This data exchange between organisations increases the motivation of
all members to keep their data up-to-date, and work against redundancies and incomplete
entries. The methodology supports structured and semi-structured data.
```
DaQuinCIS consists of five phases: (1) Definition, (2) Measurement, (3) Exchange,
```
```
(4) Analysis and (5) Improvement [ 17 , 84]. Definition, Measurement, Analysis and
```
Improvement are used in many DQ methodologies and were redesigned to fit a CIS
context.
```
(1) During the Definition phase, models are created, which are later used for the data
```
exports to other organisations. These models are designed to include the relevant
information and the associated quality values. DQ metrics are also defined and assigned
to specific purposes in this phase.
```
(2) The Measurement phase contains the evaluation process of the DQ dimensions of the
```
exported data.
```
(3) The Exchange phase, specifies how data gets exchanged, what information it contains
```
and which DQ values relate to certain values in data sets.
```
(4) In the Analysis phase, the interpretation of the exchanged DQ values is implemented.
```
```
(5) The Improvement phase contains actions for enabling and enhancing the improvement
```
of shared data sets between organisations. These improvement steps can be for example
the comparison of different data sources and giving automatic feedback on their quality
levels.
DaQuinCIS is based on the following definition of CIS [ 84]: A set of organisations form
a CIS, which cooperate through a communication infrastructure. This infrastructure
provides software services to organisations. Each organisation can provide different
services. The communication infrastructure is responsible for making these services
available to other parties. A user of this infrastructure can be a software application or a
human in an organisation using this cooperative system.
Enterprise CISs can be characterized by a “high degree of data replicated in the different
organisation” [ 84]. As an example in a technical-service-oriented organisation, information
about employees is stored in the department HR and also in the service department,
which provides the service itself to the customer. This leads to different DQ levels in
each department/organisation. Some information is more important to one organisation
than it is to another one. Therefore it should be possible to either provide users with the
highest DQ level or merge the existing data if possible.
DaQuinCIS Architecture
As previously mentioned, the general idea of DaQuinCIS is that organisations provide
services to other organisations to increase the overall DQ levels. These services are
provided to other parties through gateways or interfaces. Each organisation exports its
data and quality data information “according to a common model, referred to as Data
24
2.5. Data Quality Methodologies applicable to Enterprises
Figure 2.1: DaQuinCIS architecture from [84]
```
and Data Quality (D2Q)”. This data model contains (i) the data object itself, (ii) a set
```
```
of DQ properties, (iii) a structure which represents these properties, and (iv) relations
```
which connect the data object and DQ properties values [ 84]. The description of D2Q is
exhaustive and can be checked in the source [84].
Each organisation manages an interface to other organisations, which is composed of the
following elements as shown in Figure 2.1:
```
(i) Quality Factory: The Quality Factory service is connected to all the backend services,
```
such as internal databases and data providers of the organisation. The Quality Factory is
a general interface to the data sources of an organisation. It evaluates the quality of the
owned and internally available data. A user or an automatic process can send a request
to the Quality Factory for a certain data set. The request is transformed into a universal
format so that the Quality Factory can evaluate it. First, the factory fetches the related
data and uses quality measurement tools to compare its DQ metrics with benchmark
parameters. If the results are not according to the quality standards, the Quality Factory
executes different improvement algorithms on the data and evaluates the resulting data
again. After fulfilling certain quality standards, the requested data set is certified with a
quality certificate and sent in a standardized format to the user [27, 84].
```
(ii) Data Quality Broker: If a user requests data, the Data Quality Broker sends requests to
```
other cooperating organisations demanding their version of the needed information. It also
sends additional DQ requirements included in the request, which the other organisations
must fulfil before responding. After receiving different copies of the organisations, the
broker evaluates the answers and selects the one with the best-quality level. Finally, the
organisation can either accept the response with the best possible DQ value or try to
improve it with improvement methods [68, 84, 70].
25
2. State of the Art
```
(iii) Quality Notification Service: The Quality Notification Service is a publish/subscribe
```
service, which can notify subscribed services or organisations of changes in the quality
of data [ 84, 66]. As an example, if one employee data entry gets changed by HR, a
notification gets triggered and each cooperating organisation can request the newest
information.
```
(iv) Rating Service: Every DaQuinCIS architecture needs one Rating Service which
```
assigns trust values to all data packages transmitted in the CIS. These trust values are
indicators for “the reliability of the quality evaluation performed by the organisations”
[ 84]. In general, the Rating Service should be provided by an independent third party.
[31].
```
(v) Communication infrastructure: The communication between organisations is handled
```
over specific communication infrastructure. Each organisation provides the same external
interfaces to other parties in this network. The data format of requests is standardized
for easier communication between parties.
```
(vi) Internals of the organisation: These elements of the DaQuinCIS architecture are
```
specific to each individual organisation. This aspect is important and was mentioned by
the authors of DaQuinCIS because many organisations have different internal structures
and architectures.
Assessment of Data
Assessing DQ in DaQuinCIS is done primarily by the Quality Factory. This part of the
DaQuinCIS architecture contains the measurement algorithms and metrics for specific
DQ dimensions. This assessment is done when data needs to be fetched or written to the
backend systems, which contain the data storage units. Each organisation implements an
instance of a Quality Factory in their infrastructure. Scannapieco et al. [ 84] define the DQ
dimensions Accuracy, Completeness, Currency and Consistency for DaQuinCIS. These
dimensions are expanded on in another paper by Cappiello [ 27] regarding DaQuinCIS and
also, this research paper goes into more detail regarding the Quality Factory. Suggestions
for DQ dimension metrics from other sources are given by Cappiello [ 27]. Assessing data
is supported by DQ monitoring capabilities in the Quality Factory. These monitoring
activities execute quality assurance algorithms and check for changes in data, which
require a new assessment of data [ 27 ]. The assessment process in general is not described
in much detail in any of these sources.
Improvement Activities
Improving data is covered by the Data Quality Broker as described by Scannapieco et al.
[ 84]. Improvement is based on fetching a required data object from different organisations,
each entity comes with a quality scoring from the Rating Service, and comparing them.
The data entity with the best DQ score will get selected for improving or correcting data.
If the best-fitting version of an entity was found, other organisations can be notified to
update their entries as well [84].
26
2.5. Data Quality Methodologies applicable to Enterprises
Finally, the DQ methodology DaQuinCIS does cover a lot of different important aspects,
which include concrete architectural designs, recommendations for a standardized data
model D2Q, concrete DQ dimensions, and on what metrics these dimensions could be
based on.
2.5.3 DQA - Data Quality Assessment
```
Pipino et al. [ 77] created Data Quality Assessment (Methodology) (DQA) as a way
```
to assess data subjectively and objectively. To limit the possibility of confusing the
specific methodology DQA and the general assessment of DQ, the wording data quality
assessment is meant for the general assessment activity and only if the abbreviation DQA
is used, the specific methodology is described.
The main goal for Pipino et al. [ 77] is to find subjective and objective assessment methods,
```
which can (ideally) complement each other and increase the quality of data as a result.
```
Sometimes subjective perception can contradict the objective measurements based on
data sets. This discrepancy can be for example that users have problems with accessing
the most recent information of a data set, which can be the result of missing or outdated
training for a specific task [50, 77].
```
Subjective methods like surveys can measure (i) the user’s perception of DQ itself (i.e. if
```
```
the data is complete and believable) and (ii) what working with data means on a daily
```
```
basis to users (i.e. how long it takes the user to find the needed information) [ 21, 50, 77]
```
Objective assessment can be task-independent or task-dependent. Task-independent
means that there is no contextual knowledge needed to evaluate the state of data. These
independent metrics can be applied on any data set. Task-dependent on the other hand
includes rules or regulations, which are specified for a specific context [77]
DQA describes three functional forms for “developing objective DQ metrics” [ 77]. These
three forms of objective metrics are combined with subjective methods to maximise the
reliability of the resulting DQ values.
Objective Assessment with Functional Forms
Pipino et al. [ 77] propose three functional forms, which can be defined and customized
```
by each company as they see fit. These three forms are (i) simple ratio, (ii) min or max
```
```
operation, and (iii) weighted average.
```
```
(i) Simple Ratio:
```
The simplest way to measure DQ is by calculating the ratio of the desired outcomes
|vdesired| to total outcomes v as shown in Equation 2.11. v describes each considered and
evaluated data entry.
```
Sratio = |vdesired||v| (2.11)
```
27
2. State of the Art
A more preferred form of this function is the ratio of the numbers of undesired outcomes
|vundesired| to total outcomes |v| and subtracted from 1, which is shown in Equation 2.12.
```
Sratio = 1 ≠ |vundesired||v| (2.12)
```
The Equation 2.12 is preferred because the resulting simple ratio “adheres to the conven-
tion that 1 represents the most desirable and 0 the least desirable score”. The simple
ratio is useful for long-term comparisons of the state of data. DQ dimensions such as
Completeness, Consistency and Correctness use this kind of metric in some form.
```
(ii) Min or Max Operations:
```
Dimensions such as Accessibility, Timeliness or Believability require in some form mini-
mum and maximum operations to assess the quality of data entries.
Minimum operators aggregate values and return the smallest value in regard to specific
DQ indicators, for example, if there are enough different data sets present for an analysis
of the data.
The maximum operator is applied to find the highest DQ indicator, which can be for
```
example the timeliness of data sets and if data is accessible enough to the users (i.e. how
```
```
long does a user need to obtain desired information). The result is always normalized
```
between 0 and 1.
```
(iii) Weighted Average:
```
An alternative to the min/max operations is the weighted average. It can be applied if
the company has a good understanding of which data is how important. By knowing the
worth of each variable a company can assign a specific “weight” factor to each one. This
weight factor should also be normalized between 0 and 1, and added to the rating result
of other operations to assign a more concrete worth to each DQ indicator. This weighing
of variables could include describing the social security numbers of employees as very
important to the company and the primary school an employee visited lowly in contrast.
Assessment in Practice
```
DQA’s assessment approach is split into three steps: (i) Performing subjective and
```
```
objective DQ assessment; (ii) Comparing the assessment results, identifying discrepancies,
```
```
and determining root causes; (iii) Determining and taking necessary improvement actions
```
[ 77]. These three steps are illustrated in Figure 2.2 and explained in more detail in the
following paragraphs.
The first step of analysing data is the assessment process. This assessment can be done
in subjective and objective ways. As previously described there are different ways to
execute these forms. Ideally subjective and objective assessment activities complement
each other.
28
2.5. Data Quality Methodologies applicable to Enterprises
Figure 2.2: DQA’s assessment approach [77]
Figure 2.3 shows the desired complementary way of subjective and objective assessments
by dimensions. On the x-axis, objective assessment activities for a specific dimension are
rated from low to high. The y-axis illustrates the subjective assessment capabilities of
DQ methods also ranging from low to high. If an assessment method falls in quadrant I,
it means that both the objective and subjective assessment produce low DQ measuring
results. If the results of the assessment fall in quadrant II, the subjective assessment
of data is high, and can for example mean that customers or users, which work with
this data think that the DQ is high, even if objective measurement methods do not
support this perception. Contrary to quadrant II, quadrant III indicates that data is
objectively in good condition, but the users think that it is not. The goal is to achieve
DQ assessment results for each dimension, which should fall in quadrant IV. This means
that both, the perceived subjective assessment and objective assessment methods support
29
2. State of the Art
the claim that DQ satisfies the company’s needs. If the compared results fall into the
quadrants I, II or III, the company must investigate the root causes of this.
Figure 2.3: DQA’s subjective and objective assessment quadrants [77]
After comparing and investigating the root causes of low assessment results, the company
can improve the overall quality of data sets with different actions. Such improvement
methods can vary depending on the dimensions they regard and if the root causes are
of subjective or objective nature. For example, a root cause of a lack of subjective DQ
could be poorly designed user interfaces through which an employee must access data.
Or maybe users need to be trained in using specific tools and learn how to access data
correctly. These shortcomings can be countered by training or redesigning how users
access the data they need. These improvement methods were not listed in [ 77] but were
considered an example by the author of this thesis.
An ideal scenario would provide decision-makers of the company with a single DQ index,
which measures the overall level of quality. But in practice, this can often lead to other
problems because a single quality index can be formed by the subjective weighing of
priorities, interpreted incorrectly or mismeasured. To fully utilize such DQ indicators,
companies and employees must design and apply them correctly and acquire a deep
knowledge of their data sets and what they want to achieve with this information. They
need knowledge about workflows and why data is in its current state. Assessing and
improving data is a complex and ongoing process. A “one solution fits all problems
approach” does not exist. There are common problems for different commercial areas,
but even these need customizing to fit the company’s domain model [77].
30
2.5. Data Quality Methodologies applicable to Enterprises
Improvement of Data
“Actions for Improving Data Quality” is mentioned in Figure 2.2, but no concrete
suggestion on how the improvement of data can be achieved with DQA. Regarding the
description of this DQ methodology, there are no concrete improvement activities present
in the primary source [ 77]. As mentioned in Batini et al. [ 12], apparently, the authors of
DQA “recommend implementations of other methodologies for improvement” activities.
2.5.4 HDQM - Heterogenous Data Quality Methodology
```
The DQ methodology Heterogenous Data Quality Methodology (HDQM) by Batini et al.
```
[ 23 ] is an extension of the methodology CDQ and focuses on assessment and improvement
of all types of data, structured, semi-structured and unstructured. In contrast to CDQ,
Batini et al. [23] describe HDQM in much more detail and delivers also many practical
examples.
The main idea behind HDQM is “to map the information resources used in an organisation
to a common conceptual representation and [...] to assess the quality of data considering
such homogeneous conceptual representation” [23].
This idea has led to these main goals:
```
(i) reaching flexibility and modularity to supply adequate results for different users (i.e.
```
```
salesman or a software developer) and on different hierarchical levels (i.e. project manager
```
```
and a CEO).
```
```
(ii) assessing DQ for all organisational resources, defining DQ values for each element and
```
on each level and providing a broad selection for improvement strategies for achieving
certain quality targets. As an example, decision-makers want to improve the overall DQ
by five per cent, resulting in fewer costs and missed opportunities, by improving critical
resources first.
HDQM includes unstructured data because the authors see “great importance” in covering
these mostly neglected data sets. They argue that for example raw tables, item lists
or text files are often the first steps of aggregating information, before persisting them
in a database or other structured or semi-structured formats. Batini et al. [ 23] discuss
abstract concepts for possible ways to consider unstructured data, but do not go into
```
detail. Kiefer [ 59] gives a basic overview of unstructured data assessment (not specifically
```
```
about HDQM).
```
HDQM promises to bring more flexibility in their DQ dimensions and metrics. Batini et
al. [ 23 ] argue, that other DQ methodologies are often “hardwiring” certain approaches
to assess and improve specific dimensions. They want to generalize the approach so that
it can be applied to many different dimensions and each dimension can be customized if
necessary. Two dimensions are the focus of Batini et al. [ 23] to show the flexibility of its
```
methodology: Accuracy and Currency.
```
31
2. State of the Art
HDQM Meta Model
The HDQM meta-model shown in Figure 2.4 displays all the organisational models and
information, which is managed within the different steps of the methodology. This model
is the basis for all activities presented in this methodology.
Figure 2.4: HDQM meta-model [23]
An Organizational Unit is an integral part of a company which produces, uses and
processes data. Each organisational unit is characterized by internal structures and rules,
such as departments.
Processes are executed by or within an organisational unit and contain a sequence of
activities working in some way with provided data. DQ has a considerable impact on the
effectiveness and efficiency of any process.
```
ReSource (RS) defines any information source, that an organisational unit can access to
```
```
represent real-world entities in data. The term ReSource comes from two aspects: (i)
```
```
business assets or also called “resource”, and (ii) from the origin of data itself or “source”.
```
Databases, documents or data flows are typical RSs. The data represented in RSs can be
structured, semi-structured and unstructured.
```
A Conceptual Entity (CE) refers to any single concept of real-world entities, which can
```
be abstracted from the RSs in an organisational unit. A CE can be the abstraction of
e.g. customers, suppliers, machines or facilities. CE refers to a concept, which does not
have to show the information in the same way as it is presented in a RS. This means,
that two CEs could refer to the same object, such as a customer, but highlight different
information about them, for example, one CE focuses on acquired customers and the
other on possible new customers.
32
2.5. Data Quality Methodologies applicable to Enterprises
As an example of the importance of distinguishing between RSs and CSs, the same
customer can be important to two departments, such as “Sales RS” and “Finance RS”.
Finance RS tracks detailed and confidential information about customers, which are
required for complex tasks, such as customer acquisition simulations. Sales RS on
the other hand requires quick and easy access to customer directories, which can be
forwarded to different salespersons, without the risk of sharing confidential information
with unwanted third parties. The Sales RS could only contain the basic customer
information and a centralized RS used by Finance and could contain more complex and
detailed information.
Phases overview
HDQM provides guidance on how to measure, assess and improve DQ of organisations
by specific needs and constraints. This process consists of three main phases and each
phase is split up into a certain number of steps. The main phases are similar to the ones
in CDQ:
1. State reconstruction, which focuses on knowledge collection regarding all relevant
information of organisational units, processes, resources and conceptual entities.
2. Assessment, which aims to create quantitative evaluations of DQ problems by
measuring dimensions and comparing the results to the desired DQ targets.
3. Improvement, depending on the results of the assessment results certain improve-
ment activities are selected to increase the overall DQ levels.
Batini et al. [ 23 ] illustrated a typical but simplified HDQM workflow in Figure 2.5. This
workflow can differ depending on the company it is applied to and can be customized
according to the application domain. But exactly this flexibility and modularity of the
methodology is a big advantage of HDQM.
State reconstruction phase
As described previously for the DQ methodology CDQ and in [ 10], the state reconstruction
phase can be very complex and requires a lot of knowledge about the domain model
of the organisation. Especially the problem identification and reconstruction of all the
real-world aspects of the organisation in ReSources, Conceptual Entities and Processes
are critical for the success of this phase.
The problem identification task focuses on relevant DQ problems seen from different
directions by all the actors in the involved business processes. By focusing on the
subjective perception of the actors, the most relevant problems can be pinned down
beforehand. This subjective problem identification can be achieved by surveys and
```
interviews and will lead to results, such as that data is not updated frequently enough;
```
that unnecessary data is kept up-to-date, but necessary data is often not regarded as
33
2. State of the Art
Figure 2.5: HDQM’s phases, inputs and outputs [23]
```
important; customer data contains mistakes, for example, a facility has two different
```
addresses in two different databases.
After identifying all the data problems, the HDQM meta-model can be modelled. First,
```
the involved ReSources (RS) must be identified and classified. The next step involves
```
```
defining Conceptual Entities (CE) for each RS and their relationships to each other.
```
```
To achieve this task, (i) reverse engineering and (ii) schema integration are required. (i)
```
Reverse engineering aims to translate all the relations of structured, semi-structured and
unstructured RSs into one conceptual schema. This first process of reverse engineering
```
leads to the relevant CEs. (ii) Then, CE-CE relations are extracted from the acquired
```
knowledge. These relationships lead to a mapping between each RS and the related CEs
```
which creates a schema S. This mapping is formulated by mapping ( RS, S ) and leads to
```
multiple RS schemas, each containing sub-schemas of CEs.
The result of the reverse engineering task must be analyzed in the schema integration task.
In this integration task, the goal is to combine all the RS schemas into one final schema.
Combining them, there can occur conflicts between different CE schemas. The result
of this integration task is an integrated schema. At the end of the state reconstruction
```
phase, the knowledge of all the RSs and CEs provides: (i) a set of RSs with relevant
```
```
DQ dimensions, (ii) an integrated schema with relevant DQ dimensions, (iii) mappings
```
between all the RSs and CEs schemas S.
The results of this phase will be the groundwork for the assessment and improvement
phase as shown in Figure 2.5.
34
2.5. Data Quality Methodologies applicable to Enterprises
Assessment phase
```
The assessment phase consists of two steps: (1) resource ranking, and (2) DQ measure-
```
ment.
```
(1) Resource ranking:
```
Resource ranking measures the relevancy of all ReSources, which have been previously
identified. The measuring process of all RSs leads to relevance weights, which are used to
```
(i) define the importance of every RS and its corresponding DQ dimensions; (ii) obtain
```
```
risk/feasibility identifiers for each DQ improvement program; (iii) apply the composing
```
```
function on a RS to get DQ values for CEs.
```
```
(2) Data Quality Measurement:
```
This step is designed to evaluate the previously identified DQ problems. A selection of
relevant DQ dimensions and relevant metrics are applied to the RSs.
The steps of evaluating DQ depend heavily on the specific dimension as shown by Batini
```
et al. [ 23] and the case study they included in the paper. The results of this phase are (i)
```
```
the measured DQ values of the evaluated RSs per dimension and (ii) the composed DQ
```
values for each CE per dimension. These composed values are later used to calculate the
target values for the improvement activities.
The calculation of DQ dimensions Accuracy and Currency is given by Batini et al.
[ 23]. They refer to a combination of metrics which result in a DQ dimension. These
metrics were selected and designed to “be associated to RSs and corresponding CEs”.
Accuracy is defined by Batini et al. [ 23] as “the closeness between a value v and
another value v , of a domain D , which is considered as the correct representation” of
the real-world entity. Currency is defined as “Normalized Currency” and describes “the
ratio between Actual and Optimal currency” [ 23]. The DQ dimensions Accuracy and
Currency are described with formulas and detailed information on how they can be
applied to structured, semi-structured and unstructured data in the main source [ 23].
They suggest different calculation methods depending on the type of data structure.
Unstructured/heterogeneous data can be much harder to assess than structured or
semi-structured information, and therefore requires other approaches to assess them.
Improvement phase
The improvement phase is the final phase of HDQM. It is subdivided into three steps:
```
(1) DQ requirement definition, (2) DQ improvement activity selection, and (3) choosing
```
and evaluating the improvement processes.
```
(1) Data Quality Requirement Definition:
```
The desired target quality values of the improvement activities are set in this step. By
considering the current quality values collected in the previous phase, a process-oriented
analysis can be executed to achieve this task [10, 23].
A process-oriented analysis provides target values for improvement processes. This
analysis is based on the knowledge acquired in the previous phases and includes all the
35
2. State of the Art
RSs, CEs, organisational units and processes. To calculate attainable target values, first,
we need to calculate the current quality values as shown in Equation 2.13. This formula
divides the current value of process quality pqx of a process x and the current level of
composed DQ dqx of the y-th CE. The formula 2.13 calculates –xy which holds for a
specific CE.
–xy = pqxdq
y
```
[23] (2.13)
```
The formula 2.14 returns us the target quality of the y-th CE. To obtain the target quality
dqúy we need to divide the desired process quality pqúx with the –xy from the function
2.13.
dqúy = pq
úx
```
–xy[23] (2.14)
```
By calculating the desired target quality values at the CE level, we can propagate the
```
new target values for each RS as shown in Figure 2.6. At result 1) normalized DQ
```
```
composition values are calculated for three different RSs (RS1, RS2 and RS3), then at
```
```
result 2) on CE level, a normalized DQ value is calculated with the results of 1). Then at
```
```
“STEP 2” target values are created which are shown in result 3). “STEP 3” propagates
```
the defined target values on the RS level with regard to weighted relevancy.
Figure 2.6: Example for defining and calculating of target values [23]
```
(2) Selecting Improvement Activity:
```
After defining the data requirements for the application domain, a selection of optimal
DQ improvement activities can be made. This selection considers data-driven and
process-driven activities. In contrast to the previous step, this step regards data-driven
and process-driven improvement activities as equally important, because depending on
the target values and type of RSs they can be complementary [81].
36
2.5. Data Quality Methodologies applicable to Enterprises
The following improvement activities are listed for HDQM as useful optimization tools:
```
(i) Source improvement, analyses and optimizes data from first- or third-party data
```
```
providers [5]; (ii) Record linkage, can find, identify and link the same object in different
```
data sources. This activity can be used to compare and select the best fitting values of
```
redundant data [ 15, 101]; (iii) Process control, modifies processes for more control and
```
```
insight in the process itself, so they can be later redesigned more effectively [ 23]; (iv)
```
Process re-design, processes can be re-designed from scratch to rework initial flaws in
their designs, which lead to poor DQ values [89].
All these improvement activities produce a ReSource/Improvement-Activity matrix, which
marks all relevant improvement activities for the corresponding RSs. These overlappings
between RSs and improvement activities are used in the next step as a basis for improving
data sets and evaluating the results.
```
(3) Evaluation of Improvement Process
```
This step is designed to find the best-fitting improvement process, which contains an
arrangement of improvement activities regarding all RSs from the ReSource/Improvement-
Activity matrix. These evaluated improvement processes are called “candidate improve-
ment processes”, which are a sequence of the same or different improvement activities.
All “candidate improvement processes must include all activities needed to improve the
entire set of DQ dimensions measured”[23].
Figure 2.7: Two possible improvement candidate process flows A and B [23]
Figure 2.7 shows two candidate improvement processes A and B . This diagram was
simplified by adding the RS names R1, R2 and R3 instead of the ones from the case
37
2. State of the Art
study of Batini et al. [ 23]. It is included in this thesis to get a better idea of how the
evaluation of these two improvement flows could look like. As mentioned in [ 23], most of
the time two or three appropriate candidates are sufficient to cover all relevant choices. By
considering two or more candidates the possibility of overlapping improvement activities
```
gets higher (as seen in Figure 2.7 at steps 4.) and 5.).
```
The evaluation of each candidate process includes the cost required for the improvement
activities and the rate of achieving the target goals.
Calculating a cost/benefit ratio is a complex task in itself and is explained in more detail
by Loshin [ 63]. Improvement costs can be categorized into different types such as costs
of personnel, costs of equipment, costs of overhead, and licensing costs for software tools.
The cost is categorized in a way of “very low, low, medium, high, very high” for better
comparability.
The previously established quality target values for DQ dimensions are checked by
comparing them to quality improvement values. This comparison process is done by
applying qualitative heuristic approaches and leads to categorical classifications such as
“below target, on target, higher than target, and much higher than target”. This approach
is done for all selected candidate improvement processes and in the end, all the results
lead to a table as shown in Figure 2.8.
Figure 2.8: An example for a possible evaluation result of two candidate improvement
processes [23]
In Figure 2.8 two DQ dimensions Currentness and Accuracy are evaluated for the two
candidate improvement processes A and B. The “Effects on DQ dimensions” illustrates
how effective the improvement process and “Cost” tells us how expensive the improvement
would be. With this knowledge, a decision-maker can make an easier decision on what
improvement activities should be applied.
As mentioned in the conclusion of [ 23] HDQM is a “high-level and general-domain
methodology”. This means, that it is designed to give guidance on how to apply known
techniques and methods. It can be a complex and demanding task, to apply the introduced
concepts of HDQM on an enterprise domain model, which requires a lot of work from
key stakeholders and management staff.
38
2.5. Data Quality Methodologies applicable to Enterprises
2.5.5 HIQM - Hybrid Information Quality Management
```
Hybrid Information Quality Management (HIQM) is fundamentally a DQ methodology to
```
support solving quality problems during data-access-tasks. By analyzing and highlighting
critical points in data flows, these can be continuously monitored and improved. Most of
the following information about HIQM is from Cappiello et al. [ 22], the main source of
this methodology.
Overview
HIQM is based on four main phases, which are found in a similar way in almost every
```
DQ methodology: (1) Data Quality Defintion, (2) Measurement, (3) Analysis, and (4)
```
Improvement. In HIQM these phases are generally described as:
```
(1) Data Quality Definition:
```
DQ definition, identifying all relevant DQ dimensions.
```
(2) Measurement:
```
Measuring the quality of information with help of DQ metrics to capture the current
state of data sets.
```
(3) Analysis:
```
Evaluating quality problems with identified DQ dimensions and measured results from
```
phases (1) and (2).
```
```
(4) Improvement:
```
```
Uses evaluation results from phase (3) to find root causes of DQ problems, select proper
```
improvement activities, apply them, and compare improvement results to target values,
to verify the improvement success rate.
These four main phases are iterated continuously over time for better DQ assurance.
Proper knowledge of the business context, organisational processes, organisational units
and of all the stored data, are the foundation of HIQM’s methodology. Identifying critical
points in business processes 1 and tasks are important for effective improvement activities.
These critical points can be for example data sources, of a specific task, which delivers
regularly new data. If this data input is done with incomplete data or maybe if the task
itself has flaws, this can be identified and improved for fewer DQ errors. These errors
can be identified by monitoring tasks and processes during run-time and reacting to
changes dynamically. In HIQM such critical points are called data quality blocks. These
DQ blocks are used to monitor data flows.
Data-tracking methods are required to determine where the causes of errors originate
from [ 7]. With the help of these data tracking methods, a process and the associated
data flow can be modelled and the designed models are the basis for detecting errors
and correcting them. In HIQM a proposed data-tracking method is Information Product
1A business process can contain multiple business tasks
39
2. State of the Art
```
Map (IP-MAP) [ 87]. IP-MAP is used to graphically describe the business process, with
```
which data is created or updated. One way of representation in IP-MAP is the previously
mentioned data quality blocks. These DQ blocks “represent the checks for DQ” on certain
data flows and the transported data items [22].
After detecting DQ problems, DQ goals and targets can be set for “acceptable minimum
values associated with the set of DQ dimensions” [ 22]. These DQ goals and targets can
be reached by data-driven and process-driven improvement techniques.
As mentioned by Redman [ 81] data-driven improvement methods, such as data bashing
or data cleaning, can be used to improve the accuracy and consistency of data sets.
Data-driven approaches are best used on not frequently updated data sets because they
do not have the goal to improve processes and data flows, but the final data items saved
in a database for example.
Another way to improve data is with the help of process-driven improvement methods.
This approach analysis the cause of data errors and tries to fix them permanently “through
changes in data access and update activities” [ 22]. Process-driven methods are better
suited for data elements, which are created and updated more frequently [ 81]. These
data- and process-driven improvement methods were mentioned but not described in
more detail in HIQM.
Main Phases and Step Composition
The HIQM methodology is composed of four phases, which are present in most DQ
methodologies. These four phases are split up into eight steps, which can each be assigned
to a phase. All the steps and their relations to each other are shown in Figure 2.9.
Figure 2.9: HIQM step architecture [22]
The steps shown in Figure 2.9 can be assigned to the following classical DQ phases:
40
2.5. Data Quality Methodologies applicable to Enterprises
• Definition phase: IQ Environment Analysis, Resource Management, and Data
Quality Requirements Definition steps
• Analysis and Monitoring phase: Data Quality Measurement, and Analysis & Moni-
toring steps
• Improvement phase: Improvement, and Strategy Correction steps
The Warning Management step is a unique contribution of the HIQM methodology for
real-time warning management, which can also be seen as its own Warning phase and
therefore was not included in any other phase.
Definition Phase
```
The Definition phase is designed to acquire knowledge for the steps (i) IQ Environment
```
```
Analysis, and (ii) Resource Management. After acquiring knowledge about processes and
```
```
organisational structures, the (iii) Data Quality Requirements Definition step is executed.
```
```
In step (i), data sources, processes and stakeholders of the organisations are identified. An
```
analysis of the feasibility of implementing DQ improvement strategies at the organisation
is done after identifying all the relevant objects. Critical risks and risk-success factors
are specified during this analysis.
After analysing all the organisational structures and problems, this information is used
```
in step (ii) to define and specify all previously identified relevant data sources, processes
```
and stakeholders as resources.
```
Step (iii) focuses on user perspectives and is the most important part of the Definition
```
phase. A user perspective is defined as how a user accesses, interacts and manipulates
dates. These user perspectives can be classified into three main categories:
• Enterprise consumers: Employees, which work at an organisation and work with
data every day. These users can have any role in the organisation.
• Supplier consumers: External users and other organisations, which cooperate with
the organisation to achieve common goals
• User-end consumers: Customers which benefit from the increased DQ, more reliant
outputs of business processes, and purchased products and services.
Different user perspectives establish the importance of DQ dimensions to them and to
their user-specific tasks. This information is collected and displayed in a decision matrix
D , in which “each element dij represents the relevance of the i-th quality dimension
along the j-th user perspective” [ 22]. Additionally, each business process is evaluated by
creating a hierarchy of DQ dimensions and specifying the relevancy of each dimension to
the process. This identification and evaluation is done by users weighing them with a
41
2. State of the Art
weight wik for the relevance of the “i-th dimension in the success of the k-th business
process” [22]. Before evaluating all the user perspectives, the participation factor of each
user class in any business process must be identified. This is achieved by calculating the
participation coefficient rjk of the “j-th user class in the k-th business process” [22]. At
```
the end of step (iii) the evaluation Ejk of a j-th user perspective and a k-th business
```
process results in the Equation 2.15:
```
Ejk = rjk ·
```
Iÿ
```
i=1
```
```
dij · wik[22] (2.15)
```
After applying Equation 2.15 on each business process and related user perspectives, the
result is a list of scores for each business process. The highest scores of each list for each
business process lead to “the most important user perspective for each business process”
[ 22] which can be used to create a ranking of important DQ dimensions and metrics for
assessment and improvement activities. Assessment and improvement activities are done
in the phases summarized as “Data Quality Evaluation Phases”.
Data Quality Evaluation Phases
HIQM’s Measurement, Analysis and Improvement phases are collectively called Data
Quality Evaluation Phases. Similar to previously introduced DQ methodologies, the
Measurement phase consists of DQ measurement algorithms for each dimension and the
results are the basis for the Analysis phase, in which the resulting metrics are compared
to previously set quality requirements and goals. The Analysis phase can be seen as the
evaluation of the measurement processes. If these goals are not met, suitable improvement
activities are selected depending on the type of data, data source, and update frequency,
which can lead to data-driven or process-driven improvement techniques. In critical
situations, an underlying strategy can also be modified in the Strategy Correction step.
This can result in changing business processes or workflows of employees.
Monitoring and Recovery Support
The Warning phase is an original contribution by the DQ methodology HIQM, which
```
presents the possibility to analyse and improve data during run-time (i.e. while accessing
```
```
data sets). In general, it is a Warning Management System, shown in Figure 2.10, which
```
allows real-time data and processes monitoring.
Figure 2.10 displays all components of the Warning Management System. The core
component of the architecture is the Message Generator, which handles messages from
the Diagnoser and Internal/External Feedback modules, by logging them in Warning Log
Databases and forwarding them to the Warning Analyzer. The modules Diagnoser and
Internal/External Feedback are responsible for monitoring and detecting anomalies in
the data management processes. Especially the Diagnoser is very important, because it
identifies and manages fault and warning events. The Diagnoser module contains three
42
2.5. Data Quality Methodologies applicable to Enterprises
Figure 2.10: Architecture of the Warning Management System [22]
```
submodules for monitoring: (i) System Discrepancy Analyzer, detects discrepancies which
```
```
occur between internal and external data sources (i.e. customer sends information which
```
```
differs from the own customer data set); (ii) System Inconsistency Analyzer, identifies
```
```
inconsistencies between real DQ values and target goals/requirements; (iii) System
```
Monitoring, monitors the system and it’s behaviour to detect faulty data, anomalies or
outliers. Additionally to the Diagnoser, there is the possibility to provide feedback through
an Internal/External Feedback module, which can notify the system of DQ problems.
```
Feedback can be categorized as (i) External feedback, generated by an external application;
```
```
(ii) Internal feedback, generated by an internal system; (iii) Subjective feedback, generated
```
based on an survey. If a problem is identified, the information is sent to the Message
Generator, and it creates a warning message for further processing and intervention. The
Warning Analyzer processes the previously generated warning messages and accordingly
to problem detection and correction algorithms from the Warning/Recovery Database
```
tries to find solutions (also called recovery actions) to solve these DQ problems. If the
```
Warning Analyzer found an appropriate recovery action for the problem, the Real Time
Recovery module applies these actions and monitors their impact on the system. After
recovering/improving DQ in real-time through the Real Time Recovery module, the
classical measurement and assessment phases of the systems domain model are triggered
to update its DQ metrics and check for changes in other parts of the system.
Improvement Phase
Even though the improvement phase is illustrated in Figure 2.9 and many mentions of
improving data were given in Cappiello et al. [ 22] no suggestions on how to implement
43
2. State of the Art
such activities in practice were provided. This also includes the mention of data- and
process-driven improvement activities in this section. No concrete mention of how these
can be applied and realized was given.
2.5.6 TDQM & TIQM
In the planning phase of this thesis, the DQ methodologies TDQM and TIQM were
considered for possible solutions for this thesis problem statement. After looking into
different sources regarding these two methodologies [ 14, 12, 26, 99, 36] and talking to
researchers in this field it became clear, that these methodologies are not well suited
for this thesis’s goal. Both, TDQM and TIQM, are sophisticated and well-researched
methodologies, and due to their release dates in 1998 and 1999, served as a basis for many
other DQ methodologies. A big limiting factor of especially these two methodologies is
the fact, that they “require a considerable personalization effort before application” [ 22].
Additionally, both methodologies provide only guidelines for implementing DQ actions
without listing any specific assessment, monitoring or improvement algorithms [22].
2.6 Data Quality Tools
A recent DQ tool survey by Ehrlinger et al. [ 35] is the basis for this thesis to provide
a selection of fitting tools for further assessment. The survey of Ehrlinger et al. [ 35]
was conducted based on a systematic search and a random search on the internet and
took into account previous tool surveys such as [ 25, 80, 96, 43, 60, 8]. Hundreds of free
and commercial DQ tools are available on the internet. These tools can differ wildly
in complexity and scope. Some are built as simple deduplication tools and others are
designed for big complex data structures [ 35]. Based on the following criteria the DQ
tools evaluated in this thesis were selected:
1. The tool is still available to acquire either as an open-source or commercial version.
2. The tool is available as a free trial version (if commercial).
3. The tool is not deprecated or was replaced by a newer version.
4. The tool provides any DQ measurement or assessment capabilities. These capabili-
ties can include functionalities, such as the application of typical DQ dimensions,
metrics or business rules.
```
Ideally, the tools can provide (i) any form of improvement capabilities, (ii) support
```
```
different data sources, (iii) support different data structures and types, and (iv) user
```
```
interfaces (either web-based or on desktop). This thesis does not assess the user interface
```
and usability, because the aim is to provide an overview rather than an in-depth analysis.
The following subsections describe the 6 most popular tools in detail.
44
2.6. Data Quality Tools
2.6.1 Informatica Data Quality
```
Informatica Data Quality (IDQ) is part of a commercial data management solution
```
published by Informatica2 , which is listed by Gartner [ 25] in their Magic Quadrant of
Data Quality Tools as a leader for the last several years. They provide a 30-days trial
version for testing purposes. Informatica provides desktop and web-based applications
for different user types.
The IDQ tool is a server-side backend application. The capabilities of IDQ include data
profiling, measurement, connecting to different data sources, and cleansing functionalities.
Informatica’s approach to DQ measurement and assessment is, according to Ehrlinger et
```
al. [ 35], the closest to (theoretical) DQ methodologies in regard to DQ dimensions and
```
metrics.
Informatica is one of the biggest developers of commercial data management software
[ 35 ]. Information about the capabilities of IDQ was hard to come by because Informatica
does not release many white papers with relevant information or any other data. Two
data sheets describe in a bit more detail what the IDQ tool can do [ 54 , 53]. Other than
that, most of the information is superficial and provides only an abstract idea of the
software’s functionality. Therefore this thesis will lean on the information of Ehrlinger et
al. [35], data found on their website and in white papers.
Their documentation contains two interesting sources regarding their DQ tool which
describes the configuration [ 55] of IDQ and one of its features “Address Validation”, and a
more in-depth description [ 56] of the tool and how developers can set up their environment
in regards to IDQ. Ehrlinger et al. [ 35] perceived the web-based user interface of IDQ easy
to use and the desktop application as a more powerful solution for technical personnel.
2.6.2 Experian Aperture Data Studio
Another commercial data management application company is Experian 3 with their
```
software product Experian Aperture Data Studio (EADS). Ehrlinger et al. [ 35] surveyed
```
the predecessor software product Experian Pandora4 , which was replaced by EADS.
Previously Experian Pandora and now Experian Aperture Data Studio were listed by
Gartner Gartner [25] in their Magic Quadrant of Data Quality Tools.
Experian provides in-depth documentation, which is also publicly available for their
application EADS [ 40]. Similarly to Experian Pandora, EADS contains data profiling,
measurement, creation of business rules, monitoring, improvement and different data
source connectors. These features were collected by analysing the documentation of
the DQ tool provided by Experian. No other paper can be found regarding the tool’s
usability, but Ehrlinger et al. [ 35] described the predecessor software Experian Pandora
```
2https://www.informatica.com/products/data-quality.html (02.10.2022)
```
```
3https://www.edq.com/data-quality-platform/ (02.10.2022)
```
```
4https://www.experian.co.uk/data-quality/experian-pandora/index (26.10.2022)
```
45
2. State of the Art
as a good user experience for business users and a very good experience for technical
users.
2.6.3 Talend Open Studio
```
Talend Open Studio (TOS) is one of two DQ products released by the company Talend 5 .
```
The second DQ product of Talend is called the “Talend Data Management Platform”,
which requires a paid subscription and is their commercial solution. Gartner mentions
Talend as an industry leader in the Magic Quadrant of DQ Tools [ 25]. As mentioned by
Ehrlinger et al. [35] the software TOS is one of the most cited DQ tools.
Different papers looked into the capabilities of TOS [ 80, 96, 43]. The open-source and
free TOS application can compete with several other commercial tools in the areas of
business rule management, data profiling, and user interface experience. In other aspects,
such as DQ monitoring and measurement, the paid enterprise version is required [ 35].
TOS can be found on GitHub6 and was at the time of writing still maintained there.
The documentation by Talend is not as well structured and accessible as by Informatica
or Experian. No matching white papers or other forms of documentation were found on
their website for a deeper look into its capabilities. The help page of Talend provides
guides for installing and starting out with TOS [ 91, 92], which provide also information
about features and user interfaces.
2.6.4 MobyDQ
```
MobyDQ (MDQ) 7 is an open-source DQ solution, which focuses on automating DQ
```
checks during data pipeline runs, catch DQ issues and triggers alerts. Data pipelines
are processes, which can be triggered when data changes, new entries get added or
information is removed. The application is available on GitHub 8 and was at the time of
writing still maintained by contributors.
It was initially developed by Ubisoft Entertainment, and as an open-source version
released with changes to context-dependent configurations regarding the company Ubisoft.
Concrete documentation of the open-source tool is provided on their GitHub page,
including a “Get started” guide and explanations of architecture, configuration options,
integration possibilities and tools used. A few parts of the documentation are missing
details or contain placeholders indicating that there should be an explanation for certain
functions. The documentation is partly unfinished on GitHub and on the project’s
website. The focus of MDQ is the creation, application and automation of DQ checks
[35]. It provides a user interface for the configuration and analysis of data.
```
5https://www.talend.com/ (02.10.2022)
```
```
6https://GitHub.com/Talend/tdq-studio-se (02.10.2022)
```
```
7https://ubisoft.GitHub.io/mobydq/ (02.10.2022)
```
```
8https://GitHub.com/ubisoft/mobydq (02.10.2022)
```
46
2.6. Data Quality Tools
2.6.5 Great Expectations
```
Great Expectations (GX) 9 is an open-source DQ tool built in Python, which focuses
```
on validating, documenting and profiling data in all their states, to maintain quality
and give data engineers feedback for improvement. In general, it is designed as an
automated testing tool for data pipelines. It validates existing and new data entries
with the help of expectations. An expectation is an assertion of data entries. Every
expectation is formulated in a declarative language and is designed as a Python method.
```
Each expectation contains an assertion target (i.e. column name), minimum, maximum
```
values, not null and many more configuration possibilities [88].
Similarly to automated testing in software development, an expectation can be seen as a
test case, which gets executed by a data pipeline and with which new data entries can be
checked for custom rules, such as if a value is between a minimum and maximum range.
After checking all the expectations, test documentation gets generated, which can be
viewed in static HTML pages and exported in file formats, such as JSON, for further
analysis.
The documentation includes graphs and analytics regarding the executed test runs, but
the tool can not be configured by a user interface. All configurations must be done in the
command line window or with a text editor [ 95, 94]. Great Expectations is available on
GitHub 10 and it is remarkable how many contributors work on it. It is the most updated
and maintained GitHub project of all open-source solutions. The documentation [37] is
very detailed, both on the GitHub page and the project’s website. The community of
GX seems to be a big and active one.
```
9https://greatexpectations.io/ (02.10.2022)
```
```
10https://github.com/great-expectations/great_expectations(02.10.2022)
```
47
CHAPTER 3
Requirement Elicitation
This chapter describes the elicitation process of the enterprise’s requirements in regards
to DQ, which is based on their domain model and future plans on digitizing the company.
Section 3.1, illustrates the process of how the later discussed enterprise requirements were
acquired. The results of this process are converted into multiple requirement tables, which
are split up into catalogues: “Enterprise Requirements”, “Methodology Requirements”
and “Tool Requirements”. In Section 3.2, all the relevant enterprise requirements are
presented in Table 3.1 and described. Section 3.3 provides, based on the enterprise
requirements and other research, a specific requirement catalogue for DQ methodologies.
The final Section 3.4 of this chapter defines requirements for DQ tools, which are also
based on the enterprise references and other literature.
The requirements derived in this chapter serve as a basis for evaluating the DQ method-
ologies and tools in Chapter 4 and 5.
3.1 Elicitation Process
This section describes the elicitation process of the enterprise’s requirements. This
consolidation of requirements was done in a structured and systematic way with the
company’s stakeholders over multiple iteration cycles, as shown in Figure 3.1. At the
start of this thesis, internal consolidation processes of the collaborating company were
already in operation, which was created to support their digitization tasks. Stakeholders
at the company need much more clarity about what data the corporation owns, where it
```
is stored, how it can be accessed, how many copies of the (partially) duplicate entries
```
exist in different databases, and in which state it is. For these reasons, Requirement
```
Catalogue (RC)s were created internally. These requirements do not only cover topics
```
which are relevant to this thesis but many more areas of digitizing business processes,
merging different data sources, reducing the overhead of employees where it can be done,
and many more.
49
3. Requirement Elicitation
Figure 3.1: Requirement elicitation process in cooperation with stakeholders of enterprise
Figure 3.1 shows the systematic approach used to acquire the requirements presented in the
following sections. At the beginning of the requirement elicitation process, stakeholders
were interviewed on what is important to them regarding data. These aspects included:
how data was stored, which department or organization owned identical information, and
their expectations regarding DQ assessment activities. After collecting information about
the needs of the stakeholders, literature research was conducted on DQ methodologies,
which can fulfil some or ideally all of these requirements. Then, if new findings were
acquired during research, the stakeholders have been consulted again. With the results
of the consolidation process, previously defined requirements were adjusted, and the
stakeholders were contacted again for an update. After this adjustment phase, the
stakeholders were contacted again about their requirements. Literature research was
conducted based on this new knowledge. This loop was repeated until no further
information could be acquired, which could have been interesting to the stakeholders. In
the end, the enterprise Requirement Catalogue was finalized and the resulting requirement
table is shown in the next section. All the following requirements are given an identifier
which is RC.
3.2 Enterprise Requirements
The following requirements shown in Table 3.1 were created by internal consolidation
processes of the collaborating company during their digitization processes and accumulated
as described in the previous Section 3.1. These requirements are also supported by
literature regarding CIS found in [ 69, 62, 30]. The following paragraphs describe each
requirement shown in detail in Table 3.1. Table 3.1 has two columns. The first column
contains the RC identifiers, and the second column provides a short description of the
requirement.
```
All these requirements are grouped into three requirement (RQ) categories. These three
```
```
RQ categories are (i) inter-, (ii) intra-organisational and (iii) DQ requirements. (i)
```
covers requirements which are dependent on communication and cooperation between
```
multiple organisations. (ii) focuses on requirements which can be fulfilled by a single
```
50
3.2. Enterprise Requirements
ID Description
RC-1.01 Supports multiple organisations in system architecture
```
RC-1.02 Supports data distribution over numerous organisations (decentralized)
```
RC-1.03 Organisations are independent of each other, and have unique and also common goals [69]
```
RC-1.04 Provides standardized communication methods between organisations (i.e. XML, JSON)
```
```
RC-1.05 Validates transmitted information (trust in data transmission) [69]
```
```
RC-1.06 Considers different data models of the same real-world object in various organisations(storing the same object with a different focus on information, i.e. HR and Finance)
```
```
RC-1.07 Supports multiple types of data sources(relational databases, REST APIs, text documents i.e. service contracts)
```
RC-1.08 Highlights data duplicates
RC-1.09 Highlights data inconsistencies
RC-1.10 Highlights outdated information
RC-1.11 Updates data object in one organisation if another organisation has a newer versionof a real-world entity
RC-1.12 Supports custom business rules for data objects [30, 35]
RC-1.13 Compares two data entries of the same object and highlights differences [69]
RC-1.14 Measures data quality levels of a single organisation [69]
RC-1.15 Assesses data quality levels of a single organisation [69, 62]
RC-1.16 Assesses data quality levels of all organisations [69, 62]
```
RC-1.17 Provides easy to understand metrics for decision makers(i.e. overall data quality of system is 70%)
```
```
RC-1.18 Improves data quality levels of organisation(s)
```
RC-1.19 Provides methods for automatic improvement of data entries
RC-1.20
Supports cost and benefit analysis of improvement activities.
How much will the improvement of DQ cost?
What are the benefits of DQ increase for the company in percentages? [6]
```
RC-1.21 Provides methods for improvements on structural levels (i.e. architecture, data models)
```
Table 3.1: Requirements acquired from collaborating company and based on research
results of CIS requirements [69, 62, 30]
```
organisation. (iii) summarizes requirements related to DQ topics such as measuring,
```
assessing, improving and monitoring.
3.2.1 Inter-organisational Requirements
RC-1.01: Supports multiple organisations in the system’s architecture
```
RC-1.01 defines the need for multiple (partially) independent organisations in one
```
corporate structure, which require a way to share data with each other.
RC-1.02: Supports data distribution over numerous organisations
RC-1.02 requires support for data distribution over multiple organisations and databases.
Such a distribution of information could be employee data, which is managed by one
department but also is required for business processes in other departments. This
distributed data can be managed by each organisation or by one and distributed to others
if needed.
RC-1.04: Provides standardized communication methods between organisa-
51
3. Requirement Elicitation
tion
RC-1.04 checks if standardized communication interfaces are defined between organisa-
tions. For example, all parties agree on one data model, which is used to transfer data
between them. This standardized data model is only used for transmitting data between
organisations but does not affect the format of internal data storage. With this aspect in
mind, not every organisation must convert their data structures to one universal one,
but only requires a transformation of the received data model to their internal storage
format. For transmitting data, data formats such as JSON or XML, can be used.
RC-1.05: Validates transmitted information
RC-1.05 requires mechanisms, which ensure the validity and correctness of data trans-
mitted between organisations. In general, each organisation has to trust the transmitted
data of another one. This validity of data could be ensured by using encryption or a
third-party verification application. This requirement was inspired by Mecella et al. [ 69].
RC-1.11: Updates data object in one organisation if another organisation has
a newer version of a real-world entity
RC-1.11, if data of the same real-world entity is distributed between multiple organisations
or data sources, a mechanism for updating older versions of this entity should be triggered
automatically or at least it should be done in regular intervals. Ideally, this update
operation should be triggered when a real-world entity experiences changes and is reflected
in some digital form.
3.2.2 Intra-organisational Requirements
RC-1.03: Organisations are independent of each other, and share unique and
common goals
The requirement RC-1.03 focuses on CISs, which provide the possibility to achieve
common goals beyond organisational structures, by cooperating and sharing information
with each other. Large enterprises can be composed of multiple organisations, which
exist independently from each other, but share common goals and need each other to
fulfil them. This requirement was inspired by the description of Mecella et al. [69].
RC-1.06: Considers different data models of the same real-world object in
various organisations
RC-1.06 checks if the same real-world entity is represented in different organisations, but
only some organisations need this entity’s information. For example, two departments
have information on the same employee stored. One focuses on technical aspects, and
the other focuses on information such as living addresses and social security numbers.
Such information is, in practice, often distributed over multiple organisations. Often it is
easier for organisations to store the relevant information in their databases instead of
going through all the bureaucracy to access the required data of another organisation
or even instructing them to make specific changes to an employee data set, which takes
much longer than doing it yourself.
52
3.2. Enterprise Requirements
RC-1.07: Supports multiple types of data sources
Stakeholders describe the requirement RC-1.07 as the need for different data sources,
which must be accessed at some point. This means integration options for relational
databases, REST APIs or documents such as contracts or textfiles should be provided.
3.2.3 Data Quality Requirements
RC-1.08: Highlights data duplicates
RC-1.08 can be fulfilled if a solution can recognize data duplication in one or multiple
databases. This data duplication should be recognizable on column, table and database
levels.
RC-1.09: Highlights data inconsistencies
RC-1.09, if data entries of the same object are inconsistent, there is a need for detection
algorithms, which can highlight these problems and ideally provide information on how
severe they are.
RC-1.10: Highlights outdated information
RC-1.10, data elements can be stored for a long time without being checked for their
timeliness. Data must be kept up-to-date in all data sources. If for example a person
worked in one team and changed to another team, but the data entries of this employee
do not reflect this change, this requirement is not fulfilled.
RC-1.12: Supports custom business rules for data objects
RC-1.12, creating custom business rules for data objects is more important to a company
than general DQ dimensions. Therefore it is necessary for an enterprise to create rule
sets for data, so it can be easily evaluated if it fulfils them. Ehrlinger et al. [ 35] listed
the need for business rules as very important to enterprises in practice.
RC-1.13: Compares two data entries of the same object and highlights
differences
Stakeholders require the option RC-1.13 to compare data sets of the same real-world
entities. The data objects should contain the same information, even if only parts of the
information are relevant and therefore not present in one data object. As an example,
a comparison of stored addresses in the company’s databases and publicly available
address register platforms. This way, stakeholders could get information about the state
of certain data objects. This requirement was inspired by Mecella et al. [69].
RC-1.14: Measures data quality levels of a single organisation
With requirement RC-1.14 the need for measuring Data Quality of a single organisation
is formulated. This measurement should provide stakeholders with information about
the state of their organisation’s databases. This requirement was inspired by Mecella et
al. [69].
RC-1.15: Assesses data quality levels of a single organisation
RC-1.15 builds on the acquired measurement data of RC-1.14 and evaluates the DQ of a
single organisation. This is done by putting the gathered information into context weighing
53
3. Requirement Elicitation
its importance, applying rule sets and producing percentage values for stakeholders. This
requirement was inspired by Mecella et al. [69] and Liu et al. [62].
RC-1.16: Assesses data quality levels of all organisations
If the previous requirement could be fulfilled, RC-1.16 would be the next step in assessing
all the gathered DQ information of every single organisation and combine all the data
into one assessment process for the complete organisational structure. This requirement
was inspired by Mecella et al. [69] and Liu et al. [62].
RC-1.17: Provides easy-to-understand metrics for decision makers
RC-1.17 requires all the previously collected DQ assessment data and processed as
easy-to-understand quality values. Stakeholders often are not familiar with technical
details in data management and specific metrics, therefore it is important to prepare the
results in an understandable form, such as percentage values which could describe “the
company XYZ has an overall DQ level of 85%”. This kind of easy-to-understand data
should be provided for each level of the organisational hierarchy, such as the CEO level,
the department, or the team level.
RC-1.18: Improves data quality levels of organisations
The requirement RC-1.18 describes the need for improvement mechanics based on DQ
assessment operations. These improvement mechanics could be recommendations provided
to data specialists, manual or automatic approaches. All these improvements should be
applicable to a single organisation and ideally all organisations. This requirement defines
the general need for improvement methods and does not specify any specific approaches,
such as automated or manual activities, or structural improvement recommendations,
which are covered by other requirements.
RC-1.19: Provides methods for automatic improvement of data entries
RC-1.19 expands the previous requirement and requires automatic improvement methods
with the help of data pipelines or other solutions, which could be triggered if, for example,
new data is added in a database or if regularly scheduled DQ checks find improvement
possibilities in databases.
RC-1.20: Supports cost and benefit analysis of improvement activities
Stakeholders are often interested in RC-1.20, which focuses on cost-benefit evaluations
of DQ improvement operations in their companies. An important question to answer
is always if certain improvement tasks can be more beneficial to the company than its
costs. Additionally, stakeholders want to know if the benefits are only marginally better
or if it can bring, let’s assume, a big increase in efficiency.
RC-1.21: Provides methods for improvements on structural levels
RC-1.21 defines the requirement for improvement mechanics on structural levels, such
as architectural changes, updating data models or redesigning business processes. This
requirement was inspired by Bai et al. [6].
54
3.3. Methodology Requirements
3.3 Methodology Requirements
```
Based on enterprise requirements (see Table 3.1) regarding DQ in corporations, a catalogue
```
```
of specific requirements tailored for DQ methodologies was designed (see Table 3.2).
```
These requirements are based on essential aspects of DQ methodologies, which were
inspired by the following sources [ 12, 26, 69, 33]. The following paragraphs describe every
requirement shown in Table 3.2 in more detail for a better understanding. Table 3.2 is
split up into three columns. The first column contains the RC identifiers, the second
column provides a short description of the requirement, and the third column references,
on the one hand, the related enterprise requirements of Table 3.1 and, on the other hand,
gives a reference to other sources if this requirement was taken from other sources.
```
All these requirements are grouped into three requirement (RQ) categories. These three
```
```
RQ categories are (i) enterprise and CIS, (ii) DQ assessment and (iii) DQ improvement
```
```
requirements. (i) covers requirements which are dependent on communication and
```
```
cooperation between various organisations, and relate to CIS aspects. (ii) focuses on
```
```
DQ assessment requirements. (iii) summarizes requirements related to DQ improvement
```
topics.
3.3.1 Enterprise and CIS Requirements
RC-2.01: Supports the distribution of data over multiple organisations
Requirement RC-2.01 focuses on a must-have aspect of relevant DQ methodologies, which
is supporting distributed data. This requirement is based on enterprise requirements
RC-1.02 and RC-1.06, which focus on the one hand on data distribution over multiple
organisations and on the other hand on the same real-world entity represented in different
data sources. The importance of differentiating between DQ methodologies based on the
ability to distribute data can be found in Batini et al. [12].
RC-2.02: Supports cooperative/enterprise application areas
Requirement RC-2.02 references the enterprise requirement RC-1.03, which focuses on
big enterprise system architectures. These system architectures can include multiple
```
(sub-)organisations, which have due to their company history different data models as
```
a basis for their business tasks, but they have to work together to fulfil common goals.
This cooperation includes sharing important data with other partnering organisations.
RC-2.03: Supports CIS architecture
Evaluating DQ methodologies, which support CIS architectures is one of the goals of
this thesis. Therefore the requirement RC-2.03 determines the general usability of DQ
methodologies in the focus of this thesis. Many DQ methodologies can fulfil requirements
of CIS and large enterprises, even though they are not specifically designed for them
[84, 12, 69].
RC-2.06: Specifies a concrete architecture and how it could be realized
Requirement RC-2.06 is based on the enterprise requirements RC-1.01 and RC-1.02. It
was also defined with the knowledge in mind, that a lot of DQ methodologies lack concrete
55
3. Requirement Elicitation
ID Description
Based on
RC-x.xx
& Source
RC-2.01 Supports distribution of data 1.02, 1.06,[12]
```
RC-2.02 Supports cooperative/enterprise application areas(different entities/organisations work together, share data) 1.03
```
RC-2.03 Supports CIS architecture 1.01
```
RC-2.04 Supports adding and customizing of (business) rules 1.12, [35]
```
RC-2.05 Supports adding and customizing of dimensions and metrics 1.12, [26]
RC-2.06 Specifies a concrete architecture and how it could be realized 1.01, 1.02
RC-2.07 Specifies concrete data models for transmitting data betweenentities/organisations 1.04
```
RC-2.08 Describes how trust between organisations can be established(i.e. quality certificates) 1.05, [84]
```
RC-2.09 Supports objective assessment methods 1.14, 1.15,1.16, [26]
RC-2.10 Supports subjective assessment methods 1.14, 1.15,1.16, [26]
RC-2.11 Supports dimension Accuracy 1.11
RC-2.12 Supports dimension Completeness 1.13
RC-2.13 Supports dimension Currency/Timeliness 1.10
RC-2.14 Supports dimension Consistency 1.09
RC-2.15 Supports other dimensions 1.08
RC-2.16 Suggests improvement activities 1.18, 1.19,1.21
RC-2.17 Provides auditing strategies for assessment and improvement 1.17
RC-2.18 Supports Data-Driven Improvement 1.18, 1.19,[26]
RC-2.19 Supports Process-Driven Improvement 1.18, 1.19,[26]
RC-2.20 Provides data quality cost/benefit consideration methods 1.20, [26]
RC-2.21 Supports Structured Data 1.07, [12]
RC-2.22 Supports Semi-Structured Data 1.07, [12]
RC-2.23 Supports Unstructured Data 1.07, [12]
Table 3.2: Requirement Catalogue for DQ methodologies
56
3.3. Methodology Requirements
suggestions on how to design a system architecture, which supports DQ assessment and
ideally improvement. A few methodologies, which give proposals on architecture designs
are DaQuinCIS, HDQM and HIQM. Other methodologies, such as CDQ, DQA, TDQM,
and TIQM lack any concrete and specific information in this area.
RC-2.07: Specifies concrete data models for transmitting data between entities
or organisations
RC-2.07 focuses on concrete recommendations of DQ methodologies on how to transmit
data between organisations. It is based on the enterprise requirement RC-1.04, which
requires a standardized way to communicate between organisations. A standardized data
format and data model are required for transmitting data efficiently and completely.
RC-2.08: Describes how trust between organisations can be established
Requirement RC-2.08 ensures that transmitted data between two organisations can be
trusted by each other. This is very important for enterprise applications for workflow,
quality standards and productivity reasons [ 68]. The enterprise requirement RC-1.05 was
the basis for this requirement. The methodology DaQuinCIS suggests a rating service as
one part of the system architecture, which ensures, that transmitted data can be trusted
by other parties, which was also taken into account when creating this requirement [ 84].
RC-2.21 - 2.23: Supports structured, semi-structured and unstructured data
The requirements RC-2.21 - 2.23 cover the possibility of covering different types of data
with one DQ methodology. These are structured, semi-structured and unstructured data
types, which are all partially based on RC-1.07. Surveys checked DQ methodologies for
these capabilities [26, 12].
3.3.2 Data Quality Assessment Requirements
```
RC-2.04: Supports adding and customizing of (business) rules
```
Requirement RC-2.04 shows the need for DQ methodology, which allows stakeholders
of companies to add customizable business rules to data measurement and assessment
activities. This need is based on the enterprise requirement RC-1.12. In Ehrlinger et
al. [ 35] DQ tool software manufacturers are mentioned, which list the importance of
integrating business rules in such tools and DQ processes as necessary.
RC-2.05: Supports adding and customizing of dimensions and metrics
RC-2.05, adding DQ metrics and custom dimensions to a DQ methodology can also be
important due to the limitations of some methodologies. Looking into the capabilities of
expanding on existing DQ methodologies was done by Cichy et al. [ 26] and is also seen
as an important aspect of this thesis’s evaluation.
RC-2.09: Supports objective assessment methods
Requirement RC-2.09 defines the need for objective DQ assessment methods in methodolo-
gies. These are very important, for quantitative and qualitative evaluations of distributed
data, because otherwise, it would be too time-consuming to analyse corporate data by
hand. These assessment methods should cover data from different sources and can be
57
3. Requirement Elicitation
applied to data from tables, databases, and organisations. This requirement is based on
enterprise requirements RC-1.14-16 and is inspired by DQ methodology surveys such as
Cichy et al. [ 26] and Batini et al. [ 12], where the authors also distinguished between
objective and subjective assessment methods in DQ methodologies.
RC-2.10: Supports subjective assessment methods
Similar to the previous requirement, RC-2.10 covers the need for subjective DQ assessment
methods in DQ methodologies. Subjective assessment methods can be very useful to
enhance the results of objective assessment because approaches, such as interviews of
people, who have to use data every day. These people can highlight problems, which
were invisible to algorithms. This requirement is also based on enterprise requirements
RC-1.14-16 and was inspired by the surveys [26, 12].
RC-2.11 - 2.14
Requirements RC-2.11 - 2.14 describe the most often referenced DQ dimensions by
methodologies [ 14]. These requirements focus on the support of the dimensions Accuracy,
Completeness, Currency/Timeliness and Consistency.
RC-2.11: Supports the dimension Accuracy
RC-2.11 defines “support for dimension Accuracy” and is based on RC-1.11, which can
suit the dimension Accuracy but the scope of Accuracy is much bigger than that. With
RC-2.11, the evaluation of differences between real-world and stored distributed data
and how accurate the stored information is to the real world can be done.
RC-2.12: Supports the dimension Completeness
RC-2.12 defines “support for dimension Completeness” and is based on RC-1.13. This
dimension takes aspects such as how to complete data entries, tables or databases into
account. This can include how many null or empty values exist, or which properties of
```
data sets are empty (i.e. certain address fields could be empty without being incomplete).
```
RC-2.13: Supports the dimension Currency or Timeliness
RC-2.13 defines “support for dimension Currency/Timeliness” and is based on RC-1.10.
Currency and Timeliness are combined in this requirement, due to the fact that they are
often defined as very similar dimensions and a lot of their characteristics overlap [ 33].
Currency and Timeliness take into account, when data was updated the last time, but
also if it is data, which needs to be frequently updated. A social security number for
example will probably not change over a lifetime of a person.
RC-2.14: Supports the dimension Consistency
RC-2.14 defines “support for dimension Consistency” and is based on RC-1.09. The DQ
dimension Consistency is designed to check for inconsistencies between the same data
object stored at different locations.
RC-2.15: Supports other dimensions
With requirement RC-2.15 support for other possible dimensions through a DQ method-
ology is covered. Due to the fact, that there is a broad variety of dimensions in different
methodologies, this “other dimensions” requirement is needed. The requirement is
58
3.3. Methodology Requirements
partially based on the enterprise requirement RC-1.08, which should “highlight data
duplicates” but this is only an example for other possible types of DQ problems. This re-
quirement is designed for already defined and described DQ dimensions in methodologies
and does not include the possibility to expand the methodology with custom dimensions,
which is already covered by RC-2.05.
3.3.3 Data Quality Improvement Requirements
RC-2.16: Suggests improvement activities
Requirement RC-2.16 checks if any improvement activities are supported by DQ method-
```
ologies. These could be reports, which could be used for applying changes manually;
```
automatic improvement operations, such as updating incomplete data entries if possible
```
when they are created; or recommendations for structural changes, such as architecture
```
or interface improvement. This requirement is based on the enterprise requirements
RC-1.18, 1.19 & 1.21.
RC-2.17: Provides auditing strategies for assessment and improvement
At the end of DQ assessment operations, stakeholders are interested in the requirement
RC-2.17, for which a methodology should provide ways to audit and review the assessment
results. In general, there are many ways to communicate the state of data in a company
to the stakeholders. Ideally, at the end of the assessment process, percentage values are
the results for the overall DQ of the assessed system. This is often not that easy to
realize in practice [ 12]. This requirement is based on the enterprise requirement RC-1.17.
RC-2.18: Supports Data-Driven Improvement
If any improvement activities are supported by the DQ methodology, the requirement
RC-2.18 checks if the type of improvement is based on the “Data-Driven Improvement”
approach. Data-driven improvement methods are useful if data is not often updated,
because they are not designed to improve data flows or processes This kind of improvement
is more focused on stored data. This requirement is based on the enterprise requirements
RC-1.18 and 1.19.
RC-2.19: Supports Process-Driven Improvement
Another improvement approach is covered with the requirement RC-2.19, which focuses
on “Process-Driven Improvement”. Process-driven improvement methods are used on
data flows and business processes, which create or change data sets frequently. This
requirement is also based on the enterprise requirements RC-1.18 and 1.19.
RC-2.20: Provides data quality cost/benefit consideration methods
Requirement RC-2.20, focuses on cost-benefit considerations in regards to assessed DQ
levels of the methodology. The enterprise requirement RC-1.20 is the basis for this
requirement.
59
3. Requirement Elicitation
3.4 Tool Requirements
Similar to the requirements regarding DQ methodologies seen in Table 3.2 a custom
DQ tools requirements catalogue was developed, which can be seen in Table 3.3. This
catalogue was created by translating the general enterprise requirements of Table 3.1
into relatable requirements of DQ software tools and parts were taken from the survey of
Ehrlinger et al. [ 35]. Ehrlinger et al. [ 35] created a RC specific for DQ tools, parts of
which were also adjusted and added to Table 3.3 so they fit the use case of this thesis.
The following paragraphs describe each requirement shown in Table 3.3 in more detail.
The enterprise requirements RC-1.03, RC-1.04 and RC-1.21 were not covered by the tool
requirements, due to the fact that these could not be matched with any of the capabilities
of the evaluated tools. Table 3.3 has three columns. The first column contains the RC
identifiers, the second column provides a short description of the requirement, and the
third column references on the one hand the related enterprise requirements of Table 3.1
and on the other hand gives a reference to other sources, if this requirement was found
in other sources.
```
All these requirements are grouped into three requirement (RQ) categories. These four
```
```
RQ categories are (i) data management, (ii) metrics, (iii) Data Quality and (iv) support
```
```
and usability requirements. (i) covers requirements which refer to data management tasks
```
```
and practices. (ii) focuses on metrics provided by tools. (iii) summarizes requirements
```
```
related to DQ topics. (iv) covers software support and usability requirements.
```
3.4.1 Data Management Requirements
RC-3.01: Supports distributed data sources
Requirement RC-3.01 describes the support of the capabilities of DQ tools to access
and process data from distributed data sources. This requirement includes the option
to connect to different data sources, work with multiple data sources in parallel and
ideally assess DQ over data source borders. This requirement is based on the enterprise
requirement RC-1.01 & 1.02.
RC-3.02: Supports relational databases
The requirement RC-3.02 shows the need for evaluated tools to connect to relational
databases, such as SQL, MySQL or MariaDB. It is based on the enterprise requirement
RC-1.07.
RC-3.03: Supports other data sources
Similar to the previous requirement, RC-3.03 focuses on data sources integration options
of the evaluated DQ tools. These options can include non-relational databases, REST
APIs, and textfiles. It is based on the enterprise requirement RC-1.07.
RC-3.04: Understands different data models of same object
Requirement RC-3.04 describes the need to compare data objects of the same real-world
entity. In practice, this can mean, that the tool can analyse two employee data sets,
which reference the same real-world person and should recognize differences, but also that
60
3.4. Tool Requirements
ID Description
Based on
RC-x.xx
& Source
RC-3.01 Supports distributed data sources 1.01, 1.02
RC-3.02 Supports relational databases 1.07
RC-3.03 Supports other data sources 1.07
```
RC-3.04 Understands different data models of same object(i.e. two employee objects with different focus) 1.06, 1.13
```
RC-3.05 Validates information of different sources in order to create trust 1.05
RC-3.06 Includes metrics for Accuracy 1.11, [35]
RC-3.07 Includes metrics for Completeness 1.13, [35]
RC-3.08 Includes metrics for Consistency 1.09, [35]
RC-3.09 Includes metrics for Currency 1.10, [35]
RC-3.10 Includes metrics for other dimensions 1.08, [35]
RC-3.11 Supports assessment of data quality 1.14, 1.15,1.16
RC-3.12 Provides pre-defined business rules for assessing data quality 1.12, [35]
RC-3.13 Supports creation of custom business rules 1.12, [35]
RC-3.14 Supports data verification with business rules 1.12
RC-3.15 Supports continuous data quality monitoring [35]
```
RC-3.16 Supports versioning and storage of activities(assessment, improvement, analytics) [35]
```
```
RC-3.17 Supports improvement activities (manual and/or automatic) 1.18, 1.19
```
RC-3.18 Supports cost/benefit analysis of improvement methods 1.20
RC-3.19 Provides customer support [35]
RC-3.20 Provides user interface [35]
RC-3.21 Provides analytics and graphs 1.17, [35]
Table 3.3: Requirement Catalogue for DQ tools based on tool survey by Ehrlinger et al.
[35] and expanded upon in this thesis
it is the same person. This requirement is based on the enterprise requirement RC-1.06
& 1.13.
RC-3.05: Validates information of different sources in order to create trust
Requirement RC-3.05 requires DQ tools to validate information coming from different
data sources from multiple organisations It is based on RC-1.05. This validation could
create trust in foreign data by providing a certification or authentication service, which
ensures that only verified parties can provide data to others.
3.4.2 Metrics Requirements
RC-3.06 - RC-3.10: Includes metrics for Accuracy, Completeness, Consistency,
Currency and/or other dimensions
Ehrlinger et al. [ 35] focused in their DQ tool survey on included DQ metrics in tools The
61
3. Requirement Elicitation
requirements RC-3.06 - 3.10 are adopted from this survey. These requirements check if
any metrics for the dimensions Accuracy, Completeness, Consistency, Currency or other
dimensions are defined for any tools. These requirements are based on the survey of
Ehrlinger et al. [ 35] and reference the enterprise requirements RC-1.08, 1.09, 1.10, 1.11
and 1.13.
3.4.3 Data Quality Requirements
RC-3.11: Supports assessment of data quality
Requirement RC-3.11 specifies the need for DQ assessment, which is based on the
enterprise requirements RC-1.14, 1.15 & 1.16.
RC-3.12: Provides pre-defined business rules for assessing data quality
Requirement RC-3.12 formulates the requirement of stakeholders who often want to
use business rules on their data instead of DQ dimensions or metrics. A DQ tool could
provide a list of pre-defined business rules for users. This requirement was inspired by
Ehrlinger et al. [35] and references the enterprise requirement RC-1.12.
RC-3.13: Supports creation of custom business rules
Requirement RC-3.13 describes the need for the option to create new custom business
rules. As the previous requirement, this is also inspired by Ehrlinger et al. [ 35] and also
references the enterprise requirement RC-1.12.
RC-3.14: Supports data verification with business rules
The requirement RC-3.14 introduces the option to check data sets with the help of
pre-defined and/or custom business rules. This requirement builds on RC-3.12 & 3.13,
and is also referencing the enterprise requirement RC-1.12.
RC-3.15: Supports continuous data quality monitoring
Requiring continuous DQ monitoring is covered by the requirement RC-3.15, which was
adopted from Ehrlinger et al. [ 35]. DQ monitoring methods check the state of data sets
in regular intervals or when certain events happen. This could be realized by using a
“data pipeline”, which checks each new or updated data entry for validity and applies
rule sets.
RC-3.16: Supports versioning and storage of DQ activities
After assessing and/or improving data the results must be stored for later auditing and
reviewing processes. This is covered by the requirement RC-3.16 and was also inspired
by Ehrlinger et al. [35].
RC-3.17: Supports improvement activities
Requirement RC-3.17 describes the need to apply improvement methods to assessed
data sets. It references the enterprise requirements RC-1.18 & 1.19.
RC-3.18: Supports cost/benefit analysis of improvement methods
The requirement RC-3.18 defines the need for cost-benefit analysis of improvement
methods. This requirement is referencing the enterprise requirement RC-1.20.
62
3.4. Tool Requirements
3.4.4 Support and Usability Requirements
RC-3.19: Provides customer support
For enterprises, it is often necessary to have the option of customer support for a software
product, which is covered by the requirement RC-3.19 and is inspired by the survey of
Ehrlinger et al. [35].
RC-3.20: Provides user interface
The requirement RC-3.20 describes the need for user interfaces which are important
to stakeholders of enterprises because users want an easy way to interact with software
products and do not want to use terminal windows or edit text files. This requirement
was adopted from the survey of Ehrlinger et al. [35].
RC-3.21: Provides analytics and graphs
Analytics and graphs for a better understanding of the assessed data should be provided
by the DQ tool, which is described by the requirement RC-3.21. This need is referencing
the enterprise requirement RC-1.17 and also was inspired by the survey of Ehrlinger et
al. [35].
63
CHAPTER 4
Assessment of Data Quality
Methodologies
This chapter focuses on the evaluation of the Requirement Catalogue “Methodology
Requirements” shown in Table 3.2 and each requirement is described in more detail
in Section 3.3. Each DQ methodology is investigated regarding these methodology
requirements. The chapter is structured based on the requirement categories introduced
in Section 3.3.
In Table 4.1 each requirement of the Requirement Catalogue “Methodology Requirements”
is listed and five DQ methodologies were evaluated based on them. The DQ methodologies
are described in more detail in Section 2.5. The first column of the Table 4.1 lists the
```
Requirement Catalogue IDs, which are references to the methodology RCs (see Table
```
```
3.2). The second column gives a short description of the requirement itself. The third to
```
seventh column contains how much the evaluated DQ methodologies fulfil the requirement.
```
Each requirement is rated by: ( X ) the requirement is fulfilled, (Z) the requirement is not
```
```
fulfilled or can not be found in sources, or (p) the requirement is partially fulfilled.
```
4.1 Enterprise and CIS Requirements
RC-2.01 can be fulfilled by each assessed DQ methodology [ 12, 26, 22, 23]. Each
methodology supports some form of distributed data storage. DaQuinCIS, HDQM and
HIQM provide concrete architecture suggestions on how such data distribution could look
in real-world examples [ 84, 22, 23]. CDQ and DQA support data distribution according
to their sources, but do not describe any solutions in more detail [ 11, 77]. DQA supports
distributed data implicitly as highlighted by Batini et al. [12].
The requirement RC-2.02 can be fulfilled by all methodologies, except for DQA [ 12, 22, 23].
DaQuinCIS, CDQ and HDQM and were designed with enterprise use cases in mind. DQA
65
4. Assessment of Data Quality Methodologies
RC-2.xx Requirement DescriptionCDQDaQuinCISDQAHDQMHIQM
2.01 Supports distribution of data X X X X X
2.02 Supports cooperative/enterprise application areas X X p X X
2.03 Supports CIS architecture X X Z X p
```
2.04 Supports adding and customizing of (business) rules p p p p Z
```
2.05 Supports adding and customizing of dimensions and metrics X X X X X
2.06 Specifies a concrete architecture and how it could be realized Z X Z X p
2.07 Specifies concrete data models for transmitting databetween entities/organisations Z X Z p Z
2.08 Describes how trust between organisations can be established Z X Z Z Z
2.09 Supports objective assessment methods X X X X X
2.10 Supports subjective assessment methods X Z X Z X
2.11 Supports dimension Accuracy X X Z X X
2.12 Supports dimension Completeness X X X Z X
2.13 Supports dimension Currency/Timeliness X X X X X
2.14 Supports dimension Consistency p X X Z X
2.15 Supports other dimensions X Z X Z Z
2.16 Suggests improvement activities X p Z X Z
2.17 Provides auditing strategies for assessment and improvement X X X X X
2.18 Supports Data-Driven Improvement X Z Z X Z
2.19 Supports Process-Driven Improvement X Z Z X Z
2.20 Provides data quality cost/benefit consideration methods X Z Z X Z
2.21 Supports Structured Data X X X X X
2.22 Supports Semi-Structured Data X X Z X X
2.23 Supports Unstructured Data p Z Z X Z
Table 4.1: DQ methodology capabilities evaluation based on “Methodology Requirements”
shown in Table 3.2
and HIQM were designed for general commercial application areas, but not especially
for big corporate infrastructures or architectures. DQA is only described in an abstract
way and misses a lot of concrete information about larger application scopes, such as
big enterprises and therefore it is only supported partially [ 77]. HIQM is described in
more detail and also gives a case study as an example of what a possible implementation
could look like. This case study presents a bookshop web service implementation, which
illustrates multiple bookshops, communication between each other and sharing data
related to their businesses [22].
Support for CIS as required by RC-2.03 can not be supported by all evaluated method-
```
ologies. DaQuinCIS, CDQ and HDQM support CIS fully [ 84, 11, 23]; HIQM supports it
```
```
partially [ 22]; and no mentioning of CIS was found in DQA. DaQuinCIS is designed espe-
```
cially for CIS [ 26, 84]. CDQ and its extension HDQM both “focus on inter-organizational
contexts” [ 11], which are described as a network of organisations cooperating with each
66
4.1. Enterprise and CIS Requirements
other to reach a common goal. HIQM supports “cooperative business processes” [ 22] of
companies and organisations, and according to the description and examples given, it
can be assumed that HIQM could be applied to CIS, but it is not mentioned explicitly.
```
RC-2.06 can be fulfilled by the DQ methodologies DaQuinCIS and HDQM; and partially
```
by HIQM. DaQuinCIS and HDQM both provide architectural concepts to realise them in a
real-world application [ 84, 23]. DaQuinCIS includes the most sophisticated description of
an architecture design. For HIQM a cases study was described which contains suggestions,
but it is not as concrete as in DaQuinCIS and HDQM [ 22]. CDQ and DQA do not
provide any suggestions on implementing their methodologies in practice.
Concrete data models for transmitting data between organisations as defined by RC-2.07
are provided by DaQuinCIS and partially by HDQM. Scannapieco et al. [ 84] describe
for DaQuinCIS a unified data model D2Q, which is used to transmit data between
organisations. When transmitting data, D2Q contains all the relevant data, property
information and additionally the DQ values for each entry, which other organisations can
use to compare their stored information and choose better fitting data sets from other
parties. This data model is described in much detail by Scannapieco et al. [ 84]. HDQM
contains a uniform meta-model, which “represents the main types of the organisational
knowledge” [ 23]. This meta-model does not only mirror all organisational aspects but
also contains references to related DQ dimensions and metrics. Due to the suggestion to
use this meta-model within each organisation, it can be argued that transmitting data
between organisations can be unified, if the structure behind every party is the same.
Therefore the requirement RC-2.07 is partially fulfilled for the methodology HDQM.
The requirement RC-2.08 defines the need to establish trust in data transmitted between
organisations. This means that data from another organisation comes with a certificate or
something similar, which shows the reliability of its data. RC-2.08 can be fully satisfied
by DaQuinCIS, all other DQ methodologies do not provide functionality for establishing
trust in transmitted data. DaQuinCIS includes a rating service in their communication
service, which checks each transmitted data package and gives each a reliability rating.
This rating communicates the level of evaluation done by each organisation. The level
of evaluation can be increased if more sophisticated assessment algorithms are used or
decreased if only superficial checks were made internally before transmitting data [84].
RC-2.21 is fulfilled if the DQ methodology supports structured data sets, such as relational
databases. All the assessed DQ methodologies support this type of data [ 12, 26]. In
general, structured data is supported by most methodologies because this type of data is
present in almost any data structure and company.
RC-2.22 can be satisfied if the DQ methodology can handle data of semi-structured data
sets, such as JSON or XML files. CDQ [ 11], DaQuinCIS [ 84] and HDQM [ 23] support
this type of data fully as mentioned in all its source papers and surveys from Batini
et al. [ 12] and Cichy et al. [ 26]. HIQM can fulfil this requirement even though it is
not mentioned explicitly, but as suggested by Cichy et al. [ 26], it can be inferred from
the sources [ 22] that HIQM can handle semi-structured data. According to Cappiello
67
4. Assessment of Data Quality Methodologies
et al. [ 22] and its case study example with web services this can be implicitly assumed,
that HIQM does support semi-structured data sets if data must be transmitted over
REST interfaces. DQA does not contain any description of capabilities to work with
semi-structured data.
Unstructured data can not be handled by most DQ methodologies, as the requirement
RC-2.23 shows. HDQM is one of the only methodologies, which was designed to support
unstructured data explicitly. It was designed with heterogenous data in mind [ 23]. CDQ
includes DQ dimensions which are described as ways to assess unstructured data sets,
such as the content of emails or text files [ 11]. These dimensions should check data
on aspects such as originality and condition, which can be seen as characteristics of
unstructured data as argued by Cichy et al. [26].
4.2 Data Quality Assessment Requirements
RC-2.04 can be partially fulfilled by all methodologies, except for HIQM. None of the
assessed methodologies supports the custom implementation of business rules in their
assessment processes. CDQ consideres “structure and rules” of the system in the state
reconstruction phase at the beginning of the DQ assessment process [ 11]. DaQuinCIS
does support semantic rules in one described DQ dimension, which covers database
schemas, and also rule sets for translating and mapping objects [ 84]. DQA mentions
“task-dependent metrics, which include organisation’s business rules”, which are part
of the objective assessment process but are not explained in more detail [ 77]. HDQM
contains one mention of business rules, which should check the semantic integrity of
tables and related foreign keys, but also does not go into detail on how this should look
like [ 23] No mention of any support for creating or using business rules HIQM was found
during the research process.
Each methodology fulfils the requirement RC-2.05, which verifies the possibility to add
custom DQ metrics and dimensions to existing methodologies. This requirement is
based on Cichy et al. [ 26], in which they asked if a methodology is “flexible” regarding
customizing existing and adding new DQ dimensions. According to Cichy et al. [ 26] the
methodologies HIQM, DQA and CDQ are all flexible, which can also be supported by
Batini et al. [ 12] and the related sources of the methodologies [ 77, 22, 11]. Cichy et al.
[ 26] listed the methodology HDQM as not flexible, but mentioned that it is adaptable
to include other dimensions. For this reason and because explicit mention in the main
source [ 23] of HDQM were found, that it is designed to add custom dimensions and
metrics, the requirement RC-2.05 is considered fulfilled. Scannapieco et al. [ 84] mention
for DaQuinCIS the option to add additional DQ dimensions and metrics.
Each evaluated DQ methodology provides some form of objective DQ assessment as
required by RC-2.09. Objective assessment can be done in different forms, but all of
them require metrics or algorithms to measure DQ. Batini et al. [ 11] include metrics
for DQ dimensions, Accuracy, Timeliness, Completeness and Currency, and additional
metrics for duplicate detection in their methodology CDQ. Scannapieco et al. [ 84 ] specify
68
4.2. Data Quality Assessment Requirements
for DaQuinCIS metrics for DQ dimensions, algorithms to compare quality values of
different sources, creating quality certificates for transmitted data, and guaranteed trust
among organisations. DQA contains suggestions for quantitative metrics, which are called
“Functional Forms” and include “Simple-Ratio” operations, “Min-Max-Operations”, and
“Weighted Average” operations [ 77]. HDQM includes DQ metrics for the dimensions
Accuracy and Currency as examples. The methodology HDQM can be expanded with
custom dimensions and metrics [ 23 ]. HIQM suggests “objective assessment through
measurement algorithms”, which are named and described but no metrics were provided
[ 22 ]. Other research was referenced by Cappiello et al. [ 22], which can be a starting point
for implementing matching metrics.
Subjective assessment is only supported by CDQ, DQA and HIQM, which fulfil the
requirement RC-2.10. CDQ includes user interviews in its methodology, which are used
to gather DQ issues and should highlight quality problems. These interviews should
provide insight into the consequences of poor DQ, if it is not improved [ 11]. DQA defines
stakeholder expectation surveys, which should provide information on the perception of
DQ and what users would expect from data [ 77]. HIQM defines one part of its architecture
explicitly as an “Internal/External Feedback” unit. This unit is part of monitoring the
whole system and includes subjective feedback from stakeholder satisfaction [22].
RC-2.11, support for the DQ dimension Accuracy is provided by all DQ methodologies,
except for DQA. The dimension is described in detail in CDQ, DaQuinCIS and HDQM.
HIQM only mentions the dimension as an example but does not provide any formulas,
metrics or concrete approaches [ 22]. The interpretation of the DQ dimension Accuracy is
different for each methodology [12].
RC-2.12, support for the DQ dimension Completeness is provided by all DQ methodologies,
except for HDQM. HDQM does not include this dimension, because it only provides
Accuracy and Currency as examples for possible DQ dimensions, but according to Carlo
et al. [ 23] it can be added if required. Similar to the previous requirement RC-2.11,
HIQM only mentions the dimension Completeness as an example but does not provide
any concrete implementation suggestions [22].
RC-2.13, support for the DQ dimension Currency or Timeliness is provided by all DQ
methodologies in some form. As mentioned in the requirement definition, the dimensions
Currency and Timeliness are combined, due to the fact that they often cover the same
aspects of data [ 33]. CDQ interestingly contains definitions for Currency and Timeliness
[12, 11].
RC-2.14, support for the DQ dimension Consistency is provided fully by DaQuinCIS,
```
DQA and HIQM; and partially by CDQ. No mention of the dimension Consistency was
```
found for HDQM. The dimension Consistency is mentioned by Batini et al. [ 11] for CDQ
but not described in detail. They only explain the theoretical capability of this dimension
in CDQ.
RC-2.15 focuses on the definition of DQ dimensions other than the already checked
dimensions. CDQ and DQA fulfil this requirement. Batini et al. [ 11] define for CDQ
69
4. Assessment of Data Quality Methodologies
in total eleven DQ dimensions. Some of them are described in detail but not all of
them. CDQ includes the dimensions Correctness, Accessibility, Relevancy, Reliability,
Readability and Volatility [ 12, 11]. DQA includes in total 16 DQ dimension definitions,
which can be found in an overview table in [77].
4.3 Data Quality Improvement Requirements
Improvement activities are covered by the requirement RC-2.16, which focuses on sug-
gestions for improving DQ in any form. These activities can be done automatically
by algorithms or could include suggestions for manual improvement processes. This
```
requirement is fully satisfied by CDQ, HDQM; and partially by DaQuinCIS. As summa-
```
rized by Cichy et al. [ 26] the dimensions CDQ and HDQM provide both process-driven
and data-driven improvement activities. Batini et al. [ 11] describe for CDQ different
activities for improving business processes and already stored data, and list deeper-going
research papers for further reading. Carlo et al. [ 23] describe for HDQM in detail how
data improvement could look like for the two defined dimensions Accuracy and Currency.
DaQuinCIS provides no explicit improvement suggestions but mentions improvement
mechanics included in its architecture, namely the Data Quality Broker. Additionally
one of the built-in improvement functions is the possibility of organisations to request
the same data from different organisations and check if any has a more up-to-date or
```
a “better” data set and if so, can update (improve) its own data [ 84]. DQA describes
```
one of its phases as an improvement phase but does not go into detail on its execution.
Therefore DQA does not fulfil this requirement [77].
RC-2.17, all DQ methodologies specify some form of auditing or reviewing of the assess-
ment and/or improvement activities. All methodologies provide percentage values of the
evaluated data sources which try to communicate to stakeholders how high the level of
DQ is. HDQM’s resulting assessment data can focus on specific data sets and can be
split up into different DQ dimensions for a detailed analyse [ 23]. HIQM includes separate
processes in its methodology which measure the quality of improvements and insert this
information into analysis processes [ 22]. CDQ describes real- and target-quality-values,
which are compared to each other after improvement activities and additional actions can
be taken with regards to these results [ 11]. DaQuinCIS can deliver quality information
on each data set to other organisations and each organisation can compare its own data
with data of other organisations. This quality information can be collected and prepared
for stakeholders to get a better feeling on which organisation manages data better [ 84].
DQA combines subjective and objective metrics to provide stakeholders with information
about the state of their data [77].
Both requirements, RC-2.18 and RC-2.19, are fulfilled by CDQ and HDQM, which was
summarized by Cichy et al. [ 26] and which can also be found in [ 11] and [ 23]. Both
```
methodologies provide data-driven (RC-2.18) and process-driven (RC-2.19) improvement
```
capabilities.
The costs and benefits of improvement activities are evaluated by requirement RC-2.20.
70
4.3. Data Quality Improvement Requirements
CDQ and HDQM include cost and benefit analysis methods as summarized by Cichy et
al. [ 26]. CDQ keeps track of budget constraints, improvement costs, cost classifications
and none-quality costs [ 11]. HDQM does describe methods to include budget constraints,
improvement costs and none-quality costs in the selection of improvement activities [ 23].
Both methodologies include methods for the cost-benefit analysis for the selection of the
“best” improvement activities over others with more efficient outcomes.
71
CHAPTER 5
Assessment of Data Quality Tools
This chapter focuses on the assessment of the Requirement Catalogue “Tool Requirements”
shown in Table 3.3, which are described in more detail in Section 3.4. Each DQ tool
is investigated regarding these requirements. The chapter is structured based on the
requirement categories introduced in Section 3.4.
In Table 5.1 each requirement of the Requirement Catalogue “Tool Requirements” is
listed and five DQ tools were evaluated based on them. The DQ tools are described in
more detail in Section 2.6. The first column of Table 5.1 lists the Requirement Catalogue
```
IDs, which are references to the tool RCs (see Table 3.3). The second column gives a
```
short description of the requirement itself. The third to seventh column contains how
```
much the evaluated DQ tools fulfil the requirement. Each requirement is rated by: ( X )
```
```
the requirement is fulfilled, (Z) the requirement is not fulfilled or can not be found in
```
```
sources, or (p) the requirement is partially fulfilled.
```
5.1 Data Management Requirements
The requirement RC-3.01 is used to verify if the DQ tools support distributed data
sources and data. This requirement can be fully satisfied by Informatica Data Quality,
```
Talend Open Studio, Experian Aperture Data Studio; and partially by MobyDQ and
```
Great Expectations. Informatica Data Quality, Talend Open Studio and Experian
Aperture Data Studio support connections to multiple distributed databases [ 56, 91, 40].
MobyDQ supports one active connection to a data source but can switch between multiple
data sources [ 93]. Great Expectations is intended to be combined with other database
integration tools, such as Python Pandas 1 , PySpark 2 , Postgres, MySQL and others which
are listed on their GitHub 3 page [ 37]. Depending on the frameworks used to integrate a
1https://pandas.pydata.org/
2https://spark.apache.org/docs/latest/api/python/
3https://github.com/great-expectations/great_expectations
73
5. Assessment of Data Quality Tools
RC-3.xx Requirement DescriptionInformatica DQTalend Open StudioExperian Aperture Data StudioMobyDQGreat Expectations
3.01 Supports distributed data sources X X X p p
3.02 Supports relational databases X X X X X
3.03 Supports other data sources Z X X X X
```
3.04 Understands different data models of same object(i.e. two employee objects with different focus) X Z Z Z Z
```
3.05 Validates information of different sources in order to create trust Z Z Z Z Z
3.06 Includes metrics for Accuracy Z Z X Z p
3.07 Includes metrics for Completeness p Z X X p
3.08 Includes metrics for Consistency Z Z Z Z p
3.09 Includes metrics for Currency Z Z Z Z Z
3.10 Includes metrics for other dimensions p p Z X Z
3.11 Supports assessment of data quality X p X X X
3.12 Provides pre-defined business rules for assessing data quality X X X X X
3.13 Supports creation of custom business rules X X X X X
3.14 Supports data verification with business rules X X X X X
3.15 Supports continuous data quality monitoring X X X X X
3.16 Supports versioning and storage of activities X X X p X
3.17 Supports improvement activities Z Z p Z Z
3.18 Supports cost/benefit analysis of improvement methods Z Z Z Z Z
3.19 Provides customer support X X X Z Z
3.20 Provides user interface X X X X p
3.21 Provides analytics and graphs X X X X X
Table 5.1: DQ tools capabilities evaluation based on “Tool Requirements” shown in Table
3.3
74
5.1. Data Management Requirements
data source with Great Expectations, multiple connections to data sources are possible.
Informatica Data Quality, Talend Open Studio and Experian Aperture Data Studio can
assess data on table-level, but not higher [35, 56, 91, 40].
RC-3.02 describes the requirement for integrating relational databases in DQ tools.
All DQ tools provide integration options for a relational database. Informatica Data
Quality provides integration possibilities for PostgresSQL, Oracle, Microsoft SQL Server,
Microsoft Azure SQL Server and IBM DB2 [ 56]. According to Talend’s starter guide,
Talend Open Studio provides support for different SQL and MySQL servers [ 91 ]. Experian
lists for its DQ tool Experian Aperture Data Studio many supported relational database
types, such as MongoDB, SQL Server, Oracle, MySql, PostgresSQL and others [ 41].
For MobyDQ a list of data connectors 4 is listed in their documentation, which includes
MariaDB, Microsoft SQL Server, MySQL, Oracle, PostgreSQL and others [ 93]. Great
Expectations includes in its documentation a list of integration options 5 and on GitHub 6
relational database connectors, including Microsoft Server SQL, MySQL, PostgresSQL
and MariaDB are listed [37].
Other data source integrations are verified by the requirement RC-3.03. These other data
sources include text files or APIs. All DQ tools, except for Informatica Data Quality
support data sources next to relational databases. For Informatica Data Quality no other
references to other possible data sources were found during this research. Talend Open
Studio supports Apache Hive and Amazon Redshift, which are both data warehouse
products, and the tool also supports importing delimited files, such as CSV files [ 91].
Experian Aperture Data Studio supports “files, a database table, a DDL file, or a snapshot
taken in a Workflow” [ 39]. These files include data formats such as text, CSV, Excel
spreadsheet, and JSON files. MobyDQ supports Cloudera Apache Hive 7 , Snowflake 8
and others which can be found in their documentation for data source connections [ 93].
Great Expectations supports data warehouse systems such as Snowflake, Redshift and
Apache Hive, and depending on the specific Python integration of GX other types of
data sources can be supported [37].
Requirement RC-3.04 describes the capability of checking and comparing two complex
data objects based on the same real-world entity. Only Informatica Data Quality does
describe this capability clearly in a paper from 2010 [ 53]. All the other evaluated DQ
tools do not mention the option to compare complex data objects of, i.e. an employee
and understand that it is the same object, but for example, a few properties are missing.
The need for validating information from other organisations so that it can be trusted is
described in requirement RC-3.05. This requirement is based on the fact that multiple
4https://ubisoft.github.io/mobydq/pages/datasourceconnectionstrings/
5https://docs.greatexpectations.io/docs/guides/connecting_to_your_data/
connect_to_data_overview6
```
https://github.com/great-expectations/great_expectations7
```
```
https://www.cloudera.com/products/open-source/apache-hadoop/apache-hive.
```
html8
```
https://www.snowflake.com/?lang=de
```
75
5. Assessment of Data Quality Tools
organisations share data with each other and must be able to trust each other. Any
organisation requesting data from another needs to verify if the data is correct. None of
the assessed DQ tools mention something regarding this requirement.
5.2 Metrics Requirements
The DQ dimension Accuracy is one of the most referenced dimensions of all DQ method-
ologies. The requirement RC-3.06 verifies if any DQ tool can assess data according to
related Accuracy metrics. As mentioned by Ehrlinger et al. [ 35] the implementation
of DQ dimensions is often only described in an abstract way or only references certain
dimensions, but does not explain what they implement exactly. Experian Aperture Data
Studio is the only DQ tool, which includes Accuracy. It is mentioned in their online
documentation in combination with business rules, which cover aspects of Accuracy
and also include examples for use-cases [ 38 ]. Informatica released a white paper which
mentions Accuracy as one of the dimensions they want to support, but nothing in the doc-
umentation can be found [ 53]. Great Expectations does not support any DQ dimensions
out-of-the-box, but as described by Christopher Getts [ 44] expectations can be designed
to cover certain metrics of these dimensions. Due to the fact that GX is an open-source
Python library, the capabilities of the tool can also depend on the community and what
they do with it.
RC-3.07, support for the DQ dimension Completeness is covered by this requirement.
MobyDQ and Experian Aperture Data Studio provide metrics or business rules which
cover the DQ dimension Completeness [ 93]. MobyDQ contains Completeness metrics,
which are also described in formulas. Experian Aperture Data Studio include definitions
for business rules which cover the dimension Completeness and also provide examples
[ 38]. Informatica Data Quality partially fulfils this requirement, due to the fact that
the dimension is mentioned but only metrics for completing addresses are given [ 55].
This dimension was mentioned in the Informatica white paper [ 53] but not explained in
detail. Great Expectations does not support this dimensions similarly to the previous
requirement RC-3.06 out-of-the-box, but DQ metrics regarding Completeness can be
implemented as Getts [44] shows.
RC-3.08, the DQ dimensions Consistency is not included in any of the assessed DQ tools.
Informatica does mention this dimension in the white paper [ 53 ] as well, but similar
to Accuracy and Completeness, it is not described in more detail. Other mentions of
this dimension were not found. Great Expectations supports this dimension similar to
the previous requirement RC-3.07, not out-of-the-box. Getts [ 44] shows that metrics for
Consistency can be implemented.
```
RC-3.09, Currency (or Timeliness) is not covered by any evaluated DQ tools. No mention
```
of this dimension was found in any material regarding these tools.
RC-3.10, support for other DQ dimensions, then Accuracy, Completeness, Consistency
and Currency/Timeliness, is covered by this requirement. MobyDQ includes metrics for
76
5.3. Data Quality Requirements
“freshness” and “latency” [ 93], which are referenced by the developers as DQ indicators,
but could be interpreted as dimensions if they would be normalized between [0,1] [ 47 ].
MobyDQ also provides “validity” as a DQ indicator [ 93]. Great Expectations forums
include discussions 9 about integrating DQ dimensions. According to developers are DQ
dimensions prototyped internally, but nothing at the time of writing this thesis is available.
There was no native support for concrete DQ dimensions and metrics available when this
thesis was written, but as shown by Getts [ 44] metrics for dimensions can be implemented
as expectations for GX. Talend Open Studio includes DQ dimension “uniqueness” and
metrics for “integrity” as found by Ehrlinger et al. [ 35]. Informatica Data Quality
also includes DQ dimension “uniqueness” and metrics for “integrity”, “conformity” and
“duplicates” as mentioned by Ehrlinger et al. [35].
5.3 Data Quality Requirements
RC-3.11 evaluates the support for assessing DQ. Most tools do implement DQ metrics
for assessment purposes but not complete DQ dimensions. Talend Open Studio does not
support any DQ assessment methods, but the enterprise edition 10 of TOS does support
it. TOS is mainly used for data profiling and exploring data sets [ 91]. As summarized by
Ehrlinger et al. [ 35] Informatica Data Quality and MobyDQ both include metrics for
assessing DQ. According to Experian’s documentation of Experian Aperture Data Studio
the tool supports assessment of DQ with metrics [ 40]. Great Expectations supports
assessment of DQ. The assessment of data works differently in GX than in other tools.
As described in their documentation GX applies pre-defined expectations on data sets
[ 37 ]. These expectations are basically unit tests which check if a data value, for example,
is in a certain range, but such expectations can also be much more complex. These
checks are applied to the data elements and the results are stored for later assessment
activities. If data changes over time, the previous evaluations can be compared to the
current ones and validated [ 95]. As mentioned in the assessment of the requirements
RC-3.06, RC-3.07 & RC-3.08, typical DQ metrics can also be implemented for assessment
as shown by Getts [44].
RC-3.12 verifies if the DQ tools provide business rules for assessing DQ. All the evaluated
DQ tools do support assessment of DQ with pre-defined rules. Business rules are,
according to Ehrlinger et al. [ 35], often more important to stakeholders than DQ
dimensions or metrics because they can be easier understood and can also be easier to
```
implement. These rule sets often include simple checks, such as address (i.e. zip code,
```
```
street or country validation), email and telephone validations [ 3 ]. As summarized by
```
Ehrlinger et al. [ 35] the DQ tools Informatica Data Quality and Talend Open Studio
provide pre-defined “general-applicable” rules. MobyDQ does not provide any pre-defined
rule sets for DQ assessment purposes. Experian Aperture Data Studio includes rule sets
9https://discuss.greatexpectations.io/t/data-quality-dimensions-metrics/
```
409 (14.10.2022)10
```
```
https://www.talend.com/products/data-quality/ (16.10.2022)
```
77
5. Assessment of Data Quality Tools
for validating typical data formats and types, such as dates, emails, phone numbers or
addresses [ 40 ]. Great Expectations implements business rules natively as expectations.
GX includes pre-defined expectations, which are listed in their documentation [37].
RC-3.13, creating their own business rules is important to stakeholders so they can
customise DQ tools to their needs. As discovered by Ehrlinger et al. [ 35] the DQ tools
Informatica Data Quality, MobyDQ and Talend Open Studio all provide options for
creating custom business rules, even though for example MDQ does not provide any
predefined rules. Experian Aperture Data Studio includes a “Rule Editor” which can
be used to create new and customize already existing rules [ 40]. Great Expectations
supports the possibility to create new expectations [37].
```
Requirement RC-3.14 is fulfilled if a DQ tool can apply pre-defined or custom (business)
```
rule sets on data and evaluate the level of quality. All the assessed DQ tools do provide
the option to apply the already provided or newly created rules on data sets. None of
the tools can apply rules at the database level or higher. MobyDQ can for example
```
compare two tables with each other based on a reference data set (i.e. gold standard) [ 35].
```
Informatica Data Quality does provide aggregation operations on the table level, but some
metrics and rules, in general, are only applicable to columns as described by Ehrlinger et
al. [ 35]. Talend Open Studio can apply business rules only on the column level, at least
in their open-source version [ 91, 35]. Experian Aperture Data Studio also seems to have
support for column-based evaluation but not for higher levels [ 40]. Great Expectations
natively supports table-based evaluation as described in their documentation [37].
RC-3.15 verifies if DQ tools can monitor the level of DQ in a regular interval or triggered
by specific changes. All the evaluated DQ tools do support either an integration in DQ
pipelines or natively support functionality for monitoring data changes in data sources.
Informatica Data Quality, Talend Open Studio and Experian Aperture Data Studio do
provide integration of continuous DQ monitoring if new entries are added or existing ones
are updated. MobyDQ is designed for integrating into DQ pipelines, which trigger MDQ’s
evaluation mechanics. Great Expectations was designed with multiple DQ pipelines
integration options in mind. These integration options are listed in their documentation
[37] and many examples are given.
Versioning and storing the results of DQ assessment operations is an important require-
ment RC-3.16 for stakeholders because they want to verify if changes in workflows, data
providers and improvement activities lead to desired outcomes. Informatica Data Quality,
Talend Open Studio, Experian Aperture Data Studio and Great Expectations provide
native storage and versioning functionalities. MobyDQ only provides the option to
store the results but does not include methods to compare current and previous results,
therefore it can only partially fulfil this requirement.
RC-3.17, improving data based on assessment results is a complicated task, but an
important one for stakeholders. Except for Experian Aperture Data Studio, no other
tool does provide natively improvement activities based on assessment results. According
to EADS’s documentation [ 40] it is possible to improve data sets based on assessment
78
5.4. Support and Usability Requirements
results. Examples in their documentation list deduplicate algorithms, auto-correcting
incomplete or wrong addresses and “training a machine learning algorithm with user-
provided match outcomes” to fix specific types of data. Even though Great Expectations
can not improve data sets based on assessment results, it is noteworthy that the results
of GX can be exported easily to other tools, which can trigger an improvement process,
if implemented. Therefore it can be argued that matching integrations in another tool
can provide improvement capabilities, but for this evaluation, it is not true and there
were also no examples found on the internet which provide possible solutions.
RC-3.18, none of the evaluated DQ tools support any form of cost-benefit analysis of
improvement activities or could provide recommendations on which improvements could
be done by stakeholders themselves.
5.4 Support and Usability Requirements
RC-3.19, customer support is an important aspect of enterprise applications as mentioned
by stakeholders. This requirement can be important for the longevity of a tool deployment
in an enterprise and also for the reliability of its service. Informatica, Talend and Experian
all sell commercial software which provides according to their websites 24/7 customer
support. Even though Talend Open Studio is open-source software, the enterprise version
of it will provide customer support and therefore this requirement is also fulfilled by it.
MobyDQ and Great Expectations both are open-source and community-maintained, and
therefore no customer support is available. It seems that GX, in contrast to MDQ, has
acquired a broad community of enthusiasts if the number of articles, seminars, tutorials
and discussions in forums can be believed.
RC-3.20, all DQ tools except for Great Expectations provide an interactable user interface,
which allows the user to configure tools as needed. GX does provide a user interface for
the results of the assessment, but it is only a static website, which gets generated after
each run and does not include any interactability to configure expectations or database
connections. The configuration of expectations must be done in an editor or terminal
window.
RC-3.21, each evaluated DQ tool provides analytics and graphs for a better understanding
of the DQ assessment activities. The natively provided analytics functions are more
developed in Informatica Data Quality and Experian Aperture Data Studio, which also
depends on the that these are commercial software products.
79
CHAPTER 6
Conclusions, Recommendations
and Future Work
This diploma thesis investigated the current state of DQ in large enterprises and how DQ
```
methodologies can be applied to CISs (see Section 2.2 for more details on CIS). Due to
```
the complexity of the research topic DQ assessment and improvement, the focus of this
thesis was first and foremost on assessing the quality of data and if possible investigating
improvement methods based on the assessed data sets. During researching and writing
this thesis, the focus had to be adjusted multiple times because the topic DQ is such a
complex research area. In theory, a lot of concepts and methodologies exist and work,
but in practice, a lot of their descriptions are not detailed enough to be applicable in
real-world scenarios.
With this accumulated knowledge and the given advice from Dr. Lisa Ehrlinger, the
focus of this thesis finally was directed towards DQ assessment methodologies applicable
to CIS and assessing DQ tools which could be used in an enterprise environment. Dr.
Ehrlinger is a senior researcher at Software Competence Center Hagenberg and performed
```
a lot of research (including her doctor thesis [33]) in the area of DQ.
```
This thesis was written in cooperation with a large enterprise, which employs thousands
of people and is distributed over multiple sub-organisations and multiple countries
```
over the world. Each sub-organisation (also called an organisation in this thesis for
```
```
simplicity) has its own area of expertise and is focused on specific industrial areas, but
```
they have also overlapping aspects. Big projects, such as planning different aspects of
city infrastructure are done by this enterprise, which includes multiple areas of expertise
from different organisations. In cooperation with stakeholders from this large enterprise,
requirements were collected, which were defined in internal consolidation processes, but
needed adaptations for this thesis. With the gathered knowledge in the area of CIS and
81
6. Conclusions, Recommendations and Future Work
```
DQ these requirements were converted in a requirement catalogue for enterprises (see
```
```
Section 3.2).
```
6.1 Conclusions
First, this thesis introduces and describes methodologies, which can be applied to CISs
```
(see Section 2.5). These methodologies were then evaluated with a requirement catalogue
```
```
(see Section 3.3) specifically designed for DQ methodologies (see also Chapter 4). The
```
```
second part of this thesis focuses on the evaluation of DQ tools (see Chapter 5), which
```
were described in Section 2.6 and the assessment of the tools was done by checking a
```
specific DQ tool requirement catalogue (see Section 3.4).
```
The following research questions were asked in Section 1.1 and answered by this diploma
```
thesis:
```
RQ-I. What are relevant data quality requirements for large enterprises?
Investigating generally applicable requirements for large enterprises and CISs was done by
looking at already defined requirements by the stakeholders of the cooperating enterprise
and current research. These requirements were generalizations of the needs of the
company and were acquired with the help of a requirement elicitation process described
in Section 3.1. In the requirement elicitation process seen in Figure 3.1 stakeholders were
interviewed on what is important to them regarding DQ, which was followed by literature
research backing up these needs in regards to CIS. These findings were evaluated based
on the aspect, of they can provide new insights into already-defined requirements. If
so, the stakeholders were consolidated, the relevant requirements were readjusted and
the process was repeated till no more new knowledge was acquired and the enterprise
requirement catalogue was finalized. With the acquired knowledge regarding CIS and
what makes them essential, all the requirements of the company were merged into
an enterprise requirement catalogue found in Table 3.1. These requirements highlight
important aspects of the stakeholders such as the importance of data distribution over
multiple organisations, trust in data from other organisations, standardization needs for
communication, highlighting different types of problems in data, measuring overall data
quality in a company and how to improve it programmatically.
Based on these accumulated enterprise requirements two requirement catalogues were
specified, which focus respectively on DQ methodologies and DQ tools. The “methodology
requirement catalogue” seen in Table 3.2 lists specific requirements relevant to DQ
methodologies and the application area of enterprises. These requirements are partially
adopted from other papers, which evaluated DQ methodologies, and these requirements
reference one or multiple requirements of the enterprise requirement catalogue. The “tool
requirement catalogue” is shown in Table 3.3 and lists all the specific requirements for
DQ tools in an enterprise application field. These requirements reference the enterprise
requirement catalogue of Table 3.1 and partially adopt requirements of other surveys. By
82
6.1. Conclusions
specifying these two specific requirement catalogues, the research questions RQ-II and
RQ-III can be answered by evaluating the DQ methodologies and tools based on them.
RQ-II. Which DQ methodologies are best suitable for large enterprises, especially in the
context of CIS?
The introduced DQ methodologies in Section 2.5 were selected by evaluating different
survey papers, which evaluated DQ methodologies and if these methodologies can be
applied to CIS. The methodologies included in this thesis are Comprehensive Data
```
Quality Methodology for Web and Structured Data (CDQ), Data Quality Assessment
```
```
(Methodology) (DQA), Data Quality In Cooperative Information Systems (DaQuinCIS),
```
```
Heterogenous Data Quality Methodology (HDQM) and Hybrid Information Quality
```
```
Management (HIQM). Other methodologies namely Total Data Quality Management
```
```
(TDQM) and Total Information Quality Management (TIQM) were also considered at
```
first, but as explained in Section 2.5.6 these are described in an unspecific way and can
not really be applied to real-world scenarios based on their descriptions.
These DQ methodologies were assessed in Chapter 4 with the help of the “methodology
requirements” defined in Table 3.2. The assessment of DQ methodologies is summarized
in Table 4.1 and each evaluated requirement was described in detail in the same chapter.
The evaluation of DQ methodologies highlights big differences between them.
One of the requirements for selecting methodologies for this thesis was the capability
to apply them in enterprises. Additionally, they needed to support data distribution
over multiple data sources and ideally over multiple organisations. All of the assessed
methodologies fulfil these requirements except for DQA, which only partially supports
enterprise applications as described in Section 5.
CDQ and DQA are methodologies, which include general descriptions about the most
important parts of a DQ methodology, but often lack concrete suggestions on how to realize
them in a real-world system and how data can be transmitted between organisations.
They also lack descriptions of data models for storing and transferring data.
In contrast to that, DaQuinCIS, HDQM and HIQM were all described in much more detail
and include real-world examples which makes it much easier to imagine different ways how
to realize them in enterprise systems. All of them describe architectures for implementing
DQ assessment operations in some form. The most concrete architecture suggestions are
described in DaQuinCIS, which was specifically designed for CISs. DaQuinCIS is also the
only DQ dimension which provides suggestions for creating trust between organisations
when receiving and transmitting data.
All DQ methodologies are dimension-based, which means they were designed to include
DQ dimensins and metrics to evaluate DQ. All except for HIQM include mentions of
business rules in their evaluation process, but none fully mention and explain the specific
commitment to support business rule creation and customization.
Regarding DQ assessment, all of the evaluated DQ methodologies provide objective
assessment methods. CDQ, DQA and HIQM also provide subjective assessment methods,
83
6. Conclusions, Recommendations and Future Work
such as interviews and surveys. Support for the most used DQ dimensions, Accuracy,
Completeness, Consistency and Currency, was provided by most methodologies. Accuracy
is supported by CDQ, DaQuinCIS, HDQM and HIQM. Completeness gets supported by
CDQ, DaQuinCIS, DQA and HIQM. Currency is the only dimension which is supported
by all methodologies, but this is only true, because HIQM supports Timeliness, which is
often defined similarly to Currency. Consistency gets supported by DaQuinCIS, DQA
and HIQM. CDQ does support Consistency according to its author Carlo Batini in [ 12]
but does not mention it in the main source [ 11] of CDQ. In conclusion, all of the four
DQ dimensions are supported by CDQ, DaQuinCIS and HIQM. DQA supports three
out four dimensions. HDQM is the only methodology, which does only support two
dimensions out-of-the-box, but this is due to the fact, that it lists Accuracy and Currency
as example dimensions, which should show how DQ dimensions could be implemented
in this methodology. One important aspect of HDQM is the fact that it is designed for
customizing and adding DQ dimensions as they are needed and therefore only two are
provided by the methodology.
Improving data with the help of DQ methodologies is not the main focus of this thesis.
Regarding the needs of stakeholders, it was important to look at this aspect in some
form to assess if a methodology can be useful in improving data after assessment.
Only CDQ and HDQM provide detailed descriptions of improvement methods. Both
support data-driven and process-driven improvement activities. CDQ and HDQM also
provide cost-benefit considerations. DaQuinCIS mentions improvement activities through
comparing data sets of the same entity from other organisations and updating data sets
if they can be verified as “better” or more up-to-date than the own information. This
type of improvement method is not very specific and leaves a lot of unanswered questions,
therefore it only partially counts as fulfilled.
Structured data gets supported by all DQ methodologies, semi-structured data gets
supported by all except for DQA and unstructured data gets fully supported only by
HDQM.
Section 6.2 contains the final recommendations for DQ methodologies.
RQ-III. Which DQ tools can be recommended to decision-makers?
Recommending DQ tools for enterprise application areas is a difficult task to fulfil, due
to the fact that hundreds of open-source and commercial DQ tools are available, and due
to the lack of research in this area. One of the most recent papers surveying DQ tools
was done by Ehrlinger et al. [ 35] which provided many starting points for this thesis.
Based on this survey and previous ones such as [ 8 , 80 ] the decision was made to assess
open-source and commercial tools in this thesis. The selection process of DQ tools was
supported by general requirements defined in Section 2.6 and also based on this survey
```
[ 35]. The final selection of assessed DQ tools included Informatica Data Quality (IDQ),
```
```
Talend Open Studio (TOS), Experian Aperture Data Studio (EADS), MobyDQ (MDQ)
```
```
and Great Expectations (GX), which are described in Section 2.6. The tools IDQ, TOS
```
and MDQ were adopted from the survey of Ehrlinger et al. [ 35 ] and evaluated with the
84
6.1. Conclusions
requirements defined in this thesis. EADS and GX were added without being in any
other surveys.
This selection of tools should provide an overview of commercial and open-source tools,
but is not an exhaustive assessment, due to the fact that this comparison should provide
an overview and entry point to DQ tools in general, what is important and what to
expect of them. Also important to note is that Informatica and Talend both provide
other software solutions, which go in similar directions as the assessed tools, but these
are either cloud-based solutions, getting trial access is time-consuming and hard, and
no independent information is available for these tools, which does not come from the
software vendors themself.
These DQ tools were assessed in Chapter 5 with the help of the “tool requirements”
defined in Table 3.3. The assessment of DQ tools is summarized in Table 5.1 and each
evaluated requirement was described in detail in the same chapter.
Each DQ tool does support basic features such as connecting to different data sources and
also provides integration options for relational databases. Except for IDQ each tool does
support integration to other types of data sources, such as big data sources, streaming
services, REST APIs and importing files.
Assessment of data is in practice much harder to implement which can be seen in the
results of measuring and assessing DQ with the help of these tools. IDQ is the only tool
which can compare two data objects of the same real-world entity directly without any
additional work required.
None of the assessed tools provide validation options, which can be used to check the
correctness of data from external data sources.
DQ dimensions are a composition of DQ metrics which are often partially implemented
in software tools. The assessment of DQ metrics supported by tools was split up into
Accuracy, Completeness, Consistency, Currency and other dimensions. Similarly to the
DQ methodology assessment, these four dimensions were selected due to the fact that
they are the most referenced and used dimensions in this research area.
EADS does implement metrics for the DQ dimensions Accuracy and Completeness,
which are also explicitly mentioned in the documentation. IDQ does support metrics for
validating the Completeness of addresses. They also included metrics for data integrity,
deduplication and conformity and mentions specifically the dimension “uniqueness”. MDQ
includes metrics for Completeness and other DQ indicators such as Freshness, Latency
and Validity. TOS includes no specific metrics for any of the four major dimensions,
but mentions the dimension “uniqueness” and metrics for “integrity”. Sources for GX
showed the possibility to implement metrics for this dimension in the framework [ 44], but
these metrics need to be implemented and are not natively supported. The possibility
to implement DQ dimensions was shown by Getts [ 44] for Accuracy, Completeness and
Consistency.
85
6. Conclusions, Recommendations and Future Work
In general, each DQ tool, except for TOS, does have the capabilities to assess the quality
of data. Most of them implement metrics of DQ dimensions but do not completely cover
all aspects of a dimension. IDQ and EADS appear to be the most developed DQ tools in
this regard and cover a broad spectrum of DQ metrics. GX provides a lot of potential
for assessment tasks, due to its broad integration possibilities. TOS does not support
any assessment activities, but the enterprise version of the software does and therefore it
partially can fulfil this requirement.
Most of the tools do not provide assessment options according to DQ dimensions but
implement measurement and assessment operations based on rule sets. All of the tools
provide the users with general-purpose rules, the possibility to create their own custom
business rules and of course the possibility to apply all the rules on each data set. EADS
and MDQ provide both, dimension- and rule-based assessment methods.
Monitoring data in regular intervals or based on changes is very important for enterprise
workflows. Therefore it is important, that tools support DQ monitoring for sustainable
deployments. Some tools, such as IDQ, MDQ and EADS have DQ monitoring options
built in. MDQ and GX can be integrated in data pipelines, which trigger DQ checks if
changes happen. Versioning of assessment results for later auditing processes and storing
these results is also very important to stakeholders for verifying the usability of such
tools. All tools, except MDQ do support both, versioning and storing analysis data.
MDQ only supports storage of results but does not include a versioning option which
can be used to compare previous data pipeline runs to current ones.
Improvement capabilities are rare to find within these assessed tools. EADS is the only
tool which explicitly describes the improvement of data. Even though improvement
capabilities are limited to deduplication, auto-correction algorithms and some form of
machine learning algorithm, which does not get explained in detail. This requirement
gets not fulfilled by any tool. Other improvement-related tasks, such as cost-benefit
analysis of improvement methods can not be done by any tool.
Each tool comes with user interface features, which are also more developed in commercial
solutions, in contrast to open-source ones. All tools include analytics and graph diagrams
for analysing and understanding problems with data and where they could originate from.
GX does come with static HTML sites, which are created for each run and give insights
into shortcomings of data sets, analysis and information on used exception cases.
All the commercial applications from Informatica, Talend and Experian do provide
customer support if you buy licenses for any of their products. MDQ and GX do not
come with any customer support, but the community of GX is a growing and seemingly
very active one, which can help users a lot of problems come up or you are stuck.
Section 6.3 contains the final recommendations for DQ tools.
86
6.2. Methodology Recommendation
6.2 Methodology Recommendation
Recommending one specific DQ methodology for large enterprises is hard to do because
a lot of things need to be considered before giving any recommendation. This diploma
thesis looked at a very complex, broad and often not clearly defined research area, where
different opinions on how certain things should be are still discussed.
Finding the one DQ methodology which fits perfect to a company is a complicated task
because a lot of these methodologies, even the more concrete ones, are often only described
in theory and if you are lucky, there exists a case study with a health organisation or
something similar. This thesis should give an insight into the topic DQ especially focusing
on the requirements of large enterprises and where good starting points for research
are when such a big corporation wants to implement DQ measures in their company.
Recommending one single methodology is hard to justify, so the two best fitting in my
opinion get recommended with their concrete differences highlighted.
Based on the assessment results of this thesis Data Quality In Cooperative Information
```
Systems (DaQuinCIS) and Heterogenous Data Quality Methodology (HDQM) are recom-
```
mended as good matches for large enterprises. These both DQ methodologies should not
be seen as the only suitable solution for large enterprises, because especially in real-world
applications most commercial products use adoptions and customized solutions, which
are often not based on these scientific theoretical concepts.
```
6.2.1 Data Quality In Cooperative Information Systems (DaQuinCIS)
```
DaQuinCIS gets recommended due to the fact, that it is designed for CISs and is
described in detail by multiple papers. It includes suggestions on how to design enterprise
architectures with multiple organisations working together and sharing data. One
important aspect of this methodology is the standardized data model which gets used
to transfer data between organisations but does not require each organisation to adopt
this data model internally. Therefore originally data structures of other organisations do
not be changed completely to establish this methodology. Instead wrapper services can
be integrated between the communication media of organisations and the internal data
sources, which takes care of converting data objects into the right format. Another unique
aspect of the methodology is the inclusion of an independent software service called
Rating Service, which assigns “trust values” to each package and uses indicators for the
reliability of the quality evaluation performed by the organisation. This Rating Service
checks implemented DQ measurement and assessment methods of each organisation and
can evaluate if the result is reliable and good enough for other organisations.
DaQuinCIS supports dimension-based DQ assessment methods based on metrics for
Accuracy, Completeness, Currency, Consistency and other dimensions. These assessment
methods can be applied to structured and semi-structured data types. The methodology
also supports the expansion of existing and creation of new DQ dimensions and metrics.
Improving data with the help of DaQuinCIS is not described in much detail, but it
87
6. Conclusions, Recommendations and Future Work
provides suggestions on requesting the same data of different organisations, comparing
the quality levels of each organisation and choosing the best one. Other improvement
methods are not introduced in DaQuinCIS and must be researched and implemented.
In conclusion, the DQ methodology DaQuinCIS provides a lot of capabilities for large
enterprises, which can be very useful, especially due to the concrete description of the
architecture, how internal workflows can be designed, and the focus on CIS. It fulfils
many requirements of stakeholders regarding DQ methodologies formulated in Table 4.1.
```
6.2.2 Heterogenous Data Quality Methodology (HDQM)
```
HDQM is based on the evaluated methodology CDQ and expands on its ideas and also
introduces a lot more details in its description.
In contrast to DaQuinCIS, the methodology HDQM focuses at the beginning of its
description on a unified meta-model, which aims to establish all relevant relations between
the important entities of an organisation, such as organisational units, processes, and
connects these to DQ dimensions, metrics, measurement results and custom methodology
specific entities. Understanding the idea behind this HDQM meta-model is complicated
at first and takes a lot of time, especially because it is one of the first things, which are
introduced in the main source and everything builds on these concepts. This meta-model
can also be seen as a suggestion on how data should be stored and relevant information
must be related to each other for efficient use of this methodology.
HDQM is not designed for cooperative application areas and CISs but can be applied to
it nonetheless.
The assessment of DQ is done in a dimension-based form similarly as DaQuinCIS. The
methodology introduces and describes only the dimensions of Accuracy and Currency
including matching metrics, but the authors emphasize the general idea behind the
methodology, which is the expandability regarding new dimensions. Therefore only two
dimensions were described because the methodology should be adopted as the users see
fit and are not restricted to pre-defined DQ dimensions and metrics.
The included improvement activities are an important aspect of this methodology because
they provide ways to improve data in process- and data-driven methods. This gives the
methodology a lot of options to improve static and not frequently changing data sets, and
also improve data of regularly added information. Expanding the improvement activities
with cost-benefit calculations also gives more information to stakeholders, if they should
invest in certain business processes to be more efficient.
HDQM is also one of the few DQ methodologies, which does not only focus on struc-
tured and/or semi-structured data types but also includes in its description support for
unstructured data.
Even though HDQM can be applied to large enterprise systems, not much information
is given in the main source on how communication between organisations can work in
practice and how data can be shared between them.
88
6.3. Tool Recommendation
HDQM can be a capable DQ methodology for large enterprises, but due to design decisions
such as a complex meta-model, which requires a lot of work on the organisation’s side,
it is not as easy to understand and maybe also not as practical than DaQuinCIS. The
integration in enterprise architectures is also not as well described as in DaQuinCIS.
Each part of the architecture of DaQuinCIS gets explained in separate papers, which in
total is more information than HDQM provides.
In conclusion, DaQuinCIS seems to be a better fit for large enterprises in total. This
judgment is done based on the fact that a lot of enterprise-related topics are already
present in its main sources. In contrast to that, HDQM leaves a lot of questions
unanswered on how to implement it in a real-world application and cover certain aspects
of large enterprises, such as multiple organisations communicating with each other and
sharing data. But this problem of unspecified real-world use cases is present in almost
all of the assessed methodologies in this thesis and a general problem of many DQ
methodologies.
6.3 Tool Recommendation
Giving a recommendation on certain DQ tools to choose for enterprise applications is a
difficult task.
Commercial versions, such as Informatica Data Quality and Experian Aperture Data
Studio can provide a lot of functionalities and are often more developed than other open-
source solutions. They usually provide extensive customer support and their customer
base consists of big enterprises. The most promising commercial version of this assessment
```
seems to be Experian Aperture Data Studio (EADS). It provides options for integrating
```
distributed data, includes metrics for DQ dimensions Accuracy and Completeness, and
also includes a broad variety of options for including pre-defined and custom business rules
in data assessment activities. It also allows for assessing data in more detail with the help
of analytics and graphs. Some simple improvement capabilities, such as deduplication
and address correction, are also provided by EADS, which is not provided by any other
tool.
This does not mean, that open-source tools, such as Great Expectations, can not compete
with them in certain areas. The big advantage of the tool GX is the fact, that it is built
in Python and provides a lot of different integration options and can also be expanded by
users if necessary. This gives many possibilities to include GX in assessment procedures.
Even if GX is built on their own so-called “expectations”, which can be seen as unit tests
or requirements for data sets, and these can be altered so that for example metrics of DQ
dimensions can be validated. One big downside of open-source tools is always the missing
customer support, if problems come up, which are rooted in the software itself and not
the cause of wrong user interactions. Community support for GX is on the other hand
very strong and also seems to grow, because GX does not exist that long. The potential
for GX and how it can do data measurement and assessment is for an open-source tool not
to be underestimated. A lot of its success depends on further development, community
89
6. Conclusions, Recommendations and Future Work
support, and what people come up with for integrating GX into other data management
solutions, such as cloud-based data storage. One big disadvantage of GX is a missing
interactive user interface. If the assessment of data sets is finished, static HTML files are
generated, where users can analyse the results, but any configuration of the tool must be
done in text editors and in terminal windows.
In conclusion, this thesis recommends a deeper look into both the commercial tool
Experian Aperture Data Studio and the open-source tool Great Expectations. Regarding
the requirements of large enterprises, which often need failsafe systems, if they want to
use them on all levels, a commercial tool is a safer solution. This should not undermine
the potential of tools such as GX, which can be also very capable if implemented correctly.
There are articles [ 95] on how to set up GX with specific cloud-based data storages, which
should be implemented in banking sectors. Therefore it seems that specialists in the field
of data engineering take this tool seriously enough to implement in commercial solutions,
where a lot of money is on the line.
6.4 Summary and Future Work
The assessment of DQ methodologies lead to two recommendations: DaQuinCIS and
HDQM. These two methodologies fulfilled the most requirements and were also different
enough in their approach, for them to be both recommended. DaQuinCIS seems to be a
better fit for large enterprises in total, because the methodology defines a lot enterprise
related topics, in contrast to HDQM, which leaves a lot of questions unanswered on how
to implement it in a real-world application.
The tool assessment process led to the recommendation of these two DQ tools: EADS
and GX. EADS is a commercial software tool and GX is an open-source solution. The
tool recommendation consists of two tools, because even though EADS as a commercial
software solution is more developed and provides typical commercial advantages, such as
customer support and better user interface, the open-source solution GX does deliver
a lot of potential due to its open-source nature, rich feature sets, a lot of potential in
general and the huge community support on the internet.
Questions such as how well can tools improve data, what are limitations to certain
improvement algorithms, and what kind of data can be improved in the first place, were
not covered in this thesis. These questions and many more in the area of DQ are still
unanswered and provide a lot of future research topics. Theoretical aspects of DQ are
still researched a lot even nowadays there are currently changes in opinions. Research in
practical application areas is much further behind and especially in bigger application
contexts a lot more work must be done.
90
List of Figures
1.1 Organisation and specific data objects example . . . . . . . . . . . . . . . 3
1.2 Methodology overview of this thesis . . . . . . . . . . . . . . . . . . . . . 6
2.1 DaQuinCIS architecture . . . . . . . . . . . . . . . . . . . . . . . . . . . . 25
2.2 DQA’s assessment approach . . . . . . . . . . . . . . . . . . . . . . . . . . 29
2.3 DQA’s subjective and objective assessment quadrants . . . . . . . . . . . 30
2.4 HDQM meta model . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 32
2.5 HDQM’s phases, inputs and outputs . . . . . . . . . . . . . . . . . . . . . 34
2.6 Example for defining and calculating of target values [23] . . . . . . . . . 36
```
2.7 Two possible improvement candidate processes with the flows A and B (based
```
```
on the case study of Batini et al. [23]) . . . . . . . . . . . . . . . . . . . . 37
```
2.8 An example for a possible evaluation result of two candidate improvement
```
processes [23]) . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 38
```
2.9 HIQM step architecture [22] . . . . . . . . . . . . . . . . . . . . . . . . . . 40
2.10 Architecture of the Warning Management System [22] . . . . . . . . . . . 43
3.1 Requirement elicitation process in cooperation with stakeholders of enterprise 50
91
List of Tables
2.1 Overview of DQ methodologies applicable to large enterprises . . . . . . . 21
3.1 Requirements acquired from collaborating company and based on research
results of CIS requirements [69, 62, 30] . . . . . . . . . . . . . . . . . . . . 51
3.2 Requirement Catalogue for DQ methodologies . . . . . . . . . . . . . . . . 56
3.3 Requirement Catalogue for DQ tools based on tool survey by Ehrlinger et al.
[35] and expanded upon in this thesis . . . . . . . . . . . . . . . . . . . . 61
4.1 DQ methodology capabilities evaluation based on “Methodology Requirements”
shown in Table 3.2 . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 66
5.1 DQ tools capabilities evaluation based on “Tool Requirements” shown in
Table 3.3 . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 74
93
Acronyms
API Application Programming Interface. 53, 60, 75, 85
CDQ Comprehensive Data Quality Methodology for Web and Structured Data. 20–23,
31, 33, 57, 65–71, 83, 84, 88
CEO Chief Executive Officer. 54
CIS Cooperative Information System. 3–5, 9, 11, 12, 16, 20, 23, 24, 26, 50–52, 55, 56,
66, 67, 81–83, 87, 88, 93
CSV Comma-Separated Values. 75
DaQuinCIS Data Quality In Cooperative Information Systems. xii, xiii, 12, 23–27, 57,
65–70, 83, 84, 87–91
DB Database. 10, 13, 15
DQ Data Quality. 1–5, 7, 9–47, 49–51, 53–63, 65–70, 73–79, 81–90, 93
```
DQA Data Quality Assessment (Methodology). 27–31, 57, 65–70, 83, 84, 91
```
D2Q Data and Data Quality. 24, 25, 27, 67
EADS Experian Aperture Data Studio. xii–xiv, 45, 73, 75–79, 84–86, 89, 90
ETL Extract Transform Load. 10
GX Great Expectations. xii, xiv, 47, 73, 75–79, 84–86, 89, 90
HDQM Heterogenous Data Quality Methodology. 31–35, 37, 38, 57, 65–71, 83, 84,
87–91
HIQM Hybrid Information Quality Management. 39–42, 57, 65–70, 83, 84, 91
HR Human Resources. 12, 24, 26, 33
HTML Hypertext Markup Language. 11, 47
95
ID Identifier. 2, 65, 73
IDQ Informatica Data Quality. 45, 73, 75–79, 84–86, 89
IP-MAP Information Product Map. 39, 40
JSON JavaScript Object Notation. 11, 47, 52, 67, 75
MDQ MobyDQ. 46, 73, 75–79, 84–86
RC Requirement Catalogue. 49, 50, 55, 56, 60, 61, 65, 73, 93
RDF Resource Description Framework. 13
REST Representational State Transfer. 53, 60, 68, 85
TDQM Total Data Quality Management. 44, 57, 83
TIQM Total Information Quality Management. 44, 57, 83
TOS Talend Open Studio. 46, 73, 75, 77–79, 84–86
XML Extensible Markup Language. 11, 13, 52, 67
96
Bibliography
[1] Ziawasch Abedjan. Data Profiling. In Encyclopedia of Big Data Technologies, pages
563–568. Springer International Publishing, Cham, 2019.
[2] AbedjanZiawasch, GolabLukasz, and NaumannFelix. Profiling relational data.
The VLDB Journal — The International Journal on Very Large Data Bases,
```
24(4):557–581, 8 2015.
```
[3] Detlef Apel, Wolfgang Behme, Rüdiger Eberlein, and Christian Merighi. Datenqual-
ität erfolgreich steuern: Praxislösungen für Business-intelligence-projekte. dpunkt.
verlag, 2015.
[4] Paolo Atzeni and Valeria De Antonellis. Relational database theory. Benjamin-
Cummings Publishing Co., Inc., 1993.
[5] Alessandro Avenali, Carlo Batini, Paola Bertolazzi, and Paolo Missier. Brokering
infrastructure for minimum cost data procurement based on quality–quantity
```
models. Decision Support Systems, 45(1):95–109, 4 2008.
```
[6] Xue Bai, Ramayya Krishnan, Rema Padman, and Harry Jiannan Wang.
On Risk Management with Information Flows in Business Processes.
```
https://doi.org/10.1287/isre.1120.0450, 24(3):731–749, 11 2012.
```
[7] Donald Ballou, Richard Wang, Harold Pazer, and Giri Kumar Tayi. Modeling
information manufacturing systems to determine information product quality.
```
Management Science, 44(4):462–484, 1998.
```
[8] J Barateiro, H Galhardas Datenbank-Spektrum, and Undefined 2005. A survey of
data quality tools. dc-pubs.dbs.uni-leipzig.de.
[9] Kimberly A. Barchard and Larry A. Pace. Preventing human error: The impact
of data entry methods on data accuracy and statistical results. In Computers in
Human Behavior, pages 1834–1839. Pergamon, 9 2011.
[10] C. Batini and M. Scannapieco. Data Quality: Concepts, Methods, and Techniques.
Data-Centric Systems and Applications. Springer Berlin Heidelberg, 2006.
97
[11] Carlo Batini, Federico Cabitza, Cinzia Cappiello, and Chiara Francalanci. A
comprehensive data quality methodology for web and structured data. International
```
Journal of Innovative Computing and Applications, 1(3):205–218, 2006.
```
[12] Carlo Batini, Cinzia Cappiello, Chiara Francalanci, and Andrea Maurino. Method-
ologies for data quality assessment and improvement. ACM Computing Surveys,
```
41(3):1–52, 7 2009.
```
[13] Carlo Batini and Monica Scannapieco. Data and Information Quality : Dimensions,
Principles and Techniques. Data-Centric Systems and Applications. Springer
International Publishing Imprint: Springer, Cham, 1st ed. 20 edition, 2016.
[14] Carlo Batini and Monica Scannapieco. Methodologies for Information Quality
Assessment and Improvement. pages 353–402. Springer, Cham, 2016.
[15] R Baxter, P Christen, and T Churches. A Comparison of Fast Blocking Methods
```
for Record Linkage; erschienen in: Proceedings of the Workshop on Data Cleaning,
```
Record Linkage and Object Consolidation at the Ninth ACM SIGKDD International
Conference on Knowledge Discovery and Data Mining. Washington DC, 2003.
[16] Laure Berti-Équille. Measuring and Modelling Data Quality for Quality-Awareness
in Data Mining. Studies in Computational Intelligence, 43:101–126, 2007.
[17] P Bertolazzi, M Scannapieco IQ, and Undefined 2001. Introducing Data Quality
in a Cooperative Context. Proceedings of the Sixth International Conference on
Information Quality, 2001.
[18] Robert Blumberg and Shaku Atre. The problem with unstructured data. Dm
```
Review, 13(42-49):62, 2003.
```
[19] M Bovee, RP Srivastava, B Mak International journal of, and undefined 2003. A
conceptual framework and belief-function approach to assessing overall information
```
quality. Wiley Online Library, 18(1):51–74, 1 2003.
```
[20] Cambridge. DATA | meaning in the Cambridge English Dictionary.
```
[21] Cambridge Research Group. Information Quality Assessment (IQA) Software Tool.
```
Technical report, Cambridge Research Group, 1997.
[22] Cinzia Cappiello, Paolo Ficiaro, and Barbara Pernici. HIQM - A methodology for
information quality monitoring, measurement, and improvement. Lecture Notes in
```
Computer Science (including subseries Lecture Notes in Artificial Intelligence and
```
```
Lecture Notes in Bioinformatics), 4231 LNCS:339–351, 2006.
```
[23] Batini Carlo, Barone Daniele, Cabitza Federico, and Grega Simone. A data
quality methodology for heterogeneous data. International Journal of Database
```
Management Systems, 3(1):60–79, 2011.
```
98
[24] M. Castellano, N. Pastore, F. Arcieri, V. Summo, and G.B. de Grecis. An E-
Government Cooperative Framework for Government Agencies. Proceedings of the
38th Annual Hawaii International Conference on System Sciences, pages 121c–121c,
2005.
[25] M. Chien and A. Jain. Magic Quadrant for Data Quality Tools. Technical report,
Gartner Inc., 2020.
[26] Corinna Cichy and Stefan Rass. An overview of data quality frameworks. IEEE
Access, 7:24634–24648, 2019.
[27] L. Costantini, C. Nwafor, S. Lorenzi, A. Marrano, P. Ruffa, P. Moreno-Sanz, S. Rai-
mondi, A. Schneider, I. Gribaudo, and M.S. Grando. Data Quality Assurance in
Cooperative Information Systems: A Multi-Dimension Quality Certificate. Inter-
```
national Workshop on Data Quality in Cooperative Information Systems (DQCIS
```
```
2003- ICDT 2003), (22):p.43, 2003.
```
[28] Tamraparni Dasu and Theodore Johnson. Exploratory Data Mining and Data
Cleaning. Exploratory Data Mining and Data Cleaning, 5 2003.
[29] Joseph A De Feo. Juran’s quality handbook: The complete guide to performance
excellence. McGraw-Hill Education, 2017.
[30] Giorgio De Michelis, Eric Dubois, Matthias Jarke, Florian Matthes, John Mylopou-
los, Mike Papazoglou, Klaus Pohl, Joachim Schmidt, Carson Woo, and Eric Yu.
Cooperative information systems: a manifesto. 1997.
[31] Luca De Santis, Monica Scannapieco, and Tiziana Catarci. Trusting Data Quality
```
in Cooperative Information Systems. Lecture Notes in Computer Science (in-
```
cluding subseries Lecture Notes in Artificial Intelligence and Lecture Notes in
```
Bioinformatics), 2888:354–369, 2003.
```
[32] Wayne W Eckerson and Research Sponsors. Achieving Business Success through a
Commitment to High Quality Data TDWI REPORT SERIES DATA QUALITY
AND THE BOTTOM LINE. TDWI REPORT SERIES, 2002.
[33] Lisa Ehrlinger. Automated Continuous Data Quality Measurement. PhD thesis,
2021.
[34] Lisa Ehrlinger and Wolfram Wöß. Automated data quality monitoring. In Pro-
```
ceedings of the 22nd MIT International Conference on Information Quality (ICIQ
```
```
2017), pages 11–15, 2017.
```
[35] Lisa Ehrlinger and Wolfram Wöß. A Survey of Data Quality Measurement and
Monitoring Tools. Frontiers in Big Data, 5:28, 3 2022.
99
[36] Larry P. English. Improving data warehouse and business information quality :
methods for reducing costs and increasing profits. Wiley computer publishing, page
518, 1999.
[37] Great Expectations. Great Expectations Documentation.
```
https://docs.greatexpectations.io/docs/ (02.10.2022), 2022.
```
[38] Experian. Experian Aperture Data Studio - Accuracy and Completeness.
```
https://docs.experianaperture.io/data-quality/aperture-data-studio-v2/create-
```
a-single-customer-view-scv/validate-and-enrich-data/#validate-phone-numbers-
```
step (14.10.2022).
```
[39] Experian. Experian Aperture Data Studio - Get Data.
```
https://docs.experianaperture.io/data-quality/aperture-data-studio-v2/get-
```
```
started/get-data-use-datasets/#upload-file-or-load-from-directory (14.10.2022).
```
[40] Experian. Aperture Data Studio v2 Documentation.
```
https://docs.experianaperture.io/data-quality/aperture-data-studio-v2/
```
```
(02.10.2022), 2022.
```
[41] Experian. Experian Aperture Data Studio - External system/data
sources. https://docs.experianaperture.io/data-quality/aperture-data-studio-
```
v2/get-started/configure-external-systems/ (14.10.2022), 2022.
```
[42] Craig W. Fisher, Eitel J.M. Lauria, and Carolyn C. Matheus. An Accuracy Metric.
```
Journal of Data and Information Quality (JDIQ), 1(3), 12 2009.
```
[43] Jerry Gao, Chunli Xie, and Chuanqi Tao. Big data validation and quality assurance
- Issuses, challenges, and needs. Proceedings - 2016 IEEE Symposium on Service-
Oriented System Engineering, SOSE 2016, pages 433–441, 5 2016.
[44] Christopher Getts. Data Validation - Measuring Completeness, Consistency, and
Accuracy Using Great Expectations with PySpark. https://medium.com/99p-
labs/data-validation-measuring-completeness-consistency-and-accuracy-using-
```
great-expectations-with-c0ad2924e425 (16.10.2022), 2021.
```
[45] Tom Haegemans, Monique Snoeck, and Wilfried Lemahieu. Towards a Precise
Definition of Data Accuracy and a Justification for its Measure. In International
Conference on Information Quality, 8 2016.
[46] Anders Haug, Frederik Zachariassen, and Dennis Liempd. The costs of poor data
quality. Journal of Industrial Engineering and Management, 4, 2011.
[47] Bernd Heinrich, Marcus Kaiser, and Mathias Klier. HOW TO MEASURE DATA
QUALITY? A METRIC BASED APPROACH. 2007.
[48] Bernd Heinrich, Marcus Kaiser, and Mathias Klier. Metrics for measuring data
quality-foundations for an economic oriented management of data quality. 2007.
100
[49] H Hinrichs. Datenqualitaetsmanagement in data warehouse systemen. 2002.
[50] K. Huang, Y. Lee, and R. Wang. Quality Information and Knowledge. Technical
report, 1999.
```
[51] IBM. What is ETL (Extract, Transform, Load)? | IBM.
```
```
https://www.ibm.com/cloud/learn/etl (23.10.2022).
```
[52] IEEE. 1061-1998 IEEE Standard for a Software Quality Metrics Methodology.
Technical Report - Standard for a Software Quality Metrics Methodology, 1998.
[53] Informatica. The Informatica Data Quality Methodology A Framework to Achieve
Pervasive Data Quality Through Enhanced Business-IT Collaboration, 2010.
[54] Informatica. Improve the Quality of Your Data to Accelerate Your Data-Driven
Digital Transformation, 2018.
```
[55] Informatica. Data Engineering Quality 10.5.1 (Documentation).
```
```
https://docs.informatica.com/data-engineering/data-engineering-quality/10-
```
```
5-1.html (02.10.2022), 2022.
```
```
[56] Informatica. Informatica Data Quality 10.5.2 (Documentation).
```
```
https://docs.informatica.com/data-quality-and-governance/data-quality/10-
```
```
5-2.html (02.10.2022), 2022.
```
[57] International Organization for Standardization. ISO - ISO 9000:2015 - Quality
management systems — Fundamentals and vocabulary.
[58] International Organization for Standardization. ISO 25012.
[59] Cornelia Kiefer. Assessing the Quality of Unstructured Data: An Initial Overview.
In LWDA, pages 62–73, 2016.
[60] Jochen Kokemueller, Florian Haupt, Dieter Spath, Anette Weisbecker, and Stuttgart
Fraunhofer IAO. Datenqualitaetswerkzeuge 2012 Werkzeuge zur Bewertung und
Erhoehung von Datenqualitaet.
[61] Liping Liu and Lauren N Chi. EVOLUTIONAL DATA QUALITY: A THEORY-
SPECIFIC VIEW. Proceedings of the Seventh International Conference on Infor-
```
mation Quality (ICIQ-02), 2002.
```
[62] Q Liu, G Feng, W Zheng, J Tian Expert Systems with Applications, and Undefined
2022. Managing data quality of cooperative information systems: Model and
algorithm. Expert Systems With Applications 189, 2022.
[63] David Loshin. Master Data Management. Master Data Management, 2009.
101
[64] Heather Maguire. Book review: Data quality: concepts, methodologies and tech-
niques by C. Batini and M. Scannapieco. International Journal of Information
```
Quality, 1(4):444–450, 2007.
```
[65] T. N. Manjunath and Ravindra S. Hegadi. Data quality assessment model for data
migration business enterprise. International Journal of Engineering and Technology,
```
5(1):101–109, 2013.
```
[66] C Marchetti, M Mecella, M Scannapieco, and A Virgillito. Enabling Data Quality
Notification in Cooperative Information Systems through a Web-service based
Architecture. 2003.
[67] Arkady Maydanchik. Data quality assessment. Technics publications, 2007.
[68] Massimo Mecella, Monica Scannapieco, Antonino Virgillito, Roberto Baldoni,
Tiziana Catarci, and Carlo Batini. The DaQuinCIS Broker: Querying Data and
Their Quality in Cooperative Information Systems. Lecture Notes in Computer
```
Science (including subseries Lecture Notes in Artificial Intelligence and Lecture
```
```
Notes in Bioinformatics), 2003.
```
[69] Mecella Massimo, Scannapieco Monica, Virgillito Antonino, Baldoni Roberto,
Catarci Tiziana, and Batini Carlo. Managing Data Quality in Cooperative Infor-
mation Systems. In Meersman Robert and Zahir Tari, editors, On the Move to
Meaningful Internet Systems 2002: CoopIS, DOA, and ODBASE, pages 486–502,
Berlin, Heidelberg, 2002. Springer Berlin Heidelberg.
[70] D. Milano and Monica Scannapieco. Design and implementation of a peer-to-peer
data quality broker. 2006.
[71] Glen D. Murphy. Improving the quality of manually acquired data: Applying the
theory of planned behaviour to data quality. Reliability Engineering and System
```
Safety, 94(12):1881–1886, 12 2009.
```
[72] D. Myers. About the Dimensions of Data Quality | Conformed Dimensions of Data
Quality, 2017.
[73] Felix Naumann, Johann Christoph Freytag, and Ulf Leser. Completeness of
```
integrated information sources. Information Systems, 29(7):583–615, 10 2004.
```
```
[74] NaumannFelix. Data profiling revisited. ACM SIGMOD Record, 42(4):40–49, 2
```
2014.
[75] Boris Otto and Hubert Österle. Corporate Data Quality : Voraussetzung erfol-
greicher Geschäftsmodelle. Springer Berlin Heidelberg Imprint: Springer Gabler,
Berlin, Heidelberg, 1. aufl. 2 edition, 2016.
102
[76] Payam Hassany Shariat Panahy, Fatimah Sidi, Lilly Suriani Affendey, and
Marzanah A. Jabar. The impact of data quality dimensions on business pro-
cess improvement. 2014 4th World Congress on Information and Communication
Technologies, WICT 2014, pages 70–73, 4 2014.
[77] Leo L. Pipino, Yang W. Lee, and Richard Y. Wang. Data quality assessment.
```
Communications of the ACM, 45(4):211–218, 4 2002.
```
[78] Leo L. Pipino, Richard Y. Wang, James D. Funk, and Yang W. Lee. Journey to
Data Quality. Journey to Data Quality, 12 2006.
[79] Andrea Piro. Informationsqualität bewerten: Grundlagen, Methoden, Praxisbeispiele.
Symposion Publishing GmbH, Düsseldorf, Germany, 1st editio edition, 2014.
[80] Val Pushkarev, Henry Neumann, Cihan Varol, and John Talburt. An Overview of
Open Source Data Quality Tools. pages 370–376, 2010.
[81] Thomas C. Redman. Data Quality for the Information Age. Communications of
```
the ACM, 41(2):79–82, 1998.
```
[82] Thomas C. Redman. Impact of poor data quality on the typical enterprise. Com-
```
munications of the ACM, 41(2):79–82, 2 1998.
```
[83] Thomas C. Redman. Measuring data accuracy: A framework and review. Informa-
tion Quality, pages 21–36, 12 2005.
[84] Monica Scannapieco, Antonino Virgillito, Carlo Marchetti, Massimo Mecella, and
```
Roberto Baldoni. The DaQuinCIS architecture. Information Systems, 29(7):551–
```
582, 9 2004.
[85] Sebastian Schelter, Dustin Lange, Philipp Schmidt, Meltem Celikel, Felix Biessmann,
Andreas Grafberger, and Meltem Ce-Likel. Automating Large-Scale Data Quality
```
Verification. PVLDB, 11(12):1781–1794, 2018.
```
[86] Laura Sebastian-Coleman. Measuring Data Quality for Ongoing Improvement.
Measuring Data Quality for Ongoing Improvement, 2013.
[87] Ganesan Shankaranarayan, Richard Y Wang, and Mostapha Ziad. Modeling the
Manufacture of an Information Product with IP-MAP. In Proceedings of the 6th
International Conference on Information Quality, 2000.
[88] Tomas Sobotík. How to ensure data quality with Great Expecta-
tions. https://medium.com/snowflake/how-to-ensure-data-quality-with-great-
```
expectations-271e3ca8b4b9 (02.10.2022), 2021.
```
[89] Mihail Stoica, Nimit Chawat, and Namchul Shin. An investigation of the method-
ologies of business process reengineering. Technical report, 2004.
103
[90] Diane M Strong, Yang W Lee, and Richard Y Wang. Data Quality In Context.
```
Communications of the ACM, 40(5), 1997.
```
[91] Talend. Talend Open Studio for Data Quality Getting Started Guide.
```
https://help.talend.com/r/en-US/8.0/studio-getting-started-guide-open-studio-
```
```
for-data-quality/introduction (02.10.2022), 2022.
```
[92] Talend. Talend Open Studio for Data Quality User Guide.
```
https://help.talend.com/r/en-US/8.0/studio-user-guide-open-studio-for-data-
```
```
quality/launching-talend-studio (02.10.2022), 2022.
```
[93] Ubisoft Entertainment. MobyDQ Documentation.
```
https://ubisoft.github.io/mobydq/ (14.10.2022), 2022.
```
[94] Karen Bajador Valencia. Data Quality Unit Tests in PySpark Using Great Expec-
tations. https://towardsdatascience.com/data-quality-unit-tests-in-pyspark-using-
```
great-expectations-e2e2c0a2c102 (02.10.2022).
```
[95] Karen Bajador Valencia. Great Expectations: The Data Testing Tool – Is This
the Answer to Our Data Quality Needs? https://towardsdatascience.com/great-
expectations-the-data-testing-tool-is-this-the-answer-to-our-data-quality-needs-
```
f6d07e63f485 (02.10.2022), 2021.
```
[96] Venkata Sai Venkatesh Pulla, Cihan Varo, and Murat Al. Open source data quality
```
tools: Revisited. Advances in Intelligent Systems and Computing, 448:893–902,
```
2016.
[97] Antonio Vetrò, Lorenzo Canova, Marco Torchiano, Camilo Orozco Minotas, Rai-
mondo Iemma, and Federico Morando. Open data quality measurement framework:
Definition and application to Open Government Data. Government Information
```
Quarterly, 33(2):325–337, 4 2016.
```
[98] WandYair and WangRichard Y. Anchoring data quality dimensions in ontological
```
foundations. Communications of the ACM, 39(11):86–95, 11 1996.
```
[99] Richard Y. Wang. A product perspective on total data quality management.
```
Communications of the ACM, 41(2):58–65, 2 1998.
```
[100] Richard Y Wang and Diane M Strong. Beyond Accuracy: What Data Quality Means
```
to Data Consumers. Journal of management information systems, 12(4):5–33, 1996.
```
[101] William E. Winkler. Matching and record linkage. Wiley Interdisciplinary Reviews:
```
Computational Statistics, 6(5):313–325, 9 2014.
```
104