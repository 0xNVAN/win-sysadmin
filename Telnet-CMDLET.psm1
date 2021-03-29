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