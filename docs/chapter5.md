# Capítulo V: Product Implementation, Validation & Deployment

## 5.1. Software Configuration Management

En esta sección se describen las decisiones, convenciones y herramientas utilizadas por el equipo Inges Company para gestionar el ciclo de vida, la implementación, la validación y el despliegue de **DoofPlus**. Estas decisiones permiten mantener la consistencia y la trazabilidad de los cambios realizados en cada sprint sobre la Landing Page, la Frontend Web Application y los RESTful Web Services.

### 5.1.1. Software Development Environment Configuration

A continuación se detallan los productos de software que los miembros del equipo utilizan para colaborar en el ciclo de vida de DoofPlus, indicando su propósito y su ruta de referencia (productos SaaS) o de descarga (productos que se ejecutan en el computador de cada integrante).

* **Project Management**
    * **Jira Software:** Gestión del Product Backlog, planificación de sprints y seguimiento de tareas en el board del proyecto. (Referencia: https://www.atlassian.com/software/jira)
    * **Discord:** Canal de comunicación del equipo para las reuniones de Sprint Planning, Sprint Review y coordinación diaria. (Referencia: https://discord.com)
* **Requirements Management**
    * **Jira Software:** Registro de User Stories y Technical Stories con sus Story Points y criterios de aceptación. (Referencia: https://www.atlassian.com/software/jira)
    * **Gherkin:** Redacción de criterios de aceptación con la estructura Given-When-Then. (Referencia: https://cucumber.io/docs/gherkin/reference)
    * **Miro:** Elaboración del Big Picture Event Storming y del Design-Level Event Storming. (Referencia: https://miro.com)
* **Product UX/UI Design**
    * **Figma:** Elaboración de Wireframes, Mock-ups y Prototypes de la Landing Page y la Web Application. (Referencia: https://www.figma.com)
    * **FigJam:** Elaboración de los Wireflows y User Flows de la Web Application. (Referencia: https://www.figma.com/figjam)
    * **UXPressia:** Elaboración de User Personas, Empathy Maps, Journey Maps e Impact Maps. (Referencia: https://uxpressia.com)
    * **Structurizr DSL:** Elaboración de los diagramas C4 de contexto, contenedores y componentes bajo el enfoque Diagram-as-Code. (Referencia: https://structurizr.com)
    * **Mermaid:** Elaboración de los diagramas de clases y de base de datos bajo el enfoque Diagram-as-Code. (Referencia: https://mermaid.js.org)
* **Software Development**
    * **Git:** Sistema de control de versiones distribuido utilizado en todos los repositorios. (Descarga: https://git-scm.com/downloads)
    * **GitHub:** Plataforma de alojamiento de los repositorios de la organización y de colaboración mediante ramas y Pull Requests. (Referencia: https://github.com/IngesCompany-7742)
    * **WebStorm:** IDE para el desarrollo de la Landing Page (HTML5, CSS3 y JavaScript) y de la Frontend Web Application en Angular. (Descarga: https://www.jetbrains.com/webstorm/download)
    * **IntelliJ IDEA:** IDE para el desarrollo de los RESTful Web Services en Java con Spring Boot. (Descarga: https://www.jetbrains.com/idea/download)
    * **Node.js y npm:** Entorno de ejecución y gestor de paquetes requeridos por Angular CLI. (Descarga: https://nodejs.org/en/download)
    * **Angular CLI:** Herramienta para generar, ejecutar y compilar la Frontend Web Application, integrando **Angular Material** como biblioteca de componentes y **ngx-translate** para la internacionalización. (Referencia: https://angular.dev/tools/cli)
    * **Spring Boot y Spring Data JPA:** Frameworks de Java para el desarrollo de los RESTful Web Services. (Referencia: https://spring.io/projects/spring-boot)
    * **MySQL:** Sistema gestor de base de datos relacional (MySQL 8). (Descarga: https://dev.mysql.com/downloads)
* **Software Testing**
    * **Chrome DevTools:** Inspección del diseño responsive y depuración de la Landing Page y la Web Application. (Referencia: https://developer.chrome.com/docs/devtools)
    * **json-server:** Fake API para simular los endpoints REST desde la Web Application mientras se implementan los Web Services. (Referencia: https://github.com/typicode/json-server)
    * **Swagger UI:** Ejecución de pruebas sobre los endpoints documentados de los RESTful Web Services. (Referencia: https://swagger.io/tools/swagger-ui)
* **Software Documentation**
    * **Markdown en GitHub:** Redacción del informe del proyecto bajo el enfoque Docs-as-Code en el repositorio del informe. (Referencia: https://www.markdownguide.org)
    * **OpenAPI (Swagger):** Documentación de los RESTful Web Services. (Referencia: https://swagger.io/specification)
* **Software Deployment**
    * **GitHub Pages:** Publicación de la Landing Page. (Referencia: https://pages.github.com)
    * **Firebase Hosting:** Publicación de la Frontend Web Application. (Referencia: https://firebase.google.com/docs/hosting)
    * **Render:** Publicación de los RESTful Web Services. (Referencia: https://render.com)
    * **Railway:** Base de datos MySQL gestionada en la nube. (Referencia: https://railway.com)

### 5.1.2. Source Code Management

El equipo utiliza **GitHub** como plataforma y **Git** como sistema de control de versiones. Todos los repositorios pertenecen a la organización [IngesCompany-7742](https://github.com/IngesCompany-7742):

| Producto | Repositorio |
|----------|-------------|
| Landing Page | https://github.com/IngesCompany-7742/IngesCompany-LandingPage |
| Frontend Web Application | https://github.com/IngesCompany-7742/IngesCompany-Frontend |
| RESTful Web Services | Se creará en el Sprint 3. |
| Informe del proyecto | https://github.com/IngesCompany-7742/IngesCompany-Project-Report |

**GitFlow Workflow**

El equipo aplica el modelo GitFlow propuesto por Vincent Driessen en *A successful Git branching model*:

* **`main`:** Contiene únicamente versiones estables listas para producción. Solo recibe merges desde ramas `release/*` y `hotfix/*`, y cada merge se etiqueta con su versión (por ejemplo, `v1.0.0`).
* **`develop`:** Rama de integración. Consolida las funcionalidades terminadas antes de preparar una nueva versión.
* **Feature branches:** Nacen de `develop` y regresan a `develop` mediante Pull Request. Convención: `feature/<nombre-en-kebab-case>`, nombrando el bounded context o la funcionalidad (por ejemplo, `feature/shared`, `feature/manufacturing`, `feature/project-configuration`). En el repositorio del informe se usa `feature/chapter<n>`.
* **Release branches:** Nacen de `develop` cuando un incremento está listo para entregarse y se fusionan con `main` y `develop`. Convención: `release/v<MAJOR>.<MINOR>.<PATCH>`, admitiendo el sufijo de pre-release `-rc.<n>` (por ejemplo, `release/v1.0.0-rc.1`, usada en la Landing Page).
* **Hotfix branches:** Nacen de `main` para corregir errores críticos en producción y se fusionan con `main` y `develop`. Convención: `hotfix/v<MAJOR>.<MINOR>.<PATCH>` (por ejemplo, `hotfix/v1.0.1`).

**Semantic Versioning**

Las releases se nombran según **Semantic Versioning 2.0.0** con el formato `MAJOR.MINOR.PATCH`:

* **MAJOR:** Cambios incompatibles con versiones anteriores (por ejemplo, `v2.0.0`).
* **MINOR:** Nuevas funcionalidades compatibles con la versión anterior (por ejemplo, `v1.1.0`).
* **PATCH:** Correcciones de errores compatibles (por ejemplo, `v1.0.1`).

**Conventional Commits**

Los mensajes de commit siguen la especificación **Conventional Commits 1.0.0**:

```
<type>(<optional scope>): <description>

<optional body>

<optional footer(s)>
```

* **type:** `feat` (nueva funcionalidad), `fix` (corrección de errores), `docs` (documentación), `style` (formato sin cambios de lógica), `refactor` (reestructuración sin cambio de comportamiento), `test` (pruebas), `build` (sistema de build o dependencias), `ci` (integración continua), `chore` (tareas de mantenimiento).
* **scope:** Módulo o bounded context afectado, por ejemplo `feat(lots): ...` o `docs(chapter5): ...`.
* **description:** Resumen breve en inglés, en modo imperativo y en minúsculas.
* **body y footer:** Detalle del cambio y referencias a tareas; los cambios incompatibles se marcan con `BREAKING CHANGE:` o con `!` después del type.

### 5.1.3. Source Code Style Guide & Coding Conventions

Toda la nomenclatura del código fuente (archivos, clases, variables, métodos y comentarios) se escribe en **inglés**, respetando el Ubiquitous Language del dominio de calidad farmacéutica (por ejemplo, `ProductionBatch`, `Deviation`, `CapaAction`). Las convenciones adoptadas por lenguaje son las siguientes:

* **HTML:** [HTML Style Guide and Coding Conventions (W3Schools)](https://www.w3schools.com/html/html5_syntax.asp) y [Google HTML/CSS Style Guide](https://google.github.io/styleguide/htmlcssguide.html). Etiquetas y atributos en minúsculas, valores de atributos entre comillas dobles, uso de etiquetas semánticas (`header`, `main`, `section`, `footer`) y atributo `alt` en todas las imágenes.
* **CSS:** [Google HTML/CSS Style Guide](https://google.github.io/styleguide/htmlcssguide.html). Indentación de 2 espacios, nombres de clases en kebab-case y selectores cortos; los ids no se usan para estilos.
* **JavaScript:** [Google JavaScript Style Guide](https://google.github.io/styleguide/jsguide.html). Uso de `const`/`let`, lowerCamelCase para variables y funciones y punto y coma al final de cada sentencia.
* **TypeScript:** [Google TypeScript Style Guide](https://google.github.io/styleguide/tsguide.html). UpperCamelCase para clases e interfaces, lowerCamelCase para propiedades y métodos, tipado explícito y sin uso de `any`.
* **Angular:** [Angular coding style guide](https://angular.dev/style-guide). Nombres de archivos en kebab-case, un componente por archivo, selectores con el prefijo `app-`, inyección de dependencias en servicios y organización del código por bounded context (`domain`, `infrastructure`, `application`, `presentation`).
* **Java:** [Google Java Style Guide](https://google.github.io/styleguide/javaguide.html). UpperCamelCase para clases, lowerCamelCase para métodos y variables, CONSTANT_CASE para constantes y llaves obligatorias en todas las estructuras de control.
* **Spring Boot:** [Spring Boot Features](https://docs.spring.io/spring-boot/reference/features/index.html). Clase principal en el paquete raíz, configuración externalizada en `application.properties` y variables de entorno, y controladores RESTful con rutas en plural y kebab-case (por ejemplo, `/api/v1/production-batches`).
* **Gherkin:** [Gherkin Conventions for Readable Specifications](https://specflow.org/gherkin/gherkin-conventions-for-readable-specifications). Palabras clave `Feature`, `Scenario`, `Given`, `When`, `Then` en inglés, un comportamiento por escenario y uso de `Scenario Outline` con `Examples` para casos basados en datos.

### 5.1.4. Software Deployment Configuration

A continuación se describen los pasos para desplegar cada producto de la solución a partir de su repositorio de código fuente:

1. **Landing Page (GitHub Pages)**
    1. Fusionar la rama en `main` y etiquetar la versión.
    2. En el repositorio `IngesCompany-LandingPage`, ingresar a *Settings > Pages* y seleccionar *Deploy from a branch* con la rama `main` y la carpeta `/ (root)`. El archivo `.nojekyll` de la raíz indica a GitHub Pages que publique los archivos estáticos sin procesarlos con Jekyll.
    3. GitHub Pages publica el sitio en https://ingescompany-7742.github.io/IngesCompany-LandingPage/ y lo vuelve a publicar con cada push a `main`.
2. **Frontend Web Application (Firebase Hosting)**
    1. Instalar Firebase CLI (`npm install -g firebase-tools`) e iniciar sesión con `firebase login`.
    2. Seleccionar el proyecto de Firebase con `firebase use --add`. El repositorio ya incluye `firebase.json`, que publica la carpeta `dist/IngesCompany-Frontend/browser` como Single Page Application.
    3. Publicar la Fake API en un Web Service de Render vinculado a la rama `main` del repositorio `IngesCompany-Frontend`, con el comando de build `npm install` y el de inicio `npm run server:prod`, y registrar su URL en `src/environments/environment.ts`.
    4. Compilar la versión de producción con `ng build --configuration production`.
    5. Publicar con `firebase deploy`.
3. **RESTful Web Services (Render y Railway)**
    1. Crear la base de datos MySQL en Railway y obtener la URL de conexión y las credenciales.
    2. Crear un Web Service en Render vinculado a la rama `main` del repositorio de Web Services, con el Dockerfile del proyecto Spring Boot.
    3. Registrar en Render las variables de entorno de producción (URL y credenciales de la base de datos, secreto JWT, credenciales de la pasarela de pagos Niubiz, API key de SendGrid y API key de los dispositivos de ThingsBoard).
    4. Render compila y publica el servicio con cada push a `main`; la documentación OpenAPI queda disponible en la ruta `/swagger-ui/index.html` del servicio.

## 5.2. Landing Page, Services & Applications Implementation

En esta sección se explica y evidencia el proceso de implementación, pruebas, documentación y despliegue de **DoofPlus**, incluyendo la Landing Page, la Frontend Web Application y los RESTful Web Services. El avance se presenta organizado por Sprints a partir del Product Backlog.

### 5.2.1. Sprint 1

En esta sección se registra y explica el avance en términos de producto y trabajo colaborativo para el **Sprint 1**, cuyo enfoque principal fue la construcción y el despliegue de la primera versión de la Landing Page de DoofPlus, así como la configuración inicial de los repositorios.

#### 5.2.1.1. Sprint Planning 1

El Sprint Planning Meeting sirvió para definir los objetivos iniciales, asignar responsabilidades y seleccionar las User Stories prioritarias orientadas a la presentación comercial de DoofPlus. A continuación, se presenta el resumen de la reunión de planificación:

| Sprint # | Sprint 1 |
|----------|----------|
| **Sprint Planning Background** | |
| **Date** | 2026-09-20 |
| **Time** | 10:00 AM |
| **Location** | Reunión virtual vía Discord |
| **Prepared By** | Cobades Zamora, Yhoshua Hebert |
| **Attendees (to planning meeting)** | Angulo Ramírez, Marcelo Martín / Cobades Zamora, Yhoshua Hebert / Flores Martinez, Ricardo Andres / Rojas Ambicho, Nestor Daniel / Zavaleta Gutierrez, Rodolfo Martin |
| **Sprint 0 Review Summary** | No aplica por ser el primer Sprint del proyecto. |
| **Sprint 0 Retrospective Summary** | No aplica por ser el primer Sprint del proyecto. |
| **Sprint Goal & User Stories** | |
| **Sprint 1 Goal** | **Our focus is on** delivering a responsive and bilingual Landing Page for DoofPlus.<br>**We believe it delivers** a clear understanding of DoofPlus' value proposition, plans and team to QA/QC specialists and production supervisors of pharmaceutical laboratories.<br>**This will be confirmed when** visitors can navigate through the features, plans and team sections, switch between Spanish and English, and reach the contact form on both desktop and mobile devices. |
| **Sprint 1 Velocity** | 16 Story Points |
| **Sum of Story Points** | 16 Story Points (US44: 3, US03: 2, US45: 1, US04: 1, TS01: 3, US46: 5, US47: 1) |

#### 5.2.1.2. Aspect Leaders and Collaborators

En el Sprint 1 se consideraron cuatro aspectos: el diseño de la Landing Page, su implementación, la configuración de repositorios y despliegue, y la documentación del sprint. A continuación se presenta el Leadership-and-Collaboration Matrix (LACX), que indica quién es el líder (L) y quiénes son los colaboradores (C) en cada aspecto:

| Team Member (Last Name, First Name) | GitHub Username | Landing Page UI/UX | Landing Page Implementation | Repositories & Deployment | Documentation |
|-------------------------------------|-----------------|:------------------:|:---------------------------:|:-------------------------:|:-------------:|
| Angulo Ramírez, Marcelo Martín | Zock2005 | L | C | | C |
| Cobades Zamora, Yhoshua Hebert | YhoshuaCZ | C | C | L | C |
| Flores Martinez, Ricardo Andres | Nitoryu28 / Nitoryu2801 | C | C | | C |
| Rojas Ambicho, Nestor Daniel | danRO-20 | C | C | | |
| Zavaleta Gutierrez, Rodolfo Martin | gutierrezrodolfo360-bit | C | L | C | L |

#### 5.2.1.3. Sprint Backlog 1

El objetivo principal de este Sprint fue implementar y publicar la Landing Page de DoofPlus para dar a conocer a Inges Company y su propuesta de valor. La siguiente imagen muestra el board del Sprint 1 en Jira:

![Sprint Backlog 1 en Jira](../assets/img/chapter5/jira-pb.png)

*Figura: Board del Sprint 1 en Jira Software.*

**Enlace al board en Jira:** [click aquí](https://doofplus.atlassian.net/jira/software/projects/UPC/boards/3/backlog?jql=parent+IN+%28UPC-2%2C+UPC-9%2C+UPC-20%29&atlOrigin=eyJpIjoiOWZkY2NhNGFkYzdlNGFmNGJlZTE4MTY1OGVjNjAyZDciLCJwIjoiaiJ9)

| Sprint # | Sprint 1 | | | | | | |
|----------|----------|---|---|---|---|---|---|
| **User Story** | | **Work-Item / Task** | | | | | |
| **Id** | **Title** | **Id** | **Title** | **Description** | **Estimation (Hours)** | **Assigned To** | **Status (To-do / In-Process / To-Review / Done)** |
| US44 | Navegación por secciones | T001 | Implementar navbar responsivo | Estructurar el menú de navegación con los enlaces a Home, Features, Benefits, Plans y Contact. | 2 | Zavaleta Gutierrez, Rodolfo Martin | Done |
| US44 | Navegación por secciones | T002 | Estilos y menú hamburguesa | Aplicar estilos CSS al menú y añadir el comportamiento responsive con menú hamburguesa para móvil. | 2 | Angulo Ramírez, Marcelo Martín | Done |
| US03 | Visualización de planes y precios | T003 | Diseñar tarjetas de planes | Crear las tarjetas de los planes Standard Lab (US$199/mes) y Enterprise (US$599/mes) con sus características. | 3 | Flores Martinez, Ricardo Andres | Done |
| US03 | Visualización de planes y precios | T004 | Toggle mensual/anual | Implementar el cambio entre precios mensuales y anuales con un ahorro equivalente a dos meses (≈17%). | 2 | Cobades Zamora, Yhoshua Hebert | Done |
| US45 | Visualización del equipo y de la startup | T005 | Maquetar sección Our Team | Implementar las tarjetas de los 5 integrantes del equipo Inges Company con foto, nombre y descripción. | 2 | Rojas Ambicho, Nestor Daniel | Done |
| US45 | Visualización del equipo y de la startup | T006 | Correcciones sección Our Team | Corregir la estructura y el contenido de la sección del equipo tras la revisión de pares. | 1 | Angulo Ramírez, Marcelo Martín | Done |
| US04 | Formulario de contacto | T007 | Implementar footer y formulario | Desarrollar el footer con el formulario de suscripción por email, datos de contacto y enlaces legales. | 3 | Zavaleta Gutierrez, Rodolfo Martin | Done |
| TS01 | Implementación de Landing Page responsive y accesible | T008 | Correcciones de estructura index | Corregir la estructura general de `index.html` para asegurar la consistencia semántica y la accesibilidad. | 2 | Flores Martinez, Ricardo Andres | Done |
| US46 | Cambio de idioma | T009 | Lógica i18n y toggle de idioma | Implementar el selector de idioma ES/EN con archivos de traducción y lógica JavaScript de i18n. | 3 | Cobades Zamora, Yhoshua Hebert | Done |
| US47 | Consulta de términos y política de privacidad | T010 | Agregar Terms of Service | Redactar e implementar la página de Términos de Servicio de DoofPlus. | 2 | Rojas Ambicho, Nestor Daniel | Done |
| US47 | Consulta de términos y política de privacidad | T011 | Agregar Privacy Policy | Redactar e implementar la Política de Privacidad conforme a la Ley N.° 29733. | 2 | Angulo Ramírez, Marcelo Martín | Done |

#### 5.2.1.4. Development Evidence for Sprint Review

Durante el Sprint 1 se implementó la Landing Page con HTML5, CSS3 y JavaScript: estructura semántica de las secciones, hoja de estilos responsive, recursos gráficos, footer con formulario de contacto y cambio de idioma ES/EN mediante archivos de traducción. La versión estable se integró a `main` a través de la rama `release/v1.0.0-rc.1`. La siguiente tabla presenta los commits del repositorio:

| Repository | Branch | Commit Id | Commit Message | Commit Message Body | Committed on (Date) |
|------------|--------|-----------|----------------|---------------------|---------------------|
| IngesCompany-7742/IngesCompany-LandingPage | main | `b93c547` | fix: refactor index.html | Refactorización de la estructura de `index.html`. | 20/09/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | main | `1f1a22f` | Merge branch 'release/v1.0.0-rc.1' into main | Integración de la rama de release a producción. | 20/09/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `e530153` | fix: change the defect language | Corrección del idioma predeterminado. | 20/09/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `7eded14` | build: add the option to change the language in main.js | Lógica para alternar idiomas en el script principal. | 20/09/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `432fb64` | fix: update links of the images in index.html | Actualización de las rutas de las imágenes. | 20/09/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `46b51b6` | build: add styles | Incorporación de la hoja de estilos CSS. | 20/09/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `86d4578` | chore: add images | Inclusión de los recursos gráficos del sitio. | 20/09/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `06bd5ef` | build: Add footer | Creación de la sección del pie de página. | 20/09/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `be8e428` | build: add body | Estructura y contenido del cuerpo principal. | 20/09/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `9b082a5` | feat: add language switching functionality in main.js | Funcionalidad de cambio de idioma. | 20/09/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `b9ff9e6` | ci: add translations | Archivos de traducción ES/EN. | 20/09/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `6a1377f` | docs: update README.md | Actualización de la documentación del repositorio. | 20/09/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `0de92b6` | fix: refactor README.md | Corrección del formato del README. | 20/09/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `6e6efc0` | docs: add README.md | Creación del README del repositorio. | 20/09/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `8dca66b` | Merge remote-tracking branch 'origin/develop' into develop | Sincronización de la rama `develop`. | 20/09/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `a8c7448` | chore: Create template | Creación de la plantilla base del proyecto. | 20/09/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `e68b54e` | feat: init commit | Commit inicial del repositorio. | 20/09/2026 |

#### 5.2.1.5. Execution Evidence for Sprint Review

En este Sprint se logró una Landing Page funcional, responsive y bilingüe (español e inglés), con navegación por secciones, propuesta de valor, características, planes y precios con toggle mensual/anual, sección del equipo, formulario de contacto y páginas de Términos de Servicio y Política de Privacidad. A continuación se presentan las capturas de las principales secciones implementadas:

![Landing Page - Parte 1](../assets/img/chapter5/screenshots/1.png)

![Landing Page - Parte 2](../assets/img/chapter5/screenshots/2.png)

![Landing Page - Parte 3](../assets/img/chapter5/screenshots/3.png)

![Landing Page - Parte 4](../assets/img/chapter5/screenshots/4.png)

![Landing Page - Parte 5](../assets/img/chapter5/screenshots/5.png)

![Landing Page - Parte 6](../assets/img/chapter5/screenshots/6.png)

![Landing Page - Parte 7](../assets/img/chapter5/screenshots/7.png)

![Landing Page - Parte 8](../assets/img/chapter5/screenshots/8.png)

![Landing Page - Parte 9](../assets/img/chapter5/screenshots/9.png)

![Landing Page - Parte 10](../assets/img/chapter5/screenshots/10.png)

![Landing Page - Parte 11](../assets/img/chapter5/screenshots/11.png)

**Landing Page desplegada:** https://ingescompany-7742.github.io/IngesCompany-LandingPage/

#### 5.2.1.6. Services Documentation Evidence for Sprint Review

El alcance del Sprint 1 se limitó a la Landing Page, por lo que no se implementaron ni documentaron endpoints. La documentación de los RESTful Web Services con OpenAPI se elaborará en el sprint en que se implementen dichos servicios.

#### 5.2.1.7. Software Deployment Evidence for Sprint Review

Durante este Sprint, el equipo publicó la Landing Page en **GitHub Pages**. Para ello se configuró, en *Settings > Pages* del repositorio `IngesCompany-LandingPage`, la publicación desde la rama `main` y la carpeta raíz, de modo que cada cambio integrado en `main` se publica automáticamente.

![Configuración de GitHub Pages](../assets/img/chapter5/evidencia/github-pages.png)

*Figura: Configuración de GitHub Pages en el repositorio de la Landing Page.*

![Landing Page publicada](../assets/img/chapter5/evidencia/pages.png)

*Figura: Landing Page publicada en GitHub Pages.*

#### 5.2.1.8. Team Collaboration Insights during Sprint

Todos los miembros del equipo participaron en la implementación de la Landing Page. Los cambios se integraron en la rama `develop` y, desde ella, se preparó la rama `release/v1.0.0-rc.1`, que se fusionó con `main` para su publicación. La siguiente imagen muestra los analíticos de commits del repositorio en GitHub:

![Insights del repositorio de la Landing Page](../assets/img/chapter5/evidencia/evidencia.png)

*Figura: Analíticos de colaboración del repositorio de la Landing Page en GitHub.*

### 5.2.2. Sprint 2

En esta sección se registra y explica el avance en términos de producto y trabajo colaborativo para el **Sprint 2**, cuyo enfoque fue completar la Landing Page de DoofPlus y construir la primera versión de la Frontend Web Application con sus seis bounded contexts, consumiendo una Fake API mientras se implementan los RESTful Web Services.

#### 5.2.2.1. Sprint Planning 2

El Sprint Planning Meeting sirvió para definir los objetivos del Sprint, asignar responsabilidades por bounded context y seleccionar las User Stories pendientes de la Landing Page y las de la Web Application. A continuación, se presenta el resumen de la reunión de planificación:

| Sprint # | Sprint 2 |
|----------|----------|
| **Sprint Planning Background** | |
| **Date** | 2026-10-02 |
| **Time** | 09:00 AM |
| **Location** | Reunión virtual vía Discord |
| **Prepared By** | Cobades Zamora, Yhoshua Hebert |
| **Attendees (to planning meeting)** | Angulo Ramírez, Marcelo Martín / Cobades Zamora, Yhoshua Hebert / Flores Martinez, Ricardo Andres / Rojas Ambicho, Nestor Daniel / Zavaleta Gutierrez, Rodolfo Martin |
| **Sprint 1 Review Summary** | Se entregó la primera versión de la Landing Page de DoofPlus publicada en GitHub Pages, con navegación por secciones, planes y precios, sección del equipo, formulario de contacto, cambio de idioma ES/EN y páginas legales. Como feedback, se pidió quitar la solicitud de demos (la startup no las ofrece) y reemplazarla por un formulario de consultas, y alinear la Landing Page con los mock-ups del capítulo 4. |
| **Sprint 1 Retrospective Summary** | Como acierto, el equipo integró la versión estable mediante una rama de release siguiendo GitFlow. Como oportunidades de mejora, se acordó trabajar en feature branches que nazcan de `develop`, una por sección o bounded context, distribuir los commits a lo largo del sprint y usar los types de Conventional Commits según su significado. |
| **Sprint Goal & User Stories** | |
| **Sprint 2 Goal** | **Our focus is on** delivering the complete DoofPlus Landing Page and the first version of the DoofPlus Web Application for the QA/QC, Production and Administration environments.<br>**We believe it delivers** a single place to register batches, follow deviations and CAPA, release batches with electronic signature and monitor IoT equipment to QA/QC specialists and production supervisors of pharmaceutical laboratories.<br>**This will be confirmed when** each segment signs in to its own environment with two-factor authentication and completes its user goals (QA-1 to QA-6 and PR-1 to PR-6) on the published Web Application. |
| **Sprint 2 Velocity** | 177 Story Points |
| **Sum of Story Points** | 177 Story Points (US01: 2, US02: 2, US48: 2, US49: 2, US05: 1, US06: 2, US07: 3, US08: 5, US55: 3, US50: 3, US51: 3, US52: 5, US53: 3, US35: 3, US36: 5, US57: 3, US14: 3, US15: 5, US16: 2, US58: 3, US17: 3, US32: 3, US23: 3, US24: 3, US25: 5, US26: 3, US37: 3, US38: 3, US39: 3, US56: 3, US22: 2, US09: 5, US10: 3, US12: 5, US13: 3, US18: 3, US19: 5, US20: 5, US21: 3, US11: 5, US54: 5, US31: 3, US27: 5, US28: 5, US29: 5, US30: 3, US59: 3, US33: 3, US34: 3, US40: 3, US41: 3, US42: 2, US43: 3) |

#### 5.2.2.2. Aspect Leaders and Collaborators

En el Sprint 2 se consideraron ocho aspectos: la Landing Page y, en la Web Application, los bounded contexts (Shared e IAM; Organizations y Subscriptions; Manufacturing; IoT Monitoring; Quality & Compliance), las releases y el despliegue, y la documentación. El líder (L) de cada aspecto es el integrante con más commits en él, según el historial de los repositorios.

| Team Member (Last Name, First Name) | GitHub Username | Landing Page | Shared & IAM | Organizations & Subscriptions | Manufacturing | IoT Monitoring | Quality & Compliance | Releases & Deployment | Documentation |
|-------------------------------------|-----------------|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| Angulo Ramírez, Marcelo Martín | Zock2005 | C | C | | | L | | | C |
| Cobades Zamora, Yhoshua Hebert | YhoshuaCZ | C | L | | L | | L | C | C |
| Flores Martinez, Ricardo Andres | Nitoryu28 | C | | | C | | C | | |
| Rojas Ambicho, Nestor Daniel | danRO-20 | L | | L | | C | | L | C |
| Zavaleta Gutierrez, Rodolfo Martin | gutierrezrodolfo360-bit | C | C | | C | | C | C | L |

#### 5.2.2.3. Sprint Backlog 2

El objetivo del Sprint fue completar la Landing Page y entregar la primera versión de la Web Application. Las tareas se organizaron por User Story; las de la Landing Page incluyen la reimplementación de las secciones del Sprint 1 sobre el diseño del capítulo 4. La siguiente imagen muestra el board del Sprint 2 en Jira:

![Sprint Backlog 2 en Jira](../assets/img/chapter5/evidencia/jira-pb2.png)

*Figura: Board del Sprint 2 en Jira Software.*

**Enlace al board en Jira:** [click aquí](https://doofplus.atlassian.net/jira/software/projects/UPC/boards/3/backlog?jql=parent+IN+%28UPC-2%2C+UPC-9%2C+UPC-20%29&atlOrigin=eyJpIjoiOWZkY2NhNGFkYzdlNGFmNGJlZTE4MTY1OGVjNjAyZDciLCJwIjoiaiJ9)

| Sprint # | Sprint 2 | | | | | | |
|----------|----------|---|---|---|---|---|---|
| **User Story** | | **Work-Item / Task** | | | | | |
| **Id** | **Title** | **Id** | **Title** | **Description** | **Estimation (Hours)** | **Assigned To** | **Status (To-do / In-Process / To-Review / Done)** |
| US01 | Visualización de la propuesta de valor | T012 | Hero con propuesta de valor | Implementar el hero con el título, el subtítulo, los indicadores de confianza y los botones Get Started y View plans. | 3 | Zavaleta Gutierrez, Rodolfo Martin | Done |
| US02 | Visualización de servicios y características | T013 | Secciones Services y Features | Implementar las tarjetas de servicios y el acordeón de características con su panel de vista previa. | 3 | Flores Martinez, Ricardo Andres | Done |
| US48 | Acceso por segmento a la Web Application | T014 | Acceso por segmento | Implementar la sección Choose your workspace y los enlaces con data-app-segment hacia el inicio de sesión de cada entorno. | 3 | Rojas Ambicho, Nestor Daniel | Done |
| US49 | Visualización del video promocional | T015 | Video About the Product y About the Team | Implementar el reproductor que carga el video de YouTube al pulsar play y muestra un aviso mientras el video no está publicado. | 3 | Angulo Ramírez, Marcelo Martín | Done |
| US05 | Preguntas frecuentes | T016 | Sección FAQ | Implementar las preguntas frecuentes con acordeón accesible y el enlace al formulario de contacto. | 2 | Rojas Ambicho, Nestor Daniel | Done |
| US44 | Navegación por secciones | T017 | Navbar con menú móvil | Reimplementar la barra de navegación con anclas reales, Sign in y Get Started con destino propio y el menú overlay en mobile. | 4 | Rojas Ambicho, Nestor Daniel | Done |
| US03 | Visualización de planes y precios | T018 | Planes con toggle mensual/anual | Reimplementar las tarjetas de planes con el cambio de precio mensual/anual y su nota de precios. | 3 | Zavaleta Gutierrez, Rodolfo Martin | Done |
| US45 | Visualización del equipo y de la startup | T019 | Secciones About us y Our Team | Implementar la misión, la visión y las tarjetas de los integrantes con su foto y rol. | 2 | Rojas Ambicho, Nestor Daniel | Done |
| US04 | Formulario de contacto | T020 | Formulario Contact us | Implementar el formulario de consulta con validación de campos y el estado de mensaje enviado. | 2 | Cobades Zamora, Yhoshua Hebert | Done |
| US47 | Consulta de términos y política de privacidad | T021 | Términos y política de privacidad | Implementar las páginas terms.html y privacy.html con sus estilos y traducciones. | 2 | Angulo Ramírez, Marcelo Martín | Done |
| US06 | Inicio de sesión con segundo factor | T022 | Inicio de sesión con 2FA | Implementar la elección de entorno, el inicio de sesión por entorno y la verificación con código de seis dígitos. | 3 | Zavaleta Gutierrez, Rodolfo Martin | Done |
| US07 | Gestión de roles | T023 | Acceso por rol | Implementar el guard de IAM y el estado Access not authorized cuando el rol no corresponde al entorno. | 4 | Cobades Zamora, Yhoshua Hebert | Done |
| US08 | Firmas electrónicas | T024 | Firma electrónica | Implementar la confirmación con contraseña en las aprobaciones, liberaciones y cierres críticos. | 6 | Cobades Zamora, Yhoshua Hebert | Done |
| US55 | Alta de usuarios del equipo | T025 | Usuarios e invitaciones | Implementar el directorio de usuarios y perfiles y el formulario para invitar usuarios. | 4 | Cobades Zamora, Yhoshua Hebert | Done |
| US50 | Registro de organización | T026 | Registro de organización | Implementar el registro con razón social, RUC, planta, plan y primer administrador, y el resumen de administración. | 4 | Rojas Ambicho, Nestor Daniel | Done |
| US51 | Selección de plan | T027 | Selección de plan | Implementar la revisión del cambio de plan en la página de suscripción. | 4 | Rojas Ambicho, Nestor Daniel | Done |
| US52 | Pago de suscripción | T028 | Pago de suscripción | Implementar el historial de facturación y el reintento de un pago rechazado. | 6 | Rojas Ambicho, Nestor Daniel | Done |
| US53 | Renovación y cancelación | T029 | Renovación de la suscripción | Mostrar la fecha de renovación y el estado de la suscripción en la página de suscripción y pagos. | 4 | Rojas Ambicho, Nestor Daniel | Done |
| US35 | Catálogo de productos | T030 | Catálogo de productos | Implementar el catálogo de productos con su fórmula maestra vigente. | 4 | Cobades Zamora, Yhoshua Hebert | Done |
| US36 | Gestión de fórmulas maestras | T031 | Fórmulas maestras | Mostrar los componentes y la versión aprobada de la fórmula maestra de cada producto. | 6 | Cobades Zamora, Yhoshua Hebert | Done |
| US57 | Gestión de órdenes de producción | T032 | Órdenes de producción | Implementar la lista y la ejecución de órdenes de producción contra la fórmula maestra. | 4 | Cobades Zamora, Yhoshua Hebert | Done |
| US14 | Registro de lotes | T033 | Registro de lotes | Implementar el diálogo Create batch con el estado de lote rechazado por fórmula no aprobada. | 4 | Zavaleta Gutierrez, Rodolfo Martin | Done |
| US15 | Consulta del historial de lotes | T034 | Historial de lotes | Implementar la lista de lotes con filtros y la genealogía y el historial de estados de cada lote. | 6 | Cobades Zamora, Yhoshua Hebert | Done |
| US16 | Gestión de estados de lote | T035 | Estados de lote | Implementar el cambio de estado de los lotes y sus conteos por estado. | 3 | Cobades Zamora, Yhoshua Hebert | Done |
| US58 | Recepción de materias primas | T036 | Recepción de materias primas | Implementar la recepción de materias primas con cuarentena e inspección. | 4 | Cobades Zamora, Yhoshua Hebert | Done |
| US17 | Asociación de materias primas | T037 | Asociación de materias primas | Asignar lotes de materia prima aprobados a un lote de producción. | 4 | Cobades Zamora, Yhoshua Hebert | Done |
| US32 | Dashboard de producción | T038 | Resumen de producción | Implementar el resumen de producción con el programa del día, la disponibilidad de equipos y las incidencias. | 4 | Flores Martinez, Ricardo Andres | Done |
| US23 | Registro de dispositivos IoT | T039 | Inventario de equipos y sensores | Implementar el inventario de equipos con sus sensores IoT y el registro de un sensor. | 4 | Angulo Ramírez, Marcelo Martín | Done |
| US24 | Asociación de sensores a un lote | T040 | Asociación de sensores a lotes | Implementar la evidencia IoT del lote con la asociación de equipos y sensores. | 4 | Angulo Ramírez, Marcelo Martín | Done |
| US25 | Captura automática de evidencias | T041 | Telemetría | Implementar el gráfico de telemetría con límites y lectura pico. | 6 | Angulo Ramírez, Marcelo Martín | Done |
| US26 | Consulta de registros IoT | T042 | Consulta de registros IoT | Implementar el resumen IoT con la salud de los equipos y la cola de alertas. | 4 | Angulo Ramírez, Marcelo Martín | Done |
| US37 | Gestión de equipos | T043 | Gestión de equipos | Mostrar el estado operativo de cada equipo en el inventario. | 4 | Angulo Ramírez, Marcelo Martín | Done |
| US38 | Gestión de calibraciones | T044 | Calibraciones | Mostrar el estado de calibración (apto, por vencer, no apto) de equipos y sensores. | 4 | Angulo Ramírez, Marcelo Martín | Done |
| US39 | Mantenimiento preventivo | T045 | Mantenimiento preventivo | Mostrar el próximo mantenimiento y su responsable en el detalle del equipo. | 4 | Angulo Ramírez, Marcelo Martín | Done |
| US56 | Registro y escalamiento de incidencias | T046 | Incidentes | Implementar la lista de incidentes con su severidad y el reconocimiento de alertas. | 4 | Angulo Ramírez, Marcelo Martín | Done |
| US22 | Notificaciones de desviación crítica | T047 | Alertas críticas | Implementar el detalle del sensor con la alerta activa y la regla de reconocimiento. | 3 | Angulo Ramírez, Marcelo Martín | Done |
| US09 | Gestión de protocolos de calidad | T048 | Documentos de calidad | Implementar el repositorio de documentos controlados con su flujo de aprobación. | 6 | Cobades Zamora, Yhoshua Hebert | Done |
| US10 | Repositorio de SOP | T049 | Repositorio de SOP | Filtrar los documentos por tipo y estado para consultar la versión vigente. | 4 | Cobades Zamora, Yhoshua Hebert | Done |
| US12 | Control de versiones documentales | T050 | Versiones de documentos | Implementar el historial de versiones de cada documento. | 6 | Cobades Zamora, Yhoshua Hebert | Done |
| US13 | Aprobación documental | T051 | Aprobación documental | Implementar la aprobación con firma y el bloqueo de autoaprobación (segregación de funciones). | 4 | Cobades Zamora, Yhoshua Hebert | Done |
| US18 | Registro de desviaciones | T052 | Registro de desviaciones | Implementar el reporte de desviación con su evaluación de riesgo. | 4 | Cobades Zamora, Yhoshua Hebert | Done |
| US19 | Análisis de causa raíz | T053 | Análisis de causa raíz | Implementar el registro de la causa raíz como requisito del plan CAPA. | 6 | Cobades Zamora, Yhoshua Hebert | Done |
| US20 | Gestión CAPA | T054 | Plan CAPA | Implementar el plan CAPA con sus acciones, responsables y fechas. | 6 | Cobades Zamora, Yhoshua Hebert | Done |
| US21 | Seguimiento de acciones CAPA | T055 | Seguimiento de CAPA | Mostrar el avance de las acciones CAPA y bloquear el cierre sin evidencia de eficacia. | 4 | Cobades Zamora, Yhoshua Hebert | Done |
| US11 | Automatización de cálculos de calidad | T056 | Resultados analíticos | Implementar los resultados analíticos con su conformidad respecto de la especificación. | 6 | Cobades Zamora, Yhoshua Hebert | Done |
| US54 | Revisión y liberación de lotes | T057 | Liberación de lotes | Implementar la liberación de lotes con requisitos previos, firma electrónica y estado bloqueado. | 6 | Cobades Zamora, Yhoshua Hebert | Done |
| US31 | Dashboard de calidad | T058 | Resumen de calidad | Implementar el resumen de calidad con la cola de prioridades y las próximas decisiones. | 4 | Cobades Zamora, Yhoshua Hebert | Done |
| US27 | Audit trail | T059 | Audit trail | Implementar el registro de eventos con filtros por registro y actor, compartido por los tres entornos. | 6 | Cobades Zamora, Yhoshua Hebert | Done |
| US28 | Generación automática de reportes | T060 | Reportes regulatorios | Implementar la lista y generación de reportes regulatorios. | 6 | Cobades Zamora, Yhoshua Hebert | Done |
| US29 | Preparación de auditorías | T061 | Preparación de auditorías | Implementar el registro de auditorías y su estado de preparación. | 6 | Cobades Zamora, Yhoshua Hebert | Done |
| US30 | Acceso de auditor a evidencias | T062 | Evidencias para auditor | Mostrar las evidencias vinculadas a cada hallazgo de auditoría. | 4 | Cobades Zamora, Yhoshua Hebert | Done |
| US59 | Registro de auditorías y hallazgos | T063 | Hallazgos de auditoría | Implementar el registro de hallazgos con su severidad y acción asignada. | 4 | Cobades Zamora, Yhoshua Hebert | Done |
| US33 | Indicadores de trazabilidad | T064 | Indicadores de trazabilidad | Implementar los indicadores de brechas de trazabilidad. | 4 | Cobades Zamora, Yhoshua Hebert | Done |
| US34 | Indicadores de desviaciones | T065 | Indicadores de desviaciones | Implementar la tendencia de desviaciones por periodo. | 4 | Cobades Zamora, Yhoshua Hebert | Done |
| US40 | Bandeja de tareas | T066 | Bandeja de tareas | Implementar la lista de tareas pendientes vinculadas a registros. | 4 | Cobades Zamora, Yhoshua Hebert | Done |
| US41 | Notificaciones entre áreas | T067 | Comunicación entre áreas | Implementar los comentarios de cada tarea para la coordinación entre Producción y Calidad. | 4 | Cobades Zamora, Yhoshua Hebert | Done |
| US42 | Solicitudes de aprobación | T068 | Solicitudes de aprobación | Crear tareas de aprobación dirigidas a Calidad desde un registro. | 3 | Cobades Zamora, Yhoshua Hebert | Done |
| US43 | Seguimiento de tareas | T069 | Seguimiento de tareas | Mostrar el estado de las tareas asignadas por el usuario. | 4 | Cobades Zamora, Yhoshua Hebert | Done |
| — | Tareas técnicas | T070 | Configuración del proyecto Angular | Configurar Angular Material, ngx-translate, environments y json-server con las rutas /api/v1. | 4 | Zavaleta Gutierrez, Rodolfo Martin | Done |
| — | Tareas técnicas | T071 | Capa shared | Implementar las clases base de la API, el layout público, el workspace shell, el page header y el selector de idioma. | 6 | Cobades Zamora, Yhoshua Hebert | Done |
| — | Tareas técnicas | T072 | Traducciones de IoT Monitoring | Agregar las 121 claves de la sección monitoring en inglés y español. | 3 | Rojas Ambicho, Nestor Daniel | Done |
| — | Tareas técnicas | T073 | Documentación del repositorio | Redactar el README, el CHANGELOG, la guía de contribución, las ADRs y el diagrama de clases. | 4 | Zavaleta Gutierrez, Rodolfo Martin | Done |
| — | Tareas técnicas | T074 | Releases v1.0.0 | Preparar release/v1.0.0 en la Landing Page y en la Web Application, con merge a main y tag SemVer. | 2 | Rojas Ambicho, Nestor Daniel | Done |
| — | Tareas técnicas | T075 | Configuración de despliegue | Agregar firebase.json para Firebase Hosting y el script server:prod para publicar la Fake API. | 2 | Rojas Ambicho, Nestor Daniel | Done |

#### 5.2.2.4. Development Evidence for Sprint Review

En el Sprint 2 se trabajó en dos repositorios siguiendo GitFlow: una feature branch por sección de la Landing Page o por bounded context de la Web Application, integradas en `develop` con merges `--no-ff`, y una rama `release/v1.0.0` fusionada en `main` con el tag `v1.0.0` en ambos repositorios. La Landing Page recibió además el hotfix `v1.0.1`. Las tablas siguientes presentan todos los commits de `main`; la columna *Branch* indica la rama en que se realizó cada commit.

**Landing Page** (92 commits)

| Repository | Branch | Commit Id | Commit Message | Commit Message Body | Committed on (Date) |
|------------|--------|-----------|----------------|---------------------|---------------------|
| IngesCompany-7742/IngesCompany-LandingPage | main | `5a5fb40` | chore: initial commit | — | 07/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | main | `80e064f` | chore: add gitignore | — | 07/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/project-configuration | `afb534f` | feat(translations): add initial language files for English and Spanish | — | 07/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/project-configuration | `dc827a9` | feat(translations): implement language switching functionality file | — | 07/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `0a72a3f` | Merge branch 'feature/project-configuration' into develop | — | 07/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/navbar-hero | `c569c20` | feat(translations): add language switching functionality and update HTML structure | — | 07/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/navbar-hero | `ab9e295` | feat(nav): add navbar with language support in English and Spanish and styles | — | 07/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/navbar-hero | `996e8cd` | feat(hero): add hero section with dynamic content placeholders and styles | — | 07/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/navbar-hero | `2ca1c4b` | feat(translations): add hero content translations for English and Spanish | — | 07/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `2acc88b` | Merge branch 'feature/navbar-hero' into develop | — | 07/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `0d68dcf` | feat(styles): add modular styles with the 12-column fluid grid | — | 08/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `a79fefb` | feat(i18n): load English and Spanish texts from JSON files | — | 08/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `b31ee03` | feat(layout): add navbar with mobile menu, footer and segment access | — | 08/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `85932c9` | feat(cursor): add custom cursors in the DoofPlus colors | — | 08/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/plans-section | `cc97535` | feat(i18n): add translation of plans | — | 08/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/plans-section | `690e9a9` | feat(components): add billing-toggle | — | 08/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/plans-section | `f3838e1` | feat(styles): add section of plan styles | — | 08/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/plans-section | `b527590` | feat(scripts): add import of sections | — | 08/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/plans-section | `8bfd189` | feat(index):  add monthly and yearly plans | — | 08/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `cdd7304` | Merge branch 'feature/plans-section' into develop | — | 08/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/restore-hero | `59d793c` | feat(home): restore hero section | — | 08/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `f886259` | Merge branch 'feature/restore-hero' into develop | — | 08/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/workspace-section | `c10ba0b` | feat(i18n): add workspace content translations for English and Spanish | — | 08/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/workspace-section | `3cc963b` | feat(workspace): add process flow bar and section workspace | — | 08/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/workspace-section | `b8b9428` | feat(workspace): add workspace cards with dynamic content and translation | — | 08/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `06b0bfe` | Merge branch 'feature/workspace-section' into develop | — | 08/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/services | `504205f` | feat(services) : add services cards | — | 08/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/services | `ca857c3` | feat(i18n) : add services content translations for english and spanish | — | 08/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/services | `78ab06b` | feat(services) : add services styles | — | 08/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `0b48370` | Merge branch 'feature/services' into develop | — | 08/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `0d2bd78` | fix(navbar): skip placeholder links when highlighting sections | — | 08/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `666d9cd` | feat(i18n): add features content translations for english and spanish | — | 08/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `c8ffc51` | feat(features): add features section with accordion and preview panels | — | 08/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `70c9db1` | feat(features): add features styles | — | 08/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `fbf3b79` | fix(plans): load billing toggle script so the annual option works | — | 08/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `beb359f` | style(form): add textarea and confirmation styles and remove unused demo styles | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `72c978b` | feat(i18n): add contact inquiry translations for english and spanish | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/contact-section | `3a58827` | feat(contact): add contact inquiry form section | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `d296d28` | Merge remote-tracking branch 'origin/feature/contact-section' into develop | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/benefits-section | `103c355` | feat(i18n): add benefits content translations for english and spanish | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/benefits-section | `6e38531` | feat(benefits): add benefits section with key result cards | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/benefits-section | `f043190` | feat(benefits): add benefits styles | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `9b49664` | Merge branch 'feature/benefits-section' into develop | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/testimonials-section | `e8b7970` | feat(i18n): add testimonials content translations for english and spanish | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/about-product-section | `f14e0b9` | feat(i18n): add product section content translations for english and spanish | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/about-product-section | `7fd893b` | feat(video): add styles for product video section | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/about-product-section | `145acdf` | feat(video): add product video section with player and details | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `989262c` | Merge branch 'feature/about-product-section' into develop | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/testimonials-section | `cbfe7b1` | feat(testimonials): add testimonials section with client quotes and ratings | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/testimonials-section | `26f6288` | feat(testimonials): add testimonials styles | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `f3a3a1e` | Merge branch 'feature/testimonials-section' into develop | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/faq-section | `7833057` | feat(i18n): add faq content translations for english and spanish | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/faq-section | `9599b92` | feat(faq): add faq section with accordion and contact link | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/faq-section | `ff8e68a` | feat(faq): add faq styles | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `20a0012` | Merge branch 'feature/faq-section' into develop | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/about-section | `f43c313` | feat(i18n): add about content translations for english and spanish | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/about-section | `58d8b38` | feat(about): add about section with mission, vision and principles | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/about-section | `ed983a7` | feat(about): add about styles | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `e0235c1` | Merge branch 'feature/about-section' into develop | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/team-section | `bdeab66` | feat(i18n): add team content translations for english and spanish | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/team-section | `65de15e` | feat(team): add team member photos | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/team-section | `25f6c2b` | feat(team): add team section with member cards | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/team-section | `e40431d` | feat(team): add team styles | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `217aa55` | Merge branch 'feature/team-section' into develop | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | fix/landing-links | `5e7e811` | fix(landing): replace demo links, fix hero buttons and wrap sections in main | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/navbar | `f5754c1` | feat(navbar): add section links, segment access and mobile menu | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `8236269` | Merge branch 'fix/landing-links' into develop | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `b9e41f1` | Merge branch 'feature/navbar' into develop | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | fix/hero-section | `ab053c9` | fix(i18n): update hero content translations | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | fix/hero-section | `ab59881` | fix(hero): update hero call to action buttons | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `2b51732` | Merge branch 'fix/hero-section' into develop | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | fix/workspace-section | `25c1931` | fix(i18n): update workspace content translations | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | fix/workspace-section | `486687f` | style(workspace): replace workspace styles with card and banner styles | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | fix/workspace-section | `4e471af` | fix(workspace): simplify segment cards and add new customer banner | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `0af9d9e` | Merge branch 'fix/workspace-section' into develop | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/footer-privacy-section | `483ab70` | fix(i18n): update Spanish translations for product video section producing error | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/footer-privacy-section | `f0d25a0` | feat(terms): add Terms of Service page with legal content and multilingual support | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/footer-privacy-section | `cf1c8a3` | feat(privacy): add Privacy Policy page with legal content and multilingual support | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/footer-privacy-section | `670ebff` | feat(styles): add styles for secondary pages including terms of service and privacy policy | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/footer-privacy-section | `7d42d1c` | feat(legal): add Terms of Service and Privacy Policy sections in English and Spanish | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `6f34ece` | Merge branch 'feature/footer-privacy-section' into develop | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | fix/legal-pages | `acda06d` | fix(styles): import the secondary page styles used by the terms and privacy pages | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | fix/legal-pages | `6f465cd` | fix(i18n): add the page titles and back link translations of the terms and privacy pages | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `f8a1b3d` | Merge branch 'fix/legal-pages' into develop | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/videos | `2bd55e5` | feat(video): add the video player that loads the YouTube embed on play | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | feature/videos | `d742662` | feat(team): add the about the team video below the member cards | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | develop | `1163cea` | Merge branch 'feature/videos' into develop | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | release/v1.0.0 | `42a44c0` | chore(release): set the landing page version to 1.0.0 | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | main | `1acb96b` | Merge branch 'release/v1.0.0' | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | hotfix/v1.0.1 | `7a2de04` | fix(deploy): publish the static site on GitHub Pages without the Jekyll build | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | hotfix/v1.0.1 | `d4efb41` | chore(release): set the landing page version to 1.0.1 | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-LandingPage | main | `61326ed` | Merge branch 'hotfix/v1.0.1' | — | 09/10/2026 |

**Frontend Web Application** (173 commits)

| Repository | Branch | Commit Id | Commit Message | Commit Message Body | Committed on (Date) |
|------------|--------|-----------|----------------|---------------------|---------------------|
| IngesCompany-7742/IngesCompany-Frontend | main | `16247a9` | chore: initial commit | — | 28/09/2026 |
| IngesCompany-7742/IngesCompany-Frontend | main | `58f3404` | chore: add git ignore | — | 28/09/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/project-configuration | `89336d3` | feat(i18n): add i18n support for English and Spanish translation | — | 28/09/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/project-configuration | `84282bf` | feat(ui): add Material Design UI Library | — | 28/09/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/project-configuration | `cb6376e` | feat(environment): add Environment configuration for development and production modes | — | 28/09/2026 |
| IngesCompany-7742/IngesCompany-Frontend | develop | `3ea5890` | Merge branch 'feature/project-configuration' into develop | — | 28/09/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/shared | `b066a80` | feat(home): add Home view with title and content, including route definition and style | — | 28/09/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/shared | `6d386d5` | feat(home): add DateTime and URL value objects for handing dates and URLs | — | 29/09/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/shared | `574db0d` | feat(base-entity): add BaseEntity interface for domain entities with UUID identifier | — | 29/09/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/shared | `b1906c4` | feat(toolbar): add responsive toolbar component | — | 29/09/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/shared | `c701062` | feat(layout): add layout component | — | 29/09/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/shared | `f5ed375` | feat(language-switcher): add language switcher component for UI language selection | — | 29/09/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/shared | `c0bcedc` | feat(about): add About page with layout, styles, and content for product overview | — | 29/09/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/shared | `78a850c` | feat(page-not-found): add Page Not Found component with template and navigation | — | 29/09/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/shared | `9df65b3` | chore(index): update index.html structure for semantic consistency | — | 29/09/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/shared | `8ebbec3` | style(layout): add tittle | — | 29/09/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/shared | `067727c` | feat(about): add the route definition of the view About | — | 29/09/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/shared | `9840b0b` | feat(routes): add the route definition of the view About and PageNotFound | — | 29/09/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/shared | `f4f9185` | Merge remote-tracking branch 'origin/feature/shared' into feature/shared | # Conflicts: # src/app/app.routes.ts | 29/09/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/shared | `a270b2f` | feat(footer): add footer component and translation | — | 29/09/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/shared | `485f392` | feat(footer): add footer component and translation | — | 29/09/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/shared | `46a135e` | fix(layout): render toolbar globally across public views and add translations | — | 30/09/2026 |
| IngesCompany-7742/IngesCompany-Frontend | develop | `e7ec1ba` | Merge branch 'feature/shared' into develop | — | 05/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/manufacturing | `c5951a6` | feat(database): add initial db.json with vaccine batch data | — | 05/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/manufacturing | `dd30869` | feat(batch): add Batch entity to represent product batches | — | 05/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/share-fixes | `a09dd57` | fix(shared): add missing DoofPlus logo asset | — | 06/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/share-fixes | `6f4ce9c` | fix(i18n): add missing translations for home, about and page not found views | — | 06/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | develop | `23e6e5a` | Merge branch 'feature/share-fixes' into develop | — | 06/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/manufacturing | `5f53fd7` | feat(server): add JSON server setup to run the locale database | — | 07/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/manufacturing | `43b4302` | feat(manufacturing): add infrastructure layer in manufacturing for batch operations | — | 07/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/manufacturing | `98bd8a3` | feat(database): add db.json with initial posts and comments data | — | 07/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/manufacturing | `ae368f6` | feat(manufacturing): implement ManufacturingStore for batch state management in application layer | — | 07/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/manufacturing | `353c95b` | feat(batch): add BatchList component with support in English and Spanish and routing for batch management | — | 07/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/manufacturing | `07e9dc2` | feat(batch): add BatchForm component with support in English and Spanish and routing | — | 07/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/manufacturing | `2092428` | Merge branch 'develop' into feature/manufacturing | — | 08/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | develop | `f8184a4` | Merge branch 'feature/manufacturing' into develop | — | 08/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | develop | `9ab2fae` | fix(routes): integrate manufacturing routes into main app routing | — | 08/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | develop | `0e9ba1a` | fix(manufacturing): add ChangeDetectorRef to batch list to trigger zoneless rendering | — | 08/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | develop | `767e6a2` | test(mock): update mock database with testing records | — | 08/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/iam | `00c63c2` | feat(iam): add domain models for user authentication and authorization | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/iam | `96c30c7` | feat(iam): add data transfer objects and assembler for sign-in flow | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/iam | `3aa4550` | feat(iam): add data transfer objects and assembler for sign-up flow | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/iam | `f6b50bc` | feat(iam): implement IamApi for user sign-up and sign-in functionality | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/iam | `f28cca2` | feat(store): add application store to manage authentication state | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/iam | `68ed25a` | feat(guard): add route guard to protect authenticated views | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/iam | `41b15e9` | feat(interceptor): add interceptor to attach bearer tokens | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/iam | `bf9e497` | feat(sign-in-view): add user interface component for sign in | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/iam | `1da2e62` | feat(sign-up-view): add user interface component for sign up | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/iam | `0d905de` | feat(routing): integrate iam views and configure loading for authentication | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | develop | `c59594f` | Merge branch 'feature/iam' into develop | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/quality | `8aab2ab` | chore(server): add documents, deviations, CAPA, results, audits, reports and tasks to the fake API | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/quality | `493c0ec` | feat(environment): add the fake API base URL and the quality endpoint paths | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/quality | `863f2c8` | feat(quality): model documents, deviations, CAPA, analytical results, audits, reports and tasks | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/quality | `de4c4f6` | feat(quality): read and write the quality collections through the fake API | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/quality | `141ea68` | feat(quality): enforce release, signature, segregation of duties and CAPA closure rules in the store | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/quality | `a26fb2d` | feat(quality-view): add the quality overview and the traceability and deviation indicators | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/quality | `f0ec8e2` | feat(document-view): add controlled documents with approval workflow and version history | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/quality | `83b92e7` | feat(release-view): add batch release with electronic signature and the analytical results | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/quality | `46ea7c9` | feat(task-view): add tasks and discussions linked to records | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/quality | `d0bd0c5` | feat(i18n): add the quality and compliance translations in English and Spanish | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/quality | `e91dbb4` | feat(routing): add the routes of the quality bounded context | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/shared | `ee75ac9` | fix(config): complete the index.html head with viewport, fonts, icons and SEO meta tags | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/shared | `28b167d` | feat(environment): add the landing page URL and the fake API base URL | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/shared | `fca883b` | style(theme): apply DoofPlus colors and shapes to the Material theme | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/shared | `5c6559e` | style(shared): add layout, status and accessibility helpers for the Figma views | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/shared | `0ac965e` | feat(shared): add base API, endpoint, assembler and form classes from the course base project | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/shared | `7657404` | feat(language-switcher): show the EN/ES pill of the mock-ups and remember the chosen language | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/monitoring | `939f04d` | feat(alert): add Alert entity to represent system alerts | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/shared | `3798e78` | feat(layout): turn the toolbar, footer and layout into the public frame of the mock-ups | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/monitoring | `9f900a0` | feat(equipment): add Equipment entity to represent equipment details and maintenance | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/shared | `33cd8ca` | feat(page-header): add breadcrumb, title and actions header for workspace pages | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/monitoring | `1d274fd` | feat(reading): add Reading entity to represent telemetry readings | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/shared | `1286b97` | feat(config): use outlined Material icons, bind route parameters to inputs and announce the page language | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/monitoring | `28f0f89` | feat(sensor): add Sensor entity to represent IoT sensors and their properties | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/shared | `8b345e2` | refactor(shared): replace home and about with the sign-in entry point | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/shared | `9ca0dea` | test(app): check that the root component hosts the routed views | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | develop | `7aa3999` | Merge branch 'feature/shared' into develop | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/iam | `30ebe27` | chore(server): add users, role profiles and invitations to the fake API | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/iam | `5c45a1a` | feat(environment): add the endpoint paths of the IAM collections | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/monitoring | `bf84897` | feat(monitoring-api): add monitoring api service for iot endpoints management | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/iam | `fbe4243` | feat(iam): model users with environment and organization, role profiles and invitations | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/monitoring | `a66ff4c` | feat(alert): add alert API endpoint and assembler for CRUD operations | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/iam | `e3c2e89` | feat(iam): read users, role profiles and invitations from the fake API | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/monitoring | `cb30ca9` | feat(equipment): add API endpoint, assembler, and response models for equipment CRUD operations | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/iam | `271285c` | feat(iam): sign in by environment with a two-factor code and role-based access | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/monitoring | `b2c9c9d` | feat(reading): add Reading API endpoint, assembler, and response models for CRUD operations | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/iam | `496cd7a` | feat(layout): add the workspace shell with sidebar, top bar and user menu | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/monitoring | `e60fbcd` | feat(sensor): add Sensor API endpoint, assembler, and response models for CRUD operations | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/iam | `31c5208` | feat(sign-in-view): add environment selection, sign-in, two-factor and not-authorized views | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/iam | `042b8fe` | feat(users-view): add users and profiles directory and the invite user form | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/monitoring | `73b7b53` | feat(monitoring-store): add monitoringstore for managing equipment, sensors, readings, and alerts | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/iam | `d304131` | feat(i18n): add the IAM and workspace translations in English and Spanish | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/iam | `4a3f0b6` | feat(routing): route the sign-in and the three environments protected by the IAM guard | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/iam | `9a91e9d` | refactor(iam): remove the token sign-in, sign-up and interceptor that the fake API cannot serve | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | develop | `9ca9813` | Merge remote-tracking branch 'origin/feature/iam' into develop | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | develop | `5aa36c1` | chore(server): add json-server as a development dependency | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | develop | `bae6ffe` | chore(config): raise the component style budget for the Figma layouts | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/monitoring | `092339a` | feat(telemetry-chart): add telemetry chart component for visualizing sensor readings | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | develop | `e457c8a` | chore(server): replace the sample production batches with the manufacturing collections | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | develop | `dd7b09f` | feat(environment): add the endpoint paths of the manufacturing collections | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | develop | `fe885b3` | feat(manufacturing): model products, master formulas, orders, operations, batches and material lots | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | develop | `1b415ea` | feat(manufacturing): read and write the manufacturing collections through the fake API | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | develop | `33eebd2` | feat(manufacturing): validate batches, record operations and receive materials in the store with signals | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/monitoring | `67542b0` | feat(alert-list): add alert list component for displaying IoT incidents with severity and status | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | develop | `ded2019` | feat(batch-view): turn the batch form into the create batch dialog with the rejection state | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/monitoring | `519b1cd` | feat(batch-iot-evidence): add component for displaying IoT evidence with equipment association and readings | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/monitoring | `8a49239` | feat(equipment-inventory): add equipment inventory component for managing sensors and maintenance | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/monitoring | `b4190b2` | feat(iot-overview): add IoT overview component for monitoring sensor and equipment health, telemetry, and alerts | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/monitoring | `d85d8bf` | feat(sensor-detail): add sensor detail component for displaying telemetry, alerts, and equipment calibration | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/monitoring | `448e9de` | feat(routes): add monitoring routes for IoT overview, equipment inventory, sensor detail, alert list, and batch IoT evidence | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | develop | `037a753` | feat(batch-view): show batches with status counts, filters, lookup and the selected batch | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/subscriptions | `4ca6f73` | chore(server): add plans, the organization subscription and invoices to the fake API | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | develop | `58d11c5` | feat(batch-view): add batch genealogy and status history | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/subscriptions | `7903c15` | feat(environment): add the endpoint paths of the subscription collections | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | develop | `1d252d1` | feat(order-view): add production orders and the order execution against the master formula | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | develop | `ba60036` | feat(product-view): add the product catalog and the effective master formula | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | develop | `ea09f17` | feat(receipt-view): add the raw-material receipt with quarantine inspection | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/subscriptions | `af07149` | feat(subscriptions): model plans, subscriptions and invoices | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | develop | `7646e4c` | feat(i18n): replace the batch translations with the manufacturing translations and add shared labels | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | develop | `223e7ca` | feat(routing): route the manufacturing views in the production environment | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/subscriptions | `5d3118b` | feat(subscriptions): read plans, subscriptions and invoices from the fake API | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/subscriptions | `c6a4fda` | feat(subscriptions): manage the plan change and the payment retry in the subscriptions store | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/subscriptions | `01e3922` | feat(subscription-view): add the subscriptions and payments page with billing history and plan change review | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/monitoring | `3f183b2` | Merge branch 'develop' into feature/monitoring | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/monitoring | `b9a862a` | feat(db): add equipment and sensor data with calibration and maintenance details | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/subscriptions | `9dc488c` | feat(i18n): add the subscriptions translations in English and Spanish | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/monitoring | `9383633` | chore(db): remove unnecessary whitespace and trailing braces from db.json | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/monitoring | `b104c03` | feat(environment): add new endpoint paths for equipment, sensors, readings, and alerts | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/subscriptions | `23c8b4e` | feat(routing): route the subscriptions page in the administration environment | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | develop | `1481052` | Merge branch 'feature/subscriptions' into develop | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/monitoring | `d05ab97` | Merge branch 'develop' into feature/monitoring | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/organizations | `e78965d` | chore(server): add the organization, facilities, user profiles and administrative activity to the fake API | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/organizations | `0737256` | feat(environment): add the endpoint paths of the organization collections | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/organizations | `63f97ed` | feat(organizations): model organizations, facilities, user profiles and administrative activity | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/monitoring | `6a75732` | feat(routes): add monitoring routes to production environment | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/organizations | `eace210` | feat(organizations): read and register organizations through the fake API | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/monitoring | `f3e103f` | chore(routes): clean up import statements in app.routes.ts | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/organizations | `378c1a7` | feat(organizations): register organizations and update user profiles in the organizations store | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | develop | `14b745a` | Merge branch 'feature/monitoring' into develop | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/organizations | `028ab75` | feat(registration-view): add the organization registration with plan and first administrator | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/organizations | `9646143` | feat(overview-view): add the administration overview with users, facilities and account health | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/organizations | `0c0d6bd` | feat(profile-view): add profile and notification preferences for every environment | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/organizations | `d03f0bc` | Merge branch 'develop' into feature/organizations | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/organizations | `222adee` | feat(i18n): add the organizations translations in English and Spanish | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/organizations | `3bb4348` | feat(routing): route the registration, the administration overview and the profile | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/manufacturing | `0d4cdb9` | feat(overview): add the production overview with schedule readiness and incident priorities | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/manufacturing | `6f3053b` | feat(routing): route the production overview as the production home | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | develop | `be5d92b` | Merge branch 'feature/organizations' into develop | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/quality | `6e3273e` | fix(i18n): use shared cancel and status labels instead of keys from other bounded context | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/quality | `a5ffaaa` | fix(routing): route the quality view and share the audit trail and task with every environment | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | develop | `0446f56` | Merge branch 'feature/manufacturing' into develop | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/quality | `05fae7c` | Merge branch 'develop' into feature/quality | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/quality | `f53fbe1` | fix(i18n): use the shared status label in the remaining quality views | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/quality | `7de536e` | fix(routing): add the quality routes to the qa, production and administration environments | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | develop | `4132182` | Merge branch 'feature/quality' into develop | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | docs/repository-setup | `1864b3b` | docs(readme): add project documentation, run instructions and bounded contexts | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | docs/repository-setup | `f791346` | chore(license): add MIT license | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | docs/repository-setup | `abb5afc` | docs(repository): add changelog and contributing guidelines | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | docs/repository-setup | `60145ed` | docs(architecture): create docs directory with user stories and diagrams placeholders | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | develop | `158f838` | Merge branch 'docs/repository-setup' into develop | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | docs/expanded-readme | `0b2a174` | docs(readme): expand documentation with badges, architecture and tech stack details | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | develop | `8c47f21` | Merge branch 'docs/expanded-readme' into develop | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | develop | `3a87aa1` | docs(architecture): fix readme markdown, add ADRs and mermaid diagrams | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | develop | `1298689` | docs(architecture): add domain model class diagram | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | develop | `39b250c` | docs(architecture): align docs structure with learning-center (PlantUML and single adrs file) | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/monitoring | `785fda4` | feat(i18n): add the IoT monitoring translations in English and Spanish | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | develop | `efa7877` | Merge branch 'feature/monitoring' into develop | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/project-configuration | `c96bd29` | docs(readme): rename the demo accounts section to test accounts | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/project-configuration | `317784a` | chore(server): add a start script to publish the fake API on a hosting service | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/project-configuration | `a258f40` | chore(deploy): add the Firebase Hosting configuration for the single page application | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | develop | `eab64e9` | Merge branch 'feature/project-configuration' into develop | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | release/v1.0.0 | `700dcb1` | chore(release): set the web application version to 1.0.0 and update the changelog | — | 09/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | main | `d63b938` | Merge branch 'release/v1.0.0' | — | 09/10/2026 |

#### 5.2.2.5. Execution Evidence for Sprint Review

En este Sprint se completó la Landing Page, publicada en GitHub Pages, y se implementó la Web Application con sus tres entornos. En la Landing Page se agregaron el hero, el acceso por segmento, los servicios y características, el video About the Product, los beneficios, About us, el equipo con su video, los testimonios y las preguntas frecuentes, y se reimplementaron la navegación con menú mobile, los planes, el formulario de consulta y las páginas legales. La Web Application permite elegir el entorno, iniciar sesión con segundo factor y recorrer todos los módulos de QA/QC (documentos, desviaciones y CAPA, resultados analíticos, liberación de lotes, auditorías, audit trail, reportes y tareas), Production (órdenes, productos y fórmulas, lotes, materias primas, equipos e IoT, incidentes) y Administration (usuarios, organización y suscripción), en inglés y español, con datos servidos por una Fake API.

**Landing Page:** https://ingescompany-7742.github.io/IngesCompany-LandingPage/

![Hero con la propuesta de valor (US01)](../assets/img/chapter5/sprint2/landing/01-home.png)

*Figura: Hero con la propuesta de valor (US01).*

![Acceso por segmento: Choose your workspace (US48)](../assets/img/chapter5/sprint2/landing/02-workspace.png)

*Figura: Acceso por segmento: Choose your workspace (US48).*

![Servicios (US02)](../assets/img/chapter5/sprint2/landing/03-services.png)

*Figura: Servicios (US02).*

![Características con acordeón y vista previa (US02)](../assets/img/chapter5/sprint2/landing/04-features.png)

*Figura: Características con acordeón y vista previa (US02).*

![Video About the Product (US49)](../assets/img/chapter5/sprint2/landing/05-product.png)

*Figura: Video About the Product (US49).*

![Beneficios](../assets/img/chapter5/sprint2/landing/06-benefits.png)

*Figura: Beneficios.*

![Planes con toggle mensual/anual (US03)](../assets/img/chapter5/sprint2/landing/07-plans.png)

*Figura: Planes con toggle mensual/anual (US03).*

![About us: misión y visión (US45)](../assets/img/chapter5/sprint2/landing/08-about.png)

*Figura: About us: misión y visión (US45).*

![Our Team y video About the Team (US45, US49)](../assets/img/chapter5/sprint2/landing/09-team.png)

*Figura: Our Team y video About the Team (US45, US49).*

![Testimonios](../assets/img/chapter5/sprint2/landing/10-testimonials.png)

*Figura: Testimonios.*

![Preguntas frecuentes (US05)](../assets/img/chapter5/sprint2/landing/11-faq.png)

*Figura: Preguntas frecuentes (US05).*

![Formulario Contact us y footer (US04)](../assets/img/chapter5/sprint2/landing/12-contact.png)

*Figura: Formulario Contact us y footer (US04).*

![Landing Page en español (US46)](../assets/img/chapter5/sprint2/landing/13-home-es.png)

*Figura: Landing Page en español (US46).*

![Términos de Servicio (US47)](../assets/img/chapter5/sprint2/landing/14-terms.png)

*Figura: Términos de Servicio (US47).*

![Vista mobile](../assets/img/chapter5/sprint2/landing/15-mobile-home.png)

*Figura: Vista mobile.*

![Menú de navegación en mobile (US44)](../assets/img/chapter5/sprint2/landing/16-mobile-menu.png)

*Figura: Menú de navegación en mobile (US44).*

**Web Application** (cuentas de prueba en el README del repositorio; contraseña `DoofPlus2026!` y código 2FA `482106`):

![Elección de entorno (US06)](../assets/img/chapter5/sprint2/web-app/01-sign-in.png)

*Figura: Elección de entorno (US06).*

![Verificación con código 2FA (US06)](../assets/img/chapter5/sprint2/web-app/02-two-factor.png)

*Figura: Verificación con código 2FA (US06).*

![QA/QC · Quality overview (US31)](../assets/img/chapter5/sprint2/web-app/03-qa-overview.png)

*Figura: QA/QC · Quality overview (US31).*

![QA/QC · Quality documents con versiones y aprobación (US09, US12, US13)](../assets/img/chapter5/sprint2/web-app/04-qa-documents.png)

*Figura: QA/QC · Quality documents con versiones y aprobación (US09, US12, US13).*

![QA/QC · Deviation report y evaluación de riesgo (US18)](../assets/img/chapter5/sprint2/web-app/05-qa-deviations.png)

*Figura: QA/QC · Deviation report y evaluación de riesgo (US18).*

![QA/QC · Plan CAPA (US19, US20, US21)](../assets/img/chapter5/sprint2/web-app/06-qa-capa.png)

*Figura: QA/QC · Plan CAPA (US19, US20, US21).*

![QA/QC · Liberación de lotes con firma electrónica (US54, US08)](../assets/img/chapter5/sprint2/web-app/07-qa-batch-release.png)

*Figura: QA/QC · Liberación de lotes con firma electrónica (US54, US08).*

![QA/QC · Audit trail (US27)](../assets/img/chapter5/sprint2/web-app/08-qa-audit-trail.png)

*Figura: QA/QC · Audit trail (US27).*

![Production · Production overview (US32)](../assets/img/chapter5/sprint2/web-app/09-production-overview.png)

*Figura: Production · Production overview (US32).*

![Production · Órdenes de producción (US57)](../assets/img/chapter5/sprint2/web-app/10-production-orders.png)

*Figura: Production · Órdenes de producción (US57).*

![Production · Lotes con filtros y lote seleccionado (US14, US15, US16)](../assets/img/chapter5/sprint2/web-app/11-production-batches.png)

*Figura: Production · Lotes con filtros y lote seleccionado (US14, US15, US16).*

![Production · IoT overview con telemetría (US25, US26)](../assets/img/chapter5/sprint2/web-app/12-iot-overview.png)

*Figura: Production · IoT overview con telemetría (US25, US26).*

![Production · Equipos y sensores IoT (US23, US37, US38)](../assets/img/chapter5/sprint2/web-app/13-equipment.png)

*Figura: Production · Equipos y sensores IoT (US23, US37, US38).*

![Production · Incidentes (US56, US22)](../assets/img/chapter5/sprint2/web-app/14-incidents.png)

*Figura: Production · Incidentes (US56, US22).*

![Administration · Resumen de administración (US50)](../assets/img/chapter5/sprint2/web-app/15-admin-overview.png)

*Figura: Administration · Resumen de administración (US50).*

![Administration · Usuarios y perfiles (US55, US07)](../assets/img/chapter5/sprint2/web-app/16-admin-users.png)

*Figura: Administration · Usuarios y perfiles (US55, US07).*

![Administration · Suscripción y pagos (US51, US52, US53)](../assets/img/chapter5/sprint2/web-app/17-admin-subscription.png)

*Figura: Administration · Suscripción y pagos (US51, US52, US53).*

![Administration · Suscripción y pagos en español](../assets/img/chapter5/sprint2/web-app/18-admin-subscription-es.png)

*Figura: Administration · Suscripción y pagos en español.*

![Registro de la organización (US50)](../assets/img/chapter5/sprint2/web-app/19-register.png)

*Figura: Registro de la organización (US50).*

![Inicio de sesión en mobile](../assets/img/chapter5/sprint2/web-app/20-mobile-sign-in.png)

*Figura: Inicio de sesión en mobile.*

Video de navegación del producto, upc-pre-202620-1asi0729-7742-IngesCompany-productnavigation-sprint-2: <mark>pegar URL de Microsoft Stream, inicio y duración</mark>

#### 5.2.2.6. Services Documentation Evidence for Sprint Review

En el Sprint 2 todavía no se implementaron los RESTful Web Services, por lo que no hay documentación OpenAPI. Mientras tanto, la Web Application consume una Fake API con json-server (`server/db.json`), cuyas rutas se exponen bajo el prefijo `/api/v1` mediante `server/routes.json`, el mismo que tendrán los Web Services. La siguiente tabla documenta los endpoints que usa la Web Application; la URL base local es `http://localhost:3000/api/v1`.

| Endpoint | Verbo HTTP | Sintaxis | Parámetros | Response | URL documentación |
|---|---|---|---|---|---|
| `/invitations` | GET | `/api/v1/invitations` | — | 200 OK con la lista de `invitations` | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/invitations` | POST | `/api/v1/invitations` | Recurso en el body (JSON) | 201 Created con el recurso creado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/role-profiles` | GET | `/api/v1/role-profiles` | — | 200 OK con la lista de `role-profiles` | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/users` | GET | `/api/v1/users` | — | 200 OK con la lista de `users` | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/users` | GET | `/api/v1/users?email={email}&password={password}` | `email`, `password` (query) | 200 OK con el usuario cuyas credenciales coinciden (inicio de sesión) | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/users` | GET | `/api/v1/users?id={id}&twoFactorCode={code}` | `id`, `twoFactorCode` (query) | 200 OK con el usuario si el código 2FA es válido | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/users` | POST | `/api/v1/users` | Usuario en el body (JSON) | 201 Created con el usuario invitado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/batch-events` | GET | `/api/v1/batch-events` | — | 200 OK con la lista de `batch-events` | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/batch-events` | POST | `/api/v1/batch-events` | Recurso en el body (JSON) | 201 Created con el recurso creado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/batches` | GET | `/api/v1/batches` | — | 200 OK con la lista de `batches` | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/batches` | POST | `/api/v1/batches` | Recurso en el body (JSON) | 201 Created con el recurso creado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/batches` | PUT | `/api/v1/batches/{id}` | `id` (path) y recurso en el body (JSON) | 200 OK con el recurso actualizado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/formula-items` | GET | `/api/v1/formula-items` | — | 200 OK con la lista de `formula-items` | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/master-formulas` | GET | `/api/v1/master-formulas` | — | 200 OK con la lista de `master-formulas` | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/material-lots` | GET | `/api/v1/material-lots` | — | 200 OK con la lista de `material-lots` | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/material-lots` | POST | `/api/v1/material-lots` | Recurso en el body (JSON) | 201 Created con el recurso creado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/material-lots` | PUT | `/api/v1/material-lots/{id}` | `id` (path) y recurso en el body (JSON) | 200 OK con el recurso actualizado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/operations` | GET | `/api/v1/operations` | — | 200 OK con la lista de `operations` | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/operations` | PUT | `/api/v1/operations/{id}` | `id` (path) y recurso en el body (JSON) | 200 OK con el recurso actualizado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/production-orders` | GET | `/api/v1/production-orders` | — | 200 OK con la lista de `production-orders` | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/production-orders` | POST | `/api/v1/production-orders` | Recurso en el body (JSON) | 201 Created con el recurso creado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/products` | GET | `/api/v1/products` | — | 200 OK con la lista de `products` | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/products` | POST | `/api/v1/products` | Recurso en el body (JSON) | 201 Created con el recurso creado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/alerts` | GET | `/api/v1/alerts` | — | 200 OK con la lista de `alerts` | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/alerts` | PUT | `/api/v1/alerts/{id}` | `id` (path) y recurso en el body (JSON) | 200 OK con el recurso actualizado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/equipment` | GET | `/api/v1/equipment` | — | 200 OK con la lista de `equipment` | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/equipment` | PUT | `/api/v1/equipment/{id}` | `id` (path) y recurso en el body (JSON) | 200 OK con el recurso actualizado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/readings` | GET | `/api/v1/readings` | — | 200 OK con la lista de `readings` | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/sensors` | GET | `/api/v1/sensors` | — | 200 OK con la lista de `sensors` | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/sensors` | POST | `/api/v1/sensors` | Recurso en el body (JSON) | 201 Created con el recurso creado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/sensors` | PUT | `/api/v1/sensors/{id}` | `id` (path) y recurso en el body (JSON) | 200 OK con el recurso actualizado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/administrative-activities` | GET | `/api/v1/administrative-activities` | — | 200 OK con la lista de `administrative-activities` | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/facilities` | GET | `/api/v1/facilities` | — | 200 OK con la lista de `facilities` | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/facilities` | POST | `/api/v1/facilities` | Recurso en el body (JSON) | 201 Created con el recurso creado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/organizations` | GET | `/api/v1/organizations/{id}` | `id` (path) | 200 OK con el recurso de `organizations` | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/organizations` | POST | `/api/v1/organizations` | Recurso en el body (JSON) | 201 Created con el recurso creado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/organizations` | GET | `/api/v1/organizations?ruc={ruc}` | `ruc` (query) | 200 OK con la organización que ya usa ese RUC | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/user-profiles` | GET | `/api/v1/user-profiles` | — | 200 OK con la lista de `user-profiles` | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/user-profiles` | PUT | `/api/v1/user-profiles/{id}` | `id` (path) y recurso en el body (JSON) | 200 OK con el recurso actualizado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/analytical-results` | GET | `/api/v1/analytical-results` | — | 200 OK con la lista de `analytical-results` | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/analytical-results` | POST | `/api/v1/analytical-results` | Recurso en el body (JSON) | 201 Created con el recurso creado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/analytical-results` | PUT | `/api/v1/analytical-results/{id}` | `id` (path) y recurso en el body (JSON) | 200 OK con el recurso actualizado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/audit-events` | GET | `/api/v1/audit-events` | — | 200 OK con la lista de `audit-events` | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/audit-events` | POST | `/api/v1/audit-events` | Recurso en el body (JSON) | 201 Created con el recurso creado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/audit-events` | PUT | `/api/v1/audit-events/{id}` | `id` (path) y recurso en el body (JSON) | 200 OK con el recurso actualizado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/audit-findings` | GET | `/api/v1/audit-findings` | — | 200 OK con la lista de `audit-findings` | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/audit-findings` | POST | `/api/v1/audit-findings` | Recurso en el body (JSON) | 201 Created con el recurso creado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/audit-findings` | PUT | `/api/v1/audit-findings/{id}` | `id` (path) y recurso en el body (JSON) | 200 OK con el recurso actualizado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/audits` | GET | `/api/v1/audits` | — | 200 OK con la lista de `audits` | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/audits` | POST | `/api/v1/audits` | Recurso en el body (JSON) | 201 Created con el recurso creado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/audits` | PUT | `/api/v1/audits/{id}` | `id` (path) y recurso en el body (JSON) | 200 OK con el recurso actualizado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/capa-actions` | GET | `/api/v1/capa-actions` | — | 200 OK con la lista de `capa-actions` | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/capa-actions` | POST | `/api/v1/capa-actions` | Recurso en el body (JSON) | 201 Created con el recurso creado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/capa-actions` | PUT | `/api/v1/capa-actions/{id}` | `id` (path) y recurso en el body (JSON) | 200 OK con el recurso actualizado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/capa-plans` | GET | `/api/v1/capa-plans` | — | 200 OK con la lista de `capa-plans` | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/capa-plans` | POST | `/api/v1/capa-plans` | Recurso en el body (JSON) | 201 Created con el recurso creado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/capa-plans` | PUT | `/api/v1/capa-plans/{id}` | `id` (path) y recurso en el body (JSON) | 200 OK con el recurso actualizado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/collaboration-tasks` | GET | `/api/v1/collaboration-tasks` | — | 200 OK con la lista de `collaboration-tasks` | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/collaboration-tasks` | POST | `/api/v1/collaboration-tasks` | Recurso en el body (JSON) | 201 Created con el recurso creado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/collaboration-tasks` | PUT | `/api/v1/collaboration-tasks/{id}` | `id` (path) y recurso en el body (JSON) | 200 OK con el recurso actualizado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/deviation-trends` | GET | `/api/v1/deviation-trends` | — | 200 OK con la lista de `deviation-trends` | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/deviation-trends` | POST | `/api/v1/deviation-trends` | Recurso en el body (JSON) | 201 Created con el recurso creado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/deviation-trends` | PUT | `/api/v1/deviation-trends/{id}` | `id` (path) y recurso en el body (JSON) | 200 OK con el recurso actualizado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/deviations` | GET | `/api/v1/deviations` | — | 200 OK con la lista de `deviations` | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/deviations` | POST | `/api/v1/deviations` | Recurso en el body (JSON) | 201 Created con el recurso creado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/deviations` | PUT | `/api/v1/deviations/{id}` | `id` (path) y recurso en el body (JSON) | 200 OK con el recurso actualizado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/evidence` | GET | `/api/v1/evidence` | — | 200 OK con la lista de `evidence` | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/evidence` | POST | `/api/v1/evidence` | Recurso en el body (JSON) | 201 Created con el recurso creado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/evidence` | PUT | `/api/v1/evidence/{id}` | `id` (path) y recurso en el body (JSON) | 200 OK con el recurso actualizado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/quality-documents` | GET | `/api/v1/quality-documents` | — | 200 OK con la lista de `quality-documents` | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/quality-documents` | POST | `/api/v1/quality-documents` | Recurso en el body (JSON) | 201 Created con el recurso creado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/quality-documents` | PUT | `/api/v1/quality-documents/{id}` | `id` (path) y recurso en el body (JSON) | 200 OK con el recurso actualizado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/regulatory-reports` | GET | `/api/v1/regulatory-reports` | — | 200 OK con la lista de `regulatory-reports` | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/regulatory-reports` | POST | `/api/v1/regulatory-reports` | Recurso en el body (JSON) | 201 Created con el recurso creado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/regulatory-reports` | PUT | `/api/v1/regulatory-reports/{id}` | `id` (path) y recurso en el body (JSON) | 200 OK con el recurso actualizado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/task-comments` | GET | `/api/v1/task-comments` | — | 200 OK con la lista de `task-comments` | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/task-comments` | POST | `/api/v1/task-comments` | Recurso en el body (JSON) | 201 Created con el recurso creado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/task-comments` | PUT | `/api/v1/task-comments/{id}` | `id` (path) y recurso en el body (JSON) | 200 OK con el recurso actualizado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/traceability-gaps` | GET | `/api/v1/traceability-gaps` | — | 200 OK con la lista de `traceability-gaps` | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/traceability-gaps` | POST | `/api/v1/traceability-gaps` | Recurso en el body (JSON) | 201 Created con el recurso creado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/traceability-gaps` | PUT | `/api/v1/traceability-gaps/{id}` | `id` (path) y recurso en el body (JSON) | 200 OK con el recurso actualizado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/invoices` | GET | `/api/v1/invoices` | — | 200 OK con la lista de `invoices` | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/invoices` | POST | `/api/v1/invoices` | Recurso en el body (JSON) | 201 Created con el recurso creado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/plans` | GET | `/api/v1/plans` | — | 200 OK con la lista de `plans` | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/subscriptions` | GET | `/api/v1/subscriptions` | — | 200 OK con la lista de `subscriptions` | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/subscriptions` | POST | `/api/v1/subscriptions` | Recurso en el body (JSON) | 201 Created con el recurso creado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |
| `/subscriptions` | PUT | `/api/v1/subscriptions/{id}` | `id` (path) y recurso en el body (JSON) | 200 OK con el recurso actualizado | [README](https://github.com/IngesCompany-7742/IngesCompany-Frontend#readme) |

#### 5.2.2.7. Software Deployment Evidence for Sprint Review

En este Sprint se prepararon las versiones estables de ambos productos siguiendo GitFlow:

- **Landing Page:** la rama `release/v1.0.0` se fusionó en `main` con el tag `v1.0.0`, y luego se publicó el hotfix `v1.0.1`, que agrega el archivo `.nojekyll` para que GitHub Pages publique los archivos estáticos sin procesarlos con Jekyll. La Landing Page se publica en GitHub Pages desde `main` en https://ingescompany-7742.github.io/IngesCompany-LandingPage/.
- **Web Application:** la rama `release/v1.0.0` se fusionó en `main` con el tag `v1.0.0` y su CHANGELOG. El repositorio incluye `firebase.json`, que configura Firebase Hosting como Single Page Application, y el script `npm run server:prod`, que publica la Fake API en un Web Service de Render. URL de la Web Application publicada: <mark>pegar URL de Firebase Hosting</mark>. URL de la Fake API: <mark>pegar URL de Render</mark>.

![Tag v1.0.0 de la Landing Page](../assets/img/chapter5/sprint2/github/release-landing-v1.0.0.png)

*Figura: Tag v1.0.0 del repositorio de la Landing Page.*

![Tag v1.0.0 de la Web Application](../assets/img/chapter5/sprint2/github/release-frontend-v1.0.0.png)

*Figura: Tag v1.0.0 del repositorio de la Web Application.*

![Landing Page publicada](../assets/img/chapter5/sprint2/landing/01-home.png)

*Figura: Landing Page publicada en GitHub Pages.*

#### 5.2.2.8. Team Collaboration Insights during Sprint

Los cinco integrantes participaron en ambos repositorios. La siguiente tabla resume los commits de cada integrante en `main` (sin contar los commits de merge), seguida de los analíticos de GitHub: *Contributors*, que muestra los commits por integrante, y *Network*, que muestra las ramas de GitFlow y sus merges.

| Team Member | GitHub Username | Landing Page | Web Application | Total |
|---|---|:---:|:---:|:---:|
| Rojas Ambicho, Nestor Daniel | danRO-20 | 23 | 23 | 46 |
| Zavaleta Gutierrez, Rodolfo Martin | gutierrezrodolfo360-bit | 17 | 44 | 61 |
| Cobades Zamora, Yhoshua Hebert | YhoshuaCZ | 12 | 51 | 63 |
| Angulo Ramírez, Marcelo Martín | Zock2005 | 8 | 28 | 36 |
| Flores Martinez, Ricardo Andres | Nitoryu28 | 8 | 4 | 12 |

![Contributors de la Landing Page](../assets/img/chapter5/sprint2/github/insights-landing-contributors.png)

*Figura: Contributors del repositorio de la Landing Page.*

![Contributors de la Web Application](../assets/img/chapter5/sprint2/github/insights-frontend-contributors.png)

*Figura: Contributors del repositorio de la Web Application.*

![Network de la Landing Page](../assets/img/chapter5/sprint2/github/insights-landing-network.png)

*Figura: Network graph del repositorio de la Landing Page.*

![Network de la Web Application](../assets/img/chapter5/sprint2/github/insights-frontend-network.png)

*Figura: Network graph del repositorio de la Web Application.*

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
