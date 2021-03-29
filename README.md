# win-sysadmin
Windows System Administration - Custom Windows Powershell CMDLET for Telnet

NAME
    
    Telnet
    
SYNOPSIS
    
    Tests the connectivity between two computers on a TCP Port
    
    
SYNTAX
   
   Telnet [-ComputerName] <String> [-Port] <Int32> [[-Timeout] <Int32>] [<CommonParameters>]
    
    
DESCRIPTION
    
    The Telnet command tests the connectivity between two computers on a TCP Port. 
    By running this command, you can determine if specific service is running on Server.
    

PARAMETERS
    -ComputerName <String>
        


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
    
    This command will take all the computernames from a text file and pipe each computername to Telnet Cmdlet to report Port 80 accessibility.
