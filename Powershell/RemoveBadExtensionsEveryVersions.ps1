# Define the path to the Chrome extensions folder for the found user
$chromeExtensionsPath = "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Extensions"
# Define the path to the Chromium extensions folder for the found user
$chromiumExtensionsPath = "$env:LOCALAPPDATA\Chromium\User Data\Default\Extensions"
# Define the path to the Edge extensions folder for the found user
$edgeExtensionsPath = "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Extensions"
# Define the path to the Brave extensions folder for the found user
$braveExtensionsPath = "$env:LOCALAPPDATA\BraveSoftware\Brave-Browser\User Data\Default\Extensions"
# List of extension IDs to remove
$extensionsToRemove = @(
    "bibjgkidgpfbblifamdlkdlhgihmfohh",
    "pkgciiiancapdlpcbppfkmeaieppikkk",
    "epdjhgbipjpbbhoccdeipghoihibnfja",
    "bbdnohkpnbkdkmnkddobeafboooinpla",
    "befflofjcniongenjmbkgkoljhgliihe",
    "cedgndijpacnfbdggppddacngjfdkaca",
    "nnpnnpemnckcfdebeekibpiijlicmpom",
    "dpggmcodlahmljkhlmpgpdcffdaoccni",
    "cplhlgabfijoiabgkigdafklbhhdkahj",
    "egmennebgadmncfjafcemlecimkepcle",
    "acmfnomgphggonodopogfbmkneepfgnh",
    "mnhffkhmpnefgklngfmlndmkimimbphc",
    "oaikpkmjciadfpddlpjjdapglcihgdle",
    "fbmlcbhdmilaggedifpihjgkkmdgeljh",
    "kkodiihpgodmdankclfibbiphjkfdenh",
    "oeiomhmbaapihbilkfkhmlajkeegnjhe",
    "jiofmdifioeejeilfkpegipdjiopiekl",
    "hihblcmlaaademjlakdpicchbjnnnkbo",
    "ndlbedplllcgconngcnfmkadhokfaaln",
    "igbodamhgjohafcenbcljfegbipdfjpk",
    "bgejafhieobnfpjlpcjjggoboebonfcg",
    "llimhhconnjiflfimocjggfjdlmlhblm",
    "hodiladlefdpcbemnbbcpclbmknkiaem",
    "epikoohpebngmakjinphfiagogjcnddm",
    "pajkjnmeojmbapicmbpliphjmcekeaac",
    "ogbhbgkiojdollpjbhbamafmedkeockb",
    "eanofdhdfbcalhflpbdipkjjkoimeeod",
    "ekpkdmohpdnebfedjjfklhpefgpgaaji",
    "miglaibdlgminlepgeifekifakochlka",
    "mbindhfolmpijhodmgkloeeppmkhpmhc",
    "eaijffijbobmnonfhilihbejadplhddo",
    "lbneaaedflankmgmfbmaplggbmjjmbae",
    "hmiaoahjllhfgebflooeeefeiafpkfde",
    "pdkmmfdfggfpibdjbbghggcllhhainjo",
    "emedckhdnioeieppmeojgegjfkhdlaeo",
    "didhgeamncokiaegffipckhhcpnmlcbl"
    )


function Remove-Extension {
    param (
        [string]$path
    )
    # Remove the extensions
    foreach ($extensionId in $extensionsToRemove) {
        $extensionPath = Join-Path -Path $path -ChildPath $extensionId
        if (Test-Path $extensionPath) {
            Remove-Item -Path $extensionPath -Recurse -Force
            Write-Host "Extension $extensionId removed."
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