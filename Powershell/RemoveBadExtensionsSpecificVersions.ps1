# Define the path to the Chrome extensions folder for the found user
$chromeExtensionsPath = "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Extensions"
# Define the path to the Chromium extensions folder for the found user
$chromiumExtensionsPath = "$env:LOCALAPPDATA\Chromium\User Data\Default\Extensions"
# Define the path to the Chrome extensions folder for the found user
$edgeExtensionsPath = "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Extensions"
# Define the path to the Chrome extensions folder for the found user
$braveExtensionsPath = "$env:LOCALAPPDATA\BraveSoftware\Brave-Browser\User Data\Default\Extensions"
# List of extension IDs to remove
$extensionsToRemove = @{
        "dpggmcodlahmljkhlmpgpdcffdaoccni" = "1.1.1"  # Internxt VPN
        "nnpnnpemnckcfdebeekibpiijlicmpom" = "2.0.1"  # VPNCity
        "kkodiihpgodmdankclfibbiphjkfdenh" = "1.16.2" # Parrot Talks
        "oaikpkmjciadfpddlpjjdapglcihgdle" = "1.0.12" # Uvoice
        "acmfnomgphggonodopogfbmkneepfgnh" = "4.00"   # Bookmark Favicon Changer
        "mnhffkhmpnefgklngfmlndmkimimbphc" = "4.40"   # Castorus 
        "befflofjcniongenjmbkgkoljhgliihe" = "2.13.0" # TinaMind - The GPT-4o-powered AI Assistant! 
        "cedgndijpacnfbdggppddacngjfdkaca" = "0.0.11" # Wayin AI 
        "egmennebgadmncfjafcemlecimkepcle" = "2.2.7"  # VidHelper - Video Downloader
        "cplhlgabfijoiabgkigdafklbhhdkahj" = "1.0.161"# Vidnoz Flex - Video recorder & Video share
        "oeiomhmbaapihbilkfkhmlajkeegnjhe" = "3.18.0" # Primus (prev. PADO)
        "bbdnohkpnbkdkmnkddobeafboooinpla" = "1.0.1"  # Search Copilot AI Assistant for Chrome
        "bibjgkidgpfbblifamdlkdlhgihmfohh" = "0.1.3"  # AI Assistant - ChatGPT and Gemini for Chrome 
        "pkgciiiancapdlpcbppfkmeaieppikkk" = "1.3.7"  # Bard AI chat
        "llimhhconnjiflfimocjggfjdlmlhblm" = "1.5.7"  # Reader Mode
        "ekpkdmohpdnebfedjjfklhpefgpgaaji" = "1.3"    # Tackker - online keylogger tool
        "epikoohpebngmakjinphfiagogjcnddm" = "2.7.3"  # AI Shop Buddy
        "miglaibdlgminlepgeifekifakochlka" = "1.4.5"  # Sort by Oldest
        "eanofdhdfbcalhflpbdipkjjkoimeeod" = "1.4.9"  # Rewards Search Automator    
        "ogbhbgkiojdollpjbhbamafmedkeockb" = "1.8.1"  # Earny - Up to 20% Cash Back  
        "bgejafhieobnfpjlpcjjggoboebonfcg" = "1.1.1"  # ChatGPT Assistant - Smart Search
        "igbodamhgjohafcenbcljfegbipdfjpk" = "2.3"    # Keyboard History Recorder
        "mbindhfolmpijhodmgkloeeppmkhpmhc" = "1.44"   # Email Hunter 
        "hodiladlefdpcbemnbbcpclbmknkiaem" = "3.1.3"  # Visual Effects for Google Meet  
        "pajkjnmeojmbapicmbpliphjmcekeaac" = "24.10.4"# Cyberhaven security extension V3
        "ndlbedplllcgconngcnfmkadhokfaaln" = "2.22.6" # GraphQL Network Inspector
        "epdjhgbipjpbbhoccdeipghoihibnfja" = "1.4"    # GPT 4 Summary with OpenAI
        "jiofmdifioeejeilfkpegipdjiopiekl" = "1.1.61" # YesCaptcha assistant
        "hihblcmlaaademjlakdpicchbjnnnkbo" = "3.0.2"  # Proxy SwitchyOmega (V3)
    }

function Remove-Extension {
    param (
        [string]$path
    )    
    # Remove the extensions if the version matches
    foreach ($extensionId in $extensionsToRemove.Keys) {
        $extensionPath = Join-Path -Path $chromeExtensionsPath -ChildPath $extensionId
        if (Test-Path $extensionPath) {
            # Check for the version
            $manifestPath = Join-Path -Path $extensionPath -ChildPath "$($extensionsToRemove[$extensionId])_0/manifest.json"
            if (Test-Path $manifestPath) {
                $manifest = Get-Content -Path $manifestPath -Raw | ConvertFrom-Json
                if ($manifest.version -eq $extensionsToRemove[$extensionId]) {
                    Remove-Item -Path $extensionPath -Recurse -Force
                    Write-Host "Extension $extensionId (version $($extensionsToRemove[$extensionId])) removed."
                } else {
                    Write-Host "Extension $extensionId found, but version does not match. Found version: $($manifest.version)."
                }
            }
        } else {
            Write-Host "Extension $extensionId not found."
        }
    }
}

if (Test-Path $chromeExtensionsPath) {
    Write-Host "Delete extensions for chrome"
    Remove-Extension -path $chromeExtensionsPath
}
if (Test-Path $chromiumExtensionsPath) {
    Write-Host "Delete extensions for chromium"
    Remove-Extension -path $chromiumExtensionsPath
}
if (Test-Path $edgeExtensionsPath) {
    Write-Host "Delete extensions for edge"
    Remove-Extension -path $edgeExtensionsPath
}
if (Test-Path $braveExtensionsPath) {
    Write-Host "Delete extensions for brave"
    Remove-Extension -path $braveExtensionsPath
}
