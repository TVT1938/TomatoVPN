# Makefile for uClibc
#
# Copyright (C) 2002 Erik Andersen <andersen@uclibc.org>
#
# This program is free software; you can redistribute it and/or modify it under
# the terms of the GNU Library General Public License as published by the Free
# Software Foundation; either version 2 of the License, or (at your option) any
# later version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE. See the GNU Library General Public License for more
# details.
#
# You should have received a copy of the GNU Library General Public License
# along with this program; if not, write to the Free Software Foundation, Inc.,
# 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA



TESTDIR=../
include $(TESTDIR)/Rules.mak

TARGETS=crypt md5c-test
EXTRA_LIBS=-lcrypt

all: $(TARGETS)

crypt: crypt.c Makefile $(TESTDIR)/Config $(TESTDIR)/Rules.mak $(CC)
	-@ echo "-------"
	-@ echo " "
	-@ echo "Compiling vs uClibc: "
	-@ echo " "
	$(CC) $(CFLAGS) -c $< -o $@.o
	$(CC) $(LDFLAGS) $@.o -o $@ $(EXTRA_LIBS)
	$(STRIPTOOL) -x -R .note -R .comment $@
	-./$@ < crypt.input #> $@.out 2>&1
	-@ echo " "

crypt_glibc: crypt.c Makefile $(TESTDIR)/Config $(TESTDIR)/Rules.mak $(CC)
	-@ echo "-------"
	-@ echo " "
	-@ echo "Compiling vs glibc: "
	-@ echo " "
	$(HOSTCC) $(GLIBC_CFLAGS) -c $< -o $@.o
	$(HOSTCC) $(GLIBC_LDFLAGS) $@.o -o $@ $(EXTRA_LIBS)
	$(STRIPTOOL) -x -R .note -R .comment $@
	-./$@ < crypt.input > $@.out 2>&1
	-@ echo " "

diff: crypt_glibc crypt
	-@ echo "-------"
	-@ echo " "
	-@ echo "Diffing output: "
	-@ echo " "
	-diff -u crypt_glibc.out crypt.out
	-@ echo " "

md5c-test: md5c-test.c Makefile $(TESTDIR)/Config $(TESTDIR)/Rules.mak $(CC)
	-@ echo "-------"
	-@ echo " "
	-@ echo "Compiling vs uClibc: "
	-@ echo " "
	$(CC) $(CFLAGS) -c $< -o $@.o
	$(CC) $(LDFLAGS) $@.o -o $@ $(EXTRA_LIBS)
	$(STRIPTOOL) -x -R .note -R .comment $@
	-./$@
	-@ echo " "

clean:
	rm -f *.[oa] *~ core crypt_glibc crypt crypt_glibc.out crypt.out md5c-test


