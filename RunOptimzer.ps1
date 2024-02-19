-ExecutionPolicy Bypass
# set working directory to Desktop/Files/Applications
Set-Location "$env:USERPROFILE\Desktop\Files\applications"
Configfile = "$env:USERPROFILE\Desktop\Files\Scripts\template10.json"
# run the optimizer
optimizer.exe /config=$Configfile
