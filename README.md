This is a quick way to get a windows vm running with required software. It will cache the installers so you don't need to redownload them. I am using the free 90 day eval Windows evaluation. When you want to re-update your installers, restart from step #4. Could work with VMWare or KVM. 

What needs to be tweeked/added (please do pull request) :
- Automating from linux/mac/bsd host
  - Create script to download and set-up VM from linux host
  - Use a network share of some short 
  - Add support for VMWare and kvm
  - Inject a script into de virtual disk image's autorun
  - Create clone and start it
- More package list for default installation

#1 Download Windows VirtualBox image
https://az792536.vo.msecnd.net/vms/VMBuild_20180102/VirtualBox/IE11/IE11.Win81.VirtualBox.zip

#2 Import in VirtualBox and configure CPU/MEM/VIDEO. 
Add a second HDD to hold persistent data between all Windows cloned VM. And snapshot clean install.
A better way would be to use a network mount or share. As you can't share disk image between multiple running VM.

#3 Set second drive to not be snapshoted.
VBoxManage  modifyhd Permanent-disk.vdi --type writethrough

#4 Create Clone VM with a new name (ex.: Windows81-dev).

#5 Boot new VM and use disk administration to initialyse the second disk. Then format it NTFS. 

#6 Install chocolaty by running in Administrator:cmd

@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

#7 Install git and chocolateygui
choco install git chocolateygui --acceptlicense -y --package-parameters "--includeRecommended" -c D:\To-Install\Chocolatey\DL

#8 Git clone the scripts from git bash
cd /d/To-Install/Chocolatey
git clone ...

#9 Go to D:\To-Install\Chocolatey\ and run the scripts needed.
Install run .ps1 as administrator from context menu.
https://www.tenforums.com/attachments/tutorials/102357d1474400469-run-administrator-add-ps1-file-context-menu-windows-10-a-add_ps1_run_as_administrator.reg
from https://www.tenforums.com/tutorials/64349-run-administrator-add-ps1-file-context-menu-windows-10-a.html

#10 Backup your current installed applications by running 
99-generate-pkglist.ps1

#11 Stop VM and remove secondary disk
#12 Create a new cloned vm from the original. 
#13 Go to D:\To-Install\Chocolatey\ and run reinstall all applications from the disk cache.
#14 Return to step #11


