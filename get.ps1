$source = "https://github.com/bhowley/IdentityServer4.Quickstart.UI/archive/2.2.0.zip"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest $source -OutFile ui.zip

Expand-Archive ui.zip ui.temp

if (!(Test-Path -Path Modules))  { mkdir Modules }
if (!(Test-Path -Path Views))       { mkdir Views }
if (!(Test-Path -Path wwwroot))     { mkdir wwwroot }

copy .\ui\IdentityServer4.Quickstart.UI-release\Modules\* Modules -recurse -force
copy .\ui\IdentityServer4.Quickstart.UI-release\Views\* Views -recurse -force
copy .\ui\IdentityServer4.Quickstart.UI-release\wwwroot\* wwwroot -recurse -force

del ui.zip
del ui.temp -recurse
