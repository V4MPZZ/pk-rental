local label = 
[[ 
      ___________
     //         \\
    // pk-rental \\
    || ___   ___ ||
    || | |   | | ||
    ||___________||
]]
  
Citizen.CreateThread(function()
    if Config.VersionCheck then
        local CurrentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version', 0)
        if not CurrentVersion then
            print('^1Resource Version Check Failed!^7')
        end

        function VersionCheckHTTPRequest()
            PerformHttpRequest('https://raw.githubusercontent.com/PeeganKreece/versions/main/versions.md', VersionCheck, 'GET')
        end

        function VersionCheck(err, response, headers)
            Citizen.Wait(3000)
            if err == 200 then
                local Data = json.decode(response)
                if CurrentVersion ~= Data.NewestVersion then
                    print( label )			
                    print(' ^1Resource is outdated!^0')
                    print(' Current version: ^2' .. Data.NewestVersion .. '^7')
                    print(' Your version: ^1' .. CurrentVersion .. '^7')
                    print(' Please download the lastest version from ^5' .. Data.DownloadLocation .. '^7')
                    if Data.Changes ~= '' then
                        print('      \n      ^5Changes: ^7' .. Data.Changes .. "\n^0  \\\\\n")
                    end
                else
                    print( label )			
                    print(' ^2Resource is up to date!\n^0')
                end
            else
                print( label )			
                print('      ^1There was an error getting the latest version information\n^0  \n  \\\\\n')
            end
            
            SetTimeout(60000000, VersionCheckHTTPRequest)
        end

        VersionCheckHTTPRequest()
    end
end)