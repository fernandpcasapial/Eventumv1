# Instrucciones para Publicar en GitHub Pages

## Paso 1: Instalar Git (si no lo tienes)

1. Descarga Git desde: https://git-scm.com/download/win
2. Instala Git siguiendo el asistente
3. Reinicia la terminal después de instalar

## Paso 2: Crear un Repositorio en GitHub

1. Ve a https://github.com y crea una cuenta (si no tienes una)
2. Haz clic en el botón "+" en la esquina superior derecha
3. Selecciona "New repository"
4. Nombre del repositorio: `eventum` (o el nombre que prefieras)
5. Marca "Public"
6. **NO** marques "Initialize this repository with a README"
7. Haz clic en "Create repository"

## Paso 3: Inicializar Git en tu Proyecto

Abre PowerShell o Terminal en la carpeta `D:\ATLAS` y ejecuta:

```bash
git init
git add .
git commit -m "Initial commit - Eventum app"
```

## Paso 4: Conectar con GitHub y Subir

Reemplaza `TU-USUARIO` y `TU-REPOSITORIO` con tus datos reales:

```bash
git branch -M main
git remote add origin https://github.com/TU-USUARIO/TU-REPOSITORIO.git
git push -u origin main
```

Te pedirá tu usuario y contraseña de GitHub. Si tienes autenticación de dos factores, usa un Personal Access Token en lugar de la contraseña.

## Paso 5: Activar GitHub Pages

1. Ve a tu repositorio en GitHub
2. Haz clic en "Settings" (Configuración)
3. En el menú lateral, busca "Pages"
4. En "Source", selecciona "Deploy from a branch"
5. Selecciona la rama "main" y la carpeta "/ (root)"
6. Haz clic en "Save"
7. Espera unos minutos y tu sitio estará disponible en:
   `https://TU-USUARIO.github.io/TU-REPOSITORIO/`

## Actualizaciones Futuras

Cada vez que hagas cambios, ejecuta:

```bash
git add .
git commit -m "Descripción de los cambios"
git push
```

Los cambios se publicarán automáticamente en GitHub Pages en unos minutos.

## Nota sobre Autenticación

Si GitHub te pide autenticación:
1. Ve a GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
2. Genera un nuevo token con permisos `repo`
3. Usa ese token como contraseña cuando Git te lo pida

