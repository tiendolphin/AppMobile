$publishDir = "d:\Dev\Projects\AndroidStudioProjects\datxe\webAPI\publish"
$ftpBase = "ftp://site104694.siteasp.net/wwwroot"
$user = "site104694"
$pass = "Sf3#+Zc7Ri2_"

function Create-FtpDir($dirUrl) {
    try {
        $req = [System.Net.FtpWebRequest]::Create($dirUrl)
        $req.Credentials = New-Object System.Net.NetworkCredential($user, $pass)
        $req.Method = [System.Net.WebRequestMethods+Ftp]::MakeDirectory
        $req.UsePassive = $true
        $resp = $req.GetResponse()
        $resp.Close()
    } catch {
        # Directory might already exist
    }
}

# 1. Create directories
$dirs = Get-ChildItem -Path $publishDir -Recurse -Directory | Sort-Object FullName
foreach ($d in $dirs) {
    $rel = $d.FullName.Substring($publishDir.Length).Replace("\", "/")
    $targetUrl = "$ftpBase$rel"
    Create-FtpDir $targetUrl
}

# Also ensure logs dir exists
Create-FtpDir "$ftpBase/logs"

# 2. Upload files
$files = Get-ChildItem -Path $publishDir -Recurse -File
$wc = New-Object System.Net.WebClient
$wc.Credentials = New-Object System.Net.NetworkCredential($user, $pass)

$total = $files.Count
$idx = 0
foreach ($f in $files) {
    $idx++
    $rel = $f.FullName.Substring($publishDir.Length).Replace("\", "/")
    $targetUrl = "$ftpBase$rel"
    Write-Host "[$idx/$total] Uploading $rel..."
    try {
        $wc.UploadFile($targetUrl, "STOR", $f.FullName) | Out-Null
    } catch {
        Write-Warning "Failed to upload $rel : $_"
    }
}

Write-Host "ALL FILES UPLOADED SUCCESSFULLY!"

