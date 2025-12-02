
$ErrorActionPreference = "Stop"

$projectRoot = "D:\study\NEU\neu courses\7580\Sprint-demo\demo5"

$env:CICD_API_BASE = "http://localhost:30080"

$jar = "D:\study\NEU\neu courses\7580\code\tc-cicd\cli\target\cli-0.1.0-SNAPSHOT-runner.jar"

Write-Host "== cd to demo5 repo ==" -ForegroundColor DarkGray
Set-Location $projectRoot

Write-Host "== Run parallel-with-needs (from demo5) ==" -ForegroundColor Cyan
& java -jar "$jar" run --file ".pipelines/parallel-with-needs.yaml" --branch "main"

Write-Host ""
Write-Host "== Check status (first) ==" -ForegroundColor Cyan
& java -jar "$jar" status ".pipelines/parallel-with-needs.yaml"

Write-Host ""
Write-Host "== Wait 8 seconds before checking again ==" -ForegroundColor DarkGray
Start-Sleep -Seconds 8

Write-Host ""
Write-Host "== Check status (second) ==" -ForegroundColor Cyan
& java -jar "$jar" status ".pipelines/parallel-with-needs.yaml"
