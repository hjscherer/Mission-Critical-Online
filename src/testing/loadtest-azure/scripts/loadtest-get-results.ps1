param
(
  # Load Test Id
  [Parameter(Mandatory=$true)]
  [string] $loadTestId,
  
  # Load Test data plane endpoint
  [Parameter(Mandatory=$true)]
  [string] $apiEndpoint,

  # Load Test data plane api version
  [Parameter(Mandatory=$true)]
  [string] $apiVersion,

  [string] $testRunId
)

. "$PSScriptRoot/common.ps1"

$urlRoot = "https://" + $apiEndpoint + "/testruns/" + $testRunId + "/clientMetrics"

# Following is to get Invoke-RestMethod to work
$url = $urlRoot + "?api-version=" + $apiVersion

# Secure string to use access token with Invoke-RestMethod in Powershell
$accessTokenSecure = ConvertTo-SecureString -String $accessToken -AsPlainText -Force

Invoke-RestMethod `
  -Uri $url `
  -Method GET `
  -Authentication Bearer `
  -Token $accessTokenSecure `
  -Verbose:$verbose

Remove-Item $accessTokenFileName