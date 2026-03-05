#!/usr/bin/env pwsh

# Set git configuration to avoid editor prompts
$env:GIT_EDITOR = "cat"
[Environment]::SetEnvironmentVariable('GIT_EDITOR', 'cat', 'Process')

# Push to GitHub
cd "c:\Users\Estudiante\Downloads\aqui"

Write-Host "Configurando git..."
git config user.name "Estudiante"
git config user.email "estudiante@example.com"

Write-Host "Agregando archivos..."
git add .

Write-Host "Realizando cambios..."
git reset --soft HEAD~1 2>$null
git add --all
git commit -m "Flutter Twitch Mobile App Clone" --no-edit 2>$null || git commit -m "Flutter Twitch Mobile App Clone"

Write-Host "Subiendo a GitHub..."
git push -u origin main --force-with-lease 2>&1 | Write-Host

Write-Host "`n✅ Completado!"
