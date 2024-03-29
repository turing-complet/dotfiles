
Import-Module '/home/jen/.local/share/powershell/Modules/posh-git/1.0.0/posh-git.psd1'

$env:Path += ";C:\Users\jen\AppData\Local\Programs\Python\Python38"
$env:Path += ";C:\Users\jen\AppData\Local\Programs\Python\Python38\Scripts"
$env:Path += ";C:\Users\jen\Downloads\nvim-win64\Neovim\bin"
$env:Path += ";C:\Program Files\Notepad++"

function gs { git status }
function gb { git branch -vv } 
function vimrc { vim ~/.vimrc }
function vim { nvim.exe  }

filter maybesubstring {
    param(
        [Parameter(ValueFromPipeline)]
        [string]$text,
        [Nullable[int]]$len
    )
    if ($null -eq $len) { $text }
    else { $text.Substring(0, [math]::Min($len, $text.Length)) }
}

function guid {
    param(
        [Parameter()]
        [ValidateSet("Default", "Clean")]
        [string]$Format = "Default",
        [Parameter()]
        [Nullable[int]]$length
    )
    $guid = [System.Guid]::NewGuid()
    switch ($Format) 
    {
        "Default" { $guid.ToString() | maybesubstring -len $length }
        "Clean" { $guid.ToString("N") | maybesubstring -len $length }
    }
}

function Format-Xml (
    [Parameter(ValueFromPipeline)]
    [xml]$xml
)
{
    $StringWriter = New-Object System.IO.StringWriter
    $XmlWriter = New-Object System.Xml.XmlTextWriter $StringWriter
    $XmlWriter.Formatting = "indented"
    $XmlWriter.Indentation = 2
    $xml.WriteContentTo($XmlWriter)
    $XmlWriter.Flush()
    Write-Output $StringWriter.ToString()
}

function Parse-JWTtoken {
 
    [cmdletbinding()]
    param([Parameter(Mandatory=$true)][string]$token)
 
    #Validate as per https://tools.ietf.org/html/rfc7519
    #Access and ID tokens are fine, Refresh tokens will not work
    if (!$token.Contains(".") -or !$token.StartsWith("eyJ")) { Write-Error "Invalid token" -ErrorAction Stop }
 
    #Header
    $tokenheader = $token.Split(".")[0].Replace('-', '+').Replace('_', '/')
    #Fix padding as needed, keep adding "=" until string length modulus 4 reaches 0
    while ($tokenheader.Length % 4) { Write-Verbose "Invalid length for a Base-64 char array or string, adding ="; $tokenheader += "=" }
    Write-Verbose "Base64 encoded (padded) header:"
    Write-Verbose $tokenheader
    #Convert from Base64 encoded string to PSObject all at once
    Write-Verbose "Decoded header:"
    [System.Text.Encoding]::ASCII.GetString([system.convert]::FromBase64String($tokenheader)) | ConvertFrom-Json | fl | Out-Default
 
    #Payload
    $tokenPayload = $token.Split(".")[1].Replace('-', '+').Replace('_', '/')
    #Fix padding as needed, keep adding "=" until string length modulus 4 reaches 0
    while ($tokenPayload.Length % 4) { Write-Verbose "Invalid length for a Base-64 char array or string, adding ="; $tokenPayload += "=" }
    Write-Verbose "Base64 encoded (padded) payoad:"
    Write-Verbose $tokenPayload
    #Convert to Byte array
    $tokenByteArray = [System.Convert]::FromBase64String($tokenPayload)
    #Convert to string array
    $tokenArray = [System.Text.Encoding]::ASCII.GetString($tokenByteArray)
    Write-Verbose "Decoded array in JSON format:"
    Write-Verbose $tokenArray
    #Convert from JSON to PSObject
    $tokobj = $tokenArray | ConvertFrom-Json
    Write-Verbose "Decoded Payload:"
    
    return $tokobj
}
