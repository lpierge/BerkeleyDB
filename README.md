## Overview
This is the original **BerkeleyDB 2.7.7** distribution from Sleepycat Software, featuring an updated Visual Studio solution file (`DB_DLL.sln` in the `build_win32` folder) to build the Windows DLL.

The original copyright notice can be found in the README file and the original license is available in the LICENSE file.

I use this project for my own C/C++ interface (`CBerkeleyDB.cpp/.h`, `CBase.cpp/.h`, `CBdbtf.cpp/.h`, etc.) for tabular data access. See the [Include](https://github.com/lpierge/Include) and [Library](https://github.com/lpierge/Library) repositories.
[Calimero](https://sourceforge.net/projects/kalimero/) also uses that interface to handle all the data related to the local files.

## Berkeley DB
**What it does**

Berkeley DB is an **embedded database**. Unlike products like MySQL, which runs as a separate server process, this thing is just a **library** that gets linked into the application code, which makes it very fast because the code just makes function calls to read/write data (no network overhead, no separate process, etc.).

Basically, this library is a **key/value** store. You provide a key, and it returns the corresponding value. You can even choose different storage structures like **B-Tree**, **Hash**, or **queues**, depending on how you need to access your data.

**Its History**

All started back in **1991** at the **University of California, Berkeley**. The original goal was to build a better replacement for the old `dbm` and `ndbm` libraries that came with UNIX. By **1992**, version 1.85 made its way into the famous **4.4BSD** distribution.

Read the [document](https://web.mit.edu/Ghudson/dev/third/rpm/db/docs/ref/refs/bdb_usenix.html) from the original creators.

Then in **1996**, **Netscape** came and asked the creators (Seltzer and Bostic) to beef up the library for their browsers and servers. That push led them to found a company called **Sleepycat Software**.

Over time, they kept adding major features: version 2.x added **locking** for concurrency, version 3.x added **transactions** and version 4.x introduced **replication**. In **2006**, Oracle bought Sleepycat, and they've been maintaining it ever since.
A major issue came in **2013**, with the release of the version 6.0, because Oracle changed the original SleepyCat license, and switched to the **AGPLv3** license, a _smart move_ to de-facto restrict and inhibit the use and distribution of the BDB source code. This is why I never updated to the latest version of the BerkeleyDB. The 2.7.7 was a super compact version and ideal for "old school" C/C++ Win32 projects, where efficiency and no frills matter more than anything else.

## Implementation notes
**Important note on projects structure:**

The Visual Studio project for **BerkeleyDB** (`DB_DLL.sln` in the `build_win32` folder) is hardcoded to search for dependencies using absolute paths starting from the root of a virtual L: drive. The expected directory structure is as follows:

```text
L:\
  |-- BerkeleyDB\
  |-- Lib\
```

The L:\Lib directory must be created manually because it is the directory where the output BerkeleyDB DLL will be copied and where my other project looks for libraries and DLLs to compile and link.

Instead of changing the Visual Studio settings in the project file, I recommend mapping a local folder to a virtual L: drive with the Windows SUBST command:
- Create a directory on your local drive, for example `C:\DEV`.
- Download and extract all the repositories inside that directory.
- Open the Windows Command Prompt (press `Win + R` to open the Run dialog, type `cmd.exe` and press `Enter`) and from the Console run the following command: `SUBST L: C:\DEV`

Luca P.
