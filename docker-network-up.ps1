$networkName = "portfolio_suite_network"

$existing = docker network ls --format "{{.Name}}" | Where-Object { $_ -eq $networkName }
if (-not $existing) {
    docker network create $networkName | Out-Null
    Write-Host "Created shared Docker network $networkName"
} else {
    Write-Host "Shared Docker network $networkName already exists"
}
