# Capítulo IV: Product Design

En este capítulo se detallan las decisiones de diseño del producto para su plataforma DoofPlus, junto con la Landing Page. Se establecen guías de estilo visuales, arquitectura de la información (AI) y criterios que aseguran que la experiencia de usuario (UX) sea intuitiva y profesional, donde alineamos a las exigencias en las máquinas de la industria farmacéutica y entidades regulatorias para la calidad de los fármacos como la DIGEMID.

## 4.1. Style Guidelines

En esta sección se establecen las bases visuales y de comunicación para DoofPlus, centralizando los recursos que serán de uso común para todo el equipo de desarrollo y diseño. El objetivo es garantizar una presentación consistente, inclusiva y enfocada a través de todos los puntos de contacto del producto, facilitando la mantenibilidad y escalabilidad del código y del diseño a lo largo del ciclo de vida del proyecto.

### 4.1.1. General Style Guidelines

Para asegurar una interfaz coherente y alineada con los estándares que exige la industria farmacéutica, el sistema de diseño de DoofPlus toma como base **Material Design**, el lenguaje de diseño indicado para el proyecto. En la Web Application se implementa con **Angular CLI** usando un tema basado en **Material Design**, y en la Landing Page con ***HTML5*** y ***CSS3*** respetando los mismos tokens de color, tipografía y espaciado.

#### Branding:
El logotico escogido para DoofPlus comunica de forma directa y sintética la propuesta de valor del sistema: la integración de la automatización industrial con la rigurosidad del control farmacéutico. Para la sección de Branding, el análisis de los componentes de dicho logotipo se desglosa de la siguiente manera:

<p align="center">
  <img src="../assets/img/chapter4/doofplus-logo.png" alt="DoofPlus Logo" width="350px" />
</p>

- **Maquinaria y cinta transportadora:** la silueta industrial con cápsulas en la cinta representa el núcleo operativo de la plataforma: la manufactura y la conexión IoT en la línea de producción.
- **Escudo de verificación:** representa el aseguramiento de la calidad y transmite protección de los datos y cumplimiento de las BPM exigidas por DIGEMID.
- **Construcción tipográfica y cromática:** el nombre DoofPlus usa una fuente sans-serif sólida; “Doof” en azul pizarra oscuro (#0F172A) evoca la base tecnológica y “Plus” en verde marino (#0D9488) conecta con la salud y la validación de procesos.

#### Typography
La tipografía de DoofPlus es Inter, una fuente sans-serif moderna y legible con pesos de Thin a Black y sus versiones itálicas. Su diseño garantiza una lectura clara de datos numéricos críticos, tablas de lotes y gráficos de telemetría tanto en monitores como en dispositivos móviles. La jerarquía tipográfica es la siguiente:

![Typography](../assets/img/chapter4/typography-guide.jpg)

| **Elemento** | **Tamaño (desktop)** | **Peso** | **Uso** |
| --- | --- | --- | --- |
| H1 – Section heading | 3rem (48 px) | Extra Bold / Black | Títulos principales |
| H2 – Sub-heading | 2rem (32 px) | Bold / Semi Bold | Subtítulos de sección |
| H3 / H4 | 1.25–1.5rem (20–24 px) | Medium | Títulos de componentes y tarjetas |
| Body / td | 1rem (16 px), interlineado 1.5 | Regular | Texto y tablas de datos |
| Botones y etiquetas de estado | 0.875rem (14 px) | Medium / Semi Bold | Acciones y estados |

#### Colors
La paleta de colores de DoofPlus está diseñada para evocar pulcritud clínica, seguridad tecnológica y control absoluto sobre los procesos. Se distribuye en tres categorías:

| **Token** | **Valor** | **Categoría** | **Uso** |
| --- | --- | --- | --- |
| --primary-color | #0D9488 (verde marino) | Principal | Llamadas a la acción, enlaces y elementos activos |
| --accent-color | #0F766E (verde azulado oscuro) | Principal | Estados hover y énfasis |
| --secondary-color | #0F172A (azul pizarra oscuro) | Principal | Texto principal, header y footer |
| --tertiary-color | #64748B (gris pizarra) | Soporte | Texto secundario y bordes |
| --bg-light | #F8FAFC | Soporte | Fondos de secciones y dashboard |
| --bg-highlight | #F0FDFA | Soporte | Fondos destacados |
| --card-bg | #FFFFFF | Soporte | Tarjetas y tablas |
| --success-color | #4CAF50 | Funcional | Confirmaciones y lotes aprobados |
| --error-color | #F44336 | Funcional | Errores, rechazos y desviaciones críticas |
| --warning-color | #FFC107 | Funcional | Advertencias y alertas |

![paleta-colores](../assets/img/chapter4/color-palette.png)

#### Spacing

El espaciado se rige por la cuadrícula de 8 puntos de Material Design, que asegura un ritmo vertical constante y facilita la lectura rápida de reportes técnicos:

- **Padding de secciones:** 40 a 48 px en áreas de trabajo y dashboards.
- **Espacio entre elementos:** 16 a 24 px entre tarjetas de métricas y controles de filtro.
- **Interlineado:** 1.5 en párrafos y 1.2 en celdas de tablas de datos.

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
- Botones: las llamadas a la acción (CTA) usan el color primario (#0D9488) con texto blanco; las acciones secundarias usan botones outlined. Los estados hover, focus (con contorno visible para teclado), active y disabled están definidos para asegurar la accesibilidad. Las acciones destructivas o de rechazo de lotes usan el color de error y piden confirmación.
- Formularios y Validaciones: Los formularios de captura de datos integran validación en tiempo real. Utilizan contornos verdes para datos correctos y mensajes de error descriptivos en rojo debajo de los campos obligatorios incompletos, lo que garantiza una integridad de los datos antes del envío a la base de datos.

4. Images and Icons
- Imágenes: En la Landing Page se utilizan fotografías de alta calidad, optimizadas en formato WebP, que evocan el entorno de manufactura: líneas de producción automatizadas, laboratorios esterilizados y operarios utilizando tablets. Refuerzan el mensaje de tecnología aplicada al cumplimiento BPM.
- Íconos: Se emplea la biblioteca Material Symbols para un estilo lineal y minimalista. Estos íconos ofrecen una guía visual rápida para representar servicios críticos: un microchip o antena para la telemetría, un escudo con un símbolo de check para el cumplimiento regulatorio y cápsulas o maquinaria para la gestión de producción.

5. Repositorio Central
- Organización: el proyecto de la Web Application (Vue 3 + Vite) se organiza por bounded context: src/iam, src/manufacturing, src/quality, src/iot, src/subscriptions y src/organizations, cada uno con sus carpetas model, services, components y pages. Los recursos estáticos se ubican en src/assets (images, icons), los estilos globales y design tokens en src/assets/styles, los componentes reutilizables en src/shared/components y las traducciones en src/locales (en.json y es.json).
- Versionado: Se utiliza Git gestionado desde GitHub como sistema de control de versiones central. El equipo aplica GitFlow y Conventional Commits para gestionar los cambios en el código, lo que ayuda a garantizar que el entorno de desarrollo mantenga una integración continua y una versión estable del producto en todo momento. Además, se aplica Semantic Versioning para darle un orden a las versiones.


## 4.2. Information Architecture

La arquitectura de la información de DoofPlus establece las decisiones que dirigen la organización del contenido en las experiencias web, lo que está orientado a que tanto los visitantes del sector comercial como los usuarios operativos, que forman parte de los segmentos objetivos, se adapten con facilidad a la funcionalidad del producto y puedan encontrar lo que necesitan sin esfuerzo.

### 4.2.1. Organization Systems

Para estructurar los grupos de información de la plataforma se aplican los siguientes sistemas de organización y esquemas de categorización:

- **Organización jerárquica (visual hierarchy):** en la Landing Page el contenido va de mayor a menor impacto: propuesta de valor (Home), servicios, características, beneficios, equipo, planes y contacto.
- **Organización secuencial (step-by-step):** en la Web Application para flujos regulados, como la liberación de un lote (cuarentena → evaluación de resultados → firma electrónica → certificado).
- **Organización matricial:** en los dashboards, que cruzan lotes, variables de equipos e indicadores de cumplimiento.
- **Categorización cronológica:** en el audit trail, la línea de tiempo del lote y la telemetría IoT, ordenados por fecha y hora.
- **Categorización por tópicos:** en el repositorio documental (protocolos, SOP, especificaciones) y en la navegación por módulos.
- **Categorización por audiencia:** en la Landing Page (llamadas a la acción para QA/QC y para Producción) y en la Web Application (entornos de calidad y de producción según el rol).

### 4.2.2. Labeling Systems

Para asegurar la simplicidad y evitar la confusión de los visitantes y usuarios, la representación de los datos se realiza mediante etiquetas que utilizan el mínimo número de palabras posibles, lo que representa la terminología técnica de la industria farmacéutica:

- Landing Page: Se emplean asociaciones de uso estándar como "Features" (para módulos técnicos), "Pricing" (para los planes) y "Request Demo" (para el contacto comercial).
- Web Application: Las etiquetas operativas evitan ambigüedades. Se utiliza "Lotes" (agrupando el historial de fabricación), "Cuarentena" (asociado a la evaluación de calidad), "Desviaciones" (asociado a alertas IoT y errores) y "Audit Trail" (asociado al registro inmutable de auditoría).

### 4.2.3. SEO Tags and Meta Tags

Para el posicionamiento y la indexación correcta de las principales páginas de la experiencia web, se asignan los siguientes valores mínimos exigidos:

Valores para la Landing Page (sitio estático indexable):

| **Página** | **Title** | **Meta description** | **Meta keywords** | **Author** |
| --- | --- | --- | --- | --- |
| Landing Page (index.html) | DoofPlus \| Pharmaceutical Quality & Batch Traceability Platform | SaaS platform that centralizes quality documentation, batch traceability, deviations and IoT data for pharmaceutical laboratories (GMP/DIGEMID). | pharmaceutical quality management, batch traceability, GMP, DIGEMID, CAPA, audit trail, IoT | IngesCompany |

Valores para las vistas principales de la Web Application. Al ser una SPA, el título y la descripción se actualizan en cada cambio de ruta (meta de Vue Router); keywords y author se definen una vez en index.html con los mismos valores de la Landing Page:

| **Vista de la Web Application** | **Title** | **Meta description** |
| --- | --- | --- |
| Sign in | Sign in \| DoofPlus | Secure access to DoofPlus with two-factor authentication. |
| Quality dashboard | Quality Dashboard \| DoofPlus | Pending batches, open deviations and quality indicators. |
| Production dashboard | Production Console \| DoofPlus | Active production orders, batch status and alerts. |
| Batch detail | Batch {batchNumber} \| DoofPlus | Complete traceability timeline of a pharmaceutical batch. |
| Deviations & CAPA | Deviations & CAPA \| DoofPlus | Register, investigate and close deviations with CAPA. |

### 4.2.4. Searching Systems

Para que los usuarios no se pierdan en el volumen de información generado por la producción y la telemetría, la Web Application ofrece:

- **Búsqueda global:** barra en el encabezado para consultar por identificador exacto (número de lote, código de documento o de sensor).
- **Filtros combinados:** por estado del lote (In Progress, Quarantine, Released, Rejected), rango de fechas de fabricación, severidad de la desviación (Minor, Major, Critical) y tipo de documento.
- **Presentación de resultados:** tabla de datos (PrimeVue DataTable) paginada y ordenable que resalta la coincidencia y muestra el estado actual de cada registro; si no hay resultados se muestra un mensaje con sugerencias.

### 4.2.5. Navigation Systems

Las acciones y técnicas que guían a los usuarios son:

1. ***Landing Page:***
- **Navegación por anclas:** barra superior fija con enlaces a cada sección y desplazamiento suave; en mobile, menú desplegable.
- **Llamadas a la acción por segmento:** cada segmento tiene una llamada a la acción que lo redirige a la vista de ingreso de su entorno en la Web Application.

2. ***Web Application:***
- **Navegación global:** barra lateral (sidebar) con los módulos del entorno (Dashboard, Batches, Documents, Deviations & CAPA, Monitoring, Reports).
- **avegación contextual:** breadcrumbs para ubicar al usuario dentro de un expediente y regresar a vistas generales.

3. **Navegación por teclado y accesibilidad:** orden de tabulación lógico, foco visible y atributos ARIA en menús y diálogos.

## 4.3. Landing Page UI Design

La propuesta de UI de la Landing Page traduce las decisiones anteriores: la jerarquía visual ordena el contenido desde la propuesta de valor hasta el contacto; las etiquetas (Features, Benefits, About Us, Plans) siguen el Labeling System; la barra fija con anclas implementa el Navigation System; y el Design System (Material Design, Inter, paleta verde marino y azul pizarra) se aplica de forma consistente con la Web Application.

### 4.3.1. Landing Page Wireframe

El wireframe de nuestra página de inicio sirve como un mapa visual que define la estructura y el flujo de la información, alineado con los principios de rigurosidad y claridad que exige el sector farmacéutico. Este esquema asegura una disposición lógica de los componentes, facilitando la navegación y destacando la propuesta de valor de **DoofPlus.** Las secciones del wireframe están diseñadas para contar una historia completa y persuasiva:

**Nav y Hero:**

Esta sección inicial incluye el logotipo de DoofPlus junto con una presentación breve que introduce al visitante en la propuesta de valor de la plataforma: 'The Future of Pharmaceutical Quality Management' (El futuro de la gestión de calidad farmacéutica). La barra de navegación permite un acceso rápido a secciones clave como Features, Benefits y About Us, mientras que el área principal ofrece una visión concisa del producto, acompañada de un claro llamado a la acción: 'Request a Demo' (Solicitar Demo). Un elemento visual atractivo refuerza el mensaje de innovación tecnológica, precisión y cumplimiento regulatorio que distingue a DoofPlus.

![Hero Section Wireframe](../assets/img/chapter4/landing-page/wireframes/hero-section-landing-wireframe.png)

**Services (What We Offer):**

Aquí se detallan los servicios principales de DoofPlus: Real-Time IoT Monitoring, Automated BPM Compliance, Immutable Traceability y Digital Batch Management. Cada servicio se presenta con un icono representativo y una breve descripción, haciendo que nuestra oferta sea fácil de entender y visualmente accesible.

![What We Offer Wireframe](../assets/img/chapter4/landing-page/wireframes/whatweoffer-section-landing-wireframe.png)

**Acerca de la aplicación (About the Platform):**

Esta sección presenta lo que hace única a DoofPlus: una plataforma para laboratorios farmacéuticos que automatiza el control de calidad mediante integración IoT, elimina errores manuales y garantiza la trazabilidad inmutable. Destacamos beneficios clave como captura automática de telemetría, alertas en tiempo real y cumplimiento nativo con normativas DIGEMID.

![Benefits Wireframe](../assets/img/chapter4/landing-page/wireframes/benefits-section-landing-wireframe.png)

**Sobre el Equipo (Our Team):**

En esta sección, se humaniza la marca al presentar al equipo detrás de DoofPlus (Inges Company). Con fotos y descripciones de los miembros, mostramos a las personas dedicadas a este proyecto, construyendo confianza y una conexión personal con los visitantes.

![Our Team Wireframe](../assets/img/chapter4/landing-page/wireframes/ourteam-section-landing-wireframe.png)

**Precios (Plans):**

La sección de Precios ofrece una visión clara de los planes disponibles. Presentamos el Standard Lab Plan y el Enterprise Plan, con una comparativa de características para ayudar a los usuarios a elegir la opción que mejor se adapte a sus necesidades, ya sea para un laboratorio mediano o para una institución de salud pública. Un selector entre tarifas mensuales y anuales, junto con la indicación del ahorro asociado, facilita una elección más informada.

![Plans Wireframe](../assets/img/chapter4/landing-page/wireframes/plans-section-landing-wireframe.png)

**Footer:**

El pie de página es un elemento crucial para la usabilidad. Contiene enlaces a información de contacto (correo electrónico, teléfono y ubicación). Esto proporciona un acceso rápido a la información sin saturar la interfaz, ofreciendo un cierre limpio y funcional a la página.

![Footer Wireframe](../assets/img/chapter4/landing-page/wireframes/footer-section-landing-wireframe.png)

Este wireframe sienta las bases para un diseño visual que no solo se ve bien, sino que también guía al usuario de manera intuitiva a través de nuestra propuesta de valor, reforzando la confianza y la conexión que DoofPlus promete.

### 4.3.2. Landing Page Mock-up

Esta sección presenta y explica los Mock-ups del Landing Page, tanto en su versión para Desktop Web Browser como Mobile Web Browser. En la propuesta y la explicación se evidencia la aplicación de los principios, elementos de diseño, diseño inclusivo y arquitectura de información, así como el Design System establecido para los productos digitales.

**Hero de la aplicación**

El hero de nuestra plataforma **DoofPlus** presenta un fondo moderno e institucional que evoca precisión tecnológica y cumplimiento normativo, con un título claro: 'The Future of Pharmaceutical Quality Management'. Una breve descripción capta nuestra esencia para el control de calidad, y un botón de llamado a la acción sólido y centrado ('Request a Demo') invita a los usuarios a dar el primer paso hacia la digitalización de sus procesos. Una barra de navegación en la parte superior con el logotipo de DoofPlus permite acceder de forma fluida a todas las secciones de la página, proporcionando una experiencia de usuario intuitiva.

![Hero Section Mockup](../assets/img/chapter4/landing-page/mockups/hero-section-landing-mockup.png)

**What We Offer**

En la sección 'What we offer', presentamos nuestras principales áreas de servicio a través de tarjetas limpias. Cada tarjeta cuenta con un título y una descripción enfocada, como 'Real-Time IoT Monitoring', 'Automated BPM Compliance', 'Immutable Traceability' y 'Digital Batch Management'. Esto permite a los usuarios entender rápidamente el alcance de nuestra plataforma para resolver los problemas de documentación de calidad farmacéutica.

![What We Offer Mockup](../assets/img/chapter4/landing-page/mockups/whatweoffer-section-landing-mockup.png)

**Features**

La sección de "Features" muestra las funcionalidades clave de DoofPlus. El diseño tipo acordeón interactivo permite a los usuarios expandir cada característica (como la integración de sensores IoT o alertas instantáneas por desviación) para leer su descripción completa, mientras que el recuadro visual de la izquierda balancea el contenido. Este formato combina información técnica detallada con un diseño dinámico.

![Features Mockup](../assets/img/chapter4/landing-page/mockups/features-section-landing-mockup.png)

**Benefits**

En 'Benefits', destacamos las ventajas tangibles de utilizar DoofPlus. A través de un diseño de tarjetas (cards) sobre fondo claro con íconos representativos, comunicamos de manera directa cómo nuestra plataforma reduce el tiempo de preparación para auditorías en un 80%, elimina el error humano en los registros y proporciona una infraestructura SaaS escalable.

![Benefits Mockup](../assets/img/chapter4/landing-page/mockups/benefits-section-landing-mockup.png)

**About Us**

La sección 'About Us' presenta a **Inges Company**, la startup detrás de DoofPlus. Aquí compartimos nuestra visión de transformar digitalmente procesos especializados, detallando cómo nuestra solución permite centralizar información para el ciclo de vida farmacéutico y asegurar las BPM. El diseño separa claramente la misión de la empresa de una lista puntual con los pilares del servicio (IoT, Trazabilidad, Cumplimiento).

![About Us Mockup](../assets/img/chapter4/landing-page/mockups/aboutus-section-landing-mockup.png)

**Our Team**

La sección "Our Team" presenta a los ingenieros de software detrás de Inges Company: Marcelo Angulo, Yhoshua Cobades, Ricardo Flores, Nestor Rojas y Rodolfo Zavaleta. Las tarjetas de perfil muestran una foto, el nombre, el rol de Software Engineer y una biografía detallada para cada miembro. El diseño de tarjetas alineadas en cuadrícula brinda un aspecto organizado, humanizando el desarrollo del software.

![Our Team Mockup](../assets/img/chapter4/landing-page/mockups/ourteam-section-landing-mockup.png)

**Plans**

En la sección de "Plans", ofrecemos los detalles de nuestros planes de suscripción. Las tarjetas de "Standard Lab" y "Enterprise" incluyen descripciones precisas para los segmentos objetivos, precios mensuales/anuales, y listas completas de características. El Plan Enterprise destaca visualmente con el color Verde Marino principal como fondo sólido para distinguirlo, y se incorpora un toggle para facilitar la vista de precios anuales.

![Plans Mockup](../assets/img/chapter4/landing-page/mockups/plans-section-landing-mockup.png)

**Footer**

El "Footer" de nuestra landing page actúa como cierre funcional de la navegación. Contiene el logotipo en su versión blanca y el nombre de DoofPlus, enlaces de contacto y acceso a recursos. Finalmente, se observa la declaración oficial "Copyright © 2026 Inges Company", asegurando la propiedad del producto en una interfaz ordenada con los colores oscuros corporativos.

![Footer Mockup](../assets/img/chapter4/landing-page/mockups/footer-section-landing-mockup.png)

## 4.4. Web Applications UX/UI Design

La presente sección describe el diseño de experiencia de usuario (UX) e interfaz de usuario (UI) desarrollado para la plataforma web DoofPlus. La propuesta fue diseñada para apoyar la gestión integral de calidad farmacéutica bajo entornos regulados GxP, facilitando la administración documental, la trazabilidad de procesos productivos, la gestión de desviaciones y el monitoreo operativo de laboratorios y líneas de manufactura.

El diseño considera principios de usabilidad, accesibilidad, consistencia visual y eficiencia operativa, asegurando que los diferentes perfiles de usuario puedan ejecutar actividades críticas relacionadas con el cumplimiento normativo, la liberación de lotes y la auditoría regulatoria.

### 4.4.1. Web Applications Wireframes

En esta sección se presentan los wireframes diseñados para la aplicación web de DoofPlus. Cada pantalla fue desarrollada para gestionar procesos de calidad farmacéutica, producción regulada GxP, trazabilidad de lotes, control documental y cumplimiento normativo mediante firmas electrónicas y registros auditables.

A continuación, se muestran las representaciones esquemáticas de baja fidelidad que describen la estructura, distribución de componentes y funcionalidades principales de cada módulo de la plataforma.

- **Landing Page - DoofPlus**

Pantalla de presentación de la plataforma que comunica la propuesta de valor de DoofPlus y permite acceder al portal especializado para gestión de calidad y producción farmacéutica bajo normativas GxP.

![Wireframe](../assets/img/chapter4/prototype/wireframes/Landing%20Page.png)

- **Regulatory Identification - DoofPlus**

Pantalla de autenticación regulatoria que solicita las credenciales corporativas y la firma electrónica necesarias para acceder a funcionalidades sujetas a cumplimiento FDA 21 CFR Part 11 y normativas GxP.

![Wireframe](../assets/img/chapter4/prototype/wireframes/Login.png)

- **Environment Selection Portal - DoofPlus**

Interfaz que permite seleccionar el entorno de trabajo autorizado, diferenciando entre el segmento de calidad (QA/QC) y el entorno de producción farmacéutica.

![Wireframe](../assets/img/chapter4/prototype/wireframes/Selección%20de%20Espacio.png)

- **QA & Lab Console Dashboard - DoofPlus**

Panel principal para usuarios de calidad que centraliza la supervisión de lotes pendientes, ensayos analíticos, desviaciones abiertas y actividades del laboratorio.

![Wireframe](../assets/img/chapter4/prototype/wireframes/Dashboard%20Calidad.png)

- **Document Management & Master SOPs - DoofPlus**

Repositorio documental diseñado para gestionar procedimientos operativos estándar (SOPs), registros electrónicos, certificados de análisis y documentación regulatoria controlada.

![Wireframe](../assets/img/chapter4/prototype/wireframes/Documentación.png)

- **Quality Protocols & Validation Management - DoofPlus**

Módulo destinado a la administración de protocolos de validación, cualificación de equipos y seguimiento de actividades relacionadas con IQ, OQ y PQ.

![Wireframe](../assets/img/chapter4/prototype/wireframes/Protocolos.png)

- **Critical Deviations & CAPA Actions Control - DoofPlus**

Pantalla de seguimiento de desviaciones críticas, análisis de impacto GMP y control de acciones correctivas y preventivas (CAPA).

![Wireframe](../assets/img/chapter4/prototype/wireframes/Desviaciones.png)

- **Process Audit Master Plan - DoofPlus**

Módulo para planificar, ejecutar y monitorear auditorías internas, inspecciones regulatorias y hallazgos asociados al cumplimiento GMP.

![Wireframe](../assets/img/chapter4/prototype/wireframes/Auditorías.png)

- **GxP Regulatory Reports & Metrics - DoofPlus**

Panel de análisis que permite generar reportes regulatorios, revisar métricas de desempeño y exportar información validada para auditorías e inspecciones.

![Wireframe](../assets/img/chapter4/prototype/wireframes/Reportes.png)

- **Analytical Testing & Microbiology Control (QC) - DoofPlus**

Pantalla de control de ensayos analíticos y microbiológicos que permite gestionar muestras, equipos de laboratorio y resultados fuera de especificación (OOS).

![Wireframe](../assets/img/chapter4/prototype/wireframes/Ensayos.png)

- **Analytical Results Entry & Validation - DoofPlus**

Interfaz destinada al registro y validación de resultados analíticos, integrando verificación de especificaciones y aprobación mediante firma electrónica.

![Wireframe](../assets/img/chapter4/prototype/wireframes/Resultados.png)

- **Pharmaceutical Batch History & Traceability - DoofPlus**

Módulo de consulta histórica que permite rastrear lotes farmacéuticos, consultar estados regulatorios y acceder a certificados de análisis.

![Wireframe](../assets/img/chapter4/prototype/wireframes/Historial%20de%20Lotes.png)

- **Cross-Traceability & Audit Center - DoofPlus**

Centro de trazabilidad que integra genealogía de lotes, registros de laboratorio, documentación asociada y auditoría completa de eventos regulatorios.

![Wireframe](../assets/img/chapter4/prototype/wireframes/Centro%20de%20Trazabilidad.png)

- **GxP Production Control Console - DoofPlus**

Panel principal del entorno de producción que permite supervisar órdenes activas, progreso de eBR y estado de los procesos de manufactura.

![Wireframe](../assets/img/chapter4/prototype/wireframes/Dashboard%20Producción.png)

- **GxP Batch Execution & Management Console - DoofPlus**

Interfaz para la gestión operativa de lotes de fabricación, incluyendo seguimiento de etapas de producción, firmas electrónicas y responsables asignados.

![Wireframe](../assets/img/chapter4/prototype/wireframes/Gestión%20de%20Lotes.png)

- **GxP Incident Registration & Deviation Management - DoofPlus**

Módulo de registro de incidencias que permite documentar eventos de desviación, adjuntar evidencias y gestionar acciones de contención.

![Wireframe](../assets/img/chapter4/prototype/wireframes/Incidencias.png)

- **GxP Profile & Regulatory Credentials - DoofPlus**

Pantalla de perfil regulatorio donde los usuarios administran credenciales, firmas electrónicas y permisos asociados a los distintos contextos del sistema.

![Wireframe](../assets/img/chapter4/prototype/wireframes/Perfil.png)

- **General Settings & GxP Policies - DoofPlus**

Módulo de configuración orientado a la administración de políticas GxP, parámetros de seguridad, auditorías internas y canales de notificación regulatoria.

![Wireframe](../assets/img/chapter4/prototype/wireframes/Configuración.png)

### 4.4.2. Web Applications Wireflow Diagrams

Los Wireflow Diagrams se utilizan para representar visualmente la navegación y las interacciones que realizan los usuarios dentro de una aplicación para alcanzar un objetivo determinado. Estos diagramas combinan wireframes y flujos de usuario, permitiendo visualizar las diferentes pantallas involucradas en cada proceso y la secuencia de acciones necesarias para completar una tarea.

Para DoofPlus se desarrollaron distintos Wireflow Diagrams basados en los principales objetivos de los usuarios dentro de un entorno farmacéutico regulado por normas GxP. Cada diagrama describe el flujo que siguen los usuarios para gestionar procesos de producción, control de calidad, documentación regulatoria, trazabilidad y cumplimiento normativo.

#### Segmento 1 – Especialista de Aseguramiento y Control de Calidad (QA/QC)

**User Goal QA-1:** Ingresar a DoofPlus y acceder al entorno de calidad.

Como especialista QA/QC, quiero ingresar con mis credenciales y seleccionar el entorno de calidad para revisar mis pendientes.

Flujo: Landing Page → Regulatory Identification → Environment Selection Portal → QA & Lab Console.

![Wireflow QA-1: Ingresar a DoofPlus y acceder al entorno de calidad](../assets/img/chapter4/prototype/wireflow-diagrams/segmento-1-user-goal-1.png)

**User Goal QA-2:** Gestionar documentación y protocolos de validación.

Como especialista QA/QC, quiero gestionar SOP y protocolos de validación para mantener documentos controlados y vigentes.

Flujo: QA & Lab Console → Document Management & Master SOPs → Quality Protocols & Validation → GxP Regulatory Reports & Metrics.

![Wireflow QA-2: Gestionar documentación y protocolos de validación](../assets/img/chapter4/prototype/wireflow-diagrams/segmento-1-user-goal-2.png)

**User Goal QA-3:** Registrar una desviación y gestionar su CAPA.

Como especialista QA/QC, quiero registrar desviaciones y sus acciones CAPA para controlar los riesgos de calidad.

Flujo: QA & Lab Console → Critical Deviations & CAPA → Incident Registration & Deviation → GxP Regulatory Reports & Metrics.

![Wireflow QA-3: Registrar una desviación y gestionar su CAPA](../assets/img/chapter4/prototype/wireflow-diagrams/segmento-1-user-goal-3.png)

**User Goal QA-4:** Planificar una auditoría y reunir sus evidencias.

Como especialista QA/QC, quiero programar auditorías y reunir la documentación de soporte para responder a los inspectores.

Flujo: QA & Lab Console → Process Audit Master Plan → Document Management & Master SOPs → GxP Regulatory Reports & Metrics.

![Wireflow QA-4: Planificar una auditoría y reunir sus evidencias](../assets/img/chapter4/prototype/wireflow-diagrams/segmento-1-user-goal-4.png)

**User Goal QA-5:** Registrar y validar resultados analíticos.

Como especialista QA/QC, quiero registrar y validar resultados de ensayos para respaldar la liberación de los lotes.

Flujo: QA & Lab Console → Analytical & Microbiology Testing → Analytical Results Entry & Validation → Batch History & Traceability.

![Wireflow QA-5: Registrar y validar resultados analíticos](../assets/img/chapter4/prototype/wireflow-diagrams/segmento-1-user-goal-5.png)

**User Goal QA-6:** Consultar la trazabilidad completa de un lote.

Como especialista QA/QC, quiero consultar la genealogía y el audit trail de un lote para verificar la integridad de sus registros.

Flujo: QA & Lab Console → Batch History & Traceability → Cross-Traceability & Audit Center.

![Wireflow QA-6: Consultar la trazabilidad completa de un lote](../assets/img/chapter4/prototype/wireflow-diagrams/segmento-1-user-goal-6.png)

#### Segmento 2 – Jefe o Supervisor de Producción Farmacéutica

**User Goal PR-1:** Ingresar a DoofPlus y acceder al entorno de producción.

Como jefe de producción, quiero ingresar con mis credenciales y seleccionar el entorno de producción para supervisar las órdenes activas.

Flujo: Landing Page → Regulatory Identification → Environment Selection Portal → GxP Production Control Console.

![Wireflow PR-1: Ingresar a DoofPlus y acceder al entorno de producción](../assets/img/chapter4/prototype/wireflow-diagrams/segmento-2-user-goal-1.png)

**User Goal PR-2:** Gestionar la ejecución de un lote y consultar su historial.

Como jefe de producción, quiero actualizar las etapas de un lote y revisar su historial para mantener su trazabilidad.

Flujo: GxP Production Control Console → Batch Execution & Management → Batch History & Traceability.

![Wireflow PR-2: Gestionar la ejecución de un lote y consultar su historial](../assets/img/chapter4/prototype/wireflow-diagrams/segmento-2-user-goal-2.png)

**User Goal PR-3:** Monitorear equipos y condiciones ambientales.

Como jefe de producción, quiero supervisar las variables de los equipos y del ambiente para asegurar que la fabricación cumpla las BPM.

Flujo: GxP Production Control Console → Environmental & Equipment Monitoring → Batch Execution & Management.

![Wireflow PR-3: Monitorear equipos y condiciones ambientales](../assets/img/chapter4/prototype/wireflow-diagrams/segmento-2-user-goal-3.png)

**User Goal PR-4:** Registrar una incidencia de producción.

Como jefe de producción, quiero registrar incidencias y escalarlas a Calidad para que se gestionen como desviaciones.

Flujo: GxP Production Control Console → Incident Registration & Deviation → Critical Deviations & CAPA.

![Wireflow PR-4: Registrar una incidencia de producción](../assets/img/chapter4/prototype/wireflow-diagrams/segmento-2-user-goal-4.png)

**User Goal PR-5:** Consultar la trazabilidad de un lote para investigar un evento.

Como jefe de producción, quiero revisar los materiales y eventos de un lote para investigar una situación excepcional.

Flujo: GxP Production Control Console → Batch History & Traceability → Cross-Traceability & Audit Center.

![Wireflow PR-5: Consultar la trazabilidad de un lote para investigar un evento](../assets/img/chapter4/prototype/wireflow-diagrams/segmento-2-user-goal-5.png)

**User Goal PR-6:** Consultar reportes y métricas de producción.

Como jefe de producción, quiero consultar reportes y métricas para evaluar el desempeño de las líneas.

Flujo: GxP Production Control Console → GxP Regulatory Reports & Metrics.

![Wireflow PR-6: Consultar reportes y métricas de producción](../assets/img/chapter4/prototype/wireflow-diagrams/segmento-2-user-goal-6.png)

### 4.4.3. Web Applications Mock-ups

En esta sección se presentan los mock-ups desarrollados para la aplicación web de DoofPlus. Estas representaciones de alta fidelidad muestran la apariencia final de la plataforma, incorporando la identidad visual del producto, componentes interactivos y elementos orientados al cumplimiento regulatorio farmacéutico bajo estándares GMP y FDA 21 CFR Part 11.

Los mock-ups fueron diseñados considerando los procesos críticos de aseguramiento y control de calidad, manufactura farmacéutica, trazabilidad de lotes y gestión documental, garantizando una experiencia de usuario intuitiva y alineada con los requisitos de integridad de datos, auditoría y firmas electrónicas.

- **Landing Page - DoofPlus**

Pantalla de presentación de la plataforma que comunica la propuesta de valor de DoofPlus y permite acceder al portal especializado para gestión de calidad y producción farmacéutica bajo normativas GxP.

![Mockup](../assets/img/chapter4/prototype/mockup/Landing%20Page.png)

- **Regulatory Identification - DoofPlus**

Pantalla de autenticación regulatoria que solicita las credenciales corporativas y la firma electrónica necesarias para acceder a funcionalidades sujetas a cumplimiento FDA 21 CFR Part 11 y normativas GxP.

![Mockup](../assets/img/chapter4/prototype/mockup/Login.png)

- **Environment Selection Portal - DoofPlus**

Interfaz que permite seleccionar el entorno de trabajo autorizado, diferenciando entre el segmento de calidad (QA/QC) y el entorno de producción farmacéutica.

![Mockup](../assets/img/chapter4/prototype/mockup/Selección%20de%20Espacio.png)

- **QA & Lab Console Dashboard - DoofPlus**

Panel principal para usuarios de calidad que centraliza la supervisión de lotes pendientes, ensayos analíticos, desviaciones abiertas y actividades del laboratorio.

![Mockup](../assets/img/chapter4/prototype/mockup/Dashboard%20Calidad.png)

- **Document Management & Master SOPs - DoofPlus**

Repositorio documental diseñado para gestionar procedimientos operativos estándar (SOPs), registros electrónicos, certificados de análisis y documentación regulatoria controlada.

![Mockup](../assets/img/chapter4/prototype/mockup/Documentación.png)

- **Quality Protocols & Validation Management - DoofPlus**

Módulo destinado a la administración de protocolos de validación, cualificación de equipos y seguimiento de actividades relacionadas con IQ, OQ y PQ.

![Mockup](../assets/img/chapter4/prototype/mockup/Protocolos.png)

- **Critical Deviations & CAPA Actions Control - DoofPlus**

Pantalla de seguimiento de desviaciones críticas, análisis de impacto GMP y control de acciones correctivas y preventivas (CAPA).

![Mockup](../assets/img/chapter4/prototype/mockup/Desviaciones.png)

- **Process Audit Master Plan - DoofPlus**

Módulo para planificar, ejecutar y monitorear auditorías internas, inspecciones regulatorias y hallazgos asociados al cumplimiento GMP.

![Mockup](../assets/img/chapter4/prototype/mockup/Auditorías.png)

- **GxP Regulatory Reports & Metrics - DoofPlus**

Panel de análisis que permite generar reportes regulatorios, revisar métricas de desempeño y exportar información validada para auditorías e inspecciones.

![Mockup](../assets/img/chapter4/prototype/mockup/Reportes.png)

- **Analytical Testing & Microbiology Control (QC) - DoofPlus**

Pantalla de control de ensayos analíticos y microbiológicos que permite gestionar muestras, equipos de laboratorio y resultados fuera de especificación (OOS).

![Mockup](../assets/img/chapter4/prototype/mockup/Ensayos.png)

- **Analytical Results Entry & Validation - DoofPlus**

Interfaz destinada al registro y validación de resultados analíticos, integrando verificación de especificaciones y aprobación mediante firma electrónica.

![Mockup](../assets/img/chapter4/prototype/mockup/Resultados.png)

- **Pharmaceutical Batch History & Traceability - DoofPlus**

Módulo de consulta histórica que permite rastrear lotes farmacéuticos, consultar estados regulatorios y acceder a certificados de análisis.

![Mockup](../assets/img/chapter4/prototype/mockup/Historial%20de%20Lotes.png)

- **Cross-Traceability & Audit Center - DoofPlus**

Centro de trazabilidad que integra genealogía de lotes, registros de laboratorio, documentación asociada y auditoría completa de eventos regulatorios.

![Mockup](../assets/img/chapter4/prototype/mockup/Centro%20de%20Trazabilidad.png)

- **GxP Production Control Console - DoofPlus**

Panel principal del entorno de producción que permite supervisar órdenes activas, progreso de eBR y estado de los procesos de manufactura.

![Mockup](../assets/img/chapter4/prototype/mockup/Dashboard%20Producción.png)

- **GxP Batch Execution & Management Console - DoofPlus**

Interfaz para la gestión operativa de lotes de fabricación, incluyendo seguimiento de etapas de producción, firmas electrónicas y responsables asignados.

![Mockup](../assets/img/chapter4/prototype/mockup/Gestión%20de%20Lotes.png)

- **GxP Incident Registration & Deviation Management - DoofPlus**

Módulo de registro de incidencias que permite documentar eventos de desviación, adjuntar evidencias y gestionar acciones de contención.

![Mockup](../assets/img/chapter4/prototype/mockup/Incidencias.png)

- **GxP Profile & Regulatory Credentials - DoofPlus**

Pantalla de perfil regulatorio donde los usuarios administran credenciales, firmas electrónicas y permisos asociados a los distintos contextos del sistema.

![Mockup](../assets/img/chapter4/prototype/mockup/Perfil.png)

- **General Settings & GxP Policies - DoofPlus**

Módulo de configuración orientado a la administración de políticas GxP, parámetros de seguridad, auditorías internas y canales de notificación regulatoria.

![Mockup](../assets/img/chapter4/prototype/mockup/Configuración.png)

### 4.4.4. Web Applications User Flow Diagrams

Los User Flow Diagrams representan la secuencia de acciones que realizan los usuarios dentro de la plataforma para alcanzar un objetivo específico. Estos diagramas permiten visualizar la navegación entre módulos, las decisiones tomadas durante el proceso y los diferentes escenarios que pueden ocurrir durante la interacción con el sistema.

#### Segmento 1 – Especialista QA/QC

**User Goal QA-1:** Ingresar a DoofPlus y acceder al entorno de calidad.

Happy path: Landing Page (portal) → Regulatory Identification (2FA) → Environment Selection Portal → QA & Lab Console (Dashboard).

Unhappy paths: ¿Credenciales y código 2FA válidos? No → Mensaje "Credenciales inválidas"; tras 5 intentos la cuenta se bloquea 15 min | ¿El rol del usuario autoriza el entorno elegido? No → Mensaje "Acceso no autorizado para este entorno"; permanece en la selección.

![Segmento 1 - 1](../assets/img/chapter4/prototype/user-flow-diagrams/user-flow-qa-1.png)

**User Goal QA-2:** Gestionar documentación y protocolos de validación.

Happy path: Document Management & Master SOPs → Quality Protocols & Validation → GxP Regulatory Reports & Metrics.

Unhappy paths: ¿Datos obligatorios completos? No → Se resaltan los campos faltantes; el documento no se guarda | ¿Firma electrónica válida? No → Firma rechazada; el documento permanece "In Review".

![Segmento 1 - 2](../assets/img/chapter4/prototype/user-flow-diagrams/user-flow-qa-2.png)

**User Goal QA-3:** Registrar una desviación y gestionar su CAPA.

Happy path: Critical Deviations & CAPA Control → Incident Registration & Deviation → Critical Deviations & CAPA Control.

Unhappy paths: ¿Se indicó el lote afectado y la severidad? No → Mensaje de validación; no se genera el código de desviación | ¿Tiene causa raíz registrada para cerrar? No → Cierre bloqueado: "Registre la causa raíz antes de cerrar".

![Segmento 1 - 3](../assets/img/chapter4/prototype/user-flow-diagrams/user-flow-qa-3.png)

**User Goal QA-4:** Planificar una auditoría y reunir sus evidencias.

Happy path: Process Audit Master Plan → Document Management & Master SOPs → GxP Regulatory Reports & Metrics.

Unhappy paths: ¿Todos los lotes tienen evidencia completa? No → Se listan las evidencias faltantes (p. ej., certificado de liberación).

![Segmento 1 - 4](../assets/img/chapter4/prototype/user-flow-diagrams/user-flow-qa-4.png)

**User Goal QA-5:** Registrar y validar resultados analíticos.

Happy path: Analytical & Microbiology Testing → Analytical Results Entry & Validation → Batch History & Traceability.

Unhappy paths: ¿El resultado está dentro de la especificación? No → Resultado marcado OOS; se exige registrar una desviación | ¿Firma electrónica válida? No → Firma rechazada; el resultado queda pendiente.

![Segmento 1 - 5](../assets/img/chapter4/prototype/user-flow-diagrams/user-flow-qa-5.png)

**User Goal QA-6:** Consultar la trazabilidad completa de un lote.

Happy path: Batch History & Traceability → Cross-Traceability & Audit Center.

Unhappy paths: ¿Existe el lote buscado? No → Mensaje "No se encontró el lote"; ajusta los filtros.

![Segmento 1 - 6](../assets/img/chapter4/prototype/user-flow-diagrams/user-flow-qa-6.png)

#### Segmento 2 – Jefe de Producción

**User Goal PR-1:** Ingresar a DoofPlus y acceder al entorno de producción.

Happy path: Landing Page (portal) → Regulatory Identification (2FA) → Environment Selection Portal → GxP Production Control Console.

Unhappy paths: ¿Credenciales y código 2FA válidos? No → Mensaje "Credenciales inválidas"; tras 5 intentos la cuenta se bloquea 15 min | ¿El rol del usuario autoriza el entorno elegido? No → Mensaje "Acceso no autorizado para este entorno"; permanece en la selección.

![Segmento 2 - 1](../assets/img/chapter4/prototype/user-flow-diagrams/user-flow-pr-1.png)

**User Goal PR-2:** Gestionar la ejecución de un lote y consultar su historial.

Happy path: Batch Execution & Management → Batch History & Traceability.

Unhappy paths: ¿La transición requiere aprobación de Calidad? No → Se envía una solicitud de aprobación; el paso queda bloqueado hasta la respuesta.

![Segmento 2 - 2](../assets/img/chapter4/prototype/user-flow-diagrams/user-flow-pr-2.png)

**User Goal PR-3:** Monitorear equipos y condiciones ambientales.

Happy path: Environmental & Equipment Monitoring → Batch Execution & Management.

Unhappy paths: ¿Las lecturas están dentro del rango? No → Alerta crítica; registra una incidencia y la escala a Calidad.

![Segmento 2 - 3](../assets/img/chapter4/prototype/user-flow-diagrams/user-flow-pr-3.png)

**User Goal PR-4:** Registrar una incidencia de producción.

Happy path: Incident Registration & Deviation → Critical Deviations & CAPA Control.

Unhappy paths: ¿Formulario completo y evidencia adjunta? No → Se resaltan los campos obligatorios.

![Segmento 2 - 4](../assets/img/chapter4/prototype/user-flow-diagrams/user-flow-pr-4.png)

**User Goal PR-5:** Consultar la trazabilidad de un lote para investigar un evento.

Happy path: Batch History & Traceability → Cross-Traceability & Audit Center.

Unhappy paths: ¿Existe el lote buscado? No → Mensaje "No se encontró el lote"; ajusta los filtros.

![Segmento 2 - 5](../assets/img/chapter4/prototype/user-flow-diagrams/user-flow-pr-5.png)

**User Goal PR-6:** Consultar reportes y métricas de producción.

Happy path: GxP Regulatory Reports & Metrics.

Unhappy paths: ¿Existen registros en el periodo? No → Mensaje "Sin datos para el periodo"; cambia el rango.

![Segmento 2 - 6](../assets/img/chapter4/prototype/user-flow-diagrams/user-flow-pr-6.png)

## 4.5. Web Applications Prototyping
La sección de Web Applications Prototyping presenta los prototipos interactivos desarrollados para validar los flujos operativos y regulatorios de DoofPlus antes de su implementación. Estos prototipos permiten simular la experiencia real de navegación dentro de la plataforma, evaluando la accesibilidad, usabilidad y eficiencia de las interacciones propuestas.

El diseño de los prototipos fue guiado por cuatro principios fundamentales:

- Cumplimiento regulatorio por diseño

Todas las interacciones fueron concebidas considerando requisitos de FDA 21 CFR Part 11, GMP y buenas prácticas de documentación, incorporando controles asociados a firmas electrónicas, auditoría de registros y segregación de funciones.

- Arquitectura basada en procesos farmacéuticos

La navegación se organiza alrededor de los procesos más frecuentes dentro de la industria farmacéutica:

- Gestión documental regulatoria.
- Control y liberación de lotes.
- Investigación de desviaciones.
- Gestión CAPA.
- Auditorías regulatorias.
- Validación y control analítico.
- Consistencia visual y operativa

Los prototipos mantienen una identidad visual uniforme mediante el uso consistente de colores institucionales, componentes reutilizables, tablas regulatorias y paneles de control orientados a la supervisión operativa.

- Optimización para entornos de trabajo regulados

La interfaz prioriza:

- Acceso rápido a información crítica.
- Visualización inmediata del estado de cumplimiento.
- Reducción de errores durante el ingreso de datos.
- Navegación simplificada para procesos frecuentes.
- Facilidad de auditoría e inspección regulatoria.

Los prototipos permiten validar que las tareas principales del sistema, tales como consultar documentación aprobada, investigar desviaciones, ejecutar acciones CAPA y realizar auditorías internas, puedan completarse de forma eficiente y manteniendo la trazabilidad requerida por los estándares regulatorios del sector farmacéutico.

Los prototipos de Desktop y Mobile Web Browser siguen los paths de los User Flow Diagrams de la sección 4.4.4: el sidebar implementa la navegación global, los breadcrumbs la navegación contextual y los diálogos de firma electrónica las confirmaciones críticas.

Prototipo navegable en Figma: <mark>pegar URL pública del prototipo</mark>

Video de navegación del prototipo (Microsoft Stream), upc-pre-202620-1asi0730-7742-IngesCompany-prototype-navigation-sprint-1: <mark>pegar URL, timing de inicio y duración</mark>

## 4.6. Domain-Driven Software Architecture

La arquitectura de DoofPlus se fundamenta en Domain-Driven Design (DDD). El punto de partida es el Big Picture EventStorming (sección 2.4), que dejó una línea de tiempo de eventos organizada en siete swimlanes, con sus actores, sistemas externos y problemas. En esta sección ese conocimiento se profundiza con un Design-Level EventStorming hasta identificar los bounded contexts y obtener aggregates, commands, policies, read models y sistemas externos por contexto; luego la solución se representa con el modelo C4 (contexto, contenedores y componentes). Los mismos bounded contexts y aggregates se mantienen en los diagramas de clases (sección 4.7), en la base de datos (sección 4.8), en los módulos de la Web Application en Angular y en los paquetes del RESTful API en Spring Boot.

La siguiente tabla resume la trazabilidad entre artefactos:

| Bounded context | Tipo | Swimlanes del Big Picture | Épicas | Aggregates (DLES y clases) | Módulo Angular / paquete Spring |
| --- | --- | --- | --- | --- | --- |
| Manufacturing & Batch Management | Core | Producción y almacén | EP04, EP09 (productos y fórmulas) | Product, MasterFormula, RawMaterialLot, ProductionOrder, ProductionBatch | `manufacturing` |
| Quality & Compliance | Core | Gestión documental, Control de calidad y liberación, Desviaciones y CAPA, Auditoría y cumplimiento | EP03, EP05, EP07, EP08, EP10 | QualityDocument, MaterialApproval, BatchReview, AnalyticalResult, Deviation, Audit, AuditTrailEntry, RegulatoryReport | `quality` |
| IoT Monitoring | Supporting | Monitoreo de equipos (IoT) | EP06, EP09 (equipos, calibraciones y mantenimiento) | Equipment, IoTDevice, TelemetryReading, Alert | `iot-monitoring` / `iotmonitoring` |
| Identity & Access Management | Generic | Plataforma y administración, Gestión documental | EP02 | User, ElectronicSignature | `iam` |
| Organizations & Profiles | Supporting | Plataforma y administración | EP01 (solicitud de demo), EP02 (registro de la organización) | Organization, Profile, DemoRequest | `organizations` |
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

![Target design](../assets/img/chapter4/design-level-event-storming/dles-v2/steps/target-design.png)

#### Paso 1: Timelines

Se organizaron en una línea de tiempo vertical los eventos de cada contexto, con los resultados alternativos en la columna "Alternativa" (por ejemplo, "Documento aprobado" o "Documento rechazado"). Al revisar qué dispara cada evento, en este nivel se agregaron eventos que faltaban en el Big Picture: "Demostración solicitada", "Plan de suscripción seleccionado", "Firma electrónica registrada", "Equipo registrado", "Sensor IoT registrado", "Aprobación de insumos solicitada a Calidad", "Mantenimiento preventivo realizado", "Lote puesto en espera" y "Acción CAPA vencida"; además, "Usuario registrado" se renombró como "Usuario dado de alta en la organización". También aparecen eventos de detalle que no eran relevantes en la vista general, como "Usuario autenticado", "Inicio de sesión fallido", "Cuenta bloqueada", "Planta agregada", "Perfil actualizado" y "Alerta reconocida".

<details>
<summary>Ver el paso 1 en cada bounded context</summary>

**Identity & Access Management**

![Identity & Access Management - paso 1](../assets/img/chapter4/design-level-event-storming/dles-v2/steps/iam-1-timelines.png)

**Organizations & Profiles**

![Organizations & Profiles - paso 1](../assets/img/chapter4/design-level-event-storming/dles-v2/steps/org-1-timelines.png)

**Subscriptions & Payments**

![Subscriptions & Payments - paso 1](../assets/img/chapter4/design-level-event-storming/dles-v2/steps/sub-1-timelines.png)

**Manufacturing & Batch Management**

![Manufacturing & Batch Management - paso 1](../assets/img/chapter4/design-level-event-storming/dles-v2/steps/mfg-1-timelines.png)

**IoT Monitoring**

![IoT Monitoring - paso 1](../assets/img/chapter4/design-level-event-storming/dles-v2/steps/iot-1-timelines.png)

**Quality & Compliance** (swimlane 1: liberación de lotes; swimlane 2: desviaciones y auditoría)

![Quality & Compliance - paso 1](../assets/img/chapter4/design-level-event-storming/dles-v2/steps/qa-1-timelines.png)

</details>

#### Paso 2: Commands

Cada evento se antecedió por el command que lo provoca, redactado en imperativo (por ejemplo, "Crear lote" produce "Lote creado"). Un mismo command puede terminar en dos eventos alternativos, como "Aprobar orden de producción", que produce "Orden de producción aprobada" u "Orden de producción rechazada".

<details>
<summary>Ver el paso 2 en cada bounded context</summary>

**Identity & Access Management**

![Identity & Access Management - paso 2](../assets/img/chapter4/design-level-event-storming/dles-v2/steps/iam-2-commands.png)

**Organizations & Profiles**

![Organizations & Profiles - paso 2](../assets/img/chapter4/design-level-event-storming/dles-v2/steps/org-2-commands.png)

**Subscriptions & Payments**

![Subscriptions & Payments - paso 2](../assets/img/chapter4/design-level-event-storming/dles-v2/steps/sub-2-commands.png)

**Manufacturing & Batch Management**

![Manufacturing & Batch Management - paso 2](../assets/img/chapter4/design-level-event-storming/dles-v2/steps/mfg-2-commands.png)

**IoT Monitoring**

![IoT Monitoring - paso 2](../assets/img/chapter4/design-level-event-storming/dles-v2/steps/iot-2-commands.png)

**Quality & Compliance** (swimlane 1: liberación de lotes; swimlane 2: desviaciones y auditoría)

![Quality & Compliance - paso 2](../assets/img/chapter4/design-level-event-storming/dles-v2/steps/qa-2-commands.png)

</details>

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

<details>
<summary>Ver el paso 3 en cada bounded context</summary>

**Identity & Access Management**

![Identity & Access Management - paso 3](../assets/img/chapter4/design-level-event-storming/dles-v2/steps/iam-3-actors-policies.png)

**Organizations & Profiles**

![Organizations & Profiles - paso 3](../assets/img/chapter4/design-level-event-storming/dles-v2/steps/org-3-actors-policies.png)

**Subscriptions & Payments**

![Subscriptions & Payments - paso 3](../assets/img/chapter4/design-level-event-storming/dles-v2/steps/sub-3-actors-policies.png)

**Manufacturing & Batch Management**

![Manufacturing & Batch Management - paso 3](../assets/img/chapter4/design-level-event-storming/dles-v2/steps/mfg-3-actors-policies.png)

**IoT Monitoring**

![IoT Monitoring - paso 3](../assets/img/chapter4/design-level-event-storming/dles-v2/steps/iot-3-actors-policies.png)

**Quality & Compliance** (swimlane 1: liberación de lotes; swimlane 2: desviaciones y auditoría)

![Quality & Compliance - paso 3](../assets/img/chapter4/design-level-event-storming/dles-v2/steps/qa-3-actors-policies.png)

</details>

#### Paso 4: Read models

Se registró la información que cada actor consulta antes de decidir. Estos read models son la base de las vistas de la Web Application y de los dashboards: por ejemplo, "Panel de control del lote" (GxP Batch Execution & Management Console), "Tablero de desviaciones y CAPA" (Critical Deviations & CAPA Actions Control), "Panel de resultados de laboratorio" (Analytical Results Entry & Validation), "Panel de alertas" (Environmental & Equipment Monitoring) y "Audit trail" (Cross-Traceability & Audit Center).

<details>
<summary>Ver el paso 4 en cada bounded context</summary>

**Identity & Access Management**

![Identity & Access Management - paso 4](../assets/img/chapter4/design-level-event-storming/dles-v2/steps/iam-4-read-models.png)

**Organizations & Profiles**

![Organizations & Profiles - paso 4](../assets/img/chapter4/design-level-event-storming/dles-v2/steps/org-4-read-models.png)

**Subscriptions & Payments**

![Subscriptions & Payments - paso 4](../assets/img/chapter4/design-level-event-storming/dles-v2/steps/sub-4-read-models.png)

**Manufacturing & Batch Management**

![Manufacturing & Batch Management - paso 4](../assets/img/chapter4/design-level-event-storming/dles-v2/steps/mfg-4-read-models.png)

**IoT Monitoring**

![IoT Monitoring - paso 4](../assets/img/chapter4/design-level-event-storming/dles-v2/steps/iot-4-read-models.png)

**Quality & Compliance** (swimlane 1: liberación de lotes; swimlane 2: desviaciones y auditoría)

![Quality & Compliance - paso 4](../assets/img/chapter4/design-level-event-storming/dles-v2/steps/qa-4-read-models.png)

</details>

#### Paso 5: External systems

Se ubicaron los sistemas externos en el punto donde intervienen: Niubiz (pago y renovación de suscripciones), ThingsBoard (registro de sensores e ingesta de lecturas), SendGrid (invitaciones, alertas y notificaciones por correo), el Lector RFID (recepción de materias primas), la app autenticadora del usuario (códigos TOTP) y DIGEMID (inspección). Respecto del tablero original se corrigieron tres elementos: "Registro en la base de datos" no es un sistema externo (la base de datos es parte de la solución), el "Motor de alertas" es lógica propia del contexto IoT Monitoring y Google Authenticator no expone un API: solo genera el código que el usuario ingresa.

<details>
<summary>Ver el paso 5 en cada bounded context</summary>

**Identity & Access Management**

![Identity & Access Management - paso 5](../assets/img/chapter4/design-level-event-storming/dles-v2/steps/iam-5-external-systems.png)

**Organizations & Profiles**

![Organizations & Profiles - paso 5](../assets/img/chapter4/design-level-event-storming/dles-v2/steps/org-5-external-systems.png)

**Subscriptions & Payments**

![Subscriptions & Payments - paso 5](../assets/img/chapter4/design-level-event-storming/dles-v2/steps/sub-5-external-systems.png)

**Manufacturing & Batch Management**

![Manufacturing & Batch Management - paso 5](../assets/img/chapter4/design-level-event-storming/dles-v2/steps/mfg-5-external-systems.png)

**IoT Monitoring**

![IoT Monitoring - paso 5](../assets/img/chapter4/design-level-event-storming/dles-v2/steps/iot-5-external-systems.png)

**Quality & Compliance** (swimlane 1: liberación de lotes; swimlane 2: desviaciones y auditoría)

![Quality & Compliance - paso 5](../assets/img/chapter4/design-level-event-storming/dles-v2/steps/qa-5-external-systems.png)

</details>

#### Paso 6: Business rules y aggregates

Donde no interviene un sistema externo se escribió la business rule que el command debe cumplir. Las reglas se tomaron de los criterios de aceptación de las User Stories (el identificador aparece en el post-it), por ejemplo "Número de lote único (US14)", "Solo materia prima aprobada (US17)" o "Requiere causa raíz y CAPA verificadas (US19)". Las reglas que protegen los mismos datos se apilaron y cada grupo recibió el nombre de su aggregate:

| Bounded context | Aggregates | Ejemplo de invariante |
| --- | --- | --- |
| IAM | User, ElectronicSignature | Una cuenta se bloquea tras 5 intentos fallidos; firmar exige reingresar la contraseña. |
| Organizations & Profiles | DemoRequest, Organization, Profile | El RUC de la organización es válido y único. |
| Subscriptions & Payments | Subscription (con su Plan) | La suscripción se activa solo si Niubiz autoriza el cobro. |
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

<details>
<summary>Ver el paso 6 en cada bounded context</summary>

**Identity & Access Management**

![Identity & Access Management - paso 6](../assets/img/chapter4/design-level-event-storming/dles-v2/steps/iam-6-aggregates.png)

**Organizations & Profiles**

![Organizations & Profiles - paso 6](../assets/img/chapter4/design-level-event-storming/dles-v2/steps/org-6-aggregates.png)

**Subscriptions & Payments**

![Subscriptions & Payments - paso 6](../assets/img/chapter4/design-level-event-storming/dles-v2/steps/sub-6-aggregates.png)

**Manufacturing & Batch Management**

![Manufacturing & Batch Management - paso 6](../assets/img/chapter4/design-level-event-storming/dles-v2/steps/mfg-6-aggregates.png)

**IoT Monitoring**

![IoT Monitoring - paso 6](../assets/img/chapter4/design-level-event-storming/dles-v2/steps/iot-6-aggregates.png)

**Quality & Compliance** (swimlane 1: liberación de lotes; swimlane 2: desviaciones y auditoría)

![Quality & Compliance - paso 6](../assets/img/chapter4/design-level-event-storming/dles-v2/steps/qa-6-aggregates.png)

</details>
#### Paso 7: Bounded contexts

Los aggregates se agruparon en seis bounded contexts, siguiendo los swimlanes del Big Picture y el lenguaje que comparten sus eventos, con nombres en inglés alineados al Ubiquitous Language y al código. Respecto del Design-Level original del equipo se mantuvieron los seis contextos y se refinaron sus aggregates: "Módulo de Credenciales y Sesión" pasó a User (la sesión se maneja con JWT y no se persiste), la matriz de roles pasó de Organizations a IAM, "Perfil Corporativo y Tenant" se dividió en Organization y Profile, "Inventario y Materia Prima" se separó en Product, MasterFormula y RawMaterialLot, "Lote de Producción" en ProductionOrder y ProductionBatch, "Registro de Maquinaria y Telemetría" en Equipment, IoTDevice, TelemetryReading y Alert, y "Expediente de Trazabilidad y Auditoría" en MaterialApproval, BatchReview, AnalyticalResult, Audit y AuditTrailEntry. Así cada aggregate protege un conjunto pequeño de reglas y se corresponde con una clase raíz y sus tablas.

El context map muestra cómo se integran los contextos. Las consultas entre contextos pasan por un Anti-Corruption Layer (fachada `ContextFacade` del contexto proveedor y servicio `External…Service` del consumidor); las decisiones de Quality hacia Manufacturing se comunican con domain events.

Frame en Miro: https://miro.com/app/board/uXjVHkhKOXE=/?moveToWidget=3458764685756367552

![Context map](../assets/img/chapter4/design-level-event-storming/dles-v2/context-map.png)

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

El diagrama de contexto (nivel 1 del modelo C4) muestra a DoofPlus como un único sistema rodeado por sus usuarios y los sistemas externos identificados en el EventStorming. Los usuarios son el visitante de un laboratorio (Landing Page), el Especialista QA/QC y el Jefe de Producción (segmentos objetivo) y el Administrador del laboratorio. Los sistemas externos son ThingsBoard, que envía la telemetría de los sensores; Niubiz, que autoriza los cobros de las suscripciones; y SendGrid, que entrega correos. La app autenticadora del usuario genera los códigos TOTP del segundo factor sin integración por API, por eso se muestra con línea punteada. Los diagramas C4 se elaboraron con Structurizr DSL (Diagram-as-Code) y se renderizaron con Structurizr, la herramienta de referencia del modelo C4; todas las vistas salen de un único modelo (`assets/diagrams/structurizr/workspace.dsl`).

![Context Level Diagram](../assets/img/chapter4/software-architecture/c4/c4-01-context.png)

### 4.6.3. Software Architecture Container Diagrams

El diagrama de contenedores (nivel 2) muestra las unidades de despliegue de la solución y cómo se comunican:

| Container | Tecnología | Despliegue | Responsabilidad |
| --- | --- | --- | --- |
| Landing Page | HTML5, CSS3, JavaScript | GitHub Pages | Presentar la propuesta de valor, planes y equipo; registrar solicitudes de demo y dirigir a cada segmento a la Web Application. |
| Web Application | Angular, Angular Material, TypeScript, ngx-translate | Firebase Hosting | SPA responsive con un módulo por bounded context; consume el RESTful API con un token JWT. |
| RESTful API | Spring Boot, Java 21, Spring Data JPA, Spring Security, springdoc-openapi | Render | Monolito modular con los seis bounded contexts; expone endpoints REST documentados con OpenAPI (Swagger), recibe la telemetría de ThingsBoard y publica notificaciones por WebSocket (STOMP). |
| Database | MySQL 8 | Railway | Persistencia relacional; las tablas se agrupan por bounded context. |

Se eligió un monolito modular en lugar de microservicios porque el statement define un único RESTful API y porque el equipo y el volumen de datos de laboratorios pequeños y medianos no justifican la complejidad operativa de varios servicios. La separación por bounded context dentro del código (paquetes independientes que solo se comunican mediante fachadas y eventos) permite extraer un contexto a un servicio propio en el futuro.

![Container Level Diagram](../assets/img/chapter4/software-architecture/c4/c4-02-container.png)

### 4.6.4. Software Architecture Components Diagrams

Los diagramas de componentes (nivel 3) descomponen la Web Application y el RESTful API. La Web Application sigue la estructura del proyecto en Angular: un módulo por bounded context con las capas `domain`, `application`, `infrastructure` y `presentation`, más los elementos compartidos de `shared`.

![Component Diagram - Web Application](../assets/img/chapter4/software-architecture/c4/c4-03-webapp-components.png)

En el RESTful API cada bounded context es un paquete de Spring Boot con cuatro capas: `interfaces` (controladores REST y fachadas ACL), `application` (command services, query services, event handlers y servicios ACL de salida), `domain` (aggregates, entities, value objects, commands, queries y domain services) e `infrastructure` (repositorios Spring Data JPA e integraciones externas).

**Identity & Access Management.** `AuthenticationController` atiende sign-up, sign-in y la verificación 2FA; `BearerAuthorizationRequestFilter` valida el JWT en cada request; `UserCommandServiceImpl` da de alta usuarios, asigna roles y bloquea cuentas; `SignatureCommandServiceImpl` registra firmas electrónicas. `IamContextFacade` expone estas capacidades a los demás contextos.

![Component Diagram - IAM](../assets/img/chapter4/software-architecture/c4/c4-04-api-iam-components.png)

**Organizations & Profiles.** Registra organizaciones, plantas, perfiles y solicitudes de demo desde la Landing Page; al registrar una organización pide a IAM crear su administrador mediante `ExternalIamService`.

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

![Class Diagram - IAM](../assets/img/chapter4/diagram-class/java/class-01-iam.png)

**Organizations & Profiles.** `Organization` agrupa sus plantas y se identifica por el value object `Ruc`; `Profile` guarda los datos y preferencias de cada usuario; `DemoRequest` registra las solicitudes de demo de la Landing Page.

![Class Diagram - Organizations & Profiles](../assets/img/chapter4/diagram-class/java/class-02-organizations.png)

**Subscriptions & Payments.** `Subscription` controla el ciclo de vida de la suscripción y sus pagos; `Plan` define precios y límites. `PaymentGateway` abstrae la pasarela y `NiubizPaymentGateway` la implementa.

![Class Diagram - Subscriptions & Payments](../assets/img/chapter4/diagram-class/java/class-03-subscriptions.png)

**Manufacturing & Batch Management.** `ProductionBatch` es el aggregate central del dominio: concentra el ciclo de vida del lote (`PLANNED` a `RELEASED` o `REJECTED`), sus consumos de insumos, parámetros de proceso, incidencias y su línea de tiempo (`BatchEvent`). `ProductionOrder`, `MasterFormula`, `Product` y `RawMaterialLot` completan el contexto.

![Class Diagram - Manufacturing & Batch Management](../assets/img/chapter4/diagram-class/java/class-04-manufacturing.png)

**IoT Monitoring.** `Equipment` mantiene su historial de calibraciones y mantenimientos y define si está apto para producción; `IoTDevice` representa un sensor de ThingsBoard asignable a un lote; `TelemetryReading` guarda cada lectura y `AlertRuleEvaluator` genera las alertas.

![Class Diagram - IoT Monitoring](../assets/img/chapter4/diagram-class/java/class-05-iot.png)

**Quality & Compliance.** `QualityDocument` gestiona versiones y aprobación de SOP y protocolos; `MaterialApproval` registra el dictamen de cada lote de insumo; `BatchReview` controla la cuarentena, evaluación y liberación del lote y emite el `ReleaseCertificate`; `AnalyticalResult` calcula el resultado y detecta los OOS. `Deviation` controla la clasificación, investigación, causa raíz y acciones CAPA hasta su cierre; `Audit` registra hallazgos y observaciones; `AuditTrailEntry` es de solo inserción; `RegulatoryReport` guarda los reportes generados.

![Class Diagram - Quality & Compliance](../assets/img/chapter4/diagram-class/java/class-06-quality.png)

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
| Organizations & Profiles | organizations, plants, profiles, demo_requests | Organization, Profile, DemoRequest |
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
