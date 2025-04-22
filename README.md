# Pai Subscriptions App

> *Aplicación móvil para gestión de suscripciones mensuales con Stripe (simulado)*

---

## 📂 Estructura del Proyecto

```text
lib/
├── features/
│   ├── auth/                # Login, SignUp, Password reset
│   ├── dashboard/           # Pantalla principal, suscripciones, pagos
│   ├── payment_methods/     # Listado y gestión de métodos de pago
│   └── create_payment_method/ # UI para crear un nuevo método de pago
├── utils/                   # Colores, rutas de imágenes, animaciones, utilidades
├── widgets/                 # Componentes reutilizables (AppTextField, AppImage, Toast)
└── main.dart                # Punto de entrada
```

Cada *feature* sigue **Clean Architecture** (domain, data, ui) y usa **Riverpod** + **go_router** para estado y navegación.

---

## 🚀 Cómo ejecutar

1. Clona el repositorio:
   ```bash
   git clone [https://github.com/EmmaDev1/Pai_Test.git](https://github.com/EmmaDev-1/PaiTest)
cd pai_subscriptions
```
2. Instala dependencias:
   ```bash
flutter pub get
```
3. Ejecuta en emulador o dispositivo:
   ```bash
   flutter run


> **Requisitos**: Flutter >=3.0.0, Dart 2.17+, Android Studio/Xcode o emulador.

---

## 🛠 Decisiones Técnicas

| Elemento              | Elección                                   |
|-----------------------|--------------------------------------------|
| Arquitectura          | Clean Architecture (Domain/Data/UI)        |
| Estado                | Riverpod (`FutureProvider`, `autoDispose`) |
| Navegación            | go_router + `CustomTransitionPage`         |
| Consumo API           | JSON simulado → `SubscriptionRemoteDataSource` con `http`/`dio` falso |
| Animaciones           | `AnimationController` (flip 3D), `AnimatedSize`, `TweenAnimationBuilder` |
| Componentes UI        | Reutilizables: `AppTextField`, `AppImage`, `AppToast`, `CirculesAnimationBackground` |
| Testing               | Widget tests para Login y tarjeta giratoria |
| Lint & Formato        | `analysis_options.yaml`, `flutter format`  |

---

## ✨ Funcionalidades Principales

- **Login / Sign Up Simulado**: selector de usuario falso.
- **Dashboard**:
  - Datos del cliente (nombre, correo).
  - Estado de suscripción (activa, cancelada, en prueba).
  - Próximo pago programado.
- **Métodos de Pago**:
  - Simulación de alta y listado.
  - Selección de método principal.
- **Crear Método de Pago**:
  - Vista previa en tiempo real con tarjeta giratoria.
  - Formato MM/YY, validación CVV, formateo de número.
- **Animaciones**:
  - Fondo animado con círculos luminosos.
  - Transiciones entre pantallas.
  - Expansibles `AnimatedSize`.
- **Notificaciones**:
  - Toast customizados con `Toastification`.

---

## 🗺 Mejoras Futuras

- **Autenticación Real**: Firebase Auth (Email/Password, Google, Apple).
- **Gestión de Secretos**: Doppler o Vault para claves Stripe/Firebase.
- **Internacionalización (i18n)**: `flutter_localizations`, `intl`.
- **Stripe SDK**: integrar el SDK móvil para pagos reales.
- **Cache & Offline**: Hive/SharedPreferences para historial offline.
- **Dark Mode**: tema oscuro y selector de tema.
- **CI/CD**: GitHub Actions para tests, lint y despliegue.

---

###### 📝 Licencia bajo MIT

