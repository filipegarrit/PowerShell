$users = Get-Content "C:\temp\users.csv"

foreach ($user in $users)
{

Get-MailboxStatistics -Identity $users | Export-Csv "c:\temp\mailboxes.csv"


}
