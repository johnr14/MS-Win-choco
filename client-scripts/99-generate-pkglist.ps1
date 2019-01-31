choco list -lo -r -y | % { "choco install " + $_.Replace("|", " -version  ") + " --acceptlicense -y -c D:\To-Install\Chocolatey\DL" } > Reinstall-from-cache.ps1
