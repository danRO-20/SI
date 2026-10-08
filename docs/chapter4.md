# Capítulo IV: Product Design

En este capítulo se presenta el diseño de DoofPlus a partir de las User Stories y el Impact Map del capítulo III: las guías de estilo, la arquitectura de información, el diseño de la Landing Page y de la Web Application, la arquitectura de software orientada al dominio, el diseño orientado a objetos y el diseño de la base de datos. Las decisiones responden a las exigencias de los laboratorios farmacéuticos y de la DIGEMID sobre la calidad, la trazabilidad y la integridad de los registros.

## 4.1. Style Guidelines

En esta sección se establecen las bases visuales y de comunicación para DoofPlus, centralizando los recursos que serán de uso común para todo el equipo de desarrollo y diseño. El objetivo es garantizar una presentación consistente, inclusiva y enfocada a través de todos los puntos de contacto del producto, facilitando la mantenibilidad y escalabilidad del código y del diseño a lo largo del ciclo de vida del proyecto.

### 4.1.1. General Style Guidelines

Para asegurar una interfaz coherente y alineada con los estándares que exige la industria farmacéutica, el sistema de diseño de DoofPlus toma como base **Material Design**, el lenguaje de diseño indicado para el proyecto. En la Web Application se implementa con **Angular CLI** usando un tema basado en **Material Design**, y en la Landing Page con ***HTML5*** y ***CSS3*** respetando los mismos tokens de color, tipografía y espaciado.

#### Branding:
El logotipo escogido para DoofPlus comunica de forma directa y sintética la propuesta de valor del sistema: la integración de la automatización industrial con la rigurosidad del control farmacéutico. Para la sección de Branding, el análisis de los componentes de dicho logotipo se desglosa de la siguiente manera:

<p align="center">
  <img src="../assets/img/chapter4/doofplus-logo.png" alt="DoofPlus Logo" width="350px" />
</p>

- **Maquinaria y cinta transportadora:** la silueta industrial con cápsulas en la cinta representa el núcleo operativo de la plataforma: la manufactura y la conexión IoT en la línea de producción.
- **Escudo de verificación:** representa el aseguramiento de la calidad y transmite protección de los datos y cumplimiento de las BPM exigidas por DIGEMID.
- **Construcción tipográfica y cromática:** el nombre DoofPlus usa una fuente sans-serif sólida; “Doof” en azul pizarra oscuro evoca la base tecnológica y “Plus” en verde marino (#0D9488) conecta con la salud y la validación de procesos.

Para su uso en las interfaces se definieron dos versiones horizontales del logotipo: a color, para fondos claros (barra de navegación de la Landing Page y de la Web Application), y en blanco, para fondos oscuros (footer de la Landing Page y barras de color). Ambas se usan como componentes reutilizables en Figma.

| Versión a color (fondos claros) | Versión blanca (fondos oscuros) |
| :---: | :---: |
| <img src="../assets/img/chapter4/brand/doofplus-logo-horizontal-color.png" width="300"> | <img src="../assets/img/chapter4/brand/doofplus-logo-horizontal-white.png" width="300" style="background:#0F172A"> |

#### Typography
La tipografía de DoofPlus es Inter, una fuente sans-serif moderna y legible con pesos de Thin a Black y sus versiones itálicas. Su diseño garantiza una lectura clara de datos numéricos críticos, tablas de lotes y gráficos de telemetría tanto en monitores como en dispositivos móviles. La jerarquía tipográfica es la siguiente:

![Typography](../assets/img/chapter4/typography-guide.png)

| **Elemento** | **Tamaño (desktop)** | **Peso** | **Uso** |
| --- | --- | --- | --- |
| H1 – Título principal | 3rem (48 px), interlineado 1.1 | Semi Bold (600) | Título del hero de la Landing Page |
| H2 – Título de sección o pantalla | 2rem (32 px), interlineado 1.2 | Semi Bold (600) | Secciones de la Landing Page y títulos de pantalla |
| H3 – Título de tarjeta | 1.5rem (24 px), interlineado 1.3 | Semi Bold (600) | Tarjetas, paneles y diálogos |
| Body | 1rem (16 px), interlineado 1.45 | Regular (400) | Párrafos y tablas de datos |
| Label | 0.875rem (14 px) | Medium (500) | Etiquetas de formulario, botones y estados |
| Metadata | 0.75rem (12 px) | Regular (400) | Fechas, identificadores y notas |

#### Colors
La paleta de colores de DoofPlus está diseñada para evocar pulcritud clínica, seguridad tecnológica y control sobre los procesos. Se distribuye en cuatro categorías; los colores funcionales se acompañan siempre de un ícono y de un texto, de modo que el estado nunca se comunica solo con color:

| **Token** | **Valor** | **Categoría** | **Uso** |
| --- | --- | --- | --- |
| --primary-color | #0F766E (verde azulado) | Principal | Botones y acciones principales (texto blanco) |
| --accent-color | #0D9488 (verde marino) | Principal | Hover, anillos de foco y detalles decorativos |
| --secondary-color | #0F172A (azul pizarra oscuro) | Principal | Títulos, texto principal y barras oscuras |
| --tertiary-color | #64748B (gris pizarra) | Soporte | Texto secundario y placeholders |
| --bg-light | #F8FAFC | Soporte | Fondo de la aplicación y de secciones |
| --bg-highlight | #F0FDFA | Soporte | Paneles destacados |
| --card-bg | #FFFFFF | Soporte | Tarjetas, tablas y diálogos |
| --border-color | #E2E8F0 | Soporte | Bordes de 1 px |
| --success-color | #4CAF50 (texto #25632A sobre #EDF7ED) | Funcional | Confirmaciones, lotes liberados, controles aprobados |
| --warning-color | #FFC107 (texto #805700 sobre #FFF8DE) | Funcional | Advertencias, cuarentena y pendientes |
| --error-color | #F44336 (texto #B42318 sobre #FFF0EE) | Funcional | Errores, rechazos, OOS y bloqueos |
| --qa-color | #0F766E | Entorno | Identifica el entorno QA/QC en el inicio de sesión |
| --production-color | #1E40AF | Entorno | Identifica el entorno de Producción |
| --admin-color | #334155 | Entorno | Identifica el entorno de Administración |

![paleta-colores](../assets/img/chapter4/color-palette.png)

#### Spacing

El espaciado se rige por la cuadrícula de 8 puntos de Material Design, que asegura un ritmo vertical constante y facilita la lectura rápida de reportes técnicos:

- **Márgenes:** 64 px en las páginas públicas (Landing Page e inicio de sesión) y 32 px como margen interior del área de trabajo de la Web Application.
- **Espacio entre elementos:** 24 px de separación (gutter) entre columnas y tarjetas, y 16 px de padding interno en los elementos.
- **Geometría:** radio de 8 px en controles, 16 px en tarjetas y forma de píldora en botones de la Landing Page; bordes de 1 px (#E2E8F0).
- **Área táctil mínima:** 48 x 48 px en botones y controles, especialmente en mobile.

#### Tono de Comunicación

La voz y el tono de DoofPlus están diseñados para reflejar la misma fiabilidad e inmutabilidad que su arquitectura de software, conectando directamente con Supervisores de Producción, Especialistas QA/QC y auditores externos.

- ***Tono:*** Formal, corporativo y analítico. Proyecta dominio absoluto sobre las normativas de calidad (BPM, Data Integrity), manteniendo el rigor que exige la industria farmacéutica.
- ***Actitud:*** Resolutiva y proactiva. La comunicación se enfoca en la eficiencia operativa (“Trazabilidad automatizada”, “Monitoreo en tiempo real”) y en la alerta temprana de desviaciones.
- ***Lenguaje:*** Técnico y preciso. Se utiliza terminología propia del dominio farmacéutico y tecnológico (telemetría, IoT, Cuarentena, Fórmulas Maestras, Audit Trail, DIGEMID) asumiendo que el usuario es un profesional capacitado en estas áreas.
- ***Voz:*** Experta e inquebrantable. Posiciona a DoofPlus como el puente definitivo entre la maquinaria industrial y el cumplimiento normativo, siendo una fuente de verdad única y segura para las auditorías.

### 4.1.2. Web Style Guidelines

Las directrices de estilo web de DoofPlus explican e ilustran las decisiones sobre los estándares visuales y de interacción para las interfaces web responsivas de la plataforma. Nuestro objetivo es crear una experiencia visual que refleje la misión del sistema: digitalizar el control de calidad farmacéutico y la telemetría industrial mediante un diseño limpio, riguroso y altamente funcional, minimizando la carga cognitiva en la planta de producción.

1. Layout
- Sistema de Grid: Utilizamos un diseño de cuadrícula fluida de 12 columnas para garantizar que el contenido de DoofPlus se adapte perfectamente a cualquier resolución de pantalla. Este enfoque permite que los dashboards de telemetría, las tablas de trazabilidad de lotes y los planes de suscripción se ajusten dinámicamente, manteniendo la jerarquía visual requerida en un entorno industrial.
- Headers y Footers (encabezados y pies de página): El encabezado es fijo en la parte superior, proporcionando acceso constante a la navegación principal, alertas de desviaciones críticas y a las acciones de sesión. El pie de página centraliza los enlaces normativos, políticas de privacidad, términos de servicio, copyright y contacto de soporte.
- Cards y Data Tables: Las tarjetas (Cards) estructuran la información de los módulos del sistema (IoT, Compliance, Auditorías) en la Landing Page. Para la aplicación web, el componente central son las Tablas de Datos (Data Tables), diseñadas con bordes sutiles y alternancia de color (Zebra striping) para facilitar la lectura de expedientes de lotes y registros inmutables (Audit Trail) sin fatiga visual.

2. Responsive Design
- Desktop: Orientado al Jefe de Producción y al Administrador. La navegación principal es visible en una barra lateral o superior. El contenido aprovecha múltiples columnas para desplegar gráficos unificados de rendimiento y tablas complejas de fórmulas maestras en monitores de estaciones de trabajo.
- Tablet: Orientado al Especialista QA/QC en la línea de producción. La cuadrícula se adapta a un diseño compacto. Los botones, selectores de estado y campos táctiles se ajustan a un área mínima de 48x48 píxeles para facilitar la interacción de operarios que utilicen guantes de nitrilo o equipos de protección.
- Mobile: Optimizado para la lectura rápida y atención de emergencias. El diseño colapsa a una sola columna y la navegación se agrupa en un menú hamburguesa. Los elementos interactivos priorizan la visualización de notificaciones de urgencia.

3. Interaction Design
- Botones: las llamadas a la acción (CTA) usan el color primario (#0F766E) con texto blanco; las acciones secundarias usan botones outlined. Los estados hover, focus (con contorno visible para teclado), active y disabled están definidos para asegurar la accesibilidad. Las acciones destructivas o de rechazo de lotes usan el color de error y piden confirmación.
- Formularios y Validaciones: Los formularios marcan los campos obligatorios con un asterisco y validan los datos antes del envío. Ante un error, el campo se resalta con el color de error, se muestra un mensaje descriptivo debajo y un aviso general en la parte superior del formulario, conservando los datos ingresados.
- Selector de idioma: componente EN/ES (mat-button-toggle-group) visible en todas las pantallas públicas y autenticadas; inglés (en-US) es el idioma por defecto.

4. Images and Icons
- Imágenes: En la Landing Page se utilizan fotografías de alta calidad, optimizadas en formato WebP, que evocan el entorno de manufactura: líneas de producción automatizadas, laboratorios esterilizados y operarios utilizando tablets. Refuerzan el mensaje de tecnología aplicada al cumplimiento BPM.
- Íconos: Se emplea la biblioteca Material Symbols (variante Rounded) para un estilo lineal y minimalista. Estos íconos ofrecen una guía visual rápida para representar servicios críticos: un microchip o antena para la telemetría, un escudo con un símbolo de check para el cumplimiento regulatorio y cápsulas o maquinaria para la gestión de producción.

5. Repositorio Central
- Organización: el proyecto de la Web Application en Angular se organiza por bounded context dentro de `src/app`: `iam`, `organizations`, `subscriptions`, `manufacturing`, `iot-monitoring` y `quality`, cada uno con las capas `domain`, `application`, `infrastructure` y `presentation`. Los elementos comunes (layout, toolbar, footer, selector de idioma y cliente REST base) se ubican en `src/app/shared`; los estilos globales y los design tokens de color, tipografía y espaciado, en `src/styles.css`; las imágenes e íconos, en `public/images`, y las traducciones, en `public/i18n` (`en.json`, idioma por defecto, y `es.json`). La Landing Page aplica los mismos tokens en su hoja de estilos.
- Versionado: Se utiliza Git gestionado desde GitHub como sistema de control de versiones central. El equipo aplica GitFlow y Conventional Commits para gestionar los cambios en el código, lo que ayuda a garantizar que el entorno de desarrollo mantenga una integración continua y una versión estable del producto en todo momento. Además, se aplica Semantic Versioning para darle un orden a las versiones.


## 4.2. Information Architecture

La arquitectura de la información de DoofPlus establece las decisiones que dirigen la organización del contenido en las experiencias web, lo que está orientado a que tanto los visitantes del sector comercial como los usuarios operativos, que forman parte de los segmentos objetivos, se adapten con facilidad a la funcionalidad del producto y puedan encontrar lo que necesitan sin esfuerzo.

### 4.2.1. Organization Systems

Para estructurar los grupos de información de la plataforma se aplican los siguientes sistemas de organización y esquemas de categorización:

- **Organización jerárquica (visual hierarchy):** en la Landing Page el contenido va de mayor a menor impacto: propuesta de valor (Home), acceso por segmento (Get Started), servicios, características, video, beneficios, planes, testimonios, preguntas frecuentes, contacto y, al final, la startup y su equipo.
- **Organización secuencial (step-by-step):** en el ingreso a la Web Application (elección del entorno → inicio de sesión → 2FA) y en los flujos regulados, como la recepción de materias primas (recepción → muestreo → inspección → aprobado o rechazado) y la liberación de un lote (cuarentena → evaluación de resultados → firma electrónica).
- **Organización matricial:** en los dashboards, que cruzan lotes, variables de equipos e indicadores de cumplimiento.
- **Categorización cronológica:** en el audit trail, la línea de tiempo del lote y la telemetría IoT, ordenados por fecha y hora.
- **Categorización por tópicos:** en el repositorio documental (protocolos, SOP, especificaciones) y en la navegación por módulos.
- **Categorización por audiencia:** en la Landing Page (llamadas a la acción para QA/QC y para Producción) y en la Web Application (entornos de calidad y de producción según el rol).

### 4.2.2. Labeling Systems

Para asegurar la simplicidad y evitar la confusión de los visitantes y usuarios, la representación de los datos se realiza mediante etiquetas que utilizan el mínimo número de palabras posibles, lo que representa la terminología técnica de la industria farmacéutica:

- Landing Page: las etiquetas de la barra de navegación usan asociaciones estándar de una o dos palabras: "Home", "Features" (módulos técnicos), "Benefits", "Plans" (planes y precios) y "About Us", además de "Sign in" (inicio de sesión) y "Get Started" (acceso por segmento). En español latinoamericano se muestran como "Inicio", "Características", "Beneficios", "Planes", "Nosotros", "Iniciar sesión" y "Comenzar".
- Web Application: las etiquetas operativas siguen el Ubiquitous Language de la sección 2.5 y se definen en inglés, idioma por defecto, con su traducción al español: "Batches" (Lotes) agrupa el historial de fabricación, "Raw materials" (Materias primas) la recepción y cuarentena de insumos, "Deviations" y "CAPA plans" (Desviaciones y planes CAPA) las incidencias y su corrección, y "Audit trail" (registro de auditoría) el registro inmutable de cambios. Los estados que se muestran en pantalla son los definidos en el modelo de dominio (por ejemplo, Planned, In progress, On hold, Release requested, Released y Rejected para los lotes).

### 4.2.3. SEO Tags and Meta Tags

Para el posicionamiento y la indexación correcta de las principales páginas de la experiencia web, se asignan los siguientes valores mínimos exigidos:

Valores para la Landing Page (sitio estático indexable):

| **Página** | **Title** | **Meta description** | **Meta keywords** | **Author** |
| --- | --- | --- | --- | --- |
| Landing Page (index.html) | DoofPlus \| Pharmaceutical Quality & Batch Traceability Platform | SaaS platform that centralizes quality documentation, batch traceability, deviations and IoT data for pharmaceutical laboratories (GMP/DIGEMID). | pharmaceutical quality management, batch traceability, GMP, DIGEMID, CAPA, audit trail, IoT | IngesCompany |
| Contact us (contact.html) | Contact us \| DoofPlus | Send your questions about DoofPlus and its plans to the IngesCompany team. | DoofPlus contact, pharmaceutical quality software, GMP software Peru | IngesCompany |

Valores para las vistas principales de la Web Application. Al ser una SPA, el título se actualiza en cada cambio de ruta con la propiedad `title` de las rutas de Angular Router y la descripción con el servicio `Meta` de Angular; keywords y author se definen una vez en `index.html` con los mismos valores de la Landing Page:

| **Vista de la Web Application** | **Title** | **Meta description** |
| --- | --- | --- |
| Choose your environment | Sign in \| DoofPlus | Choose the QA/QC, Production or Administration environment of DoofPlus. |
| Sign in (por entorno) | Sign in to {environment} \| DoofPlus | Secure access to DoofPlus with two-factor authentication. |
| Quality dashboard | Quality Dashboard \| DoofPlus | Pending batches, open deviations and quality indicators. |
| Production dashboard | Production Console \| DoofPlus | Active production orders, batch status and alerts. |
| Batch detail | Batch {batchNumber} \| DoofPlus | Complete traceability timeline of a pharmaceutical batch. |
| Deviations & CAPA | Deviations & CAPA \| DoofPlus | Register, investigate and close deviations with CAPA. |

### 4.2.4. Searching Systems

Para que los usuarios no se pierdan en el volumen de información generado por la producción y la telemetría, la Web Application ofrece:

- **Búsqueda global:** barra en el encabezado para consultar por identificador exacto (número de lote, código de documento o de sensor).
- **Filtros combinados:** por estado del lote (Planned, In progress, On hold, Release requested, Released, Rejected), rango de fechas de fabricación, severidad de la desviación (Minor, Major, Critical) y tipo de documento.
- **Presentación de resultados:** tabla de datos de Angular Material (`mat-table` con `MatPaginator` y `MatSort`) paginada y ordenable que resalta la coincidencia y muestra el estado actual de cada registro; si no hay resultados se muestra un mensaje con sugerencias.

### 4.2.5. Navigation Systems

Las acciones y técnicas que guían a los usuarios son:

1. ***Landing Page:***
- **Navegación por anclas:** barra superior fija con enlaces a cada sección y desplazamiento suave; en mobile, menú hamburguesa que se abre como overlay.
- **Llamadas a la acción por segmento:** la sección "Get Started" ofrece una tarjeta por segmento; cada una lleva directamente al inicio de sesión de su entorno en la Web Application (QA/QC o Producción). El enlace "Sign in" de la barra lleva a la elección de entorno, y "Register your laboratory" al registro de la organización.
- **Páginas secundarias:** "Contact us" (formulario de consultas), "Terms of Service" y "Privacy Policy", enlazadas desde el footer.

2. ***Web Application:***
- **Ingreso por entorno:** la elección de entorno (QA/QC, Production o Administration) precede al inicio de sesión; cada entorno se reconoce por su color, ícono y módulos.
- **Navegación global:** barra lateral (sidebar) con los módulos del entorno. QA/QC: Quality overview, Quality indicators, Quality documents, Deviations, CAPA plans, Batch release, Analytical results, Audits, Audit trail, Regulatory reports y Tasks & collaboration. Production: Production overview, Production orders, Products & formulas, Batches, Raw materials, Equipment & sensors, Incidents y Tasks & collaboration. Administration: Administration overview, Users & profiles, Organizations, Subscriptions & payments, Audit trail y Tasks & collaboration.
- **Barra superior:** búsqueda global, selector de idioma y avatar del usuario, que abre "Profile & preferences".
- **Navegación contextual:** breadcrumbs para ubicar al usuario dentro de un expediente y regresar a vistas generales.

3. **Navegación por teclado y accesibilidad:** orden de tabulación lógico, foco visible y atributos ARIA en menús y diálogos.

## 4.3. Landing Page UI Design

La propuesta de UI de la Landing Page traduce las decisiones de las secciones anteriores: la jerarquía visual ordena el contenido desde la propuesta de valor hasta la presentación de la startup; las etiquetas (Home, Features, Benefits, Plans, About Us) siguen el Labeling System; la barra fija con anclas, las llamadas a la acción por segmento y el enlace "Sign in" implementan el Navigation System; y el Design System de la sección 4.1 (Inter, verde azulado #0F766E, azul pizarra #0F172A y Material Symbols Rounded) se aplica de forma consistente con la Web Application. La Landing Page atiende las user stories US01 a US05 y US44 a US49.

Las secciones se presentan en el siguiente orden, que prioriza la información que el visitante necesita para decidir (qué es DoofPlus, qué ofrece y cuánto cuesta) antes que la presentación del equipo:

| N.° | Sección | Contenido | User stories |
| --- | --- | --- | --- |
| 1 | Home | Propuesta de valor, botón "Get Started" y enlace "View plans" | US01 |
| 2 | Get Started | Una tarjeta por segmento con acceso al inicio de sesión de su entorno y el enlace "Register your laboratory" | US48, US50 |
| 3 | Services | Cuatro servicios principales con ícono y descripción | US02 |
| 4 | Features | Acordeón con las funcionalidades clave | US02 |
| 5 | About the product (video) | Video promocional embebido | US49 |
| 6 | Benefits | Beneficios medibles para el laboratorio | US02 |
| 7 | Plans | Planes Standard Lab y Enterprise con selector mensual/anual | US03, US51 |
| 8 | Testimonials | Opiniones de clientes | US01 |
| 9 | FAQ | Preguntas frecuentes en acordeón | US05 |
| 10 | Contact | Banda de llamada a la acción "Contact us" | US04 |
| 11 | About Us | Misión y visión de IngesCompany | US45 |
| 12 | Our Team | Integrantes del equipo | US45 |
| 13 | Footer | Logotipo blanco, enlaces, contacto, términos, privacidad y selector de idioma | US46, US47 |

### 4.3.1. Landing Page Wireframe

Los wireframes son de baja fidelidad: los textos se representan con barras, las imágenes con un recuadro cruzado y los íconos con círculos; solo se conservan los títulos y las etiquetas de los botones, que definen la estructura. Así se valida la disposición y el flujo de la información sin decidir aún colores ni contenido final.

**Desktop Web Browser (1440 px)**

**Navigation y Home:** barra superior fija con el logotipo, los enlaces a las secciones, "Sign in" y "Get Started". Debajo, el título de la propuesta de valor, un párrafo breve, los dos botones y una imagen del producto a la derecha.

![Landing Page Wireframe · Home](../assets/img/chapter4/landing-page/wireframes/desktop/01-home.png)

**Get Started:** dos tarjetas, una por segmento (QA/QC y Production), cada una con su descripción y su botón de acceso; debajo, el enlace para registrar un laboratorio nuevo.

![Landing Page Wireframe · Get Started](../assets/img/chapter4/landing-page/wireframes/desktop/02-get-started.png)

**Services:** cuatro tarjetas en una fila, cada una con ícono, título y descripción.

![Landing Page Wireframe · Services](../assets/img/chapter4/landing-page/wireframes/desktop/03-services.png)

**Features:** imagen a la izquierda y acordeón a la derecha; solo un elemento permanece abierto a la vez.

![Landing Page Wireframe · Features](../assets/img/chapter4/landing-page/wireframes/desktop/04-features.png)

**About the product (video):** título, descripción y un reproductor de video centrado.

![Landing Page Wireframe · Video](../assets/img/chapter4/landing-page/wireframes/desktop/05-about-the-product-video.png)

**Benefits:** cuatro tarjetas con una cifra destacada y su explicación.

![Landing Page Wireframe · Benefits](../assets/img/chapter4/landing-page/wireframes/desktop/06-benefits.png)

**Plans:** selector mensual/anual y dos tarjetas de plan con precio, lista de características y botón de suscripción.

![Landing Page Wireframe · Plans](../assets/img/chapter4/landing-page/wireframes/desktop/07-plans.png)

**Testimonials:** tres tarjetas con cita, nombre y cargo.

![Landing Page Wireframe · Testimonials](../assets/img/chapter4/landing-page/wireframes/desktop/08-testimonials.png)

**FAQ:** lista de preguntas en acordeón.

![Landing Page Wireframe · FAQ](../assets/img/chapter4/landing-page/wireframes/desktop/09-faq.png)

**Contact:** banda horizontal con un mensaje y el botón "Contact us", que abre la página de contacto.

![Landing Page Wireframe · Contact](../assets/img/chapter4/landing-page/wireframes/desktop/10-contact.png)

**About Us:** texto de misión y visión junto a una imagen.

![Landing Page Wireframe · About Us](../assets/img/chapter4/landing-page/wireframes/desktop/11-about-us.png)

**Our Team:** cuadrícula de tarjetas con foto, nombre y rol.

![Landing Page Wireframe · Our Team](../assets/img/chapter4/landing-page/wireframes/desktop/12-our-team.png)

**Footer:** logotipo, columnas de enlaces (producto, empresa y legal), datos de contacto, derechos de autor y selector de idioma.

![Landing Page Wireframe · Footer](../assets/img/chapter4/landing-page/wireframes/desktop/13-footer.png)

**Páginas secundarias (Desktop):** la página "Contact us" contiene el formulario de consultas (nombre, correo y consulta); si el correo es inválido o la consulta está vacía, se muestra el estado "Invalid data" con los campos resaltados; si el envío es correcto, se muestra "Message sent". El footer enlaza además "Terms of Service" y "Privacy Policy".

| Contact us | Contact us · Invalid data | Message sent |
| :---: | :---: | :---: |
| ![Contact us](../assets/img/chapter4/landing-page/wireframes/pages/landing-desktop-contact-us.png) | ![Contact us · Invalid data](../assets/img/chapter4/landing-page/wireframes/pages/landing-desktop-contact-us-invalid-data.png) | ![Message sent](../assets/img/chapter4/landing-page/wireframes/pages/landing-desktop-message-sent.png) |

| Terms of Service | Privacy Policy |
| :---: | :---: |
| ![Terms of Service](../assets/img/chapter4/landing-page/wireframes/pages/landing-desktop-terms-of-service.png) | ![Privacy Policy](../assets/img/chapter4/landing-page/wireframes/pages/landing-desktop-privacy-policy.png) |

**Mobile Web Browser (390 px)**

En mobile las mismas secciones se apilan en una sola columna, en el mismo orden; las tarjetas ocupan todo el ancho y la navegación se agrupa en un menú hamburguesa que se abre como overlay.

![Landing Page Wireframe · Mobile (1)](../assets/img/chapter4/landing-page/wireframes/mobile/mobile-montage-1.png)

![Landing Page Wireframe · Mobile (2)](../assets/img/chapter4/landing-page/wireframes/mobile/mobile-montage-2.png)

![Landing Page Wireframe · Mobile (3)](../assets/img/chapter4/landing-page/wireframes/mobile/mobile-montage-3.png)

| Menu open | Contact us | Contact us · Invalid data | Message sent |
| :---: | :---: | :---: | :---: |
| ![Menu open](../assets/img/chapter4/landing-page/wireframes/pages/landing-mobile-menu-open.png) | ![Contact us](../assets/img/chapter4/landing-page/wireframes/pages/landing-mobile-contact-us.png) | ![Invalid data](../assets/img/chapter4/landing-page/wireframes/pages/landing-mobile-contact-us-invalid-data.png) | ![Message sent](../assets/img/chapter4/landing-page/wireframes/pages/landing-mobile-message-sent.png) |

### 4.3.2. Landing Page Mock-up

Los mock-ups aplican sobre los wireframes el Design System de la sección 4.1 y se presentan en inglés (en-US), idioma por defecto; el selector "EN / ES" de la barra de navegación cambia todos los textos al español latinoamericano (es-419). Se aplican además criterios de diseño inclusivo: contraste alto entre texto y fondo, botones con texto explícito, estados que no dependen solo del color y áreas táctiles de 48 px.

**Desktop Web Browser (1440 px)**

**Navigation y Home:** la barra blanca muestra el logotipo a color, los enlaces Home, Features, Benefits, Plans y About Us, el selector de idioma, "Sign in" y el botón "Get Started". El hero presenta el título "The future of pharmaceutical quality management", una descripción breve, el botón "Get Started" (desplaza a la sección del mismo nombre) y "View plans" (desplaza a Plans).

![Landing Page Mock-up · Home](../assets/img/chapter4/landing-page/mockups/desktop/01-home.png)

**Get Started:** cada segmento tiene su tarjeta: "QA/QC Specialist" lleva al inicio de sesión del entorno QA/QC y "Production Supervisor" al del entorno de Producción. Los laboratorios que aún no usan DoofPlus encuentran el enlace "Register your laboratory", que abre el registro de la organización.

![Landing Page Mock-up · Get Started](../assets/img/chapter4/landing-page/mockups/desktop/02-get-started.png)

**Services:** "Real-time IoT monitoring", "Automated GMP compliance", "Immutable traceability" y "Digital batch management", cada uno con su ícono Material Symbols y una descripción breve.

![Landing Page Mock-up · Services](../assets/img/chapter4/landing-page/mockups/desktop/03-services.png)

**Features:** el acordeón presenta la integración de telemetría IoT, el motor de cumplimiento GMP, las alertas de desviación y el panel de indicadores; cada elemento se expande para mostrar su descripción.

![Landing Page Mock-up · Features](../assets/img/chapter4/landing-page/mockups/desktop/04-features.png)

**About the product (video):** el video promocional explica en pocos minutos cómo DoofPlus acompaña un lote desde la orden de producción hasta su liberación.

![Landing Page Mock-up · Video](../assets/img/chapter4/landing-page/mockups/desktop/05-about-the-product-video.png)

**Benefits:** cuatro tarjetas comunican los beneficios: menos tiempo de preparación de auditorías, registros sin transcripción manual, detección inmediata de desviaciones e infraestructura SaaS sin servidores propios.

![Landing Page Mock-up · Benefits](../assets/img/chapter4/landing-page/mockups/desktop/06-benefits.png)

**Plans:** se comparan Standard Lab (US$199 al mes; hasta 5 dispositivos IoT y 10 usuarios) y Enterprise (US$599 al mes; dispositivos y usuarios ilimitados, multi-sede). El selector "Monthly / Annual" muestra la modalidad anual (US$1,990 y US$5,990), equivalente a dos meses gratis. El botón de cada plan lleva al registro de la organización con el plan preseleccionado.

![Landing Page Mock-up · Plans](../assets/img/chapter4/landing-page/mockups/desktop/07-plans.png)

**Testimonials:** tres opiniones de profesionales de laboratorios farmacéuticos con su nombre y cargo.

![Landing Page Mock-up · Testimonials](../assets/img/chapter4/landing-page/mockups/desktop/08-testimonials.png)

**FAQ:** preguntas sobre cumplimiento normativo, integración IoT, planes y seguridad de los datos, en un acordeón.

![Landing Page Mock-up · FAQ](../assets/img/chapter4/landing-page/mockups/desktop/09-faq.png)

**Contact:** la banda invita a resolver dudas con el botón "Contact us", que abre la página del formulario de contacto.

![Landing Page Mock-up · Contact](../assets/img/chapter4/landing-page/mockups/desktop/10-contact.png)

**About Us:** presenta a IngesCompany, la startup detrás de DoofPlus, con su misión y su visión.

![Landing Page Mock-up · About Us](../assets/img/chapter4/landing-page/mockups/desktop/11-about-us.png)

**Our Team:** presenta a los integrantes de IngesCompany: Marcelo Angulo, Yhoshua Cobades, Ricardo Flores, Nestor Rojas y Rodolfo Zavaleta, con su foto, nombre y rol.

![Landing Page Mock-up · Our Team](../assets/img/chapter4/landing-page/mockups/desktop/12-our-team.png)

**Footer:** fondo azul pizarra con el logotipo blanco, los enlaces de producto y de empresa, los datos de contacto (doofplus.inges@gmail.com, +51 (1) 234-5678, Lima, Perú), los enlaces "Terms of Service" y "Privacy Policy", el copyright de IngesCompany y el selector de idioma.

![Landing Page Mock-up · Footer](../assets/img/chapter4/landing-page/mockups/desktop/13-footer.png)

**Páginas secundarias (Desktop):** "Contact us" registra la consulta del visitante (US04); ante datos inválidos muestra el aviso general y el error bajo cada campo, conservando lo ingresado; tras un envío correcto confirma la recepción en "Message sent". "Terms of Service" y "Privacy Policy" presentan las condiciones de uso y el tratamiento de datos personales (US47).

| Contact us | Contact us · Invalid data | Message sent |
| :---: | :---: | :---: |
| ![Contact us](../assets/img/chapter4/landing-page/mockups/pages/landing-desktop-contact-us.png) | ![Contact us · Invalid data](../assets/img/chapter4/landing-page/mockups/pages/landing-desktop-contact-us-invalid-data.png) | ![Message sent](../assets/img/chapter4/landing-page/mockups/pages/landing-desktop-message-sent.png) |

| Terms of Service | Privacy Policy |
| :---: | :---: |
| ![Terms of Service](../assets/img/chapter4/landing-page/mockups/pages/landing-desktop-terms-of-service.png) | ![Privacy Policy](../assets/img/chapter4/landing-page/mockups/pages/landing-desktop-privacy-policy.png) |

**Mobile Web Browser (390 px)**

La versión mobile mantiene el orden y el contenido de desktop en una sola columna. El menú hamburguesa abre un overlay con los enlaces de navegación, "Sign in", "Get Started" y el selector de idioma.

![Landing Page Mock-up · Mobile (1)](../assets/img/chapter4/landing-page/mockups/mobile/mobile-montage-1.png)

![Landing Page Mock-up · Mobile (2)](../assets/img/chapter4/landing-page/mockups/mobile/mobile-montage-2.png)

![Landing Page Mock-up · Mobile (3)](../assets/img/chapter4/landing-page/mockups/mobile/mobile-montage-3.png)

| Menu open | Contact us | Contact us · Invalid data | Message sent |
| :---: | :---: | :---: | :---: |
| ![Menu open](../assets/img/chapter4/landing-page/mockups/pages/landing-mobile-menu-open.png) | ![Contact us](../assets/img/chapter4/landing-page/mockups/pages/landing-mobile-contact-us.png) | ![Invalid data](../assets/img/chapter4/landing-page/mockups/pages/landing-mobile-contact-us-invalid-data.png) | ![Message sent](../assets/img/chapter4/landing-page/mockups/pages/landing-mobile-message-sent.png) |

## 4.4. Web Applications UX/UI Design

Esta sección describe el diseño de experiencia (UX) e interfaz (UI) de la Web Application de DoofPlus. La aplicación se organiza en tres entornos, cada uno con su propio inicio de sesión, color y módulos: **QA/QC** (segmento 1, especialista de aseguramiento y control de calidad, persona María México), **Production** (segmento 2, jefe o supervisor de producción, persona Alberto Valle) y **Administration** (administrador del laboratorio, que registra la organización, invita a los usuarios y gestiona la suscripción). Los datos de ejemplo corresponden a un mismo caso: Laboratorios Andinos S.A.C., el lote B-26041 de Paracetamol 500 mg y la excursión de temperatura del sensor T-204 que origina la desviación DEV-26017, de modo que las pantallas de ambos segmentos cuentan una historia coherente.

Todas las pantallas comparten la misma estructura, derivada de la arquitectura de información de la sección 4.2: un sidebar con el logotipo, el entorno activo y sus módulos (navegación global); una barra superior con la búsqueda global, el selector de idioma y el avatar del usuario; y un área de contenido que ubica arriba los indicadores y abajo las tablas de detalle. Las acciones críticas, como aprobar, liberar o rechazar, se confirman con firma electrónica (US08), y los estados se muestran con los valores del modelo de dominio.

### 4.4.1. Web Applications Wireframes

Los wireframes de baja fidelidad definen la distribución de cada pantalla antes del diseño visual. Se agrupan por segmento y se presentan en montajes, en el mismo orden que los mock-ups de la sección 4.4.3, donde se explica cada pantalla.

**Desktop Web Browser · Compartido: elección de entorno, registro de la organización y perfil**

Incluye "Sign in · Choose your environment", "Organization registration" con su estado "RUC already registered" y "Account · Profile & preferences".

![Web App Wireframes · Desktop · Shared](../assets/img/chapter4/web-application/wireframes/desktop-shared-environment-selection-onboarding-profile-montage-1.png)

**Desktop Web Browser · Segmento 1: Especialista QA/QC**

Incluye el inicio de sesión del entorno QA/QC con sus estados (credenciales inválidas, 2FA y acceso no autorizado) y los módulos Quality overview, Quality indicators, Quality documents, Analytical results, Deviation report & detail, CAPA plan, Batch release, Audits & findings, Audit trail, Regulatory reports y Tasks & collaboration.

![Web App Wireframes · Desktop · QA/QC (1)](../assets/img/chapter4/web-application/wireframes/desktop-segment-1-qa-qc-specialist-montage-1.png)

![Web App Wireframes · Desktop · QA/QC (2)](../assets/img/chapter4/web-application/wireframes/desktop-segment-1-qa-qc-specialist-montage-2.png)

![Web App Wireframes · Desktop · QA/QC (3)](../assets/img/chapter4/web-application/wireframes/desktop-segment-1-qa-qc-specialist-montage-3.png)

![Web App Wireframes · Desktop · QA/QC (4)](../assets/img/chapter4/web-application/wireframes/desktop-segment-1-qa-qc-specialist-montage-4.png)

![Web App Wireframes · Desktop · QA/QC (5)](../assets/img/chapter4/web-application/wireframes/desktop-segment-1-qa-qc-specialist-montage-5.png)

**Desktop Web Browser · Segmento 2: Jefe o Supervisor de Producción**

Incluye el inicio de sesión del entorno de Producción con sus estados y los módulos Production overview, Products & master formulas, Production order & master formula, Batches (y su estado "Batch not created"), Batch detail & traceability, Batch IoT evidence, Raw-material receipt, Equipment & IoT devices, IoT overview y Equipment & sensor detail.

![Web App Wireframes · Desktop · Production (1)](../assets/img/chapter4/web-application/wireframes/desktop-segment-2-production-supervisor-montage-1.png)

![Web App Wireframes · Desktop · Production (2)](../assets/img/chapter4/web-application/wireframes/desktop-segment-2-production-supervisor-montage-2.png)

![Web App Wireframes · Desktop · Production (3)](../assets/img/chapter4/web-application/wireframes/desktop-segment-2-production-supervisor-montage-3.png)

![Web App Wireframes · Desktop · Production (4)](../assets/img/chapter4/web-application/wireframes/desktop-segment-2-production-supervisor-montage-4.png)

**Desktop Web Browser · Administrador del laboratorio**

Incluye el inicio de sesión del entorno de Administración y los módulos Administration overview, Users & profiles, Invite user y Subscriptions & payments.

![Web App Wireframes · Desktop · Administration (1)](../assets/img/chapter4/web-application/wireframes/desktop-laboratory-administrator-montage-1.png)

![Web App Wireframes · Desktop · Administration (2)](../assets/img/chapter4/web-application/wireframes/desktop-laboratory-administrator-montage-2.png)

**Mobile Web Browser**

En mobile se priorizan las tareas que se realizan fuera del escritorio: la elección de entorno y el inicio de sesión, la bandeja de tareas, la revisión y firma de aprobaciones y la consulta de lotes para QA/QC, y el monitoreo IoT, la consulta de lotes y el reporte de incidencias desde planta para Producción.

![Web App Wireframes · Mobile · Shared](../assets/img/chapter4/web-application/wireframes/mobile-shared-environment-selection-montage-1.png)

![Web App Wireframes · Mobile · QA/QC (1)](../assets/img/chapter4/web-application/wireframes/mobile-segment-1-qa-qc-specialist-montage-1.png)

![Web App Wireframes · Mobile · QA/QC (2)](../assets/img/chapter4/web-application/wireframes/mobile-segment-1-qa-qc-specialist-montage-2.png)

![Web App Wireframes · Mobile · Production (1)](../assets/img/chapter4/web-application/wireframes/mobile-segment-2-production-supervisor-montage-1.png)

![Web App Wireframes · Mobile · Production (2)](../assets/img/chapter4/web-application/wireframes/mobile-segment-2-production-supervisor-montage-2.png)

![Web App Wireframes · Mobile · Administration](../assets/img/chapter4/web-application/wireframes/mobile-laboratory-administrator-montage-1.png)

### 4.4.2. Web Applications Wireflow Diagrams

Los Wireflow Diagrams combinan los wireframes con las acciones del usuario para representar la secuencia de pantallas que lo llevan a cumplir un objetivo. Para cada segmento se definieron seis user goals, basados en sus user stories. Cada diagrama muestra el user goal, la persona, el camino principal y los puntos de decisión que desvían el flujo hacia una pantalla de error o de bloqueo.

#### Segmento 1 – Especialista de Aseguramiento y Control de Calidad (QA/QC)

**User Goal QA-1:** Ingresar a DoofPlus y acceder al entorno QA/QC (US06, US07).

Como especialista QA/QC, quiero ingresar con mis credenciales y confirmar mi identidad para revisar mis pendientes de calidad. María México elige "Sign in" en la Landing Page, selecciona el entorno QA/QC, ingresa su correo y contraseña y confirma el código 2FA.

Flujo: Home → Choose your environment → Sign in · QA/QC → Two-factor authentication → Quality overview.

![Wireflow QA-1](../assets/img/chapter4/web-application/wireflows/wireflow-qa-1.png)

**User Goal QA-2:** Gestionar la documentación de calidad y sus protocolos (US09, US10, US12, US13, US42).

Como especialista QA/QC, quiero enviar a aprobación la nueva revisión de un documento controlado para mantenerlo vigente. María abre el documento, envía la revisión y sigue la tarea de aprobación.

Flujo: Quality overview → Quality documents → Tasks & collaboration.

![Wireflow QA-2](../assets/img/chapter4/web-application/wireflows/wireflow-qa-2.png)

**User Goal QA-3:** Registrar una desviación y gestionar su CAPA (US18, US19, US20, US21).

Como especialista QA/QC, quiero documentar la causa raíz de una desviación y crear su plan CAPA para controlar el riesgo de calidad. María abre DEV-26017, registra la causa raíz y crea el plan CAPA con responsables y fechas.

Flujo: Quality overview → Deviation report & detail → CAPA plan.

![Wireflow QA-3](../assets/img/chapter4/web-application/wireflows/wireflow-qa-3.png)

**User Goal QA-4:** Planificar una auditoría y reunir sus evidencias (US27, US28, US29, US59).

Como especialista QA/QC, quiero planificar una auditoría y generar su paquete de evidencias para responder a los inspectores. María planifica la auditoría, revisa el audit trail del alcance y genera el paquete de evidencias.

Flujo: Audits & findings → Audit trail → Regulatory reports.

![Wireflow QA-4](../assets/img/chapter4/web-application/wireflows/wireflow-qa-4.png)

**User Goal QA-5:** Registrar y validar resultados analíticos (US11).

Como especialista QA/QC, quiero registrar las variables de un ensayo y que el sistema calcule el resultado para respaldar la liberación del lote. El sistema aplica la fórmula del protocolo y compara el resultado con la especificación.

Flujo: Quality overview → Analytical results → Batch release.

![Wireflow QA-5](../assets/img/chapter4/web-application/wireflows/wireflow-qa-5.png)

**User Goal QA-6:** Revisar la trazabilidad completa de un lote y liberarlo (US27, US54).

Como especialista QA/QC, quiero revisar todos los eventos atribuidos de un lote antes de firmar su liberación. María revisa el audit trail del lote B-26041 y firma la liberación.

Flujo: Quality overview → Audit trail → Batch release.

![Wireflow QA-6](../assets/img/chapter4/web-application/wireflows/wireflow-qa-6.png)

#### Segmento 2 – Jefe o Supervisor de Producción Farmacéutica

**User Goal PR-1:** Ingresar a DoofPlus y acceder al entorno de Producción (US06, US07).

Como jefe de producción, quiero ingresar con mis credenciales y confirmar mi identidad para supervisar las órdenes activas. Alberto Valle elige "Sign in", selecciona el entorno de Producción, ingresa sus credenciales y confirma el código 2FA.

Flujo: Home → Choose your environment → Sign in · Production → Two-factor authentication → Production overview.

![Wireflow PR-1](../assets/img/chapter4/web-application/wireflows/wireflow-pr-1.png)

**User Goal PR-2:** Gestionar la ejecución de un lote y consultar su historial (US35, US36, US57, US14, US15, US16).

Como jefe de producción, quiero emitir la orden de producción de un producto con fórmula maestra aprobada y registrar su lote para seguir su ejecución.

Flujo: Products & master formulas → Production order & master formula → Batches → Batch detail & traceability.

![Wireflow PR-2](../assets/img/chapter4/web-application/wireflows/wireflow-pr-2.png)

**User Goal PR-3:** Monitorear equipos y condiciones ambientales (US23, US24, US25, US26, US37).

Como jefe de producción, quiero seguir una alerta IoT hasta el equipo y la evidencia del lote en proceso para actuar a tiempo. Alberto abre la alerta del equipo EQ-COAT-02 y luego la evidencia IoT del lote.

Flujo: IoT overview → Equipment & sensor detail → Batch IoT evidence.

![Wireflow PR-3](../assets/img/chapter4/web-application/wireflows/wireflow-pr-3.png)

**User Goal PR-4:** Reportar una incidencia de producción desde planta (US56, US22).

Como jefe de producción, quiero reportar una incidencia desde mi celular cuando recibo una alerta de equipo para que Calidad la evalúe.

Flujo (Mobile): Alert details → Incident reporting → Incident submitted.

![Wireflow PR-4](../assets/img/chapter4/web-application/wireflows/wireflow-pr-4.png)

**User Goal PR-5:** Trazar un lote para investigar un evento (US15, US17, US58).

Como jefe de producción, quiero revisar la genealogía de un lote y la recepción de sus insumos para verificar su disposición de calidad.

Flujo: Batches → Batch detail & traceability → Raw-material receipt.

![Wireflow PR-5](../assets/img/chapter4/web-application/wireflows/wireflow-pr-5.png)

**User Goal PR-6:** Revisar reportes e indicadores de producción (US32, US33).

Como jefe de producción, quiero revisar los indicadores de producción y el historial de un lote para tomar decisiones sobre la planta.

Flujo: Production overview → Batches → Batch detail & traceability.

![Wireflow PR-6](../assets/img/chapter4/web-application/wireflows/wireflow-pr-6.png)

### 4.4.3. Web Applications Mock-ups

Los mock-ups aplican el Design System de la sección 4.1 sobre los wireframes y se presentan en inglés (en-US), idioma por defecto. Cada entorno se reconoce por su color: QA/QC en verde azulado (#0F766E), Production en azul (#1E40AF) y Administration en azul pizarra (#334155). A continuación se presentan las pantallas Desktop por grupo, con su propósito y las user stories que atienden.

#### Compartido: elección de entorno, registro de la organización y perfil

**Sign in · Choose your environment:** se abre desde "Sign in" en la Landing Page. Presenta tres tarjetas, QA/QC, Production y Administration, cada una con su color, ícono y descripción; al elegir una se abre el inicio de sesión de ese entorno. Incluye el enlace "Register your laboratory" y "See plans" para quienes aún no tienen cuenta.

![Mock-up · Choose your environment](../assets/img/chapter4/web-application/mockups/desktop-shared-environment-selection-onboarding-profile/sign-in-choose-your-environment.png)

**Organization registration:** el administrador registra el laboratorio con su razón social, RUC, planta y datos de contacto, y continúa con la elección de su plan (US50, US51). Si el RUC ya pertenece a otra organización, el formulario muestra el estado "RUC already registered" y no crea un duplicado.

| Organization registration | RUC already registered |
| :---: | :---: |
| ![Organization registration](../assets/img/chapter4/web-application/mockups/desktop-shared-environment-selection-onboarding-profile/organization-registration.png) | ![RUC already registered](../assets/img/chapter4/web-application/mockups/desktop-shared-environment-selection-onboarding-profile/organization-registration-ruc-already-registered.png) |

**Account · Profile & preferences:** se abre desde el avatar en cualquier entorno. Muestra los datos personales y el área del usuario, sus preferencias de notificación (correo y en la aplicación) y de idioma, y el estado del segundo factor; el rol y el acceso a la planta los asigna el administrador del laboratorio.

![Mock-up · Profile & preferences](../assets/img/chapter4/web-application/mockups/desktop-shared-environment-selection-onboarding-profile/account-profile-preferences.png)

#### Segmento 1 – Especialista QA/QC

**Sign in · QA/QC:** inicio de sesión del entorno QA/QC con correo corporativo y contraseña (US06). Si las credenciales no son válidas se muestra "Invalid credentials" (tras cinco intentos la cuenta se bloquea quince minutos); luego se solicita el código 2FA; si el rol del usuario no autoriza el entorno se muestra "Access not authorized" (US07).

| Sign in · QA/QC | Invalid credentials |
| :---: | :---: |
| ![Sign in QA/QC](../assets/img/chapter4/web-application/mockups/desktop-segment-1-qa-qc-specialist/sign-in-qa-qc.png) | ![Invalid credentials](../assets/img/chapter4/web-application/mockups/desktop-segment-1-qa-qc-specialist/sign-in-qa-qc-invalid-credentials.png) |

| Two-factor authentication | Access not authorized |
| :---: | :---: |
| ![2FA](../assets/img/chapter4/web-application/mockups/desktop-segment-1-qa-qc-specialist/sign-in-qa-qc-two-factor-authentication.png) | ![Access not authorized](../assets/img/chapter4/web-application/mockups/desktop-segment-1-qa-qc-specialist/sign-in-qa-qc-access-not-authorized.png) |

**Quality overview:** dashboard de calidad (US31) con los lotes pendientes de liberación, las desviaciones abiertas, los planes CAPA vencidos y las alertas recientes, como la excursión de temperatura del sensor T-204.

![Mock-up · Quality overview](../assets/img/chapter4/web-application/mockups/desktop-segment-1-qa-qc-specialist/qa-qc-quality-overview.png)

**Quality indicators:** indicadores de trazabilidad y de desviaciones (US33, US34), con los registros obligatorios faltantes por lote.

![Mock-up · Quality indicators](../assets/img/chapter4/web-application/mockups/desktop-segment-1-qa-qc-specialist/qa-qc-quality-indicators.png)

**Quality documents:** repositorio de SOP y protocolos con su versión y estado (Draft, In review, Approved, Obsolete), y el flujo de aprobación (US09, US10, US12, US13). Si quien aprueba es el autor de la revisión, la aprobación se bloquea, porque las BPM exigen un revisor independiente.

| Quality documents | Self-approval blocked |
| :---: | :---: |
| ![Quality documents](../assets/img/chapter4/web-application/mockups/desktop-segment-1-qa-qc-specialist/qa-qc-quality-documents.png) | ![Self-approval blocked](../assets/img/chapter4/web-application/mockups/desktop-segment-1-qa-qc-specialist/qa-qc-quality-documents-self-approval-blocked.png) |

**Analytical results:** registro de las variables del ensayo; el sistema calcula el resultado con la fórmula del protocolo y lo compara con la especificación (US11). Un resultado fuera de especificación (OOS) exige registrar una desviación.

![Mock-up · Analytical results](../assets/img/chapter4/web-application/mockups/desktop-segment-1-qa-qc-specialist/qa-qc-analytical-results.png)

**Deviation report & detail:** detalle de DEV-26017 con su severidad, el lote afectado, la evidencia IoT asociada y el análisis de causa raíz (US18, US19, US22). Estados: Open, Under investigation y Closed.

![Mock-up · Deviation report & detail](../assets/img/chapter4/web-application/mockups/desktop-segment-1-qa-qc-specialist/qa-qc-deviation-report-detail.png)

**CAPA plan:** acciones correctivas y preventivas con responsable, fecha límite y estado (Open, Implemented, Overdue, Verified) (US20, US21). Mientras la causa raíz esté incompleta, el plan no puede avanzar.

| CAPA plan | Root cause required |
| :---: | :---: |
| ![CAPA plan](../assets/img/chapter4/web-application/mockups/desktop-segment-1-qa-qc-specialist/qa-qc-capa-plan.png) | ![Root cause required](../assets/img/chapter4/web-application/mockups/desktop-segment-1-qa-qc-specialist/qa-qc-capa-plan-root-cause-required.png) |

**Batch release:** lista de verificación de la liberación del lote B-26041 (resultados analíticos, desviaciones cerradas, evidencia IoT y registros completos) y firma electrónica (US54, US08). Si algún control no se cumple, la liberación se bloquea y se listan los registros pendientes.

| Batch release | Release blocked |
| :---: | :---: |
| ![Batch release](../assets/img/chapter4/web-application/mockups/desktop-segment-1-qa-qc-specialist/qa-qc-batch-release.png) | ![Release blocked](../assets/img/chapter4/web-application/mockups/desktop-segment-1-qa-qc-specialist/qa-qc-batch-release-blocked.png) |

**Audits & findings:** planificación de auditorías internas y registro de sus hallazgos (US29, US59).

![Mock-up · Audits & findings](../assets/img/chapter4/web-application/mockups/desktop-segment-1-qa-qc-specialist/qa-qc-audits-findings.png)

**Audit trail:** registro inmutable de cada cambio con usuario, fecha, valor anterior, valor nuevo y motivo, filtrable por lote, usuario o fecha (US27, US30).

![Mock-up · Audit trail](../assets/img/chapter4/web-application/mockups/desktop-segment-1-qa-qc-specialist/qa-qc-audit-trail.png)

**Regulatory reports:** generación de reportes y del paquete de evidencias de una auditoría o inspección (US28).

![Mock-up · Regulatory reports](../assets/img/chapter4/web-application/mockups/desktop-segment-1-qa-qc-specialist/qa-qc-regulatory-reports.png)

**Tasks & collaboration:** bandeja de tareas y solicitudes de aprobación entre Calidad y Producción, con su estado y responsable (US40, US41, US42, US43).

![Mock-up · Tasks & collaboration](../assets/img/chapter4/web-application/mockups/desktop-segment-1-qa-qc-specialist/qa-qc-tasks-collaboration.png)

#### Segmento 2 – Jefe o Supervisor de Producción

**Sign in · Production:** mismo flujo de ingreso que QA/QC, con el color del entorno de Producción: credenciales, "Invalid credentials", código 2FA y "Access not authorized" (US06, US07).

| Sign in · Production | Invalid credentials |
| :---: | :---: |
| ![Sign in Production](../assets/img/chapter4/web-application/mockups/desktop-segment-2-production-supervisor/sign-in-production.png) | ![Invalid credentials](../assets/img/chapter4/web-application/mockups/desktop-segment-2-production-supervisor/sign-in-production-invalid-credentials.png) |

| Two-factor authentication | Access not authorized |
| :---: | :---: |
| ![2FA](../assets/img/chapter4/web-application/mockups/desktop-segment-2-production-supervisor/sign-in-production-two-factor-authentication.png) | ![Access not authorized](../assets/img/chapter4/web-application/mockups/desktop-segment-2-production-supervisor/sign-in-production-access-not-authorized.png) |

**Production overview:** dashboard de producción (US32) con las órdenes activas, los lotes por estado, el rendimiento y las alertas de las líneas.

![Mock-up · Production overview](../assets/img/chapter4/web-application/mockups/desktop-segment-2-production-supervisor/production-production-overview.png)

**Products & master formulas:** catálogo de productos y sus fórmulas maestras con versión y estado; solo una fórmula aprobada, como MFR-AC500 v3.2, puede usarse en una orden (US35, US36).

![Mock-up · Products & master formulas](../assets/img/chapter4/web-application/mockups/desktop-segment-2-production-supervisor/production-products-master-formulas.png)

**Production order & master formula:** emisión de la orden de producción a partir de la fórmula maestra aprobada, con cantidades, equipos y fechas (US57).

![Mock-up · Production order](../assets/img/chapter4/web-application/mockups/desktop-segment-2-production-supervisor/production-production-order-master-formula.png)

**Batches:** registro y lista de lotes con su estado (Planned, In progress, On hold, Finished, Release requested, Released, Rejected) (US14, US16). Si el número de lote ya existe o la fórmula no está aprobada, el lote no se crea y se explica el motivo.

| Batches | Batch not created |
| :---: | :---: |
| ![Batches](../assets/img/chapter4/web-application/mockups/desktop-segment-2-production-supervisor/production-batches.png) | ![Batch not created](../assets/img/chapter4/web-application/mockups/desktop-segment-2-production-supervisor/production-batches-batch-not-created.png) |

**Batch detail & traceability:** historial del lote B-26041 (120,000 tabletas) con su genealogía: materias primas, equipos, etapas y eventos (US15, US17).

![Mock-up · Batch detail & traceability](../assets/img/chapter4/web-application/mockups/desktop-segment-2-production-supervisor/production-batch-detail-traceability.png)

**Batch IoT evidence:** lecturas de los sensores asociados al lote, capturadas automáticamente, con la excursión de 27.8 °C del sensor T-204 frente al límite de 18–25 °C (US25, US26).

![Mock-up · Batch IoT evidence](../assets/img/chapter4/web-application/mockups/desktop-segment-2-production-supervisor/production-batch-iot-evidence.png)

**Raw-material receipt:** recepción de materias primas con su lote de proveedor y su estado de calidad (Quarantine, Approval requested, Approved, Rejected) (US58). Un insumo solo puede usarse en un lote cuando Calidad lo aprueba.

![Mock-up · Raw-material receipt](../assets/img/chapter4/web-application/mockups/desktop-segment-2-production-supervisor/production-raw-material-receipt.png)

**Equipment & IoT devices:** registro de equipos y sensores con su estado (Fit for use, Not fit for use, In maintenance), calibraciones y mantenimientos (US23, US37, US38, US39). Un equipo no apto o un sensor ya asociado a otro lote no puede vincularse (US24).

![Mock-up · Equipment & IoT devices](../assets/img/chapter4/web-application/mockups/desktop-segment-2-production-supervisor/production-equipment-iot-devices.png)

**IoT overview y Equipment & sensor detail:** monitoreo en tiempo real de los sensores de planta y detalle de un equipo con sus lecturas, límites y alertas (US26).

| IoT overview | Equipment & sensor detail |
| :---: | :---: |
| ![IoT overview](../assets/img/chapter4/web-application/mockups/desktop-segment-2-production-supervisor/iot-iot-overview.png) | ![Equipment & sensor detail](../assets/img/chapter4/web-application/mockups/desktop-segment-2-production-supervisor/iot-equipment-sensor-detail.png) |

#### Administrador del laboratorio

**Sign in · Administration:** ingreso al entorno de Administración con credenciales y código 2FA.

| Sign in · Administration | Invalid credentials | Two-factor authentication |
| :---: | :---: | :---: |
| ![Sign in Administration](../assets/img/chapter4/web-application/mockups/desktop-laboratory-administrator/sign-in-administration.png) | ![Invalid credentials](../assets/img/chapter4/web-application/mockups/desktop-laboratory-administrator/sign-in-administration-invalid-credentials.png) | ![2FA](../assets/img/chapter4/web-application/mockups/desktop-laboratory-administrator/sign-in-administration-two-factor-authentication.png) |

**Administration overview:** resumen de los usuarios activos e invitaciones pendientes, la organización y sus sedes (planta de Ate y laboratorio de Lima), el estado de la suscripción, los usuarios que requieren atención y la actividad administrativa reciente.

![Mock-up · Administration overview](../assets/img/chapter4/web-application/mockups/desktop-laboratory-administrator/administration-administration-overview.png)

**Users & profiles e Invite user:** lista de usuarios con su rol y estado (Invited, Active, Locked, Disabled) y el diálogo para invitar a un nuevo integrante con su rol (US07, US55).

| Users & profiles | Invite user |
| :---: | :---: |
| ![Users & profiles](../assets/img/chapter4/web-application/mockups/desktop-laboratory-administrator/administration-users-profiles.png) | ![Invite user](../assets/img/chapter4/web-application/mockups/desktop-laboratory-administrator/administration-invite-user.png) |

**Subscriptions & payments:** plan vigente, modalidad mensual o anual, historial de pagos con Niubiz y su estado (Pending, Approved, Rejected), y las opciones de renovación y cancelación (US51, US52, US53).

![Mock-up · Subscriptions & payments](../assets/img/chapter4/web-application/mockups/desktop-laboratory-administrator/administration-subscriptions-payments.png)

#### Mobile Web Browser

En mobile, la navegación del entorno se agrupa en una barra inferior y las pantallas se reducen a las tareas de campo de cada segmento.

**Compartido:** elección del entorno.

![Mock-up · Mobile · Shared](../assets/img/chapter4/web-application/mockups/mobile-shared-environment-selection-montage-1.png)

**Segmento 1 – QA/QC:** inicio de sesión con sus estados, Task inbox, Approval review (con el estado "Record changed", que impide firmar si el registro cambió durante la revisión), Electronic signature (con el estado "Invalid password"), Signature confirmed, Approval completed y Batch detail.

![Mock-up · Mobile · QA/QC (1)](../assets/img/chapter4/web-application/mockups/mobile-segment-1-qa-qc-specialist-montage-1.png)

![Mock-up · Mobile · QA/QC (2)](../assets/img/chapter4/web-application/mockups/mobile-segment-1-qa-qc-specialist-montage-2.png)

**Segmento 2 – Production:** inicio de sesión con sus estados, IoT monitoring, Batch lookup, Alert details, Incident reporting (con el estado "Validation error") e Incident submitted.

![Mock-up · Mobile · Production (1)](../assets/img/chapter4/web-application/mockups/mobile-segment-2-production-supervisor-montage-1.png)

![Mock-up · Mobile · Production (2)](../assets/img/chapter4/web-application/mockups/mobile-segment-2-production-supervisor-montage-2.png)

**Administrador del laboratorio:** inicio de sesión del entorno de Administración con sus estados.

![Mock-up · Mobile · Administration](../assets/img/chapter4/web-application/mockups/mobile-laboratory-administrator-montage-1.png)

### 4.4.4. Web Applications User Flow Diagrams

Los User Flow Diagrams representan, para los mismos user goals de la sección 4.4.2, la secuencia de pantallas y acciones del camino principal (happy path) y las decisiones que llevan a caminos alternativos (unhappy paths).

#### Segmento 1 – Especialista QA/QC

**User Goal QA-1:** Ingresar a DoofPlus y acceder al entorno QA/QC.

Happy path: Home → "Sign in" → Choose your environment → QA/QC → correo y contraseña → Two-factor authentication → Quality overview.

Unhappy paths: ¿Credenciales válidas? No → "Invalid credentials"; permanece en el formulario y, tras cinco intentos, la cuenta se bloquea quince minutos | ¿El rol autoriza el entorno QA/QC? No → "Access not authorized".

![User Flow QA-1](../assets/img/chapter4/web-application/user-flows/user-flow-qa-1.png)

**User Goal QA-2:** Gestionar la documentación de calidad y sus protocolos.

Happy path: Quality overview → Quality documents → envía la revisión → Tasks & collaboration (tarea de aprobación).

Unhappy path: ¿El revisor es distinto del autor? No → "Self-approval blocked"; la aprobación debe asignarse a otro revisor.

![User Flow QA-2](../assets/img/chapter4/web-application/user-flows/user-flow-qa-2.png)

**User Goal QA-3:** Registrar una desviación y gestionar su CAPA.

Happy path: Quality overview → Deviation report & detail (DEV-26017) → registra la causa raíz → CAPA plan.

Unhappy path: ¿La causa raíz está documentada? No → "Root cause required"; el plan CAPA no avanza.

![User Flow QA-3](../assets/img/chapter4/web-application/user-flows/user-flow-qa-3.png)

**User Goal QA-4:** Planificar una auditoría y reunir sus evidencias.

Happy path: Audits & findings → Audit trail del alcance → Regulatory reports (paquete de evidencias).

Unhappy path: ¿Están todos los registros obligatorios? No → Quality indicators muestra los registros faltantes antes de la auditoría.

![User Flow QA-4](../assets/img/chapter4/web-application/user-flows/user-flow-qa-4.png)

**User Goal QA-5:** Registrar y validar resultados analíticos.

Happy path: Quality overview → Analytical results → resultado dentro de especificación → Batch release.

Unhappy path: ¿El resultado está dentro de la especificación? No → resultado OOS; se registra una desviación en Deviation report & detail.

![User Flow QA-5](../assets/img/chapter4/web-application/user-flows/user-flow-qa-5.png)

**User Goal QA-6:** Revisar la trazabilidad completa de un lote y liberarlo.

Happy path: Quality overview → Audit trail del lote → Batch release → firma electrónica.

Unhappy path: ¿Se cumplen todos los controles de liberación? No → "Release blocked"; se listan los registros pendientes.

![User Flow QA-6](../assets/img/chapter4/web-application/user-flows/user-flow-qa-6.png)

#### Segmento 2 – Jefe o Supervisor de Producción

**User Goal PR-1:** Ingresar a DoofPlus y acceder al entorno de Producción.

Happy path: Home → "Sign in" → Choose your environment → Production → correo y contraseña → Two-factor authentication → Production overview.

Unhappy paths: ¿Credenciales válidas? No → "Invalid credentials" | ¿El rol autoriza el entorno de Producción? No → "Access not authorized".

![User Flow PR-1](../assets/img/chapter4/web-application/user-flows/user-flow-pr-1.png)

**User Goal PR-2:** Gestionar la ejecución de un lote y consultar su historial.

Happy path: Products & master formulas → selecciona la fórmula aprobada → Production order & master formula → Batches → Batch detail & traceability (B-26041).

Unhappy path: ¿El número de lote es único y la fórmula está aprobada? No → "Batch not created", con el motivo.

![User Flow PR-2](../assets/img/chapter4/web-application/user-flows/user-flow-pr-2.png)

**User Goal PR-3:** Monitorear equipos y condiciones ambientales.

Happy path: IoT overview → alerta de EQ-COAT-02 → Equipment & sensor detail → Batch IoT evidence.

Unhappy path: ¿El equipo está apto y el sensor libre? No → Equipment & IoT devices; la asociación no se realiza.

![User Flow PR-3](../assets/img/chapter4/web-application/user-flows/user-flow-pr-3.png)

**User Goal PR-4:** Reportar una incidencia de producción desde planta.

Happy path (Mobile): Alert details → "Report incident" → Incident reporting → Incident submitted.

Unhappy path: ¿Los campos obligatorios están completos? No → "Validation error"; el formulario permanece abierto con los errores resaltados.

![User Flow PR-4](../assets/img/chapter4/web-application/user-flows/user-flow-pr-4.png)

**User Goal PR-5:** Trazar un lote para investigar un evento.

Happy path: Batches → Batch detail & traceability → Raw-material receipt del insumo.

Unhappy path: ¿Calidad aprobó el lote del insumo? No → el insumo permanece en Quarantine o Rejected y no puede usarse.

![User Flow PR-5](../assets/img/chapter4/web-application/user-flows/user-flow-pr-5.png)

**User Goal PR-6:** Revisar reportes e indicadores de producción.

Happy path: Production overview → Batches → Batch detail & traceability.

Unhappy path: ¿Hay una incidencia abierta en una línea? Sí → se sigue en IoT overview.

![User Flow PR-6](../assets/img/chapter4/web-application/user-flows/user-flow-pr-6.png)

## 4.5. Web Applications Prototyping

El prototipo interactivo de DoofPlus se construyó en Figma sobre los mock-ups de las secciones 4.3.2 y 4.4.3, con el fin de validar la navegación y los flujos antes de la implementación. Sus interacciones siguen los paths de los User Flow Diagrams de la sección 4.4.4:

- **Landing Page:** los enlaces de la barra desplazan a cada sección; "Sign in" abre la elección de entorno; las tarjetas de "Get Started" abren el inicio de sesión de su entorno; los botones de los planes y "Register your laboratory" abren el registro de la organización; "Contact us" abre el formulario de contacto, y los enlaces del footer, los términos y la política de privacidad. En mobile, el ícono de menú abre el overlay de navegación.
- **Ingreso:** la elección de entorno abre el inicio de sesión de QA/QC, Production o Administration; "Continue" lleva al código 2FA y "Verify" a la pantalla inicial del entorno. Los estados de error se muestran como pantallas alternativas.
- **Web Application:** el sidebar lleva a cada módulo del entorno, el avatar abre "Profile & preferences" y los botones de cada pantalla siguen los user goals QA-1 a QA-6 y PR-1 a PR-6, que se definieron como puntos de inicio del prototipo.

El diseño del prototipo se guió por cuatro criterios:

- **Cumplimiento regulatorio por diseño:** las acciones críticas exigen firma electrónica, quedan en el audit trail y respetan la segregación de funciones (por ejemplo, el autor de un documento no puede aprobarlo).
- **Navegación basada en los procesos del laboratorio:** los módulos siguen el recorrido del lote, desde la fórmula maestra y la orden de producción hasta su liberación.
- **Consistencia visual:** todos los entornos comparten componentes, tipografía y estructura, y solo cambia el color que identifica al entorno.
- **Prevención de errores:** los estados de bloqueo explican el motivo y la acción necesaria, en lugar de permitir una operación que luego deba corregirse.

Prototipo navegable en Figma: <mark>pegar URL pública del prototipo</mark>

Video de navegación del prototipo (Microsoft Stream), upc-pre-202620-1asi0729-7742-IngesCompany-prototype-navigation: <mark>pegar URL, timing de inicio y duración</mark>

## 4.6. Domain-Driven Software Architecture
La arquitectura de DoofPlus se fundamenta en Domain-Driven Design (DDD). El punto de partida es el Big Picture EventStorming (sección 2.4), que dejó una línea de tiempo de eventos organizada en siete swimlanes, con sus actores, sistemas externos y problemas. En esta sección ese conocimiento se profundiza con un Design-Level EventStorming hasta identificar los bounded contexts y obtener aggregates, commands, policies, read models y sistemas externos por contexto; luego la solución se representa con el modelo C4 (contexto, contenedores y componentes). Cada bounded context se corresponde con un módulo de la Web Application en Angular y con un paquete del RESTful API en Spring Boot.

La siguiente tabla resume la trazabilidad entre artefactos:

| Bounded context | Tipo | Swimlanes del Big Picture | Épicas | Aggregates (DLES) | Módulo Angular / paquete Spring |
| --- | --- | --- | --- | --- | --- |
| Manufacturing & Batch Management | Core | Producción y almacén | EP04, EP09 (productos y fórmulas) | Product, MasterFormula, RawMaterialLot, ProductionOrder, ProductionBatch | `manufacturing` |
| Quality & Compliance | Core | Gestión documental, Control de calidad y liberación, Desviaciones y CAPA, Auditoría y cumplimiento | EP03, EP05, EP07, EP08, EP10 | QualityDocument, MaterialApproval, BatchReview, AnalyticalResult, Deviation, Audit, RegulatoryReport | `quality` |
| IoT Monitoring | Supporting | Monitoreo de equipos (IoT) | EP06, EP09 (equipos, calibraciones y mantenimiento) | Equipment, IoTDevice, TelemetryReading, Alert | `iot-monitoring` / `iotmonitoring` |
| Identity & Access Management | Generic | Plataforma y administración, Gestión documental | EP02 | User, ElectronicSignature | `iam` |
| Organizations & Profiles | Supporting | Plataforma y administración | EP01 (consultas del formulario de contacto), EP02 (registro de la organización) | Organization, Profile, ContactInquiry | `organizations` |
| Subscriptions & Payments | Generic | Plataforma y administración | EP11 | Plan, Subscription | `subscriptions` |

Los dashboards (EP08) y las notificaciones entre áreas (EP10) no forman un contexto propio: los dashboards son read models que cada contexto expone y las notificaciones son policies que reaccionan a domain events.

### 4.6.1. Design-Level Event Storming

El equipo realizó el Design-Level EventStorming en Miro siguiendo la agenda propuesta en "The best agenda for Design-Level Event Storming" (EventStorming Journal) y la guía del statement (https://bit.ly/dles-guide). Se trabajó un bounded context a la vez, tomando como punto de partida los eventos del Big Picture que pertenecen a ese contexto. Quality & Compliance, el contexto más grande, se modeló en un solo frame con dos swimlanes: liberación de lotes (documentos, insumos, resultados analíticos y liberación) y desviaciones y auditoría (desviaciones, CAPA, auditorías y reportes regulatorios).

Tablero de Miro: https://miro.com/app/board/uXjVHkhKOXE=/

La agenda de la guía tiene 11 fases. El equipo las aplicó agrupadas en los pasos que ya usaba, y decidió qué fases son opcionales para el proyecto:

| Fase de la guía | Paso en DoofPlus | Cómo se aplicó |
| --- | --- | --- |
| 1. The target design | Paso 0: Target design | Se presentó la gramática del Design-Level (actor, read model, command, business rule o external system, domain event y policy). |
| 2. Domain Events | Paso 1: Timelines | Se copiaron los eventos del Big Picture que pertenecen a cada contexto y se ordenaron en el tiempo. |
| 3. Commands | Paso 2: Commands | Se escribió, antes de cada evento, la intención que lo provoca. |
| 4. Actors or policies | Paso 3: Actors and policies | Cada command se antecedió por el actor que lo ejecuta o por la policy que lo dispara automáticamente. |
| 5 y 6. Blank stickies / Read models and UX mock-ups | Paso 4: Read models | Se registró la información que el actor necesita ver para decidir. Los mock-ups en post-its blancos se omitieron porque las pantallas ya se diseñaron en Figma (sección 4.4); cada read model corresponde a una vista de la Web Application. |
| 7. External systems | Paso 5: External systems | Se ubicaron los sistemas externos entre el command y el evento. |
| 8 a 11. Business rules, aggregates of business rules y aggregate names | Paso 6: Business rules y aggregates | Donde no interviene un sistema externo se escribió la regla de negocio que protege el command (tomada de los criterios de aceptación de la User Story correspondiente); las reglas relacionadas se apilaron y el grupo recibió el nombre del aggregate. |
| Opcional después del taller: Bounded Context Canvas y Example Mapping | Paso 7: Bounded contexts | Se agruparon los aggregates en bounded contexts y se trazó el context map. El Bounded Context Canvas no se elaboró (es opcional) y el Example Mapping se reemplazó por los escenarios Gherkin de la sección 3.1. |

Notación usada en el tablero: domain events en naranja, commands en azul, actores en amarillo pequeño, policies en lila, read models en verde, sistemas externos en rosado, business rules en amarillo y aggregates como bloques amarillos que agrupan sus reglas.

#### Paso 0: Target design

Antes de modelar, se acordó la "imagen que lo explica todo": un actor consulta un read model, decide y ejecuta un command; el command se valida con las business rules del aggregate o invoca a un sistema externo; el resultado es un domain event, que puede disparar una policy y con ella un nuevo command.

Frame en Miro: https://miro.com/app/board/uXjVHkhKOXE=/?moveToWidget=3458764685756367551

![Target design](../assets/img/chapter4/design-level-event-storming/target-design.jpg)

#### Paso 1: Timelines

Se organizaron en una línea de tiempo vertical los eventos de cada contexto, con los resultados alternativos en la columna "Alternativa" (por ejemplo, "Documento aprobado" o "Documento rechazado"). Al revisar qué dispara cada evento, en este nivel se agregaron eventos que faltaban en el Big Picture: "Consulta recibida", "Plan de suscripción seleccionado", "Firma electrónica registrada", "Equipo registrado", "Sensor IoT registrado", "Aprobación de insumos solicitada a Calidad", "Mantenimiento preventivo realizado", "Lote puesto en espera" y "Acción CAPA vencida"; además, "Usuario registrado" se renombró como "Usuario dado de alta en la organización". También aparecen eventos de detalle que no eran relevantes en la vista general, como "Usuario autenticado", "Inicio de sesión fallido", "Cuenta bloqueada", "Planta agregada", "Perfil actualizado" y "Alerta reconocida".

**Identity & Access Management**

![Identity & Access Management - paso 1](../assets/img/chapter4/design-level-event-storming/timelines/iam-1-timelines.jpg)

**Organizations & Profiles**

![Organizations & Profiles - paso 1](../assets/img/chapter4/design-level-event-storming/timelines/org-1-timelines.jpg)

**Subscriptions & Payments**

![Subscriptions & Payments - paso 1](../assets/img/chapter4/design-level-event-storming/timelines/sub-1-timelines.jpg)

**Manufacturing & Batch Management**

![Manufacturing & Batch Management - paso 1](../assets/img/chapter4/design-level-event-storming/timelines/mfg-1-timelines.jpg)

**IoT Monitoring**

![IoT Monitoring - paso 1](../assets/img/chapter4/design-level-event-storming/timelines/iot-1-timelines.jpg)

**Quality & Compliance** (swimlane 1: liberación de lotes; swimlane 2: desviaciones y auditoría)

![Quality & Compliance - paso 1](../assets/img/chapter4/design-level-event-storming/timelines/qa-1-timelines.jpg)

#### Paso 2: Commands

Cada evento se antecedió por el command que lo provoca, redactado en imperativo (por ejemplo, "Crear lote" produce "Lote creado"). Un mismo command puede terminar en dos eventos alternativos, como "Aprobar orden de producción", que produce "Orden de producción aprobada" u "Orden de producción rechazada".

**Identity & Access Management**

![Identity & Access Management - paso 2](../assets/img/chapter4/design-level-event-storming/commands/iam-2-commands.jpg)

**Organizations & Profiles**

![Organizations & Profiles - paso 2](../assets/img/chapter4/design-level-event-storming/commands/org-2-commands.jpg)

**Subscriptions & Payments**

![Subscriptions & Payments - paso 2](../assets/img/chapter4/design-level-event-storming/commands/sub-2-commands.jpg)

**Manufacturing & Batch Management**

![Manufacturing & Batch Management - paso 2](../assets/img/chapter4/design-level-event-storming/commands/mfg-2-commands.jpg)

**IoT Monitoring**

![IoT Monitoring - paso 2](../assets/img/chapter4/design-level-event-storming/commands/iot-2-commands.jpg)

**Quality & Compliance** (swimlane 1: liberación de lotes; swimlane 2: desviaciones y auditoría)

![Quality & Compliance - paso 2](../assets/img/chapter4/design-level-event-storming/commands/qa-2-commands.jpg)

#### Paso 3: Actors and policies

Se identificó quién ejecuta cada command: Administrador del laboratorio, Especialista QA/QC, Jefe de Calidad, Jefe de Producción, Auditor interno, Responsable de la acción CAPA y, para las tareas programadas, el sistema. Cuando un command se ejecuta automáticamente, el actor se reemplazó por una policy. Las principales policies son:

| Bounded context | Policy (cuando ocurre…, entonces…) |
| --- | --- |
| IAM | Cuando ocurren 5 intentos fallidos de inicio de sesión, bloquear la cuenta 15 minutos. |
| Organizations | Cuando se registra la organización, crear la cuenta del administrador en IAM. |
| Subscriptions | Cuando se activa la suscripción, habilitar los límites del plan (usuarios y sensores). |
| Manufacturing | Cuando se recibe materia prima, solicitar su aprobación a Calidad. |
| Manufacturing | Cuando se aprueba la orden, planificar la producción. |
| Manufacturing | Cuando la incidencia es crítica, poner el lote en espera; cuando se escala, registrar una desviación en Quality. |
| Manufacturing | Cuando se solicita la liberación, poner el lote en cuarentena en Quality. |
| IoT Monitoring | Cuando llega una lectura, evaluar las reglas de alerta; cuando un parámetro sale de rango, generar una alerta. |
| IoT Monitoring | Cuando vence la calibración, marcar el equipo como no apto y notificar. |
| Quality | Cuando un resultado sale de especificación, marcarlo OOS y registrar una desviación. |
| Quality | Cuando se libera el lote, emitir el certificado y actualizar el lote en Manufacturing. |
| Quality | Cuando se cierra una desviación, reevaluar el lote afectado. |

**Identity & Access Management**

![Identity & Access Management - paso 3](../assets/img/chapter4/design-level-event-storming/actors-policies/iam-3-actors-policies.jpg)

**Organizations & Profiles**

![Organizations & Profiles - paso 3](../assets/img/chapter4/design-level-event-storming/actors-policies/org-3-actors-policies.jpg)

**Subscriptions & Payments**

![Subscriptions & Payments - paso 3](../assets/img/chapter4/design-level-event-storming/actors-policies/sub-3-actors-policies.jpg)

**Manufacturing & Batch Management**

![Manufacturing & Batch Management - paso 3](../assets/img/chapter4/design-level-event-storming/actors-policies/mfg-3-actors-policies.jpg)

**IoT Monitoring**

![IoT Monitoring - paso 3](../assets/img/chapter4/design-level-event-storming/actors-policies/iot-3-actors-policies.jpg)

**Quality & Compliance** (swimlane 1: liberación de lotes; swimlane 2: desviaciones y auditoría)

![Quality & Compliance - paso 3](../assets/img/chapter4/design-level-event-storming/actors-policies/qa-3-actors-policies.jpg)

#### Paso 4: Read models

Se registró la información que cada actor consulta antes de decidir. Estos read models son la base de las vistas de la Web Application y de los dashboards: por ejemplo, "Panel de control del lote" (GxP Batch Execution & Management Console), "Tablero de desviaciones y CAPA" (Critical Deviations & CAPA Actions Control), "Panel de resultados de laboratorio" (Analytical Results Entry & Validation), "Panel de alertas" (Environmental & Equipment Monitoring) y "Audit trail" (Cross-Traceability & Audit Center). Cada read model se obtiene con una query del contexto, atendida por su query service: por ejemplo, el panel de control del lote se arma con la consulta del lote y su línea de tiempo, y el tablero de desviaciones, con la consulta de las desviaciones abiertas por severidad.

**Identity & Access Management**

![Identity & Access Management - paso 4](../assets/img/chapter4/design-level-event-storming/read-models/iam-4-read-models.jpg)

**Organizations & Profiles**

![Organizations & Profiles - paso 4](../assets/img/chapter4/design-level-event-storming/read-models/org-4-read-models.jpg)

**Subscriptions & Payments**

![Subscriptions & Payments - paso 4](../assets/img/chapter4/design-level-event-storming/read-models/sub-4-read-models.jpg)

**Manufacturing & Batch Management**

![Manufacturing & Batch Management - paso 4](../assets/img/chapter4/design-level-event-storming/read-models/mfg-4-read-models.jpg)

**IoT Monitoring**

![IoT Monitoring - paso 4](../assets/img/chapter4/design-level-event-storming/read-models/iot-4-read-models.jpg)

**Quality & Compliance** (swimlane 1: liberación de lotes; swimlane 2: desviaciones y auditoría)

![Quality & Compliance - paso 4](../assets/img/chapter4/design-level-event-storming/read-models/qa-4-read-models.jpg)

#### Paso 5: External systems

Se ubicaron los sistemas externos en el punto donde intervienen: Niubiz (pago y renovación de suscripciones), ThingsBoard (registro de sensores e ingesta de lecturas), SendGrid (invitaciones, alertas y notificaciones por correo), el Lector RFID (recepción de materias primas), la app autenticadora del usuario (códigos TOTP) y DIGEMID (inspección). Respecto del tablero original se corrigieron tres elementos: "Registro en la base de datos" no es un sistema externo (la base de datos es parte de la solución), el "Motor de alertas" es lógica propia del contexto IoT Monitoring y Google Authenticator no expone un API: solo genera el código que el usuario ingresa.

**Identity & Access Management**

![Identity & Access Management - paso 5](../assets/img/chapter4/design-level-event-storming/external-systems/iam-5-external-systems.jpg)

**Organizations & Profiles**

![Organizations & Profiles - paso 5](../assets/img/chapter4/design-level-event-storming/external-systems/org-5-external-systems.jpg)

**Subscriptions & Payments**

![Subscriptions & Payments - paso 5](../assets/img/chapter4/design-level-event-storming/external-systems/sub-5-external-systems.jpg)

**Manufacturing & Batch Management**

![Manufacturing & Batch Management - paso 5](../assets/img/chapter4/design-level-event-storming/external-systems/mfg-5-external-systems.jpg)

**IoT Monitoring**

![IoT Monitoring - paso 5](../assets/img/chapter4/design-level-event-storming/external-systems/iot-5-external-systems.jpg)

**Quality & Compliance** (swimlane 1: liberación de lotes; swimlane 2: desviaciones y auditoría)

![Quality & Compliance - paso 5](../assets/img/chapter4/design-level-event-storming/external-systems/qa-5-external-systems.jpg)

#### Paso 6: Business rules y aggregates

Donde no interviene un sistema externo se escribió la business rule que el command debe cumplir. Las reglas se tomaron de los criterios de aceptación de las User Stories (el identificador aparece en el post-it), por ejemplo "Número de lote único (US14)", "Solo materia prima aprobada (US17)" o "Requiere causa raíz y CAPA verificadas (US19)". Las reglas que protegen los mismos datos se apilaron y cada grupo recibió el nombre de su aggregate:

| Bounded context | Aggregates | Ejemplo de invariante |
| --- | --- | --- |
| IAM | User, ElectronicSignature | Una cuenta se bloquea tras 5 intentos fallidos; firmar exige reingresar la contraseña. |
| Organizations & Profiles | ContactInquiry, Organization, Profile | El RUC de la organización es válido y único. |
| Subscriptions & Payments | Plan, Subscription | La suscripción se activa solo si Niubiz autoriza el cobro. |
| Manufacturing & Batch Management | Product, MasterFormula, RawMaterialLot, ProductionOrder, ProductionBatch | Un lote solo consume materia prima aprobada y solo Calidad puede liberarlo. |
| IoT Monitoring | Equipment, IoTDevice, TelemetryReading, Alert | Un equipo con calibración vencida no puede asignarse a un lote. |
| Quality & Compliance | QualityDocument, MaterialApproval, BatchReview, AnalyticalResult, Deviation, Audit, RegulatoryReport | Un lote con un resultado OOS sin desviación cerrada no puede liberarse. |

Frames en Miro por bounded context. Debajo de los frames finales, el tablero tiene la sección "DLES paso a paso por bounded context", con una fila por contexto y un frame por paso (Pasos 1 a 6); el enlace lleva al Paso 1 de cada fila:

| Bounded context | Frame final | Pasos 1 a 6 |
| --- | --- | --- |
| Identity & Access Management | https://miro.com/app/board/uXjVHkhKOXE=/?moveToWidget=3458764685754766070 | https://miro.com/app/board/uXjVHkhKOXE=/?moveToWidget=3458764685853215191 |
| Organizations & Profiles | https://miro.com/app/board/uXjVHkhKOXE=/?moveToWidget=3458764685754766071 | https://miro.com/app/board/uXjVHkhKOXE=/?moveToWidget=3458764685853215761 |
| Subscriptions & Payments | https://miro.com/app/board/uXjVHkhKOXE=/?moveToWidget=3458764685754766072 | https://miro.com/app/board/uXjVHkhKOXE=/?moveToWidget=3458764685853249317 |
| Manufacturing & Batch Management | https://miro.com/app/board/uXjVHkhKOXE=/?moveToWidget=3458764685754766787 | https://miro.com/app/board/uXjVHkhKOXE=/?moveToWidget=3458764685853302296 |
| IoT Monitoring | https://miro.com/app/board/uXjVHkhKOXE=/?moveToWidget=3458764685754766073 | https://miro.com/app/board/uXjVHkhKOXE=/?moveToWidget=3458764685853335403 |
| Quality & Compliance | https://miro.com/app/board/uXjVHkhKOXE=/?moveToWidget=3458764686149839907 | https://miro.com/app/board/uXjVHkhKOXE=/?moveToWidget=3458764686150007814 |

**Identity & Access Management**

![Identity & Access Management - paso 6](../assets/img/chapter4/design-level-event-storming/aggregates/iam-6-aggregates.jpg)

**Organizations & Profiles**

![Organizations & Profiles - paso 6](../assets/img/chapter4/design-level-event-storming/aggregates/org-6-aggregates.jpg)

**Subscriptions & Payments**

![Subscriptions & Payments - paso 6](../assets/img/chapter4/design-level-event-storming/aggregates/sub-6-aggregates.jpg)

**Manufacturing & Batch Management**

![Manufacturing & Batch Management - paso 6](../assets/img/chapter4/design-level-event-storming/aggregates/mfg-6-aggregates.jpg)

**IoT Monitoring**

![IoT Monitoring - paso 6](../assets/img/chapter4/design-level-event-storming/aggregates/iot-6-aggregates.jpg)

**Quality & Compliance** (swimlane 1: liberación de lotes; swimlane 2: desviaciones y auditoría)

![Quality & Compliance - paso 6](../assets/img/chapter4/design-level-event-storming/aggregates/qa-6-aggregates.jpg)

#### Paso 7: Bounded contexts

Los aggregates se agruparon en seis bounded contexts, siguiendo los swimlanes del Big Picture y el lenguaje que comparten sus eventos, con nombres en inglés alineados al Ubiquitous Language y al código. Respecto del Design-Level original del equipo se mantuvieron los seis contextos y se refinaron sus aggregates: "Módulo de Credenciales y Sesión" pasó a User (la sesión se maneja con JWT y no se persiste), la matriz de roles pasó de Organizations a IAM, "Perfil Corporativo y Tenant" se dividió en Organization y Profile, "Inventario y Materia Prima" se separó en Product, MasterFormula y RawMaterialLot, "Lote de Producción" en ProductionOrder y ProductionBatch, "Registro de Maquinaria y Telemetría" en Equipment, IoTDevice, TelemetryReading y Alert, y "Expediente de Trazabilidad y Auditoría" en MaterialApproval, BatchReview, AnalyticalResult y Audit. Así cada aggregate protege un conjunto pequeño de reglas y se corresponde con una clase raíz y sus tablas.

El context map muestra cómo se integran los contextos. Las consultas entre contextos pasan por un Anti-Corruption Layer (fachada `ContextFacade` del contexto proveedor y servicio `External…Service` del consumidor); las decisiones de Quality hacia Manufacturing se comunican con domain events.

Frame en Miro: https://miro.com/app/board/uXjVHkhKOXE=/?moveToWidget=3458764685756367552

![Context map](../assets/img/chapter4/design-level-event-storming/context-map.jpg)

| Contexto consumidor | Contexto proveedor | Integración | Motivo |
| --- | --- | --- | --- |
| Organizations & Profiles | IAM | ACL (`IamContextFacade`) | Crear la cuenta del administrador al registrar la organización. |
| Quality & Compliance | IAM | ACL (`IamContextFacade`) | Registrar firmas electrónicas en aprobaciones y liberaciones. |
| Subscriptions & Payments | Organizations & Profiles | ACL (`OrganizationsContextFacade`) | Validar la organización suscriptora. |
| IoT Monitoring | Subscriptions & Payments | ACL (`SubscriptionsContextFacade`) | Respetar el límite de sensores del plan. |
| Manufacturing | Quality & Compliance | ACL (`QualityContextFacade`) | Solicitar la aprobación de insumos y la cuarentena del lote. |
| Manufacturing | Quality & Compliance | Domain events (`MaterialApprovalDecided`, `BatchReleaseDecided`) | Actualizar el estado del insumo y del lote con el dictamen de Calidad. |
| Manufacturing e IoT Monitoring | Entre sí | ACL (`IotMonitoringContextFacade`, `ManufacturingContextFacade`) | Asignar sensores al lote y verificar que el lote esté en curso. |

### 4.6.2. Software Architecture Context Diagram

El diagrama de contexto (nivel 1 del modelo C4) muestra a DoofPlus como un único sistema rodeado por sus usuarios y los sistemas externos identificados en el EventStorming. Los usuarios son el visitante de un laboratorio (Landing Page), el Especialista QA/QC y el Jefe de Producción (segmentos objetivo) y el Administrador del laboratorio. Los sistemas externos son ThingsBoard, que envía la telemetría de los sensores; Niubiz, que autoriza los cobros de las suscripciones; SendGrid, que entrega correos; y el Lector RFID del almacén, con el que el Jefe de Producción lee la etiqueta del insumo recibido y que envía ese código a DoofPlus. La app autenticadora del usuario genera los códigos TOTP del segundo factor sin integración por API, por eso se muestra con línea punteada. DIGEMID, identificada como sistema externo en el EventStorming, no forma parte del diagrama porque inspecciona al laboratorio sin intercambiar datos con DoofPlus: el modelo C4 solo incluye las personas y los sistemas conectados directamente con el sistema. Los diagramas C4 se elaboraron con Structurizr DSL (Diagram-as-Code) y se renderizaron con Structurizr, la herramienta de referencia del modelo C4; todas las vistas salen de un único modelo (`assets/diagrams/structurizr/workspace.dsl`), y la disposición de los elementos de cada vista se guarda en `workspace.json`, ordenada en capas de arriba hacia abajo para que las relaciones no se crucen ni atraviesen otros elementos.

![Context Level Diagram](../assets/img/chapter4/software-architecture/c4/c4-01-context.png)

### 4.6.3. Software Architecture Container Diagrams

El diagrama de contenedores (nivel 2) muestra las unidades de despliegue de la solución y cómo se comunican:

| Container | Tecnología | Despliegue | Responsabilidad |
| --- | --- | --- | --- |
| Landing Page | HTML5, CSS3, JavaScript | GitHub Pages | Presentar la propuesta de valor, los planes y el equipo; enviar las consultas del formulario de contacto y llevar a cada usuario al inicio de sesión de su entorno o al registro de la organización. |
| Web Application | Angular, Angular Material, TypeScript, ngx-translate | Firebase Hosting | SPA responsive con un módulo por bounded context; consume el RESTful API con un token JWT. |
| RESTful API | Spring Boot, Java 21, Spring Data JPA, Spring Security, springdoc-openapi | Render | Monolito modular con los seis bounded contexts; expone endpoints REST documentados con OpenAPI (Swagger), recibe la telemetría de ThingsBoard y publica notificaciones por WebSocket (STOMP). |
| Database | MySQL 8 | Railway | Persistencia relacional; las tablas se agrupan por bounded context. |

El Lector RFID se conecta al equipo del almacén y envía a la Web Application el código de la etiqueta como entrada de teclado (USB HID), por lo que no requiere integración con el RESTful API.

Se eligió un monolito modular en lugar de microservicios porque el statement define un único RESTful API y porque el equipo y el volumen de datos de laboratorios pequeños y medianos no justifican la complejidad operativa de varios servicios. La separación por bounded context dentro del código (paquetes independientes que solo se comunican mediante fachadas y eventos) permite extraer un contexto a un servicio propio en el futuro.

![Container Level Diagram](../assets/img/chapter4/software-architecture/c4/c4-02-container.png)

### 4.6.4. Software Architecture Components Diagrams

Los diagramas de componentes (nivel 3) descomponen la Web Application y el RESTful API. La Web Application sigue la estructura del proyecto en Angular: un módulo por bounded context con las capas `domain`, `application`, `infrastructure` y `presentation`, más los elementos compartidos de `shared`. El módulo `manufacturing` recibe el código leído por el Lector RFID en el registro de la recepción de insumos.

![Component Diagram - Web Application](../assets/img/chapter4/software-architecture/c4/c4-03-webapp-components.png)

En el RESTful API cada bounded context es un paquete de Spring Boot con cuatro capas: `interfaces` (controladores REST y fachadas ACL), `application` (command services, query services, event handlers y servicios ACL de salida), `domain` (aggregates, entities, value objects, commands, queries y domain services) e `infrastructure` (repositorios Spring Data JPA e integraciones externas).

**Identity & Access Management.** `AuthenticationController` atiende sign-up, sign-in y la verificación 2FA; `BearerAuthorizationRequestFilter` valida el JWT en cada request; `UserCommandServiceImpl` da de alta usuarios, asigna roles y bloquea cuentas; `SignatureCommandServiceImpl` registra firmas electrónicas. `IamContextFacade` expone estas capacidades a los demás contextos.

![Component Diagram - IAM](../assets/img/chapter4/software-architecture/c4/c4-04-api-iam-components.png)

**Organizations & Profiles.** Registra organizaciones, plantas, perfiles y las consultas del formulario de contacto de la Landing Page; al registrar una organización pide a IAM crear su administrador mediante `ExternalIamService`.

![Component Diagram - Organizations](../assets/img/chapter4/software-architecture/c4/c4-05-api-organizations-components.png)

**Subscriptions & Payments.** Gestiona planes y suscripciones; `NiubizPaymentGateway` autoriza los cobros y `SubscriptionRenewalScheduler` renueva las suscripciones vencidas.

![Component Diagram - Subscriptions](../assets/img/chapter4/software-architecture/c4/c4-06-api-subscriptions-components.png)

**Manufacturing & Batch Management.** Gestiona productos, fórmulas, insumos, órdenes y lotes; solicita a Quality la aprobación de insumos y la cuarentena del lote, y actualiza sus aggregates cuando recibe los eventos `MaterialApprovalDecided` y `BatchReleaseDecided`.

![Component Diagram - Manufacturing](../assets/img/chapter4/software-architecture/c4/c4-07-api-manufacturing-components.png)

**IoT Monitoring.** `TelemetryWebhookController` recibe las lecturas de ThingsBoard, `AlertRuleEvaluator` compara cada lectura con los rangos permitidos y `NotificationService` publica las alertas por WebSocket y por correo.

![Component Diagram - IoT Monitoring](../assets/img/chapter4/software-architecture/c4/c4-08-api-iot-components.png)

**Quality & Compliance.** Gestiona documentos, dictamen de insumos, revisión y liberación de lotes, resultados analíticos, desviaciones, CAPA y auditorías. `AuditTrailEntityListener` registra cada cambio de las entidades de todos los contextos y `ReportGenerationServiceImpl` genera expedientes y reportes en PDF con OpenPDF.

![Component Diagram - Quality & Compliance](../assets/img/chapter4/software-architecture/c4/c4-09-api-quality-components.png)

## 4.7. Software Object-Oriented Design

El diseño orientado a objetos traduce los aggregates del Design-Level EventStorming a clases Java del RESTful API. Se aplicaron estas convenciones:

- Cada aggregate root extiende `AuditableAbstractAggregateRoot`, que aporta el identificador `Long id` y las fechas `createdAt` y `updatedAt` (en los diagramas, `id` se muestra en cada aggregate y la clase base solo en IAM).
- Las entities internas de un aggregate se acceden solo a través de su raíz; los value objects (por ejemplo, `BatchNumber`, `Quantity`, `Money`, `Ruc`) se implementan como Java records inmutables.
- Los nombres siguen la Google Java Style Guide: clases en PascalCase, atributos y métodos en camelCase y constantes de enumeraciones en UPPER_SNAKE_CASE. Los getters se generan con Lombok y no se muestran.
- Los cambios de estado se solicitan con commands (`CreateBatchCommand`, `CloseDeviationCommand`, etc.) atendidos por command services; las consultas usan query services. Los repositorios son interfaces de Spring Data JPA.
- Las relaciones entre contextos se modelan por identificador (`batchId`, `userId`) y no por referencia directa, respetando los límites de cada bounded context.

### 4.7.1. Class Diagrams

**Identity & Access Management.** `User` es el aggregate root de la identidad: controla su estado (`INVITED`, `ACTIVE`, `LOCKED`, `DISABLED`), sus roles y los intentos fallidos de inicio de sesión. `ElectronicSignature` registra quién firmó qué registro y con qué significado. Los servicios de tokens (JWT), hashing (BCrypt) y TOTP se definen como interfaces implementadas en la capa de infraestructura.

![Class Diagram - IAM](../assets/img/chapter4/diagram-class/class-01-iam.png)

**Organizations & Profiles.** `Organization` agrupa sus plantas y se identifica por el value object `Ruc`; `Profile` guarda los datos y preferencias de cada usuario; `ContactInquiry` registra las consultas enviadas desde el formulario de contacto de la Landing Page y, mediante una policy, avisa al equipo de DoofPlus.

![Class Diagram - Organizations & Profiles](../assets/img/chapter4/diagram-class/class-02-organizations.png)

**Subscriptions & Payments.** `Subscription` controla el ciclo de vida de la suscripción y sus pagos; `Plan` define precios y límites. `PaymentGateway` abstrae la pasarela y `NiubizPaymentGateway` la implementa.

![Class Diagram - Subscriptions & Payments](../assets/img/chapter4/diagram-class/class-03-subscriptions.png)

**Manufacturing & Batch Management.** `ProductionBatch` es el aggregate central del dominio: concentra el ciclo de vida del lote (`PLANNED` a `RELEASED` o `REJECTED`), sus consumos de insumos, parámetros de proceso, incidencias y su línea de tiempo (`BatchEvent`). `ProductionOrder`, `MasterFormula`, `Product` y `RawMaterialLot` completan el contexto.

![Class Diagram - Manufacturing & Batch Management](../assets/img/chapter4/diagram-class/class-04-manufacturing.png)

**IoT Monitoring.** `Equipment` mantiene su historial de calibraciones y mantenimientos y define si está apto para producción; `IoTDevice` representa un sensor de ThingsBoard asignable a un lote; `TelemetryReading` guarda cada lectura y `AlertRuleEvaluator` genera las alertas.

![Class Diagram - IoT Monitoring](../assets/img/chapter4/diagram-class/class-05-iot.png)

**Quality & Compliance.** `QualityDocument` gestiona versiones y aprobación de SOP y protocolos; `MaterialApproval` registra el dictamen de cada lote de insumo; `BatchReview` controla la cuarentena, evaluación y liberación del lote y emite el `ReleaseCertificate`; `AnalyticalResult` calcula el resultado y detecta los OOS. `Deviation` controla la clasificación, investigación, causa raíz y acciones CAPA hasta su cierre; `Audit` registra hallazgos y observaciones; `AuditTrailEntry`, de solo inserción, persiste el read model "Audit trail" del Design-Level EventStorming; `RegulatoryReport` guarda los reportes generados.

![Class Diagram - Quality & Compliance](../assets/img/chapter4/diagram-class/class-06-quality.png)

## 4.8. Database Design

La base de datos de DoofPlus se implementa en MySQL 8 y se genera a partir de las entidades JPA del RESTful API. Sus principales características son:

- **Organización por bounded context:** cada contexto tiene su propio conjunto de tablas, que corresponde a sus aggregates. Dentro de un contexto se usan llaves foráneas; entre contextos las referencias son lógicas (solo el identificador) y se marcan como "ref <contexto>.<tabla>" en los diagramas.
- **Convenciones:** nombres en inglés, en snake_case y en plural, aplicados con la estrategia `SnakeCaseWithPluralizedTablePhysicalNamingStrategy`; llaves primarias `bigint AUTO_INCREMENT`; restricciones `NOT NULL`, `UNIQUE` y estados como enumeraciones en texto.
- **Auditoría e integridad:** todas las tablas incluyen `created_at` y `updated_at` (omitidos en los diagramas); `audit_trail_entries` es de solo inserción y `electronic_signatures` conserva las firmas de cada registro, en línea con los principios ALCOA y 21 CFR Part 11.

### 4.8.1. Database Diagrams

Los diagramas se elaboraron con Mermaid (Diagram-as-Code), uno por bounded context:

| Bounded context | Tablas | Aggregates que persiste |
| --- | --- | --- |
| IAM | users, roles, user_roles, electronic_signatures | User, ElectronicSignature |
| Organizations & Profiles | organizations, plants, profiles, contact_inquiries | Organization, Profile, ContactInquiry |
| Subscriptions & Payments | plans, subscriptions, payments | Plan, Subscription |
| Manufacturing & Batch Management | products, master_formulas, formula_components, raw_material_lots, production_orders, production_batches, material_consumptions, process_parameters, incidents, batch_events | Product, MasterFormula, RawMaterialLot, ProductionOrder, ProductionBatch |
| IoT Monitoring | equipment, calibration_records, maintenance_records, iot_devices, telemetry_readings, alert_rules, alerts | Equipment, IoTDevice, TelemetryReading, Alert |
| Quality & Compliance | quality_documents, document_versions, material_approvals, analytical_results, batch_reviews, evidence_attachments, release_certificates, deviations, capa_actions, audits, audit_findings, audit_trail_entries, regulatory_reports | QualityDocument, MaterialApproval, AnalyticalResult, BatchReview, Deviation, Audit, AuditTrailEntry, RegulatoryReport |

**Identity & Access Management**

![Database Diagram - IAM](../assets/img/chapter4/database/db-01-iam.png)

**Organizations & Profiles**

![Database Diagram - Organizations](../assets/img/chapter4/database/db-02-organizations.png)

**Subscriptions & Payments**

![Database Diagram - Subscriptions](../assets/img/chapter4/database/db-03-subscriptions.png)

**Manufacturing & Batch Management**

![Database Diagram - Manufacturing](../assets/img/chapter4/database/db-04-manufacturing.png)

**IoT Monitoring**

![Database Diagram - IoT](../assets/img/chapter4/database/db-05-iot.png)

**Quality & Compliance (documentos, insumos, resultados, liberación, desviaciones, CAPA, auditorías y reportes)**

![Database Diagram - Quality & Compliance](../assets/img/chapter4/database/db-06-quality.png)

La fuente Structurizr DSL de los diagramas C4 se encuentra en `assets/diagrams/structurizr/workspace.dsl`, y las fuentes Mermaid de los diagramas de clases y de base de datos, en `assets/diagrams/mermaid`.
