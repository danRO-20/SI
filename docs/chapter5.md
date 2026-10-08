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
    * **UXPressia:** Elaboración de User Personas, Empathy Maps, Journey Maps e Impact Maps. (Referencia: https://uxpressia.com)
    * **Lucidchart:** Elaboración de Wireflows, User Flows y diagramas técnicos. (Referencia: https://www.lucidchart.com)
* **Software Development**
    * **Git:** Sistema de control de versiones distribuido utilizado en todos los repositorios. (Descarga: https://git-scm.com/downloads)
    * **GitHub:** Plataforma de alojamiento de los repositorios de la organización y de colaboración mediante ramas y Pull Requests. (Referencia: https://github.com/IngesCompany-7742)
    * **WebStorm:** IDE para el desarrollo de la Landing Page (HTML5, CSS3 y JavaScript) y de la Frontend Web Application en Angular. (Descarga: https://www.jetbrains.com/webstorm/download)
    * **IntelliJ IDEA:** IDE para el desarrollo de los RESTful Web Services en Java con Spring Boot. (Descarga: https://www.jetbrains.com/idea/download)
    * **Node.js y npm:** Entorno de ejecución y gestor de paquetes requeridos por Angular CLI. (Descarga: https://nodejs.org/en/download)
    * **Angular CLI:** Herramienta para generar, ejecutar y compilar la Frontend Web Application, integrando **Angular Material** como biblioteca de componentes y **ngx-translate** para la internacionalización. (Referencia: https://angular.dev/tools/cli)
    * **Spring Boot y Spring Data JPA:** Frameworks de Java para el desarrollo de los RESTful Web Services. (Referencia: https://spring.io/projects/spring-boot)
    * **PostgreSQL:** Sistema gestor de base de datos relacional. (Descarga: https://www.postgresql.org/download)
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
    * **Railway:** Base de datos PostgreSQL gestionada en la nube. (Referencia: https://railway.com)

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

Toda la nomenclatura del código fuente (archivos, clases, variables, métodos y comentarios) se escribe en **inglés**, respetando el Ubiquitous Language del dominio de calidad farmacéutica (por ejemplo, `Batch`, `Deviation`, `QualityEvent`). Las convenciones adoptadas por lenguaje son las siguientes:

* **HTML:** [HTML Style Guide and Coding Conventions (W3Schools)](https://www.w3schools.com/html/html5_syntax.asp) y [Google HTML/CSS Style Guide](https://google.github.io/styleguide/htmlcssguide.html). Etiquetas y atributos en minúsculas, valores de atributos entre comillas dobles, uso de etiquetas semánticas (`header`, `main`, `section`, `footer`) y atributo `alt` en todas las imágenes.
* **CSS:** [Google HTML/CSS Style Guide](https://google.github.io/styleguide/htmlcssguide.html). Indentación de 2 espacios, nombres de clases en kebab-case y selectores cortos; los ids no se usan para estilos.
* **JavaScript:** [Google JavaScript Style Guide](https://google.github.io/styleguide/jsguide.html). Uso de `const`/`let`, lowerCamelCase para variables y funciones y punto y coma al final de cada sentencia.
* **TypeScript:** [Google TypeScript Style Guide](https://google.github.io/styleguide/tsguide.html). UpperCamelCase para clases e interfaces, lowerCamelCase para propiedades y métodos, tipado explícito y sin uso de `any`.
* **Angular:** [Angular coding style guide](https://angular.dev/style-guide). Nombres de archivos en kebab-case, un componente por archivo, selectores con el prefijo `app-`, inyección de dependencias en servicios y organización del código por bounded context (`domain`, `infrastructure`, `application`, `presentation`).
* **Java:** [Google Java Style Guide](https://google.github.io/styleguide/javaguide.html). UpperCamelCase para clases, lowerCamelCase para métodos y variables, CONSTANT_CASE para constantes y llaves obligatorias en todas las estructuras de control.
* **Spring Boot:** [Spring Boot Features](https://docs.spring.io/spring-boot/reference/features/index.html). Clase principal en el paquete raíz, configuración externalizada en `application.properties` y variables de entorno, y controladores RESTful con rutas en plural y kebab-case (por ejemplo, `/api/v1/batches`).
* **Gherkin:** [Gherkin Conventions for Readable Specifications](https://specflow.org/gherkin/gherkin-conventions-for-readable-specifications). Palabras clave `Feature`, `Scenario`, `Given`, `When`, `Then` en inglés, un comportamiento por escenario y uso de `Scenario Outline` con `Examples` para casos basados en datos.

### 5.1.4. Software Deployment Configuration

A continuación se describen los pasos para desplegar cada producto de la solución a partir de su repositorio de código fuente:

1. **Landing Page (GitHub Pages)**
    1. Fusionar la rama en `main` y etiquetar la versión.
    2. En el repositorio `IngesCompany-LandingPage`, ingresar a *Settings > Pages* y seleccionar *Deploy from a branch* con la rama `main` y la carpeta `/ (root)`.
    3. GitHub Pages publica el sitio en https://ingescompany-7742.github.io/IngesCompany-LandingPage/ y lo vuelve a publicar con cada push a `main`.
2. **Frontend Web Application (Firebase Hosting)**
    1. Instalar Firebase CLI (`npm install -g firebase-tools`) e iniciar sesión con `firebase login`.
    2. Ejecutar `firebase init` en la raíz del proyecto Angular, indicando como carpeta pública `dist/<project-name>/browser` y configurándolo como Single Page Application.
    3. Compilar la versión de producción con `ng build --configuration production`.
    4. Publicar con `firebase deploy`.
3. **RESTful Web Services (Render y Railway)**
    1. Crear la base de datos PostgreSQL en Railway y obtener la URL de conexión y las credenciales.
    2. Crear un Web Service en Render vinculado a la rama `main` del repositorio de Web Services, con el Dockerfile del proyecto Spring Boot.
    3. Registrar en Render las variables de entorno de producción (URL y credenciales de la base de datos, secreto JWT y credenciales de la pasarela de pagos Niubiz).
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
| **Sprint 1 Goal** | **Our focus is on** delivering a responsive and bilingual Landing Page for DoofPlus.<br>**We believe it delivers** a clear understanding of DoofPlus' value proposition, plans and team to quality managers and production supervisors of pharmaceutical laboratories.<br>**This will be confirmed when** visitors can navigate through the features, plans and team sections, switch between Spanish and English, and reach the contact form on both desktop and mobile devices. |
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
| US03 | Visualización de planes y precios | T003 | Diseñar tarjetas de planes | Crear las tarjetas de los planes Standard Lab ($199/mes) y Enterprise ($599/mes) con sus características. | 3 | Flores Martinez, Ricardo Andres | Done |
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

En esta sección se registra y explica el avance en términos de producto y trabajo colaborativo para el **Sprint 2**, cuyo enfoque es la primera versión de la Frontend Web Application de DoofPlus: la configuración base del proyecto Angular y las vistas de gestión de lotes, desviaciones y dashboards. El Sprint 2 se encuentra en curso, por lo que en esta sección se presenta su avance.

#### 5.2.2.1. Sprint Planning 2

El Sprint Planning Meeting sirvió para definir los objetivos del desarrollo frontend, asignar responsabilidades y seleccionar las User Stories prioritarias orientadas a la gestión de lotes farmacéuticos, el registro de desviaciones de calidad y el monitoreo mediante dashboards. A continuación, se presenta el resumen de la reunión de planificación:

| Sprint # | Sprint 2 |
|----------|----------|
| **Sprint Planning Background** | |
| **Date** | 2026-10-02 |
| **Time** | 09:00 AM |
| **Location** | Reunión virtual vía Discord |
| **Prepared By** | Cobades Zamora, Yhoshua Hebert |
| **Attendees (to planning meeting)** | Angulo Ramírez, Marcelo Martín / Cobades Zamora, Yhoshua Hebert / Flores Martinez, Ricardo Andres / Rojas Ambicho, Nestor Daniel / Zavaleta Gutierrez, Rodolfo Martin |
| **Sprint 1 Review Summary** | Se entregó la Landing Page de DoofPlus publicada en GitHub Pages, con navegación por secciones, planes y precios, sección del equipo, formulario de contacto, cambio de idioma ES/EN y páginas legales, completando los 16 Story Points comprometidos (US44, US03, US45, US04, TS01, US46 y US47). |
| **Sprint 1 Retrospective Summary** | Como acierto, el equipo integró la versión estable mediante una rama de release siguiendo GitFlow. Como oportunidades de mejora, se acordó trabajar en feature branches que nazcan de `develop`, distribuir los commits a lo largo del sprint en lugar de concentrarlos al final y usar los types de Conventional Commits según su significado (`feat` para funcionalidades en lugar de `build` o `ci`). |
| **Sprint Goal & User Stories** | |
| **Sprint 2 Goal** | **Our focus is on** delivering the first version of the DoofPlus Web Application for batch registration, deviation tracking and quality and production dashboards.<br>**We believe it delivers** a centralized view of batch traceability and quality events to quality specialists and production supervisors of pharmaceutical laboratories.<br>**This will be confirmed when** users can register a batch, review its details, record a deviation by severity and filter batches and deviations in real time from the web application. |
| **Sprint 2 Velocity** | 17 Story Points |
| **Sum of Story Points** | 17 Story Points (US14: 3, US15: 5, US18: 3, US31: 3, US32: 3) |

#### 5.2.2.2. Aspect Leaders and Collaborators

En el Sprint 2 se consideraron cinco aspectos de la Frontend Web Application: la configuración del proyecto y los componentes compartidos (shared), la gestión de lotes, la gestión de desviaciones, los dashboards de calidad y producción, y la documentación del sprint. A continuación se presenta el Leadership-and-Collaboration Matrix (LACX):

| Team Member (Last Name, First Name) | GitHub Username | Project Setup & Shared | Batch Management | Deviation Management | Dashboards | Documentation |
|-------------------------------------|-----------------|:----------------------:|:----------------:|:--------------------:|:----------:|:-------------:|
| Angulo Ramírez, Marcelo Martín | Zock2005 | C | | C | C | |
| Cobades Zamora, Yhoshua Hebert | YhoshuaCZ | C | C | | L | L |
| Flores Martinez, Ricardo Andres | Nitoryu28 / Nitoryu2801 | | L | L | | C |
| Rojas Ambicho, Nestor Daniel | danRO-20 | | C | | | C |
| Zavaleta Gutierrez, Rodolfo Martin | gutierrezrodolfo360-bit | L | C | | | C |

#### 5.2.2.3. Sprint Backlog 2

El objetivo principal de este Sprint es implementar la primera versión de la Frontend Web Application de DoofPlus para la gestión de lotes y desviaciones y el monitoreo mediante dashboards. La siguiente imagen muestra el board del Sprint 2 en Jira:

![Sprint Backlog 2 en Jira](../assets/img/chapter5/evidencia/jira-pb2.png)

*Figura: Board del Sprint 2 en Jira Software.*

**Enlace al board en Jira:** [click aquí](https://doofplus.atlassian.net/jira/software/projects/UPC/boards/3/backlog?jql=parent+IN+%28UPC-2%2C+UPC-9%2C+UPC-20%29&atlOrigin=eyJpIjoiOWZkY2NhNGFkYzdlNGFmNGJlZTE4MTY1OGVjNjAyZDciLCJwIjoiaiJ9)

| Sprint # | Sprint 2 | | | | | | |
|----------|----------|---|---|---|---|---|---|
| **User Story** | | **Work-Item / Task** | | | | | |
| **Id** | **Title** | **Id** | **Title** | **Description** | **Estimation (Hours)** | **Assigned To** | **Status (To-do / In-Process / To-Review / Done)** |
| US14 | Registro de lotes | T012 | Componente de registro de lotes | Diseñar el formulario para capturar código de producto, nombre, cantidad y fecha de expiración del lote. | 4 | Flores Martinez, Ricardo Andres | In-Process |
| US14 | Registro de lotes | T013 | Servicio de lotes | Implementar el manejo de estado con signals en el servicio de lotes para registrar y consultar lotes. | 3 | Cobades Zamora, Yhoshua Hebert | In-Process |
| US15 | Consulta del historial de lotes | T014 | Componente de lista y detalle de lotes | Diseñar la tabla de lotes con badges de color según el estado y la vista de detalle de cada lote. | 4 | Zavaleta Gutierrez, Rodolfo Martin | In-Process |
| US15 | Consulta del historial de lotes | T015 | Filtros y buscador en tiempo real | Incorporar el campo de búsqueda y el selector por estado con `ngModel`. | 3 | Rojas Ambicho, Nestor Daniel | In-Process |
| US18 | Registro de desviaciones | T016 | Componente de registro de desviaciones | Construir el formulario para registrar hallazgos clasificados por nivel de severidad. | 4 | Flores Martinez, Ricardo Andres | In-Process |
| US18 | Registro de desviaciones | T017 | Componente de lista de desviaciones | Desarrollar la vista tabular para la consulta y el filtrado de desviaciones. | 3 | Angulo Ramírez, Marcelo Martín | In-Process |
| US31 | Dashboard de calidad | T018 | Tarjetas de indicadores KPI | Diseñar e integrar las tarjetas de indicadores de lotes y desviaciones en el dashboard. | 3 | Cobades Zamora, Yhoshua Hebert | In-Process |
| US32 | Dashboard de producción | T019 | Tabla y widgets de monitoreo | Desarrollar la tabla de seguimiento de lotes y los widgets de alertas de calidad recientes. | 3 | Angulo Ramírez, Marcelo Martín | In-Process |
| — | Tareas técnicas de la Frontend Web Application | T020 | Configuración del proyecto Angular | Configurar i18n con ngx-translate, Angular Material y los environments de desarrollo y producción. | 3 | Zavaleta Gutierrez, Rodolfo Martin | Done |
| — | Tareas técnicas de la Frontend Web Application | T021 | Componentes compartidos de layout | Implementar el toolbar responsive, el layout y el selector de idioma del bounded context shared. | 3 | Angulo Ramírez, Marcelo Martín | Done |
| — | Tareas técnicas de la Frontend Web Application | T022 | Vistas Home, About y Page Not Found | Implementar las vistas públicas, sus rutas y los value objects `DateTime` y `Url`. | 3 | Zavaleta Gutierrez, Rodolfo Martin | Done |
| — | Tareas técnicas de la Frontend Web Application | T023 | Footer con traducciones | Implementar el footer y mostrar el toolbar en todas las vistas públicas. | 2 | Zavaleta Gutierrez, Rodolfo Martin | Done |
| — | Tareas técnicas de la Frontend Web Application | T024 | Entidad Batch y Fake API | Crear la entidad `Batch` del bounded context manufacturing y el `db.json` inicial para json-server. | 2 | Zavaleta Gutierrez, Rodolfo Martin | In-Process |

#### 5.2.2.4. Development Evidence for Sprint Review

Hasta el momento, en el repositorio `IngesCompany-Frontend` se configuró el proyecto Angular (i18n, Angular Material y environments) y se implementaron los componentes compartidos (toolbar, layout, selector de idioma, footer) y las vistas Home, About y Page Not Found, siguiendo GitFlow con las ramas `feature/project-configuration`, `feature/shared` y `feature/manufacturing`. Además, se inició el bounded context manufacturing con la entidad `Batch` y la Fake API. La siguiente tabla presenta los commits del repositorio:

| Repository | Branch | Commit Id | Commit Message | Commit Message Body | Committed on (Date) |
|------------|--------|-----------|----------------|---------------------|---------------------|
| IngesCompany-7742/IngesCompany-Frontend | develop | `16247a9` | chore: initial commit | Creación del proyecto Angular. | 29/09/2026 |
| IngesCompany-7742/IngesCompany-Frontend | develop | `58f3404` | chore: add git ignore | Configuración de archivos ignorados por Git. | 29/09/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/project-configuration | `89336d3` | feat(i18n): add i18n support for English and Spanish translation | Configuración de ngx-translate con los archivos de traducción ES/EN. | 29/09/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/project-configuration | `84282bf` | feat(ui): add Material Design UI Library | Instalación y configuración de Angular Material. | 29/09/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/project-configuration | `cb6376e` | feat(environment): add Environment configuration for development and production modes | Configuración de los environments de desarrollo y producción. | 29/09/2026 |
| IngesCompany-7742/IngesCompany-Frontend | develop | `3ea5890` | Merge branch 'feature/project-configuration' into develop | Integración de la configuración del proyecto en `develop`. | 29/09/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/shared | `b066a80` | feat(home): add Home view with title and content, including route definition and style | Vista Home con su ruta y estilos. | 29/09/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/shared | `6d386d5` | feat(home): add DateTime and URL value objects for handing dates and URLs | Value objects `DateTime` y `Url` del bounded context shared. | 29/09/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/shared | `574db0d` | feat(base-entity): add BaseEntity interface for domain entities with UUID identifier | Interfaz `BaseEntity` para las entidades de dominio. | 29/09/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/shared | `b1906c4` | feat(toolbar): add responsive toolbar component | Toolbar responsive de la aplicación. | 29/09/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/shared | `c701062` | feat(layout): add layout component | Componente de layout general. | 29/09/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/shared | `f5ed375` | feat(language-switcher): add language switcher component for UI language selection | Selector de idioma de la interfaz. | 29/09/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/shared | `c0bcedc` | feat(about): add About page with layout, styles, and content for product overview | Vista About con la descripción del producto. | 29/09/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/shared | `78a850c` | feat(page-not-found): add Page Not Found component with template and navigation | Vista Page Not Found con navegación de retorno. | 29/09/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/shared | `9df65b3` | chore(index): update index.html structure for semantic consistency | Ajuste semántico de `index.html`. | 29/09/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/shared | `8ebbec3` | style(layout): add tittle | Título del layout. | 29/09/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/shared | `9840b0b` | feat(routes): add the route definition of the view About and PageNotFound | Rutas de las vistas About y Page Not Found. | 29/09/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/shared | `485f392` | feat(footer): add footer component and translation | Footer con sus traducciones. | 30/09/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/shared | `46a135e` | fix(layout): render toolbar globally across public views and add translations | Toolbar visible en todas las vistas públicas. | 30/09/2026 |
| IngesCompany-7742/IngesCompany-Frontend | develop | `e7ec1ba` | Merge branch 'feature/shared' into develop | Integración de los componentes compartidos en `develop`. | 05/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/manufacturing | `c5951a6` | feat(database): add initial db.json with vaccine batch data | Datos iniciales de lotes para la Fake API. | 05/10/2026 |
| IngesCompany-7742/IngesCompany-Frontend | feature/manufacturing | `dd30869` | feat(batch): add Batch entity to represent product batches | Entidad `Batch` del bounded context manufacturing. | 05/10/2026 |

#### 5.2.2.5. Execution Evidence for Sprint Review

Al momento, la Frontend Web Application cuenta con la estructura base del proyecto Angular, el toolbar con navegación y selector de idioma ES/EN, el footer y las vistas Home, About y Page Not Found. Las vistas de gestión de lotes, registro de desviaciones y dashboards de calidad y producción se encuentran en implementación y se presentarán al cierre del Sprint 2.

#### 5.2.2.6. Services Documentation Evidence for Sprint Review

En el Sprint 2 no se implementaron RESTful Web Services, por lo que aún no hay endpoints documentados con OpenAPI. En `IngesCompany-Frontend` se inició la Fake API con json-server (`src/server/db.json`), que se usará para consumir los recursos de lotes mediante HTTP mientras se implementan los Web Services. La documentación con OpenAPI se elaborará en el Sprint 3, junto con la implementación de los endpoints en Spring Boot.

#### 5.2.2.7. Software Deployment Evidence for Sprint Review

En el Sprint 2, la Landing Page se mantuvo publicada en GitHub Pages. La Web Application se ejecuta y valida localmente con `ng serve` durante el sprint; su publicación en Firebase Hosting, según los pasos descritos en la sección 5.1.4, se realizará al cierre del Sprint 2.

#### 5.2.2.8. Team Collaboration Insights during Sprint

La implementación del Sprint 2 se realiza en el repositorio `IngesCompany-Frontend` siguiendo GitFlow. Hasta el momento, Rodolfo Zavaleta configuró el proyecto e implementó las vistas públicas y el footer; Marcelo Angulo implementó el toolbar, el layout, el selector de idioma y las vistas About y Page Not Found; y Yhoshua Cobades ajustó el layout, trabajando en feature branches integradas en `develop`.

Las capturas necesarias y obligatorias se subirán al final del sprint 2.

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
