

# remove all containers except for sql1

$containers = docker ps -a 
$nosql = $containers | where { !$_.Contains('sql1') }
$nosql = $nosql | select -Skip 1
$spl = $nosql | foreach { $_ -split '\s' | select -First 1 }
$spl | foreach { docker rm $_ }