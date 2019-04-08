#####
# Set up web application
#
## New Webpool
Import-Module ServerManager 
Install-WindowsFeature Web-Scripting-Tools 
Import-Module WebAdministration
Import-Module IISAdministration

New-Item 'IIS:\AppPools\MyProgram'
New-Item 'IIS:\Sites\Default Web Site\MyProgram' -physicalPath 'C:\MyProgram\ApplicationServer' -Type Application -ApplicationPool 'MyProgram'
New-Item 'IIS:\Sites\Default Web Site\MyProgram\api' -physicalPath 'C:\MyProgram\ApplicationServer\api' -Type Application -ApplicationPool 'MyProgram'
New-Item 'IIS:\Sites\Default Web Site\MyProgram\i18n' -physicalPath 'C:\MyProgram\ApplicationServer\i18n' -Type VirtualDirectory
New-Item 'IIS:\Sites\Default Web Site\MyProgram\i18n\resources' -physicalPath 'C:\ProgramData\MyProgram\Translations\WebPages\i18n\resources' -Type VirtualDirectory
