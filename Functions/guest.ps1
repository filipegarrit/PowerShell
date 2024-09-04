#Função guest. Usada para exibir um convidado do Tenant na GAL.

Function guest

{
    #Conecta no AzureAD
    Connect-AzureAD

    #Conecta no Exchange Online
    Connect-ExchangeOnline

    #Limpa a console
    Clear-Host

    #Solicita o ID Azure AD do usuário.
    $objectId = Read-Host -Prompt 'Informe o ID do Usuário'

    #Solicita o e-mail #EXT# do convidado.
    $mailUser = Read-Host -Prompt 'Informe o e-mail do usuário Convidado'

    #Exibir as informações do usuário com base no ID
    Get-AzureADUser -ObjectId $objectId | Format-Table

    #Pausa para confirmar se o usuário está correto
    Pause

    #Configura a Exibição do usuário no Catálogo de Endereços do Azure
    Set-AzureADUser -ObjectId $objectId -ShowInAddressList $True

    #Configura a Exibição do usuário no Catálogo de Endereços do Exchange. OBS: usar atributo 'User principal name' como o exemplo ao lado - login_dominio.com.br#EXT#
    Set-MailUser $mailUser -HiddenFromAddressListsEnabled $false

 }