$FTE = Get-DynamicDistributionGroup -Identity "Eletronuclear - SEDE"

Get-Recipient -RecipientPreviewFilter ($FTE.RecipientFilter)| ft displayname, city, company | Out-File "C:\TEMP\TESTE.TXT"