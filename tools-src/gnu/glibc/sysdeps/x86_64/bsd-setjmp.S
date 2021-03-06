/* BSD `setjmp' entry point to `sigsetjmp (..., 1)'.  x86-64 version.
   Copyright (C) 1994,1995,1996,1997,2000,2001 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

/* This just does a tail-call to `__sigsetjmp (ARG, 1)'.
   We cannot do it in C because it must be a tail-call, so frame-unwinding
   in setjmp doesn't clobber the state restored by longjmp.  */

#include <sysdep.h>
#define _ASM
#define _SETJMP_H
#include <bits/setjmp.h>
#include "bp-sym.h"
#include "bp-asm.h"

ENTRY (BP_SYM (setjmp))
	/* Set up arguments, we only need to set the 2nd arg.  */
	movq $1, %rsi
#ifdef	PIC
#else
	jmp BP_SYM (__sigsetjmp)
#endif
END (BP_SYM (setjmp))
