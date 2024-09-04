#Limpar a console do POSH
Clear-Host

#Conectar no Exchange Online
Connect-ExchangeOnline

#Filtro para que o grupo dinâmico não inclua os parâmetros listados.
$Filter = "((City -eq 'City') -and (-not(RecipientTypeDetailsValue -eq 'RoomMailbox')) -and (RecipientType -eq 'UserMailbox') -and (RecipientTypeDetails -ne 'GuestMailUser') -and (ExchangeUserAccountControl -ne 'AccountDisabled'))"

#Criar o grupo atribuindo Nome, Nome de Exibição, Alias e SMTP primário, utilizando o Filtro acima como parâmetro para os membros a serem incluídos
New-DynamicDistributionGroup -Name 'Group' -DisplayName 'GroupName' -Alias 'Alias' -PrimarySmtpAddress 'PrimarySMTP' -RecipientFilter $Filter
