# Identify Compromised Browser Extensions in Crowdstrike Falcon

This query will identify compromised browser extensions in Crowdstrike Falcon. The query will return the `BrowserExtensionId`, `BrowserExtensionName`, `BrowserExtensionPath` and `Compromised` status of the browser extensions. The `Compromised` status will be set to `true` if the browser extension is compromised, and `false` if it is not compromised.

We are only returning the compromised browser extensions in this query. If you want to see all browser extensions, you can remove the `Compromised = "true"` filter from the query.

**Note**: Please refer to the Google Spreadsheet [Compromised extensions](https://docs.google.com/spreadsheets/d/15xOLbYgz5DQnCWYE6a_LXGcqYC_bNPPzdBqdLofz6-E/edit?pli=1&gid=0#gid=0) and update this query accordingly.

You could theoretically upload the Google Spreadsheet as a lookup table and use it in the query. However, I did not have the time to test this.

```
#event_simpleName=InstalledBrowserExtension
| regex(field=BrowserExtensionVersion, regex="(?<MajorVersion>[0-9]+)\\.(?<MinorVersion>[0-9]+)(\\.(?<PatchVersion>[0-9]+))?", strict=true)
| case {
        BrowserName = "0" | BrowserName := "UNKNOWN" ;
        BrowserName = "1" | BrowserName := "FIREFOX" ;
        BrowserName = "2" | BrowserName := "SAFARI" ;
        BrowserName = "3" | BrowserName := "CHROME" ;
        BrowserName = "4" | BrowserName := "EDGE" ;
        BrowserName = "5" | BrowserName := "EDGE_CHROMIUM" ;
        BrowserName = "6" | BrowserName := "INTERNET_EXPLORER" ;
        BrowserName = "7" | BrowserName := "EDGE_LEGACY" ;
        BrowserName = "8" | BrowserName := "IE_TYPED_URL" ;
        BrowserName = "9" | BrowserName := "FIREFOX_APP" ;
        * }
| case {
BrowserExtensionId="nnpnnpemnckcfdebeekibpiijlicmpom"
| BrowserExtensionVersion=2.0.1
| Compromised := "true";
BrowserExtensionId="kkodiihpgodmdankclfibbiphjkfdenh"
| BrowserExtensionVersion=1.16.2
| Compromised := "true";
BrowserExtensionId="oaikpkmjciadfpddlpjjdapglcihgdle"
| BrowserExtensionVersion=1.0.12
| Compromised := "true";
BrowserExtensionId="dpggmcodlahmljkhlmpgpdcffdaoccni"
| BrowserExtensionVersion=1.1.1
| Compromised := "true";
BrowserExtensionId="acmfnomgphggonodopogfbmkneepfgnh"
| BrowserExtensionVersion=4.00
| Compromised := "true";
BrowserExtensionId="mnhffkhmpnefgklngfmlndmkimimbphc"
| BrowserExtensionVersion=4.40
| Compromised := "true";
BrowserExtensionId="cedgndijpacnfbdggppddacngjfdkaca"
| BrowserExtensionVersion=0.0.11
| Compromised := "true";
BrowserExtensionId="bbdnohkpnbkdkmnkddobeafboooinpla"
| BrowserExtensionVersion=1.0.1
| Compromised := "true";
BrowserExtensionId="egmennebgadmncfjafcemlecimkepcle"
| BrowserExtensionVersion=2.2.7
| Compromised := "true";
BrowserExtensionId="bibjgkidgpfbblifamdlkdlhgihmfohh"
| BrowserExtensionVersion=0.1.3
| Compromised := "true";
BrowserExtensionId="cplhlgabfijoiabgkigdafklbhhdkahj"
| BrowserExtensionVersion=1.0.161
| Compromised := "true";
BrowserExtensionId="befflofjcniongenjmbkgkoljhgliihe"
| BrowserExtensionVersion=2.13.0
| Compromised := "true";
BrowserExtensionId="pkgciiiancapdlpcbppfkmeaieppikkk"
| BrowserExtensionVersion=1.3.7
| Compromised := "true";
BrowserExtensionId="llimhhconnjiflfimocjggfjdlmlhblm"
| BrowserExtensionVersion=1.5.7
| Compromised := "true";
BrowserExtensionId="oeiomhmbaapihbilkfkhmlajkeegnjhe"
| BrowserExtensionVersion=3.18.0
| Compromised := "true";
BrowserExtensionId="ekpkdmohpdnebfedjjfklhpefgpgaaji"
| BrowserExtensionVersion=1.3
| Compromised := "true";
BrowserExtensionId="epikoohpebngmakjinphfiagogjcnddm"
| BrowserExtensionVersion=2.7.3
| Compromised := "true";
BrowserExtensionId="miglaibdlgminlepgeifekifakochlka"
| BrowserExtensionVersion=1.4.5
| Compromised := "true";
BrowserExtensionId="eanofdhdfbcalhflpbdipkjjkoimeeod"
| BrowserExtensionVersion=1.4.9
| Compromised := "true";
BrowserExtensionId="ogbhbgkiojdollpjbhbamafmedkeockb"
| BrowserExtensionVersion=1.8.1
| Compromised := "true";
BrowserExtensionId="bgejafhieobnfpjlpcjjggoboebonfcg"
| BrowserExtensionVersion=1.1.1
| Compromised := "true";
BrowserExtensionId="igbodamhgjohafcenbcljfegbipdfjpk"
| BrowserExtensionVersion=2.3
| Compromised := "true";
BrowserExtensionId="mbindhfolmpijhodmgkloeeppmkhpmhc"
| BrowserExtensionVersion=1.44
| Compromised := "true";
BrowserExtensionId="hodiladlefdpcbemnbbcpclbmknkiaem"
| BrowserExtensionVersion=3.1.3
| Compromised := "true";
BrowserExtensionId="pajkjnmeojmbapicmbpliphjmcekeaac"
| BrowserExtensionVersion=24.10.4
| Compromised := "true";
BrowserExtensionId="ndlbedplllcgconngcnfmkadhokfaaln"
| BrowserExtensionVersion=2.22.6
| Compromised := "true";
BrowserExtensionId="epdjhgbipjpbbhoccdeipghoihibnfja"
| BrowserExtensionVersion=1.4
| Compromised := "true";
BrowserExtensionId="cplhlgabfijoiabgkigdafklbhhdkahj"
| BrowserExtensionVersion=1.0.161
| Compromised := "true";
BrowserExtensionId="lbneaaedflankmgmfbmaplggbmjjmbae"
| test(MajorVersion<=1)
| test(MinorVersion<=3)
| test(PatchVersion<=8)
| Compromised := "true";
BrowserExtensionId="eaijffijbobmnonfhilihbejadplhddo"
| BrowserExtensionVersion=2.4
| Compromised := "true";
BrowserExtensionId="hmiaoahjllhfgebflooeeefeiafpkfde"
| BrowserExtensionVersion=1.0.0
| Compromised := "true";
*
| Compromised := "false";
}
| Compromised = "true"
| groupBy([BrowserExtensionId], function=collect(fields=[aid, BrowserExtensionName, BrowserName, BrowserExtensionPath, Compromised]))
```
