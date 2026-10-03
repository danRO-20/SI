workspace "DoofPlus" "Modelo C4 de DoofPlus (IngesCompany). Fuente Structurizr DSL de los diagramas de la sección 4.7." {


    model {
        visitor = person "Visitante de un laboratorio" "Evalúa DoofPlus desde la Landing Page y solicita una demostración."
        qa = person "Especialista QA/QC" "Gestiona documentos, insumos, desviaciones, CAPA, auditorías y liberación de lotes."
        prod = person "Jefe de Producción Farmacéutica" "Gestiona órdenes y lotes, monitorea equipos y solicita aprobaciones a Calidad."
        admin = person "Administrador del laboratorio" "Registra la organización, usuarios, roles, sensores y la suscripción."
        tb = softwareSystem "ThingsBoard" "Plataforma IoT que recibe los datos de los sensores de planta y los reenvía." "External"
        niubiz = softwareSystem "Niubiz" "Pasarela de pagos para cobrar las suscripciones." "External"
        mail = softwareSystem "SendGrid" "Servicio de correo para invitaciones, alertas y notificaciones." "External"
        ga = softwareSystem "App autenticadora (TOTP)" "App móvil del usuario (p. ej., Google Authenticator) que genera códigos 2FA." "External"
        doofplus = softwareSystem "DoofPlus" "Plataforma SaaS de gestión de calidad y trazabilidad de lotes farmacéuticos (Landing Page, Web Application y RESTful API)." {
            landing = container "Landing Page" "Sitio estático (GitHub Pages) con la propuesta de valor, planes y equipo; i18n en-US/es-419. Sus CTA llevan a la Web Application." "HTML5, CSS3, JavaScript"
            webapp = container "Web Application" "SPA responsive (Material Design) con un módulo por bounded context; i18n con ngx-translate y ARIA. Desplegada en Firebase Hosting." "Angular, Angular Material, TypeScript" {
                wa_router = component "app.routes & authGuard" "Rutas lazy por bounded context y protección de vistas por rol." "Angular Router, CanActivateFn"
                wa_layout = component "Layout, Toolbar y Footer" "Shell responsive y navegación global." "shared/presentation – mat-toolbar, mat-sidenav"
                wa_iam = component "iam" "Sign-in con 2FA, sesión (JWT), usuarios y firmas." "views + IamStore + IamApi"
                wa_org = component "organizations" "Organización, plantas y perfiles." "views + store + api"
                wa_subs = component "subscriptions" "Planes, pago y estado de la suscripción." "views + store + api"
                wa_mfg = component "manufacturing" "Órdenes, lotes, insumos e incidencias." "views + ManufacturingStore + api"
                wa_iot = component "iot-monitoring" "Equipos, sensores, lecturas y alertas." "views + store + api"
                wa_qual = component "quality" "Documentos, insumos, resultados, desviaciones, CAPA, liberación, auditorías y audit trail." "views (mat-table) + QualityStore + api"
                wa_http = component "shared/infrastructure" "Cliente REST base, conversión resource ↔ entity y token Bearer." "HttpClient, BaseApi, assemblers, authInterceptor"
                wa_i18n = component "LanguageSwitcher" "public/i18n/en.json (por defecto) y es.json." "ngx-translate + HttpLoader"
                wa_ws = component "Notifications Client" "Recibe alertas en tiempo real." "@stomp/rx-stomp"
            }
            api = container "RESTful API" "Monolito modular con los 6 bounded contexts; Spring Security (JWT + TOTP), OpenAPI (springdoc) y notificaciones WebSocket (STOMP). Render." "Spring Boot, Java 21, Spring Data JPA" {
                group "Identity & Access Management" {
                    iam_ctl = component "AuthenticationController" "sign-up, sign-in y verificación 2FA." "Spring @RestController" "Identity & Access Management"
                    iam_ctl2 = component "UsersController · ElectronicSignaturesController" "Alta de usuarios, roles y firmas." "Spring @RestController" "Identity & Access Management"
                    iam_flt = component "BearerAuthorizationRequestFilter" "Valida el JWT en cada request." "Spring Security Filter" "Identity & Access Management"
                    iam_cmd = component "UserCommandServiceImpl" "Da de alta usuarios, asigna roles y bloquea cuentas tras 5 intentos." "Spring @Service – Command Service" "Identity & Access Management"
                    iam_sig = component "SignatureCommandServiceImpl" "Verifica la identidad y registra la firma electrónica." "Spring @Service – Command Service" "Identity & Access Management"
                    iam_qry = component "UserQueryServiceImpl" "Consultas de usuarios y roles." "Spring @Service – Query Service" "Identity & Access Management"
                    iam_dom = component "User · Role · ElectronicSignature" "Aggregates del contexto IAM." "Domain Model" "Identity & Access Management"
                    iam_tok = component "TokenServiceImpl" "Genera y valida tokens JWT." "Infrastructure – JJWT" "Identity & Access Management"
                    iam_hash = component "HashingServiceImpl" "Hash de contraseñas." "Infrastructure – BCrypt" "Identity & Access Management"
                    iam_totp = component "TotpServiceImpl" "Valida los códigos 2FA." "Infrastructure – RFC 6238" "Identity & Access Management"
                    iam_repo = component "UserRepository · ElectronicSignatureRepository" "Persistencia en MySQL." "Spring Data JPA Repository" "Identity & Access Management"
                    iam_acl = component "IamContextFacade" "Expone usuarios y firmas a los demás bounded contexts." "Interfaces – ACL Facade" "Identity & Access Management"
                }
                group "Organizations & Profiles" {
                    org_ctl = component "OrganizationsController · DemoRequestsController" "Registro de organizaciones, plantas y solicitudes de demo." "Spring @RestController" "Organizations & Profiles"
                    org_ctl2 = component "ProfilesController" "Perfiles y preferencias." "Spring @RestController" "Organizations & Profiles"
                    org_cmd = component "OrganizationCommandServiceImpl" "Registra la organización (RUC único) y pide crear su administrador." "Spring @Service – Command Service" "Organizations & Profiles"
                    org_dcmd = component "DemoRequestCommandServiceImpl" "Registra la solicitud y avisa al equipo comercial." "Spring @Service – Command Service" "Organizations & Profiles"
                    org_pcmd = component "ProfileCommandServiceImpl" "Crea y actualiza perfiles." "Spring @Service – Command Service" "Organizations & Profiles"
                    org_qry = component "OrganizationQueryServiceImpl" "Consultas de organizaciones y plantas." "Spring @Service – Query Service" "Organizations & Profiles"
                    org_dom = component "Organization · Plant · Profile · DemoRequest" "Aggregates del contexto." "Domain Model" "Organizations & Profiles"
                    org_ext = component "ExternalIamService" "Crea el usuario administrador mediante IamContextFacade." "Application – Outbound ACL" "Organizations & Profiles"
                    org_repo = component "OrganizationRepository · ProfileRepository · DemoRequestRepository" "Persistencia en MySQL." "Spring Data JPA Repository" "Organizations & Profiles"
                    org_acl = component "OrganizationsContextFacade" "Expone organización y plantas." "Interfaces – ACL Facade" "Organizations & Profiles"
                }
                group "Subscriptions & Payments" {
                    sub_ctl = component "PlansController · SubscriptionsController" "Planes, suscripción, pago, renovación y cancelación." "Spring @RestController" "Subscriptions & Payments"
                    sub_cmd = component "SubscriptionCommandServiceImpl" "Selecciona plan, activa, renueva y cancela suscripciones." "Spring @Service – Command Service" "Subscriptions & Payments"
                    sub_qry = component "PlanQueryServiceImpl" "Planes y límites vigentes." "Spring @Service – Query Service" "Subscriptions & Payments"
                    sub_job = component "SubscriptionRenewalScheduler" "Renueva las suscripciones vencidas." "Spring @Scheduled" "Subscriptions & Payments"
                    sub_dom = component "Plan · Subscription · Payment" "Aggregates del contexto." "Domain Model" "Subscriptions & Payments"
                    sub_gw = component "NiubizPaymentGateway" "Implementa PaymentGateway contra la API REST de Niubiz." "Infrastructure – RestClient" "Subscriptions & Payments"
                    sub_repo = component "SubscriptionRepository · PlanRepository" "Persistencia en MySQL." "Spring Data JPA Repository" "Subscriptions & Payments"
                    sub_acl = component "SubscriptionsContextFacade" "Expone el plan vigente y sus límites (p. ej., dispositivos IoT)." "Interfaces – ACL Facade" "Subscriptions & Payments"
                }
                group "Manufacturing & Batch Management" {
                    mfg_ctl = component "ProductionBatchesController · IncidentsController" "Lotes, estados, consumo, parámetros, incidencias y línea de tiempo." "Spring @RestController" "Manufacturing & Batch Management"
                    mfg_ctl2 = component "ProductsController · MasterFormulasController · RawMaterialLotsController · ProductionOrdersController" "Catálogo, fórmulas, insumos y órdenes." "Spring @RestController" "Manufacturing & Batch Management"
                    mfg_cmd = component "ProductionBatchCommandServiceImpl" "Crea lotes, cambia estados y registra consumos, parámetros e incidencias." "Spring @Service – Command Service" "Manufacturing & Batch Management"
                    mfg_ocmd = component "ProductionOrderCommandServiceImpl · RawMaterialLotCommandServiceImpl" "Órdenes de producción, recepción y ubicación de insumos." "Spring @Service – Command Service" "Manufacturing & Batch Management"
                    mfg_qry = component "ProductionBatchQueryServiceImpl" "Historial y trazabilidad de lotes." "Spring @Service – Query Service" "Manufacturing & Batch Management"
                    mfg_dom = component "Product · MasterFormula · RawMaterialLot · ProductionOrder · ProductionBatch" "Aggregates del contexto." "Domain Model" "Manufacturing & Batch Management"
                    mfg_evt = component "BatchReleaseDecidedEventHandler · MaterialApprovalDecidedEventHandler" "Actualiza lotes e insumos con los veredictos de Quality & Compliance." "Spring @EventListener" "Manufacturing & Batch Management"
                    mfg_ext = component "ExternalQualityService · ExternalIotService" "Solicita aprobación de insumos y cuarentena; asigna sensores al lote." "Application – Outbound ACL" "Manufacturing & Batch Management"
                    mfg_repo = component "ProductionBatchRepository · ProductionOrderRepository · RawMaterialLotRepository · ProductRepository" "Persistencia en MySQL." "Spring Data JPA Repository" "Manufacturing & Batch Management"
                    mfg_acl = component "ManufacturingContextFacade" "Expone lotes en curso a IoT y Quality." "Interfaces – ACL Facade" "Manufacturing & Batch Management"
                }
                group "IoT Monitoring" {
                    iot_wh = component "TelemetryWebhookController" "Recibe telemetría de ThingsBoard (API key por dispositivo)." "Spring @RestController" "IoT Monitoring"
                    iot_ctl = component "EquipmentController · IotDevicesController · AlertsController" "Equipos, calibraciones, mantenimientos, sensores y alertas." "Spring @RestController" "IoT Monitoring"
                    iot_ing = component "TelemetryCommandServiceImpl" "Registra lecturas y las asocia al lote en curso." "Spring @Service – Command Service" "IoT Monitoring"
                    iot_rule = component "AlertRuleEvaluator" "Compara lecturas con los rangos y genera alertas." "Domain Service" "IoT Monitoring"
                    iot_cmd = component "EquipmentCommandServiceImpl · IotDeviceCommandServiceImpl" "Equipos, calibraciones y sensores." "Spring @Service – Command Service" "IoT Monitoring"
                    iot_job = component "CalibrationExpirationScheduler" "Marca equipos no aptos al vencer la calibración." "Spring @Scheduled" "IoT Monitoring"
                    iot_dom = component "Equipment · IoTDevice · TelemetryReading · Alert" "Aggregates del contexto." "Domain Model" "IoT Monitoring"
                    iot_ext = component "ExternalManufacturingService · ExternalSubscriptionService" "Verifica el lote en curso y el límite de dispositivos del plan." "Application – Outbound ACL" "IoT Monitoring"
                    iot_notif = component "NotificationService" "Publica alertas en tiempo real y por correo." "Infrastructure – STOMP + SendGrid" "IoT Monitoring"
                    iot_repo = component "EquipmentRepository · IotDeviceRepository · TelemetryReadingRepository · AlertRepository" "Persistencia en MySQL." "Spring Data JPA Repository" "IoT Monitoring"
                    iot_acl = component "IotMonitoringContextFacade" "Asigna sensores a lotes a pedido de Manufacturing." "Interfaces – ACL Facade" "IoT Monitoring"
                }
                group "Quality & Compliance" {
                    qa_ctl = component "QualityDocumentsController · MaterialApprovalsController" "Documentos y versiones; dictamen de materias primas." "Spring @RestController" "Quality & Compliance"
                    qa_ctl2 = component "BatchReviewsController · AnalyticalResultsController" "Cuarentena, resultados, OOS y liberación de lotes." "Spring @RestController" "Quality & Compliance"
                    qa_ctl3 = component "DeviationsController · CapaActionsController" "Desviaciones, RCA y acciones CAPA." "Spring @RestController" "Quality & Compliance"
                    qa_ctl4 = component "AuditsController · AuditTrailController · ReportsController" "Auditorías, audit trail y reportes." "Spring @RestController" "Quality & Compliance"
                    qa_dcmd = component "QualityDocumentCommandServiceImpl · MaterialApprovalCommandServiceImpl" "Versionado, aprobación con firma y dictamen de insumos." "Spring @Service – Command Service" "Quality & Compliance"
                    qa_rcmd = component "BatchReviewCommandServiceImpl" "Cuarentena, evaluación, liberación y certificado de análisis." "Spring @Service – Command Service" "Quality & Compliance"
                    qa_vcmd = component "DeviationCommandServiceImpl · AuditCommandServiceImpl" "Ciclo de vida de desviaciones, CAPA y auditorías." "Spring @Service – Command Service" "Quality & Compliance"
                    qa_rep = component "ReportGenerationServiceImpl" "Expedientes de auditoría y reportes regulatorios en PDF." "Application Service – OpenPDF" "Quality & Compliance"
                    qa_dom = component "QualityDocument · MaterialApproval · BatchReview · AnalyticalResult · Deviation · Audit · AuditTrailEntry · RegulatoryReport" "Aggregates del contexto." "Domain Model" "Quality & Compliance"
                    qa_aud = component "AuditTrailEntityListener" "Registra quién, cuándo y qué cambió en todos los contextos (solo inserción)." "Infrastructure – JPA Entity Listener" "Quality & Compliance"
                    qa_ext = component "ExternalIamService · ExternalManufacturingService" "Firma electrónica y consulta de lotes." "Application – Outbound ACL" "Quality & Compliance"
                    qa_pub = component "ApplicationEventPublisher" "Publica BatchReleaseDecided y MaterialApprovalDecided." "Spring Events" "Quality & Compliance"
                    qa_repo = component "Quality repositories" "Persistencia en MySQL." "Spring Data JPA Repository" "Quality & Compliance"
                    qa_acl = component "QualityContextFacade" "Recibe solicitudes de aprobación y de cuarentena." "Interfaces – ACL Facade" "Quality & Compliance"
                }
            }
            db = container "Database" "Tablas agrupadas por bounded context (Railway)." "MySQL 8" "Database"
        }

        visitor -> doofplus "Conoce la propuesta de valor, los planes y solicita una demo" "HTTPS"
        qa -> doofplus "Gestiona calidad y cumplimiento" "HTTPS"
        prod -> doofplus "Gestiona la producción y monitorea la planta" "HTTPS"
        admin -> doofplus "Administra organización, usuarios y suscripción" "HTTPS"
        tb -> doofplus "Envía telemetría de sensores" "Webhook REST/HTTPS, JSON"
        doofplus -> niubiz "Autoriza cobros de suscripción" "REST/HTTPS, JSON"
        doofplus -> mail "Envía correos" "REST/HTTPS, JSON"
        qa -> ga "Leen el código TOTP (sin integración por API)" "" "Optional"
        prod -> ga "Leen el código TOTP (sin integración por API)" "" "Optional"
        admin -> ga "Leen el código TOTP (sin integración por API)" "" "Optional"
        visitor -> landing "Visita" "HTTPS"
        landing -> api "Solicita demo" "JSON/HTTPS"
        landing -> webapp "Redirige por segmento (CTA)" "HTTPS"
        qa -> webapp "Usa" "HTTPS"
        prod -> webapp "Usa" "HTTPS"
        admin -> webapp "Usa" "HTTPS"
        webapp -> api "Consume endpoints" "JSON/HTTPS, Bearer JWT"
        api -> webapp "Notificaciones en tiempo real" "WebSocket – STOMP"
        api -> db "Lee y escribe" "JDBC – Spring Data JPA/Hibernate"
        tb -> api "Envía telemetría" "Webhook JSON/HTTPS"
        api -> niubiz "Autoriza cobros" "REST JSON/HTTPS"
        api -> mail "Envía correos" "REST JSON/HTTPS"
        qa -> wa_layout "Usa" "HTTPS"
        prod -> wa_layout "Usa" "HTTPS"
        admin -> wa_layout "Usa" "HTTPS"
        wa_layout -> wa_router "Usa"
        wa_router -> wa_iam "Usa"
        wa_router -> wa_org "Usa"
        wa_router -> wa_subs "Usa"
        wa_router -> wa_mfg "Usa"
        wa_router -> wa_iot "Usa"
        wa_router -> wa_qual "Usa"
        wa_iam -> wa_http "Usa"
        wa_org -> wa_http "Usa"
        wa_subs -> wa_http "Usa"
        wa_mfg -> wa_http "Usa"
        wa_iot -> wa_http "Usa"
        wa_qual -> wa_http "Usa"
        wa_layout -> wa_i18n "Traduce textos"
        wa_http -> api "JSON/HTTPS"
        api -> wa_ws "WebSocket (STOMP)"
        wa_ws -> wa_layout "Muestra alertas"
        webapp -> iam_ctl "JSON/HTTPS"
        webapp -> iam_ctl2 "JSON/HTTPS"
        iam_flt -> iam_tok "Valida token"
        iam_ctl -> iam_cmd "Usa"
        iam_ctl2 -> iam_cmd "Usa"
        iam_ctl2 -> iam_qry "Usa"
        iam_ctl2 -> iam_sig "Usa"
        iam_cmd -> iam_dom "Usa"
        iam_sig -> iam_dom "Usa"
        iam_cmd -> iam_hash "Usa"
        iam_cmd -> iam_tok "Usa"
        iam_cmd -> iam_totp "Usa"
        iam_cmd -> mail "Invitación"
        iam_cmd -> iam_repo "Usa"
        iam_qry -> iam_repo "Usa"
        iam_sig -> iam_repo "Usa"
        iam_acl -> iam_qry "Usa"
        iam_acl -> iam_sig "Usa"
        iam_repo -> db "JDBC"
        landing -> org_ctl "Solicita demo"
        webapp -> org_ctl "JSON/HTTPS"
        webapp -> org_ctl2 "JSON/HTTPS"
        org_ctl -> org_cmd "Usa"
        org_ctl -> org_dcmd "Usa"
        org_ctl2 -> org_pcmd "Usa"
        org_ctl -> org_qry "Usa"
        org_cmd -> org_dom "Usa"
        org_dcmd -> org_dom "Usa"
        org_pcmd -> org_dom "Usa"
        org_cmd -> org_ext "Usa"
        org_ext -> iam_acl "Crea administrador"
        org_dcmd -> mail "Aviso"
        org_cmd -> org_repo "Usa"
        org_dcmd -> org_repo "Usa"
        org_pcmd -> org_repo "Usa"
        org_qry -> org_repo "Usa"
        org_acl -> org_qry "Usa"
        org_repo -> db "JDBC"
        webapp -> sub_ctl "JSON/HTTPS"
        sub_ctl -> sub_cmd "Usa"
        sub_ctl -> sub_qry "Usa"
        sub_job -> sub_cmd "Usa"
        sub_cmd -> sub_dom "Usa"
        sub_cmd -> sub_gw "Usa"
        sub_gw -> niubiz "Autoriza cobro" "REST/HTTPS"
        sub_cmd -> sub_repo "Usa"
        sub_qry -> sub_repo "Usa"
        sub_acl -> sub_qry "Usa"
        sub_repo -> db "JDBC"
        webapp -> mfg_ctl "JSON/HTTPS"
        webapp -> mfg_ctl2 "JSON/HTTPS"
        mfg_ctl -> mfg_cmd "Usa"
        mfg_ctl -> mfg_qry "Usa"
        mfg_ctl2 -> mfg_ocmd "Usa"
        mfg_cmd -> mfg_dom "Usa"
        mfg_ocmd -> mfg_dom "Usa"
        mfg_cmd -> mfg_ext "Usa"
        mfg_ocmd -> mfg_ext "Usa"
        mfg_ext -> qa_acl "Usa"
        mfg_ext -> iot_acl "Usa"
        mfg_evt -> mfg_cmd "Usa"
        mfg_evt -> mfg_ocmd "Usa"
        mfg_cmd -> mfg_repo "Usa"
        mfg_ocmd -> mfg_repo "Usa"
        mfg_qry -> mfg_repo "Usa"
        mfg_acl -> mfg_qry "Usa"
        mfg_repo -> db "JDBC"
        tb -> iot_wh "Webhook JSON/HTTPS"
        webapp -> iot_ctl "JSON/HTTPS"
        iot_wh -> iot_ing "Usa"
        iot_ing -> iot_rule "Usa"
        iot_ctl -> iot_cmd "Usa"
        iot_job -> iot_cmd "Usa"
        iot_ing -> iot_dom "Usa"
        iot_cmd -> iot_dom "Usa"
        iot_ing -> iot_ext "Usa"
        iot_cmd -> iot_ext "Usa"
        iot_ext -> mfg_acl "Usa"
        iot_ext -> sub_acl "Usa"
        iot_rule -> iot_notif "Alerta crítica"
        iot_notif -> mail "REST/HTTPS"
        iot_notif -> webapp "WebSocket"
        iot_acl -> iot_cmd "Usa"
        iot_ing -> iot_repo "Usa"
        iot_cmd -> iot_repo "Usa"
        iot_repo -> db "JDBC"
        webapp -> qa_ctl "JSON/HTTPS"
        webapp -> qa_ctl2 "JSON/HTTPS"
        webapp -> qa_ctl3 "JSON/HTTPS"
        webapp -> qa_ctl4 "JSON/HTTPS"
        qa_ctl -> qa_dcmd "Usa"
        qa_ctl2 -> qa_rcmd "Usa"
        qa_ctl3 -> qa_vcmd "Usa"
        qa_ctl4 -> qa_vcmd "Usa"
        qa_ctl4 -> qa_rep "Usa"
        qa_acl -> qa_dcmd "Usa"
        qa_acl -> qa_rcmd "Usa"
        qa_dcmd -> qa_dom "Usa"
        qa_rcmd -> qa_dom "Usa"
        qa_vcmd -> qa_dom "Usa"
        qa_dcmd -> qa_ext "Usa"
        qa_rcmd -> qa_ext "Usa"
        qa_ext -> iam_acl "Usa"
        qa_ext -> mfg_acl "Usa"
        qa_rcmd -> qa_pub "Usa"
        qa_dcmd -> qa_pub "Usa"
        qa_pub -> mfg_evt "Veredictos"
        qa_dcmd -> qa_repo "Usa"
        qa_rcmd -> qa_repo "Usa"
        qa_vcmd -> qa_repo "Usa"
        qa_rep -> qa_repo "Usa"
        qa_aud -> db "Inserta entradas"
        qa_repo -> db "JDBC"
    }

    views {
        systemContext doofplus "C4-01-Contexto" {
            title "[System Context] DoofPlus - Diagrama de Contexto (C4 Nivel 1)"
            include *
            autoLayout tb
        }
        container doofplus "C4-02-Contenedores" {
            title "[Container] DoofPlus - Diagrama de Contenedores (C4 Nivel 2)"
            include *
            autoLayout tb
        }
        component webapp "C4-03-WebApp" {
            title "[Component] Web Application (Angular) - Diagrama de Componentes (C4 Nivel 3)"
            include wa_router wa_layout wa_iam wa_org wa_subs wa_mfg wa_iot wa_qual wa_http wa_i18n wa_ws api qa prod admin
            autoLayout tb
        }
        component api "C4-04-API-IAM" {
            title "[Component] RESTful API (Spring Boot) - Identity & Access Management (C4 Nivel 3)"
            include webapp iam_ctl iam_ctl2 iam_flt iam_cmd iam_sig iam_qry iam_dom iam_tok iam_hash iam_totp iam_repo iam_acl db mail
            autoLayout tb
        }
        component api "C4-05-API-ORG" {
            title "[Component] RESTful API (Spring Boot) - Organizations & Profiles (C4 Nivel 3)"
            include webapp org_ctl org_ctl2 org_cmd org_dcmd org_pcmd org_qry org_dom org_ext org_repo org_acl db iam_acl landing mail
            autoLayout tb
        }
        component api "C4-06-API-SUB" {
            title "[Component] RESTful API (Spring Boot) - Subscriptions & Payments (C4 Nivel 3)"
            include webapp sub_ctl sub_cmd sub_qry sub_job sub_dom sub_gw sub_repo sub_acl db niubiz
            autoLayout tb
        }
        component api "C4-07-API-MFG" {
            title "[Component] RESTful API (Spring Boot) - Manufacturing & Batch Management (C4 Nivel 3)"
            include webapp mfg_ctl mfg_ctl2 mfg_cmd mfg_ocmd mfg_qry mfg_dom mfg_evt mfg_ext mfg_repo mfg_acl db qa_acl iot_acl
            autoLayout tb
        }
        component api "C4-08-API-IOT" {
            title "[Component] RESTful API (Spring Boot) - IoT Monitoring (C4 Nivel 3)"
            include webapp iot_wh iot_ctl iot_ing iot_rule iot_cmd iot_job iot_dom iot_ext iot_notif iot_repo iot_acl db tb mail mfg_acl sub_acl
            autoLayout tb
        }
        component api "C4-09-API-QA" {
            title "[Component] RESTful API (Spring Boot) - Quality & Compliance (C4 Nivel 3)"
            include webapp qa_ctl qa_ctl2 qa_ctl3 qa_ctl4 qa_dcmd qa_rcmd qa_vcmd qa_rep qa_dom qa_aud qa_ext qa_pub qa_repo qa_acl db iam_acl mfg_acl mfg_evt
            autoLayout tb
        }

        styles {
            element "Element" {
                color #ffffff
            }
            element "Person" {
                background #08427B
                shape Person
            }
            element "Software System" {
                background #1168BD
            }
            element "External" {
                background #8C8C8C
            }
            element "Container" {
                background #438DD5
            }
            element "Database" {
                shape Cylinder
            }
            element "Component" {
                background #85BBF0
                color #0B2545
            }
            relationship "Optional" {
                dashed true
            }
        }
    }
}