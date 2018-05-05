$source = "https://github.com/bhowley/IdentityServer4.Modules/archive/2.2.0.zip"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest $source -OutFile ui.zip

Expand-Archive ui.zip ui.temp

if (!(Test-Path -Path Modules))  { mkdir Modules }
if (!(Test-Path -Path Views))       { mkdir Views }
if (!(Test-Path -Path wwwroot))     { mkdir wwwroot }

copy .\ui.temp\IdentityServer4.Modules-release\Modules\* Modules -recurse -force
copy .\ui.temp\IdentityServer4.Modules-release\Views\* Views -recurse -force
copy .\ui.temp\IdentityServer4.Modules-release\wwwroot\* wwwroot -recurse -force

del ui.zip
del ui.temp -recurse
