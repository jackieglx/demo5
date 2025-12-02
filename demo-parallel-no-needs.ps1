# demo-parallel-no-needs.ps1
$ErrorActionPreference = "Stop"

# 1. demo5 这个 demo 仓库/目录作为 pipeline 所在 repo
$projectRoot = "D:\study\NEU\neu courses\7580\Sprint-demo\demo5"

# 2. 设置 API base（NodePort）
$env:CICD_API_BASE = "http://localhost:30080"

# 3. CLI jar 路径（还是用 tc-cicd 里编好的 jar）
$jar = "D:\study\NEU\neu courses\7580\code\tc-cicd\cli\target\cli-0.1.0-SNAPSHOT-runner.jar"

Write-Host "== cd to demo5 repo ==" -ForegroundColor DarkGray
Set-Location $projectRoot

Write-Host "== Run parallel-no-needs (from demo5) ==" -ForegroundColor Cyan
& java -jar "$jar" run --file ".pipelines/parallel-no-needs.yaml" --branch "main"

Write-Host ""
Write-Host "== Check status (first) ==" -ForegroundColor Cyan
& java -jar "$jar" status ".pipelines/parallel-no-needs.yaml"

Write-Host ""
Write-Host "== Wait 5 seconds before checking again ==" -ForegroundColor DarkGray
Start-Sleep -Seconds 5

Write-Host ""
Write-Host "== Check status (second) ==" -ForegroundColor Cyan
& java -jar "$jar" status ".pipelines/parallel-no-needs.yaml"
