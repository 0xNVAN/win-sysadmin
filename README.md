# win-sysadmin
Windows System Administration - Custom Windows Powershell CMDLET for Telnet

OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS C:\>Telnet -ComputerName DC1 -Port 3389
    
    This command reports if DC1 can be connected on port 3389 which is default port for Remote Desktop Protocol (RDP).
    By simply running this command, you can check if Remote Desktop is enabled on computer DC1.
        
        
    -------------------------- EXAMPLE 2 --------------------------
    
    PS C:\>Telnet WebServer 80
    
    This command tells you if WebServer is reachable on Port 80 which is default port for HTTP.
      
  
    -------------------------- EXAMPLE 3 --------------------------
    
    PS C:\>Get-Content C:\Computers.txt | Telnet -Port 80
    
    Take all the computernames from a text file and pipe each to the Telnet CMDLET to report Port 80 accessibility.
