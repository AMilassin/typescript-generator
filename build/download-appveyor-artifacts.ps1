# this script uses credentials from system browser, so first sign in to appveyor then run this script
# documentation: http://www.appveyor.com/docs/api/samples/download-artifacts-ps
$apiUrl = 'https://ci.appveyor.com/api'

Write-Host -ForegroundColor DarkCyan "Getting appveyor project..."
$project = Invoke-RestMethod -Method Get -Uri "$apiUrl/projects/vojtechhabarta/typescript-generator"
$jobId = $project.build.jobs[0].jobId

$artifactsUri = "$apiUrl/buildjobs/$jobId/artifacts/target/artifacts.zip"
Write-Host -ForegroundColor DarkCyan "Downloading '$artifactsUri'..."
$zipFilePath = "target\artifacts.zip"
$zipFileDirectory = New-Item -ItemType directory -Path (Split-Path $zipFilePath) -Force
Invoke-RestMethod -Method Get -Uri $artifactsUri -OutFile $zipFilePath
$zipFile = Get-Item $zipFilePath
$zipFile.FullName
