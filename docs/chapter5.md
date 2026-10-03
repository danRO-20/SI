# Capítulo V: Product Implementation, Validation & Deployment

## 5.1. Software Configuration Management

En esta sección se describen las decisiones, convenciones y herramientas utilizadas por el equipo Inges Company para gestionar el ciclo de vida, implementación, validación y despliegue de **DoofPlus**. Estas decisiones permitieron mantener la trazabilidad sobre los cambios realizados en cada sprint para la Landing Page, Frontend Web Application y Backend Web Services.

### 5.1.1. Software Development Environment Configuration

Se detallan las herramientas utilizadas en el ciclo de vida del producto:

* **Project Management**
  * **Jira / Trello:** Planificación de sprints, gestión del Product Backlog y seguimiento visual de tareas. (Referencia: https://www.atlassian.com/software/jira, https://trello.com)
* **Requirements Management**
  * **Markdown:** Documentación del proyecto. (Referencia: https://www.markdownguide.org)
  * **Gherkin:** Redacción de criterios de aceptación (Given-When-Then). (Referencia: https://cucumber.io/docs/gherkin)
* **Product UX/UI Design**
  * **Figma:** Elaboración de Wireframes, Mock-ups y Prototypes. (Referencia: https://www.figma.com)
  * **UXPressia:** Elaboración de User Personas, Empathy Maps, Journey Maps e Impact Maps. (Referencia: https://uxpressia.com)
  * **Lucidchart:** Diagramación técnica y diseño de base de datos. (Referencia: https://www.lucidchart.com)
* **Software Development**
  * **WebStorm / IntelliJ IDEA:** Entornos de desarrollo integrados para codificación. (Descarga: https://www.jetbrains.com)
  * **HTML5, CSS3 y JavaScript:** Tecnologías core utilizadas para el desarrollo exclusivo del Landing Page.
  * **Angular Framework:** Framework basado en TypeScript utilizado para el desarrollo de Frontend Web Applications, integrando **Angular Material** como biblioteca de componentes de interfaz basados en Material Design. (Referencia: https://angular.dev)
  * **Spring Boot & Spring Data JPA:** Frameworks basados en Java para el desarrollo de los RESTful Web Services. (Referencia: https://spring.io)
  * **JDK 21 y Maven:** Compilación y gestión de dependencias del RESTful API. (Descarga: https://adoptium.net, https://maven.apache.org)
  * **Node.js y Angular CLI:** Creación, ejecución y construcción de la Web Application. (Descarga: https://nodejs.org, https://angular.dev/tools/cli)
  * **MySQL 8 y MySQL Workbench:** Sistema gestor de base de datos relacional y herramienta de administración. (Descarga: https://dev.mysql.com/downloads)
* **Software Testing**
  * **JUnit 5 y Mockito:** Pruebas unitarias y de integración del RESTful API. (Referencia: https://junit.org, https://site.mockito.org)
  * **Vitest:** Pruebas unitarias de la Web Application en Angular. (Referencia: https://vitest.dev)
  * **Swagger UI / Chrome DevTools / MySQL Workbench:** Prueba manual de endpoints, inspección del frontend y revisión de la persistencia.
* **Software Documentation**
  * **OpenAPI (Swagger):** Documentación técnica y contratos de los RESTful Web Services. (Referencia: https://swagger.io)
  * **Structurizr (DSL):** Diagram-as-Code para los diagramas C4 de contexto, contenedores y componentes. (Referencia: https://structurizr.com)
  * **Mermaid:** Diagram-as-Code para los diagramas de clases (UML) y de base de datos. (Referencia: https://mermaid.js.org)
  * **Miro:** Big Picture y Design-Level EventStorming. (Referencia: https://miro.com)
* **Software Deployment**
  * **GitHub Pages / Firebase / Render / Railway:** Plataformas cloud para el despliegue de los distintos repositorios y servicios de la solución.

### 5.1.2. Source Code Management

El código fuente de la solución es gestionado mediante **GitHub** como plataforma y sistema de control de versiones distribuido.
* **Landing Page:** [https://github.com/IngesCompany-7742/IngesCompany-LandingPage](https://github.com/IngesCompany-7742/IngesCompany-LandingPage)
* **Frontend Web Application (Angular):** [https://github.com/IngesCompany-7742/IngesCompany-Frontend](https://github.com/IngesCompany-7742/IngesCompany-Frontend)
* **Backend Web Services (Spring Boot):** repositorio `IngesCompany-Backend` por crear en el Sprint 3; incluirá el proyecto y sus pruebas unitarias y de integración.

**GitFlow Workflow**
El proyecto adopta **GitFlow** para la organización de ramas:
* `main`: Rama principal para el código en producción estable.
* `develop`: Rama de integración donde se consolidan las funcionalidades de todo el equipo.
* `feature/<nombre>`: Convención para desarrollar nuevas funcionalidades (ej. `feature/auth-module`).
* `release/v<version>`: Ramas creadas desde develop para preparar y asegurar una nueva versión.
* `hotfix/<nombre>`: Ramas que nacen de `main` para corregir errores críticos en producción.

**Semantic Versioning y Conventional Commits**
Se aplica **Semantic Versioning 2.0.0** (`MAJOR.MINOR.PATCH`) para nombrar las releases. 
Todos los mensajes siguen la convención **Conventional Commits** (`tipo[scope opcional]: descripción`) usando prefijos como `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore` (ej. `feat(landing): add benefits section`).

### 5.1.3. Source Code Style Guide & Coding Conventions

Toda la nomenclatura y lógica programática en el código fuente se desarrolla estrictamente en **inglés**, respetando el Ubiquitous Language del dominio de calidad farmacéutica. Se han adoptado las siguientes convenciones estándar oficiales para la programación:

* **HTML/CSS:** *Google HTML/CSS Style Guide* y *HTML Style Guide and Coding Conventions*.
* **JavaScript / TypeScript:** *Google JavaScript Style Guide*, *Google TypeScript Style Guide* y *Angular coding style guide*.
* **Java / Spring Boot:** *Google Java Style Guide* y buenas prácticas de *Spring Boot Features* para controladores RESTful y abstracción JPA.
* **BDD:** *Gherkin Conventions for Readable Specifications*.

### 5.1.4. Software Deployment Configuration

Pasos y configuración necesarios para el despliegue de la solución en la nube a partir de los repositorios de código:

1. **Landing Page (GitHub Pages):** Se navega a la configuración del repositorio, se habilita GitHub Pages apuntando a la raíz (`/root`) de la rama `main` y el código estático es servido públicamente de manera automática por GitHub.
2. **Frontend Web Application (Firebase Hosting):** 
   - Se configura la URL del RESTful API en `src/environments/environment.ts` (`serverBaseUrl`) y se ejecuta la construcción optimizada (`ng build --configuration production`).
   - Se utiliza Firebase CLI y el comando `firebase deploy --only hosting` apuntando a la carpeta de distribución para sincronizar la SPA a la nube.
3. **Backend Web Services (Render & Railway):** 
   - Se aprovisiona la base de datos MySQL 8 en **Railway** y se obtiene la URL de conexión y las credenciales.
   - El RESTful API se despliega como Web Service en **Render** a partir de un Dockerfile multietapa (`maven:3-eclipse-temurin-21` para compilar con `mvn clean package` y `eclipse-temurin:21-jre` para ejecutar el JAR), vinculado a la rama `main` de su repositorio.
   - Se configuran las variables de entorno `SPRING_DATASOURCE_URL`, `SPRING_DATASOURCE_USERNAME`, `SPRING_DATASOURCE_PASSWORD`, `JWT_SECRET`, `NIUBIZ_*`, `SENDGRID_API_KEY` y `THINGSBOARD_API_KEY`. Hibernate actualiza el esquema al iniciar (`spring.jpa.hibernate.ddl-auto=update`) y la documentación OpenAPI queda publicada en `/swagger-ui/index.html`.
   - En cada merge a `main`, Render vuelve a compilar y publicar el servicio.

## 5.2. Landing Page, Services & Applications Implementation

En esta sección se explica y evidencia el proceso de implementación, pruebas, documentación y despliegue de **DoofPlus**, incluyendo la Landing Page, Web Services y Frontend Web Applications. Se presenta el avance organizado por Sprints a partir del Product Backlog.

### 5.2.1. Sprint 1

En esta sección se registra y explica el avance en términos de producto y trabajo colaborativo para el **Sprint 1**, el cual tuvo como enfoque principal la construcción y despliegue de la primera versión de la Landing Page de DoofPlus, así como la configuración inicial de los repositorios y entornos de despliegue.

#### 5.2.1.1. Sprint Planning 1

El Sprint Planning Meeting sirvió para definir los objetivos iniciales, asignar responsabilidades y seleccionar las User Stories prioritarias orientadas a la presentación comercial de DoofPlus. A continuación, se presenta el resumen de la reunión de planificación:

| Sprint # | Sprint 1 |
|----------|----------|
| **Sprint Planning Background** | |
| **Date** | 2026-09-20 |
| **Time** | 10:00 AM |
| **Location** | Reunión virtual vía Discord |
| **Prepared By** | Cobades, Yhoshua |
| **Attendees (to planning meeting)** | Angulo, Marcelo / Cobades, Yhoshua / Flores, Ricardo / Rojas, Nestor / Zavaleta, Rodolfo |
| **Sprint 1 – 1 Review Summary** | (No aplica por ser el primer Sprint del proyecto). |
| **Sprint 1 – 1 Retrospective Summary** | (No aplica por ser el primer Sprint del proyecto). |
| **Sprint Goal & User Stories** | |
| **Sprint 1 Goal** | **Our focus is on** delivering a complete and responsive Landing Page.<br>**We believe it delivers** a clear understanding of DoofPlus' value proposition to our potential pharmaceutical clients.<br>**This will be confirmed when** visitors can navigate through the features, plans, and team information flawlessly on both desktop and mobile devices. |
| **Sprint 1 Velocity** | 16 Story Points |
| **Sum of Story Points** | 16 Story Points (US44, US03, US45, US04, US46, US47 y TS01) |

#### 5.2.1.2. Aspect Leaders and Collaborators

A continuación se presenta el Leadership-and-Collaboration Matrix (LACX), que indica quién es el líder (L) y quiénes son los colaboradores (C) para cada aspecto dentro del alcance del Sprint 1 (enfocado principalmente en la Landing Page y setup inicial).

| Team Member (Last Name, First Name) | GitHub Username | Landing Page (UI/UX) | Landing Page (Code) | Deployment & Setup | Documentation |
|-------------|-----------------|----------------------|---------------------|--------------------|---------------|
| Angulo Ramírez, Marcelo Martín | Zock2005 | L | C | C | C |
| Cobades Zamora, Yhoshua Hebert | YhoshuaCZ | C | C | L | C |
| Flores Martinez, Ricardo Andres | Nitoryu2801 | C | C | C | C |
| Rojas Ambicho, Nestor Daniel | danRO-20 | C | C | C | C |
| Zavaleta Gutierrez, Rodolfo Martin | gutierrezrodolfo360-bit | C | L | C | L |

#### 5.2.1.3. Sprint Backlog 1

El objetivo principal de este Sprint fue implementar el sitio web estático (Landing Page) para dar a conocer a Inges Company y el producto DoofPlus.

![jira](../assets/img/chapter5/jira-pb.png)


| Sprint # | Sprint 1 | | | | | | |
|---|---|---|---|---|---|---|---|
| **Story Id** | **Story Title** | **Task Id** | **Task Title** | **Task Description** | **Estimation (Hours)** | **Assigned To** | **Status (To-do / In-Process / To-Review / Done)** |
| US44 | Navegación por secciones | T001 | Implementar navbar responsivo | Estructurar el menú de navegación con los enlaces a Home, Features, Benefits, Plans y Contact. | 2 | Zavaleta Gutierrez, Rodolfo Martin | Done |
| US44 | Navegación por secciones | T002 | Estilos y menú hamburguesa | Aplicar estilos CSS al menú y añadir comportamiento responsive con menú hamburguesa para móvil. | 2 | Angulo Ramírez, Marcelo Martín | Done |
| US03 | Visualización de planes y precios | T003 | Diseñar tarjetas de planes | Crear las tarjetas de los planes Standard Lab (US$199/mes) y Enterprise (US$599/mes) con sus características. | 3 | Flores Martinez, Ricardo Andres | Done |
| US03 | Visualización de planes y precios | T004 | Toggle mensual/anual | Implementar el cambio entre precios mensuales y anuales con el ahorro correspondiente. | 2 | Cobades Zamora, Yhoshua Hebert | Done |
| US45 | Visualización del equipo y de la startup | T005 | Maquetar sección Our Team | Implementar las tarjetas de los 5 integrantes con foto, nombre y descripción. | 2 | Rojas Ambicho, Nestor Daniel | Done |
| US45 | Visualización del equipo y de la startup | T006 | Correcciones sección Our Team | Corregir la estructura y el contenido de la sección del equipo tras la revisión de pares. | 1 | Angulo Ramírez, Marcelo Martín | Done |
| US04 | Formulario de contacto | T007 | Implementar footer y formulario | Desarrollar el footer con el formulario de solicitud de información por correo, datos de contacto y enlaces legales. | 3 | Zavaleta Gutierrez, Rodolfo Martin | Done |
| TS01 | Implementación de Landing Page responsive y accesible | T008 | Correcciones de estructura de index.html | Corregir la estructura general de index.html para asegurar consistencia semántica y accesibilidad. | 2 | Flores Martinez, Ricardo Andres | Done |
| US46 | Cambio de idioma | T009 | Lógica i18n y selector de idioma | Implementar el selector EN/ES con archivos de traducción y la lógica JavaScript de i18n. | 3 | Cobades Zamora, Yhoshua Hebert | Done |
| US47 | Consulta de términos y política de privacidad | T010 | Agregar Terms of Service | Redactar e implementar la página de Términos de Servicio de DoofPlus. | 2 | Rojas Ambicho, Nestor Daniel | Done |
| US47 | Consulta de términos y política de privacidad | T011 | Agregar Privacy Policy | Redactar e implementar la Política de Privacidad conforme a la Ley N.° 29733. | 2 | Angulo Ramírez, Marcelo Martín | Done |

#### 5.2.1.4. Development Evidence for Sprint Review

En esta sección se presentan los principales avances en la implementación del Landing Page.

| Repository | Branch | Commit Id | Commit Message | Commit Message Body | Commited on (Date) |
|------------|--------|-----------|----------------|---------------------|--------------------|
| IngesCompany-7742/IngesCompany-LandingPage | main | `1f1a22f` | Merge branch 'release/v1.0.0-rc.1' into main | Se fusionó la rama de liberación a producción. | 20/09/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | main | `e530153` | fix: change the defect language | Corrección del idioma predeterminado. | 20/09/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | main | `7eded14` | build: add the option to change the language in main.js | Adición de lógica para alternar idiomas en el script principal. | 20/09/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | main | `432fb64` | fix: update links of the images in index.html | Actualización de rutas y enlaces de las imágenes. | 20/09/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | main | `46b51b6` | build: add styles | Incorporación de la hoja de estilos CSS. | 20/09/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | main | `86d4578` | chore: add images | Inclusión de recursos gráficos al proyecto. | 20/09/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | main | `06bd5ef` | build: Add footer | Creación de la sección del pie de página. | 20/09/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | main | `be8e428` | build: add body | Estructuración y contenido del cuerpo principal. | 20/09/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | main | `9b082a5` | feat: add language switching functionality in main.js | Implementación de funcionalidad de cambio de idioma. | 20/09/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | main | `b9ff9e6` | ci: add translations | Adición de diccionarios y archivos de traducción. | 20/09/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | main | `6a1377f` | docs: update README.md | Actualización de la documentación del proyecto. | 20/09/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | main | `0de92b6` | fix: refactor README.md | Refactorización de formato en el README. | 20/09/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | main | `6e6efc0` | docs: add README.md | Creación inicial del archivo README. | 20/09/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `8dca66b` | Merge remote-tracking branch 'origin/develop' into develop | Sincronización de la rama develop. | 20/09/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `a8c7448` | chore: Create template | Creación de plantilla base del proyecto. | 20/09/2026 |

#### 5.2.1.5. Execution Evidence for Sprint Review

Lo alcanzado en este Sprint corresponde a la Landing Page totalmente funcional, responsiva y con soporte bilingüe.

![capturas de pantalla](../assets/img/chapter5/screenshots/1.png)

![capturas de pantalla](../assets/img/chapter5/screenshots/2.png)

![capturas de pantalla](../assets/img/chapter5/screenshots/3.png)

![capturas de pantalla](../assets/img/chapter5/screenshots/4.png)

![capturas de pantalla](../assets/img/chapter5/screenshots/5.png)

![capturas de pantalla](../assets/img/chapter5/screenshots/6.png)

![capturas de pantalla](../assets/img/chapter5/screenshots/7.png)

![capturas de pantalla](../assets/img/chapter5/screenshots/8.png)

![capturas de pantalla](../assets/img/chapter5/screenshots/9.png)

![capturas de pantalla](../assets/img/chapter5/screenshots/10.png)

![capturas de pantalla](../assets/img/chapter5/screenshots/11.png)

#### 5.2.1.6. Services Documentation Evidence for Sprint Review

Dado que el enfoque del Sprint 1 fue la Landing Page, la documentación de servicios backend mediante OpenAPI (Swagger) se abordará en los Sprints siguientes conforme se implementen los RESTful Web Services.

#### 5.2.1.7. Software Deployment Evidence for Sprint Review

Durante este Sprint, el equipo configuró los entornos en la nube para el alojamiento del Landing Page.
Se configuró **GitHub Pages** apuntando a la rama `main` del repositorio `IngesCompany-LandingPage`, permitiendo que cualquier cambio en el código se publique automáticamente.

![github page](../assets/img/chapter5/evidencia/github-pages.png)

![pages](../assets/img/chapter5/evidencia/pages.png)

#### 5.2.1.8. Team Collaboration Insights during Sprint

Todos los miembros del equipo participaron activamente en la implementación de la Landing Page, organizándose a través de ramas y realizando Pull Requests que fueron revisados por sus pares antes de ser fusionados a `main`.

![evidencia](../assets/img/chapter5/evidencia/evidencia.png)

## 5.3. Validation Interviews

### 5.3.1. Diseño de Entrevistas

### 5.3.2. Registro de Entrevistas

### 5.3.3. Evaluaciones según heurísticas

## 5.4. Video About-the-Product

# Conclusiones

## Conclusiones y recomendaciones

## Video About-the-Team

# Bibliografía

# Anexos
