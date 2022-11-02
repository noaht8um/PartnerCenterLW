function Read-ITBPassword {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [PSCustomObject[]]$Password
    )

    begin {
        $RequestParams = @{
            Method = 'Get'
        }
    }

    process {
        foreach ($Uuid in $Password) {
            $RequestParams['Endpoint'] = "/passwords/company/$($Password.companyUuid)/$($Password.uuid)/view-password"
            Invoke-ITBAPI @RequestParams
        }
    }
}
