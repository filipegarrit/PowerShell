#Pegar a lista de computadores que devem receber a implantação
$computers = Get-Content "C:\Scripts\install.txt"

#Pegar a pasta com o .exe
$folder = "C:\Softwares\OCS-Windows-Agent-Setup-x64.exe"

Foreach ($computer in $computers){

  $test = Test-Path "\\$computer\C$\Temp"
  
  If ($test -eq $True) {Write-Host "Pasta existe, iniciando instalação em $computer."}
  
  Else {(Write-Host "Past não existe, iniciando a criação da pasta em $computer e iniciando a instalação") , (New-Item -ItemType Directory -Name Temp -Path "\\$computer\C$") }
  
  Echo "Copiando arquivos para C:\Temp"
  
  Copy-Item $Folder "\\$computer\C$\Temp"
  
  Echo "Segunda parte: Instalando Software em $computer"

  Invoke-Command -ComputerName $computer -ScriptBlock {(&cmd.exe /c "C:\TEMP\OCS-Windows-Agent-Setup-x64.exe" /S /DEBUG /NOW /proxy=proxy_address 192.168.10.18 /proxy_port=port 3128) , (Remove-Item -Path "C:\Temp\OCS-Windows-Agent-Setup-x64.exe" -ErrorAction Ignore)}  

}