# Windows System Administration 

## Custom Windows Powershell CMDLET for Telnet

Launch Windows PowerShell console with administrator privilege, then run to create the file:

    New-Item -ItemType File -Path "$env:UserProfile\documents\WindowsPowerShell\Modules\Telnet\Telnet.psm1" -Force
    

Run the following command to open the newly created module file with Windows PowerShell ISE:

    ise "$env:UserProfile\documents\WindowsPowerShell\Modules\Telnet\Telnet.psm1"

Copy the below into the Windows PowerShell ISE session:

    Function Telnet{

    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true,
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true)]
        [Alias ('HostName','cn','Host','Computer')]
        [String]$ComputerName='localhost',
        [Parameter(Mandatory=$true,
            ValueFromPipeline=$true,
            ValueFromPipelineByPropertyName=$true)]
        [int32]$Port,
         [int32] $Timeout = 10000
    )

    Begin {}

    Process {
    foreach($Computer in $ComputerName) {
    Try {
          $tcp = New-Object System.Net.Sockets.TcpClient
          $connection = $tcp.BeginConnect($Computer, $Port, $null, $null)
          $connection.AsyncWaitHandle.WaitOne($timeout,$false)  | Out-Null 
          if($tcp.Connected -eq $true) {
          Write-Host  "Successfully connected to Host: `"$Computer`" on Port: `"$Port`"" -ForegroundColor Green
      }
      else {
        Write-Host "Could not connect to Host: `"$Computer `" on Port: `"$Port`"" -ForegroundColor Red
      }
    }
    
    Catch {
            Write-Host "Unknown Error" -ForegroundColor Red
          }

       }
    
    }
    End {}
    }



OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS C:\>Telnet -ComputerName DC1 -Port 3389
    
    This command reports if DC1 can be connected on port 3389 (default port for RDP). 
    By simply running this command, you can check if RDP is enabled on computer DC1.
     
        
    -------------------------- EXAMPLE 2 --------------------------
    
    PS C:\>Telnet WebServer 80
    
    This command tells you if WebServer is reachable on Port 80 which is default port for HTTP.
        
        
    -------------------------- EXAMPLE 3 --------------------------
    
    PS C:\>Get-Content C:\Computers.txt | Telnet -Port 443
    
    This command will take all the 'computernames' from a txt file and check accessibility against port 443.

