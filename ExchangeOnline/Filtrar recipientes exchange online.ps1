﻿$Filter = "((City -eq 'Rio de Janeiro') -and (-not(RecipientTypeDetailsValue -eq 'RoomMailbox')) -and (RecipientType -eq 'UserMailbox') -and (RecipientTypeDetails -ne 'GuestMailUser') -and (ExchangeUserAccountControl -ne 'AccountDisabled'))"
Get-Recipient -RecipientPreviewFilter $Filter | ft displayname, city, company 