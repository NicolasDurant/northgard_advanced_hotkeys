Add-Type -AssemblyName System.Windows.Forms
$seconds = 15
For ($i=1; $i -lt $seconds; $i++)  {
    $X = [System.Windows.Forms.Cursor]::Position.X
    $Y = [System.Windows.Forms.Cursor]::Position.Y
    Write-Output "X: $X | Y: $Y"
    Start-Sleep -Seconds 1
}
