/*
	db_win32.c

	Interfaccia Berkeley DB (db.h)

	Luca Piergentili, 04/11/99
	l.pierge@teleline.es
*/
#ifndef _DB_WIN32_H
#define _DB_WIN32_H 1

#if defined(_WIN32) || defined(WIN32) || defined(_WINDOWS) || defined(_CONSOLE)
  #define STRICT 1
  #include <windows.h>
#endif

#include "db.h"

#endif /* _DB_WIN32_H */
