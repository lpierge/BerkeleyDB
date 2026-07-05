@echo off
if not exist L:\Lib goto error
copy .\Debug\BerkeleyDB.d.lib L:\Lib
copy .\Debug\BerkeleyDB.d.dll L:\Lib
goto done
:error
error: L:\Lib does not exist
goto done
:done