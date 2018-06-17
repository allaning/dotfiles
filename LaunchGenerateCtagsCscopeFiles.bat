rem Pause N seconds and only cancel on Ctrl-C
timeout /t 300 /nobreak
rem Go to Synergy work area (TODO update if necessary)
cd /d D:\sk
rem The GenerateCtagsCscopeFiles.bat and .bash files should be in your work area
GenerateCtagsCscopeFiles.bat
