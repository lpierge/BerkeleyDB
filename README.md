This is the original **BerkeleyDB 2.7.7** distribution from Sleepycat Software, featuring an updated Visual Studio solution file (`DB_DLL.sln` in the `build_win32` folder) to build the Windows DLL.

The original copyright notice can be found in the README file and the original license is available in the LICENSE file.

This project is used by my own C/C++ interface for tabular data access (`CBerkeleyDB.cpp/.h`, `CBase.cpp/.h`, `CBdbtf.cpp/.h`, etc., see the **Include** and **Library** repositories).
This is the reason why this repository is created with the original Sleepycat Software distribution: to be able to recompile the code using my own interface.

**Important note on projects structure:**

The Visual Studio project for **BerkeleyDB** is hardcoded to search for dependencies using absolute paths starting from the root of a virtual L: drive. The expected directory structure is as follows:

```text
L:\
  |-- BerkeleyDB\
  |-- Lib\
```

The L:\Lib directory must be created manually because it is the directory where the output BerkeleyDB DLL will be copied and where my other project looks for libraries and DLLs to compile and link.

If you want to compile the projects without reconfiguring the Visual Studio settings, you can map a local folder to a virtual L: drive using the Windows SUBST command.

Create a directory on your local drive, for example, C:\DEV.

Download and extract all the repositories inside that directory.

Open the Windows Command Prompt (cmd) and run the following command:

`SUBST L: C:\DEV`

Luca P.
