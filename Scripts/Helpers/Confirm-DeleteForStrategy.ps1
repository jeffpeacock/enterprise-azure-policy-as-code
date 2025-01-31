function Confirm-DeleteForStrategy {
    [CmdletBinding()]
    param (
        [string] $PacOwner,
        [string] $Strategy
    )

    $shallDelete = switch ($PacOwner) {
        "thisPaC" {
            $true
            break
        }
        "otherPaC" {
            $false
            break
        }
        "unknownOwner" {
            $Strategy -eq "full"
            break
        }
        "orphaned" {
            # Exemptions only
            $true
            break
        }
    }
    return $shallDelete
}
