$ErrorActionPreference = "Stop"

$projectRoot = Split-Path -Parent $PSScriptRoot

$stacks = @(
    (Join-Path $projectRoot "symfony-task-api-service"),
    (Join-Path $projectRoot "react-analytics-dashboard"),
    (Join-Path $projectRoot "symfony-client-invoice-saas"),
    (Join-Path $projectRoot "flutter-task-manager-app")
)

foreach ($stack in $stacks) {
    if (Test-Path (Join-Path $stack "compose.yaml")) {
        docker compose -f (Join-Path $stack "compose.yaml") down | Out-Null
    }
}

docker network rm portfolio_suite_network 2>$null | Out-Null
docker compose up --build -d

function Invoke-DockerComposeRetry {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Command,

        [int]$Attempts = 20,
        [int]$DelaySeconds = 3
    )

    for ($attempt = 1; $attempt -le $Attempts; $attempt++) {
        try {
            Invoke-Expression $Command

            if ($LASTEXITCODE -eq 0) {
                return
            }
        }
        catch {
            if ($attempt -eq $Attempts) {
                throw
            }
        }

        Start-Sleep -Seconds $DelaySeconds
    }

    throw "Command failed after $Attempts attempts: $Command"
}

Invoke-DockerComposeRetry -Command "docker compose exec -T symfony-task-api-app php bin/console doctrine:migrations:migrate --no-interaction"
Invoke-DockerComposeRetry -Command "docker compose exec -T symfony-task-api-app php bin/console app:seed-demo-data --no-interaction"
Invoke-DockerComposeRetry -Command "docker compose exec -T symfony-client-invoice-saas-app php bin/console doctrine:migrations:migrate --no-interaction"

Write-Host "Suite available:"
Write-Host "API: http://localhost:8002"
Write-Host "Dashboard: http://localhost:3000"
Write-Host "Symfony SaaS: http://localhost:8085"
Write-Host "Flutter web: start with --profile flutter"
