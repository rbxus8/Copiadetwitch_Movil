# 📱 Copiadetwitch_Movil | Flutter Clone

# 📱 Twitch Clone App - Guía Completa de Instalación

Una app móvil que replica la interfaz de Twitch, construida con Flutter. Disponible para web, Android e iOS.

## 🎯 Características

- ✅ **Home Screen** - Streams recomendados en vivo
- ✅ **Browse Screen** - Categorías de juegos populares
- ✅ **Search Screen** - Búsqueda de canales y juegos
- ✅ **Following Screen** - Canales seguidos (en vivo y offline)
- ✅ **Profile Screen** - Perfil de usuario con estadísticas
- ✅ **Dark Theme** - Diseño oscuro estilo Twitch
- ✅ **Responsive Design** - Se adapta a cualquier pantalla

## 📋 Requisitos Previos

### ¿Qué necesito instalar?

1. **Flutter SDK v3.41.4** ✅ (Ya lo tienes en: `C:\Users\Estudiante\Downloads\flutter_windows_3.41.4-stable\flutter`)
2. **Git v2.53.0** ✅ (Ya lo tienes instalado)
3. **Google Chrome o Microsoft Edge** ✅ (Para ejecutar en web)

### Opcional (si quieres ejecutar en Android):

- **Android Studio** (para emulador)
- **Emulador de Android** o teléfono conectado

## 🚀 Paso 1: Descargar el Proyecto

```bash
git clone https://github.com/rbxus8/Copiadetwitch_Movil.git
cd Copiadetwitch_Movil
```

## 🚀 Paso 2: Instalar Dependencias

Abre PowerShell en la carpeta del proyecto y ejecuta:

```powershell
"C:\Users\Estudiante\Downloads\flutter_windows_3.41.4-stable\flutter\bin\flutter.bat" pub get
```

Espera a que termine (debería decir "Got dependencies").

## ▶️ Paso 3: Ejecutar la App en Web

Esta es la forma más fácil para empezar. Ejecuta:

```powershell
"C:\Users\Estudiante\Downloads\flutter_windows_3.41.4-stable\flutter\bin\flutter.bat" run -d chrome --web-port=8080
```

Luego abre tu navegador en: **http://localhost:8080**

¡Deberías ver la app de Twitch corriendo!

## 📱 Paso 4 (Opcional): Ejecutar en Emulador Android

### Opción A: Si tienes emulador ya creado

1. Abre **Android Studio**
2. Ve a **Device Manager** (botón arriba a la derecha con teléfono)
3. Haz click en **Play (▶)** para iniciar el emulador
4. Espera ~30 segundos a que cargue
5. En PowerShell, ejecuta:

```powershell
"C:\Users\Estudiante\Downloads\flutter_windows_3.41.4-stable\flutter\bin\flutter.bat" run
```

### Opción B: Si NO tienes emulador

1. Abre **Android Studio**
2. Ve a **Device Manager**
3. Haz click en **Create Device**
4. Selecciona un modelo de teléfono (ej: Pixel 5)
5. Haz click en **Play (▶)**
6. Luego ejecuta el comando de arriba

## ⚙️ Configuración de Flutter (Una sola vez)

Si quieres agregar Flutter al PATH para que funcione desde cualquier carpeta:

1. Busca "Variables de entorno" en Windows
2. Abre "Editar las variables de entorno del sistema"
3. Haz click en "Variables de entorno..."
4. Bajo "Variables del sistema", busca "Path" y haz click en "Editar"
5. Haz click en "Nuevo" y agrega:
   ```
   C:\Users\Estudiante\Downloads\flutter_windows_3.41.4-stable\flutter\bin
   ```
6. Haz click en "Aceptar" y cierra todas las ventanas
7. **Reinicia PowerShell**
8. Ahora puedes usar simplemente: `flutter run -d chrome`

## 🎮 Atajos mientras la app corre

| Tecla | Acción |
|-------|--------|
| `r` | Recargar la app (Hot Reload) |
| `R` | Reiniciar completamente |
| `h` | Ver todos los comandos |
| `q` | Salir |

## 📁 Estructura del Proyecto

```
Copiadetwitch_Movil/
├── lib/
│   ├── main.dart                    # Archivo principal de la app
│   ├── screens/
│   │   ├── home_screen.dart         # Pantalla de inicio
│   │   ├── browse_screen.dart       # Categorías de juegos
│   │   ├── search_screen.dart       # Búsqueda
│   │   ├── following_screen.dart    # Canales que sigues
│   │   └── profile_screen.dart      # Tu perfil
│   └── widgets/
│       ├── stream_card.dart         # Tarjeta de stream
│       └── category_card.dart       # Tarjeta de categoría
├── pubspec.yaml                     # Dependencias (IMPORTANTE)
├── .gitignore                       # Archivos que Git ignora
└── README.md                        # Documentación
```

## 🔧 Solución de Problemas

### ❌ "flutter: El término 'flutter' no se reconoce"

**Solución:** Usa la ruta completa:
```powershell
"C:\Users\Estudiante\Downloads\flutter_windows_3.41.4-stable\flutter\bin\flutter.bat" pub get
```

### ❌ "No supported devices connected"

**Solución:** Use Chrome en lugar del emulador:
```powershell
"C:\Users\Estudiante\Downloads\flutter_windows_3.41.4-stable\flutter\bin\flutter.bat" run -d chrome
```

### ❌ "The application is not configured to build on the web"

**Solución:** Ya debería estar configurado, pero si aparece, ejecuta:
```powershell
"C:\Users\Estudiante\Downloads\flutter_windows_3.41.4-stable\flutter\bin\flutter.bat" create . --platforms=web
```

### ❌ "Missing or invalid authentication code"

**Solución:** Reinicia:
1. Presiona `q` en PowerShell
2. Espera 5 segundos
3. Ejecuta de nuevo:
```powershell
"C:\Users\Estudiante\Downloads\flutter_windows_3.41.4-stable\flutter\bin\flutter.bat" run -d chrome --web-port=8080
```

### ❌ La app se abre pero no carga

**Solución:** Abre manualmente en Chrome:
- `http://localhost:8080`
- Si no funciona, intenta: `http://127.0.0.1:8080`

## 📦 Dependencias Instaladas

En `pubspec.yaml` están incluidas estas librerías:

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
  google_fonts: ^6.0.0
```

## 📝 Comandos Útiles

```bash
# Verificar instalación de Flutter
flutter doctor

# Ver dispositivos conectados
flutter devices

# Limpiar caché
flutter clean

# Reinstalar dependencias
flutter pub get

# Actualizar dependencias
flutter pub upgrade

# Verificar problemas en el código
flutter analyze
```

## 🌐 Subir cambios a GitHub

```bash
# Ver cambios realizados
git status

# Agregar todos los cambios
git add .

# Crear un commit con descripción
git commit -m "Descripción de los cambios"

# Subir a GitHub
git push
```

## 🎨 Colores de la App

La app usa estos colores (estilo Twitch):

- **Morado primario:** `#9147FF`
- **Fondo:** `#0E0E10` (gris oscuro)
- **Texto:** `#EFEFF1` (blanco grisáceo)
- **Secundario:** `#30303D` (gris más oscuro aún)

## 📱 Compilar para producción

### Para Web:
```bash
flutter build web --release
```
Los archivos estarán en `build/web/`

### Para Android (APK):
```bash
flutter build apk --release
```
El archivo estará en `build/app/outputs/apk/release/app-release.apk`

## 🤝 Cómo contribuir

1. Haz un Fork del proyecto
2. Crea una rama: `git checkout -b mi-feature`
3. Realiza cambios y commit: `git commit -m "Mi feature"`
4. Push: `git push origin mi-feature`
5. Abre un Pull Request

## 🔗 Enlaces Útiles

- [Flutter Oficial](https://flutter.dev)
- [Documentación API](https://api.flutter.dev)
- [Videos Flutter](https://www.youtube.com/flutterdev)
- [GitHub del Proyecto](https://github.com/rbxus8/Copiadetwitch_Movil)

## 📄 Licencia

MIT License - Uso libre

## 👨‍💻 Autor

GitHub: [@rbxus8](https://github.com/rbxus8)

---

**¿Preguntas?** Abre un Issue en el repositorio.

**¿Te sirvió?** ⭐ Dale una estrella en GitHub!

Última actualización: Marzo 4, 2026
