# win-sysadmin
Windows System Administration - Custom Windows Powershell CMDLET for Telnet

NAME
    Telnet
    
SYNOPSIS
    Tests the connectivity between two computers on a TCP Port
    
    
SYNTAX
    Telnet [-ComputerName] <String> [-Port] <Int32> [[-Timeout] <Int32>] [<CommonParameters>]
    
    
DESCRIPTION
    The Telnet command tests the connectivity between two computers on a TCP Port. By running this command, you can determine if specific service is running on Server.
    

PARAMETERS
    -ComputerName <String>
        
        Required?                    true
        Position?                    1
        Default value                localhost
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Accept wildcard characters?  false
        
    -Port <Int32>
        
        Required?                    true
        Position?                    2
        Default value                0
        Accept pipeline input?       true (ByValue, ByPropertyName)
        Accept wildcard characters?  false
        
    -Timeout <Int32>
        
        Required?                    false
        Position?                    3
        Default value                10000
        Accept pipeline input?       false
        Accept wildcard characters?  false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters (https:/go.microsoft.com/fwlink/?LinkID=113216). 

OUTPUTS
    
    -------------------------- EXAMPLE 1 --------------------------
    
    PS C:\>Telnet -ComputerName DC1 -Port 3389
    
    This command reports if DC1 can be connected on port 3389 which is default port for Remote Desktop Protocol (RDP). By simply running this command, you can check if 
    Remote Desktop is enabled on computer DC1.
        
        
    -------------------------- EXAMPLE 2 --------------------------
    
    PS C:\>Telnet WebServer 80
    
    This command tells you if WebServer is reachable on Port 80 which is default port for HTTP.
      
  
    -------------------------- EXAMPLE 3 --------------------------
    
    PS C:\>Get-Content C:\Computers.txt | Telnet -Port 80
    
    This command will take all the computernames from a text file and pipe each computername to Telnet Cmdlet to report if all the computers are accessible on Port 80.
