#Função Ramal. Usada para alterar o ramal de um usuário no AD.
#O usuário necessita ter permissão de alteração no AD.

Function Ramal

{
    #Importa o módulo do ActiveDirectory no Powershell.
    Import-Module ActiveDirectory

    #Guarda o login do usuário na variável $user
    $user=Read-Host -Prompt 'Informe o Login do Usuário'
    
    #Guarda o ramal do usuário na variável Phone. Pode ser usado o padrão (XX) XXXX-XXXX.
    $phone=Read-Host -Prompt 'Informe o Ramal do Usuário'

    #Aplica ao usuário o ramal informado.
    Set-ADUser $user -OfficePhone $phone

 }
