@echo off
if not exist L:\Lib goto error
copy .\Release\BerkeleyDB.lib L:\Lib
copy .\Release\BerkeleyDB.dll L:\Lib
goto done
:error
error: L:\Lib does not exist
goto done
:done