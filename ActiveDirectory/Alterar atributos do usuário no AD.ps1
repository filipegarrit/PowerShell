#Prompt para solicitar credencial do usuário
$Credential = $host.ui.PromptForCredential("Need credentials", "Please enter your user name and password.", "", "NetBiosUserName")

#Obrigatório importar o módulo Active Directory do Powershell
Import-Module Active Directory

#Coletar as propriedades do usuário em questão. Neste caso queremos o telefone comercial.
Get-ADUser usuario -Properties OfficePhone

#Setar o novo ramal para o usuário.
Set-ADUser usuario -OfficePhone "(XX) XXXX-XXXX"

##Podem ser usados vários outros parâmetros. Seguem os Links da Microsoft:
##https://learn.microsoft.com/en-us/powershell/module/activedirectory/?view=windowsserver2022-ps
##https://learn.microsoft.com/en-us/powershell/module/activedirectory/set-aduser?view=windowsserver2022-ps
