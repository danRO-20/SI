# Capítulo I: Introducción

La presente introducción tiene como finalidad contextualizar el proyecto desarrollado, proporcionando una visión general de los antecedentes, objetivos y fundamentos que sustentan su planteamiento. Asimismo, delimita el alcance de la propuesta y establece el marco de referencia necesario para comprender su desarrollo, destacando su relevancia, los retos que busca abordar y los beneficios esperados de su implementación. De esta manera, se ofrece una base conceptual que orienta al lector y facilita la comprensión de los contenidos expuestos en las secciones posteriores del documento.

## 1.1. Startup Profile

La presente sección tiene como finalidad presentar la startup responsable de la propuesta y los elementos que definen su identidad organizacional. En ella se describen los aspectos fundamentales relacionados con la empresa, incluyendo su misión, visión, propósito, propuesta de valor y características principales de la solución planteada. Asimismo, se exponen los componentes que permiten comprender el enfoque adoptado y la manera en que la startup busca generar valor dentro de su ámbito de aplicación. De esta manera, la información desarrollada proporciona el contexto necesario para comprender la propuesta presentada y su relación con los objetivos generales del proyecto.

### 1.1.1. Descripción de la Startup

La startup IngesCompany se dedica al desarrollo de soluciones tecnológicas orientadas a la transformación digital de procesos especializados en industrias altamente reguladas. Su objetivo es contribuir a la mejora de la eficiencia operativa, la gestión de información y el cumplimiento de estándares de calidad mediante herramientas digitales que apoyen las actividades críticas de las organizaciones.

Como parte de esta visión, la empresa desarrolla DoofPlus, una plataforma web diseñada para apoyar la gestión de calidad y la trazabilidad dentro de la industria farmacéutica. La solución permite centralizar información relacionada con los procesos de fabricación y control de calidad, facilitando el acceso a registros organizados, confiables y disponibles para su consulta y seguimiento.

DoofPlus busca fortalecer la gestión de los procesos asociados al ciclo de vida de los productos farmacéuticos, apoyando actividades de documentación, trazabilidad y cumplimiento regulatorio. De esta manera, la plataforma contribuye a mejorar la visibilidad de la información requerida para la toma de decisiones y favorece el cumplimiento de las Buenas Prácticas de Manufactura (BPM) y de los estándares exigidos por las entidades regulatorias del sector.

### Misión

Diseñar soluciones tecnológicas abiertas que permitan digitalizar y optimizar la gestión de calidad farmacéutica, integrando información operativa y datos IoT para fortalecer la trazabilidad, el cumplimiento regulatorio y la confiabilidad de los procesos.

### Visión

Convertirnos en una referencia en soluciones digitales de aseguramiento de calidad para la industria farmacéutica latinoamericana, facilitando la adopción de tecnologías abiertas que mejoren la trazabilidad, la integridad de los datos y la gestión del cumplimiento regulatorio.

### 1.1.2. Perfiles de integrantes del equipo

| Foto | **Nombres, código y carrera** | **Resumen de conocimientos y habilidades** |
| --- | --- | --- |
| <img src="../assets/img/photo/Marcelo.jpg" width="120"> | **Angulo Ramírez, Marcelo Martín**<br>Código: U202321425<br>Carrera: Ingeniería de Software<br>GitHub: Zock2005 | Tengo 21 años y soy una persona puntual, responsable y comunicativa. Me interesé por la carrera gracias a los cursos de programación del colegio y a los que llevé por mi cuenta. Manejo C++ y Python; en el proyecto aporto en investigación de usuarios (diseño y análisis de entrevistas), diseño UX/UI de la Web Application y en la integración de los capítulos del informe con GitFlow. |
| <img src="../assets/img/photo/Yhoshua.jpg" width="120"> | **Cobades Zamora, Yhoshua Hebert**<br>Código: U20231H117<br>Carrera: Ingeniería de Software<br>GitHub: YhoshuaCZ | Tengo 19 años, me apasiona la tecnología y trabajo bien bajo presión. Uso Linux (Arch) como entorno principal, lo que me ha dado experiencia con la terminal, Git y la configuración de entornos. En el proyecto aporto en la gestión del Product Backlog en Jira, la configuración de repositorios y despliegues (GitHub Pages) y la documentación de Software Configuration Management. |
| <img src="../assets/img/photo/Ricardo.jpg" width="120"> | **Flores Martinez, Ricardo Andres**<br>Código: U202423162<br>Carrera: Ingeniería de Software<br>GitHub: Nitoryu2801 | Tengo 19 años y soy una persona responsable, organizada y comprometida. Mi interés por la programación nació en mi familia, lo que me llevó a elegir Ingeniería de Software. Cuento con conocimientos de programación, bases de datos y maquetación web (HTML y CSS); en el proyecto aporto en las fichas de User Persona, los Empathy Maps y la implementación de la Landing Page. |
| <img src="../assets/img/photo/Daniel.jpg" width="120"> | **Rojas Ambicho, Nestor Daniel**<br>Código: U20241F397<br>Carrera: Ingeniería de Software<br>GitHub: danRO-20 | Tengo 20 años y me apasiona el desarrollo de aplicaciones. Tengo experiencia en proyectos académicos de software y bases de datos, y en modelado con UML y C4. En el proyecto aporto en los User Journey Maps, el Impact Mapping, la arquitectura de software (C4), el diseño orientado a objetos y la internacionalización de la Landing Page. |
| <img src="../assets/img/photo/Rodolfo.jpg" width="120"> | **Zavaleta Gutierrez, Rodolfo Martin**<br>Código: U20241F733<br>Carrera: Ingeniería de Software<br>GitHub: gutierrezrodolfo360-bit | Tengo 19 años y soy una persona puntual y responsable. Me interesé por la carrera gracias a los cursos de programación del colegio y a los que llevé por mi cuenta. Manejo HTML, CSS y JavaScript; en el proyecto aporto en la redacción de User Stories, el diseño de base de datos, el Design-Level EventStorming y los estilos e internacionalización de la Landing Page. |

## 1.2. Solution Profile

### 1.2.1. Antecedentes y problemática

#### 1. ANTECEDENTES:

La industria farmacéutica constituye uno de los sectores más regulados a nivel mundial debido al impacto directo que sus productos tienen sobre la salud y el bienestar de la población. En el Perú, la Dirección General de Medicamentos, Insumos y Drogas (DIGEMID) establece y supervisa el cumplimiento de las Buenas Prácticas de Manufactura (BPM), normativa que define los requisitos relacionados con la producción, el control de calidad, la documentación y la gestión de los procesos involucrados en la fabricación de medicamentos. Estas disposiciones tienen como objetivo asegurar que los productos farmacéuticos sean elaborados bajo condiciones controladas que garanticen su calidad, seguridad y eficacia durante todas las etapas de su ciclo de vida.

De manera complementaria, organismos internacionales como la Organización Mundial de la Salud (OMS) resaltan la importancia de la trazabilidad y la integridad de los datos como pilares fundamentales de los sistemas de gestión de calidad farmacéutica. La capacidad de registrar, conservar y consultar información de manera íntegra y oportuna permite respaldar actividades críticas como auditorías, investigaciones de desviaciones, validaciones de procesos y cumplimiento regulatorio, contribuyendo a una mayor confiabilidad operativa y a la protección de la salud de los pacientes.

En este contexto, la transformación digital se ha convertido en un factor estratégico para fortalecer la gestión de calidad dentro de las organizaciones farmacéuticas. La adopción de plataformas digitales integradas con tecnologías de captura y monitoreo de datos permite optimizar la trazabilidad de los lotes de producción, mejorar la disponibilidad y exactitud de los registros de calidad, y facilitar el acceso a información crítica para la toma de decisiones. Como resultado, estas iniciativas contribuyen a incrementar la eficiencia operativa, reducir riesgos asociados a errores manuales y fortalecer el cumplimiento de los requisitos regulatorios exigidos por las autoridades sanitarias nacionales e internacionales.

#### 2. PROBLEMATICA

##### - Gestión compleja de la documentación de calidad:

Los procesos de aseguramiento y control de calidad generan una gran cantidad de información asociada a protocolos, registros de producción, resultados de análisis, desviaciones y actividades de validación. La administración eficiente de esta documentación representa un desafío para las organizaciones farmacéuticas, especialmente cuando la información se encuentra distribuida en múltiples fuentes o sistemas independientes. Esta situación puede dificultar la búsqueda de evidencias y el seguimiento oportuno de los procesos relacionados con la calidad.

##### - Dificultades en la trazabilidad de lotes farmacéuticos:

La trazabilidad es un requisito esencial dentro de los sistemas modernos de calidad farmacéutica, ya que permite reconstruir el historial completo de fabricación de un producto. Sin embargo, la recopilación e integración de información proveniente de distintas etapas del proceso productivo puede resultar compleja, limitando la visibilidad sobre los eventos ocurridos durante el ciclo de vida de cada lote y dificultando las actividades de seguimiento, revisión e inspección.

##### - Necesidad de fortalecer la integridad y disponibilidad de la información:

La OMS destaca que la integridad de los datos es un componente esencial de los sistemas de calidad farmacéuticos. Los registros utilizados para actividades de producción, control de calidad y cumplimiento regulatorio deben mantenerse completos, precisos, consistentes y disponibles durante todo su ciclo de vida. La gestión inadecuada de la información puede afectar la confiabilidad de los procesos y dificultar las actividades de auditoría e inspección.

##### - Oportunidad de utilización de tecnologías IoT:

Las tecnologías basadas en Internet de las Cosas (IoT) permiten capturar información directamente desde equipos, entornos y procesos mediante dispositivos conectados. Su incorporación representa una oportunidad para complementar los registros de calidad con datos obtenidos de forma automática, aumentando la confiabilidad de la información y facilitando la supervisión de variables relevantes dentro de los procesos de fabricación farmacéutica.

#### 3. ANALISIS 5W & 2H:

- **What (¿Qué?):** *¿Qué es lo que se busca resolver?*

- Se busca resolver las limitaciones relacionadas con la gestión de documentación de calidad, la trazabilidad de los lotes farmacéuticos y la disponibilidad de información confiable para actividades de aseguramiento de calidad y cumplimiento regulatorio.

- **Why (¿Por qué?):** *¿Por qué es importante resolverlo?*

- Porque la calidad de los medicamentos depende de procesos adecuadamente controlados, documentados y respaldados por información íntegra y trazable. Además, una gestión eficiente de los registros facilita las auditorías, fortalece la toma de decisiones y contribuye al cumplimiento de las BPM y de los requisitos regulatorios aplicables.

- **Who (¿Quién?):** *¿A quién afecta?*

- Afecta principalmente a especialistas de aseguramiento y control de calidad (QA/QC), así como a responsables de producción farmacéutica encargados de supervisar procesos, gestionar documentación y asegurar el cumplimiento de estándares regulatorios.

- **When (¿Cuándo?):** *¿Cuándo ocurre?*

- La necesidad se presenta durante todas las etapas del ciclo de vida de un lote farmacéutico, incluyendo la fabricación, el control de calidad, la gestión de desviaciones, la revisión documental y las actividades de auditoría.

- **Where (¿Dónde?):** *¿En dónde ocurre?*

- Se manifiesta en laboratorios y plantas farmacéuticas donde se ejecutan actividades de producción, aseguramiento de calidad y control regulatorio.

- **How (¿Cómo?):** *¿Cómo se resuelve?*

- Puede abordarse mediante una plataforma digital que centralice protocolos, expedientes de calidad y registros asociados a los lotes farmacéuticos, complementando la información mediante tecnologías IoT para fortalecer la trazabilidad y disponibilidad de datos.

- **How much (¿Cuánto?):** *¿Cuánto cuesta resolverlo?*

- La implementación requiere infraestructura tecnológica para el despliegue de la solución, digitalización de procesos documentales, capacitación de los usuarios e integración con fuentes de información internas y dispositivos IoT. Para el laboratorio, el costo se traduce en una suscripción mensual sin inversión en servidores ni hardware propio: Standard Lab (US$199/mes) para laboratorios pequeños y Enterprise (US$599/mes) para operaciones multi-planta.

La técnica 5W + 2H permitió delimitar el problema (What), su impacto regulatorio (Why), los segmentos afectados (Who), los momentos críticos del ciclo de vida del lote (When), el entorno (Where), la estrategia de solución (How) y su costo (How much). Estos resultados se reflejan en el Problem Statement de la sección 1.2.2.1.

#### 4. OBJETIVOS

**Objetivo general:** desarrollar y desplegar DoofPlus, una solución web compuesta por una Landing Page, una Frontend Web Application y un RESTful API, que centralice la documentación de calidad, la trazabilidad de lotes y la gestión de desviaciones de laboratorios farmacéuticos pequeños y medianos de Lima Metropolitana, con el fin de reducir en 30% el tiempo de preparación de auditorías durante los primeros seis meses de uso.

**Objetivos específicos:**

- Validar las necesidades de especialistas QA/QC y jefes de producción mediante al menos tres entrevistas por segmento (AV1).
- Publicar una Landing Page responsive y bilingüe (en-US / es-419) que comunique la propuesta de valor y dirija a cada segmento a la Web Application (AV1 y TB1).
- Implementar la Frontend Web Application con Angular y Angular Material para los flujos core de lotes, desviaciones y documentación de calidad (TB1 y AV2).
- Implementar el RESTful API con Spring Boot y Spring Data JPA, documentado con OpenAPI (Swagger) e integrado con ThingsBoard y Niubiz (AV2 y TB2).
- Validar la solución con usuarios de ambos segmentos mediante evaluaciones heurísticas de usabilidad, arquitectura de información y diseño inclusivo (AV2 y TB2).

#### 5. RESTRICCIONES Y ALCANCE

- **Alcance:** Landing Page, Frontend Web Application y RESTful API de elaboración interna. No incluye aplicación móvil nativa ni fabricación de hardware IoT: la captura de datos de sensores se integra mediante la plataforma externa ThingsBoard.
- **Tecnológicas:** HTML5, CSS3 y JavaScript para la Landing Page; Angular con TypeScript y Angular Material (Material Design) para la Web Application; Spring Boot con Spring Data JPA (Java) para el RESTful API; MySQL como base de datos; OpenAPI (Swagger) para documentar los servicios; GitHub con GitFlow, Conventional Commits y Semantic Versioning.
- **Regulatorias:** DoofPlus apoya el cumplimiento de las BPM de DIGEMID y de los principios de integridad de datos de la OMS, pero no reemplaza la validación de sistemas computarizados que cada laboratorio debe ejecutar; las firmas electrónicas siguen los criterios de 21 CFR Part 11 sin constituir una certificación.
- **Datos personales:** el tratamiento de datos se rige por la Ley N.° 29733, Ley de Protección de Datos Personales.
- **Idiomas y accesibilidad:** inglés (en-US) como idioma por defecto y español latinoamericano (es-419) en la Landing Page, la Web Application y los mensajes del RESTful API; atributos ARIA en la Landing Page y la Web Application.
- **Tiempo:** cuatro sprints dentro del ciclo 2026-20 (AV1 semana 4, TB1 semana 7, AV2 semana 12 y TB2 semana 15).

### 1.2.2. Lean UX Process

La presente sección tiene como finalidad presentar el proceso de Lean UX aplicado para la validación de la propuesta desarrollada. En ella se describen las actividades de investigación, análisis y validación realizadas con el fin de comprender el contexto de los usuarios y verificar los supuestos que motivan la solución planteada. Asimismo, se exponen los artefactos y resultados obtenidos durante el proceso, los cuales permiten identificar necesidades, oportunidades y criterios de diseño relevantes. De esta manera, la información recopilada constituye una base para la definición y evolución de la propuesta de solución presentada en el proyecto.

#### 1.2.2.1. Lean UX Problem Statements

A continuación se muestra el problem statement en su idioma original:

***The current state of*** pharmaceutical quality assurance in small and medium-sized Peruvian laboratories ***has focused mainly on*** quality assurance and quality control (QA/QC) specialists and production supervisors, who keep protocols, batch records, deviation reports and audit evidence in paper forms, spreadsheets and e-mail threads, while DIGEMID Good Manufacturing Practices (GMP) inspections demand complete, traceable and immediately available records.

***What existing products and approaches fail to address is*** an affordable, quality-centered platform for these laboratories: MES and OEE platforms focus on production efficiency, pharmacy ERPs focus on retail logistics, and serialization systems only cover packaging and distribution, so batch traceability, deviation and CAPA management and audit evidence remain fragmented across disconnected sources.

***Our product will address this gap by*** offering a bilingual (English/Spanish) SaaS web platform built on open-source technologies that centralizes quality documentation, links every batch with its records, deviations and IoT-captured process data, and generates audit-ready reports.

***Our initial focus will be*** QA/QC specialists and pharmaceutical production supervisors of small and medium-sized laboratories in Lima Metropolitana that manufacture under DIGEMID GMP requirements.

***We’ll know we are successful when we see***, within the first six months after launch, at least 80% of the quality documentation queries of pilot laboratories resolved through the platform, a 50% reduction in the time required to retrieve a complete batch history, a 30% reduction in audit-preparation time, and at least 10 laboratories subscribed to a paid plan.

#### 1.2.2.2. Lean UX Assumptions

En esta sección se presentan las principales premisas que sustentan la propuesta de DoofPlus. Estas suposiciones han sido formuladas a partir del análisis del contexto regulatorio de la industria farmacéutica, las necesidades asociadas al control de calidad y producción, y las oportunidades que ofrecen las tecnologías IoT para fortalecer la trazabilidad y el monitoreo de los procesos. Los assumptions constituyen hipótesis iniciales que deberán validarse posteriormente mediante actividades de investigación y retroalimentación con usuarios potenciales.

A continuación se muestran los Assumptions en su idioma original:

**Business Assumptions:**

- We believe that small and medium-sized Peruvian pharmaceutical laboratories are willing to pay a monthly subscription between US$199 and US$599 for a platform that reduces the risk of GMP observations during DIGEMID inspections.
- We believe that stricter DIGEMID GMP inspections create urgency for laboratories to digitize their paper-based quality records.
- We believe that a SaaS model built on open-source technologies allows us to offer lower prices than global MES and QMS solutions while keeping a sustainable margin.
- We believe that heads of quality assurance are the main decision-makers or influencers in the purchase of quality-management software.
- We believe that integrating sensor data through an external IoT platform (ThingsBoard) lets us offer IoT traceability without selling or maintaining hardware.

**Business Outcome Assumptions:**

- We believe that at least 10 laboratories will subscribe to a paid plan within the first six months after launch.
- We believe that at least 20% of the laboratories that request a demo from the landing page will become paying customers.
- We believe that monthly churn will remain below 5% once a laboratory registers its batch records in the platform.
- We believe that subscribed laboratories will register at least 80% of their new batches in the platform after the third month of use.
- We believe that at least 25% of Standard Lab customers will upgrade to the Enterprise plan when they connect sensors in more than one production line.

**User Assumptions:**

- We believe that QA/QC specialists are the primary users of the platform.
- We believe that pharmaceutical production supervisors need a consolidated view of batch status and fast communication with the quality area in the plant office.
- We believe that quality control professionals need reliable and centralized records to support verification and compliance activities.
- We believe that users prefer working with a single source of information rather than consulting multiple independent systems.
- We believe that users seek to reduce the manual effort involved in managing quality documentation and batch records.

**User Outcome & Benefit Assumptions:**

* We believe that users want to find any batch record, protocol or SOP in minutes instead of searching physical files.
* We believe that users want to prepare audit evidence without manually compiling documents.
* We believe that users want to know the status of each batch and of pending quality approvals without walking to the quality area.
* We believe that users want to reduce transcription and calculation errors in quality records.
* We believe that users want confidence that every record is complete and tamper-evident.

**Feature Assumptions:**

- We believe that digital management of protocols and SOPs with version control and electronic approval will improve the organization and accessibility of quality documentation.
- We believe that a centralized electronic batch record with a complete traceability timeline will speed up the retrieval of batch histories.
- We believe that structured deviation and CAPA management with root-cause analysis will ensure that deviations are investigated and closed on time.
- We believe that automatic generation of audit-ready reports and evidence packages will reduce audit-preparation effort.
- We believe that role-based quality and production dashboards will give users a clear and updated view of batches, deviations and compliance indicators.
- We believe that integrating IoT sensor data that is automatically linked to each batch will eliminate manual transcription of critical process variables.
- We believe that approval requests and notifications between Production and Quality will reduce waiting times in batch manufacturing.
- We believe that an immutable audit trail with electronic signatures will strengthen the integrity of the records reviewed by inspectors.

#### 1.2.2.3. Lean UX Hypothesis Statements

A continuación se muestran las Hypothesis Statements en su idioma original:

- **Hypothesis 1:**   
  ***We believe we will achieve*** a 50% reduction in the time QA/QC specialists spend searching for quality documentation

  ***If*** QA/QC specialists

  ***Attain*** fast access to current, approved and version-controlled protocols and SOPs

  ***With*** digital protocol and SOP management with version control and electronic approval.


- **Hypothesis 2:**  
  ***We believe we will achieve*** a 40% reduction in the average batch release and traceability time during the first six months of use

  ***If*** QA/QC specialists and production supervisors

  ***Attain*** the ability to reconstruct the complete lifecycle of a batch in a single view

  ***With*** a centralized electronic batch record with a traceability timeline.


- **Hypothesis 3:**  
  ***We believe we will achieve*** that 90% of deviations are closed with a documented root cause and CAPA within their due date

  ***If*** QA/QC specialists and production supervisors

  ***Attain*** a structured and trackable workflow to register, investigate and close deviations

  ***With*** deviation and CAPA management with root-cause analysis.


- **Hypothesis 4:**  
  ***We believe we will achieve*** a 30% reduction in audit-preparation time

  ***If*** QA/QC specialists

  ***Attain*** audit evidence compiled automatically for any date range or batch

  ***With*** automatic generation of audit-ready reports and evidence packages.


- **Hypothesis 5:**  
  ***We believe we will achieve*** daily use of the platform by at least 70% of registered users

  ***If*** QA/QC specialists and production supervisors

  ***Attain*** an updated view of batch status, open deviations and compliance indicators

  ***With*** role-based quality and production dashboards.


- **Hypothesis 6:**  
  ***We believe we will achieve*** zero manual transcription errors in plant records during the first quarter of implementation

  ***If*** production supervisors and QA/QC specialists

  ***Attain*** critical process variables automatically linked to each batch, with early alerts

  ***With*** IoT sensor data integration and alerting.


- **Hypothesis 7:**  
  ***We believe we will achieve*** a 40% reduction in the waiting time for quality approvals during manufacturing

  ***If*** production supervisors and QA/QC specialists

  ***Attain*** direct and trackable communication of approval requests between areas

  ***With*** approval requests and notifications between Production and Quality.


- **Hypothesis 8:**  
  ***We believe we will achieve*** 100% of DIGEMID traceability audits passed without critical observations during the first year

  ***If*** QA/QC specialists

  ***Attain*** confidence that every change is recorded with who, when, what and why

  ***With*** an immutable audit trail with electronic signatures.

#### 1.2.2.4. Lean UX Canvas

El Lean UX Canvas (versión 2 de Jeff Gothelf) resume en una sola vista el Problem Statement, los usuarios, las soluciones, los resultados esperados y las hipótesis. Cada solución (S1 a S8) corresponde a un feature assumption y a su hypothesis statement. Los experimentos priorizan la Landing Page y los prototipos de los flujos principales antes de construir la Web Application.

A continuación se muestra el Lean UX Canvas en su idioma original:

![Lean UX Canvas](../assets/img/chapter1/lean-ux-canvas-v4.png)

## 1.3. Segmentos objetivo

La identificación de los segmentos objetivo constituye una actividad fundamental para orientar el desarrollo de DoofPlus hacia los profesionales que participan directamente en los procesos de producción y aseguramiento de la calidad dentro de la industria farmacéutica. La definición de estos perfiles permite comprender las necesidades asociadas al monitoreo de los procesos productivos, la trazabilidad de la información y el cumplimiento de los estándares regulatorios, contribuyendo a que la propuesta responda a problemáticas reales del entorno de aplicación.

### Segmento objetivo 1: Especialista de Aseguramiento y Control de Calidad (QA/QC)

Características demográficas:

- **Edad:** Entre 30 y 65 años.
- **Género:** Indistinto.
- **Ocupación:** Profesional responsable de garantizar el cumplimiento de los estándares de calidad, gestionar registros y documentación técnica, supervisar desviaciones y participar en auditorías e inspecciones regulatorias.
- **Nivel educativo:** Químico Farmacéutico, Ingeniería Farmacéutica o carreras afines con especialización en aseguramiento de la calidad, BPM o regulación farmacéutica.
- **Ubicación geográfica:** Lima Metropolitana, Perú.

Información estadística de sustento:

- Solo 4 de cada 10 laboratorios inspeccionados por DIGEMID obtuvieron la certificación de BPM: de 51 laboratorios inspeccionados hasta mayo de 2026, 20 la obtuvieron, 21 no la lograron y 7 desistieron del proceso. Entre los aspectos evaluados figuran los controles de laboratorio y la trazabilidad de productos, actividades a cargo de QA/QC (Gestión, 2026).
- 385 laboratorios extranjeros esperaban su certificación de BPM ante una DIGEMID desbordada por la demanda, lo que evidencia la presión regulatoria sobre la documentación de calidad (Infobae, 2025).
- La OMS establece que los registros de calidad deben ser atribuibles, legibles, contemporáneos, originales y exactos (principios ALCOA) durante todo su ciclo de vida (World Health Organization, 2016).
- Los sistemas de gestión de calidad farmacéutica requieren evidencia documentada para respaldar la liberación de productos y el seguimiento de desviaciones.
- La trazabilidad y la integridad de los datos son reconocidas como elementos fundamentales para garantizar la calidad y seguridad de los medicamentos.

### Segmento Objetivo 2: Jefe o Supervisor de Producción Farmacéutica

Características demográficas:

- **Edad:** Entre 25 y 70 años.
- **Género:** Indistinto.
- **Ocupación:** Profesional responsable de planificar, supervisar y controlar las operaciones de fabricación farmacéutica, asegurando el cumplimiento de los parámetros establecidos para la producción.
- **Nivel educativo:** Ingeniería Industrial, Ingeniería Química, Ingeniería Farmacéutica o carreras afines.
- **Ubicación geográfica:** Lima Metropolitana, Perú.

Información estadística de sustento:

- Los procesos de producción farmacéutica requieren control continuo de variables operativas para garantizar la calidad del producto final.
- Las BPM establecen la necesidad de documentar adecuadamente las actividades productivas y mantener evidencia del cumplimiento de los procedimientos establecidos.
- La disponibilidad de información trazable facilita la identificación y análisis de desviaciones durante la fabricación.
- La incorporación de herramientas digitales e iniciativas de Industria 4.0 ha impulsado la adopción de tecnologías para mejorar la visibilidad de los procesos productivos.
- El sector farmacéutico peruano proyectó un crecimiento de 4% para 2025 según la Asociación Nacional de Laboratorios Farmacéuticos (Agencia Andina, 2025), lo que incrementa el volumen de lotes que los supervisores deben controlar y documentar.
- Las BPM evaluadas por DIGEMID incluyen procesos de producción, calidad de materias primas, controles de laboratorio, condiciones de almacenamiento y trazabilidad de productos (Gestión, 2026), aspectos que dependen de los registros que genera Producción.