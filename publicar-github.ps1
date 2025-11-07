# Script para publicar Eventum en GitHub Pages
# Ejecuta este script después de instalar Git y crear el repositorio en GitHub

Write-Host "🚀 Publicando Eventum en GitHub Pages..." -ForegroundColor Cyan
Write-Host ""

# Verificar si Git está instalado
try {
    $gitVersion = git --version
    Write-Host "✅ Git encontrado: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Git no está instalado." -ForegroundColor Red
    Write-Host "Por favor, instala Git desde: https://git-scm.com/download/win" -ForegroundColor Yellow
    Write-Host "Luego ejecuta este script nuevamente." -ForegroundColor Yellow
    exit 1
}

# Solicitar información del usuario
Write-Host ""
$githubUser = Read-Host "Ingresa tu usuario de GitHub"
$repoName = Read-Host "Ingresa el nombre del repositorio (ej: eventum)"

if ([string]::IsNullOrWhiteSpace($githubUser) -or [string]::IsNullOrWhiteSpace($repoName)) {
    Write-Host "❌ Debes proporcionar usuario y nombre del repositorio." -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "📦 Inicializando repositorio Git..." -ForegroundColor Cyan

# Inicializar Git si no existe
if (-not (Test-Path .git)) {
    git init
    Write-Host "✅ Repositorio Git inicializado" -ForegroundColor Green
} else {
    Write-Host "✅ Repositorio Git ya existe" -ForegroundColor Green
}

# Agregar todos los archivos
Write-Host ""
Write-Host "📝 Agregando archivos..." -ForegroundColor Cyan
git add .
Write-Host "✅ Archivos agregados" -ForegroundColor Green

# Hacer commit
Write-Host ""
Write-Host "💾 Creando commit..." -ForegroundColor Cyan
git commit -m "Initial commit - Eventum app" 2>&1 | Out-Null
if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Commit creado" -ForegroundColor Green
} else {
    Write-Host "⚠️  No hay cambios nuevos para commitear" -ForegroundColor Yellow
}

# Configurar rama main
Write-Host ""
Write-Host "🌿 Configurando rama main..." -ForegroundColor Cyan
git branch -M main 2>&1 | Out-Null
Write-Host "✅ Rama main configurada" -ForegroundColor Green

# Configurar remote
Write-Host ""
Write-Host "🔗 Configurando conexión con GitHub..." -ForegroundColor Cyan
$remoteUrl = "https://github.com/$githubUser/$repoName.git"

# Verificar si el remote ya existe
$existingRemote = git remote get-url origin 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "⚠️  Remote 'origin' ya existe. ¿Deseas actualizarlo? (S/N)" -ForegroundColor Yellow
    $response = Read-Host
    if ($response -eq "S" -or $response -eq "s") {
        git remote set-url origin $remoteUrl
        Write-Host "✅ Remote actualizado" -ForegroundColor Green
    }
} else {
    git remote add origin $remoteUrl
    Write-Host "✅ Remote agregado" -ForegroundColor Green
}

# Push a GitHub
Write-Host ""
Write-Host "⬆️  Subiendo a GitHub..." -ForegroundColor Cyan
Write-Host "⚠️  Te pedirá tu usuario y contraseña/token de GitHub" -ForegroundColor Yellow
Write-Host ""
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "✅ ¡Publicación exitosa!" -ForegroundColor Green
    Write-Host ""
    Write-Host "🌐 Tu sitio estará disponible en:" -ForegroundColor Cyan
    Write-Host "   https://$githubUser.github.io/$repoName/" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "📋 No olvides activar GitHub Pages:" -ForegroundColor Cyan
    Write-Host "   1. Ve a tu repositorio en GitHub" -ForegroundColor White
    Write-Host "   2. Settings → Pages" -ForegroundColor White
    Write-Host "   3. Source: Deploy from a branch" -ForegroundColor White
    Write-Host "   4. Branch: main, Folder: / (root)" -ForegroundColor White
    Write-Host "   5. Save" -ForegroundColor White
} else {
    Write-Host ""
    Write-Host "❌ Error al subir. Verifica:" -ForegroundColor Red
    Write-Host "   - Que el repositorio exista en GitHub" -ForegroundColor Yellow
    Write-Host "   - Tus credenciales de GitHub" -ForegroundColor Yellow
    Write-Host "   - Que tengas permisos en el repositorio" -ForegroundColor Yellow
}

