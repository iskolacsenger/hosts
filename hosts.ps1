$url = "https://raw.githubusercontent.com/iskolacsenger/hosts/master/hosts"
$output = "c:\windows\system32\drivers\etc\hosts"
$start_time = Get-Date

Invoke-WebRequest -Uri $url -OutFile $output