# Makefile for Bash builds on Debian.
#
# The MIT License (MIT)
#
# Copyright (c) 2020, Kostya Zolotarov
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
# of the Software, and to permit persons to whom the Software is furnished to do
# so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

all: build 

PRJ         = $(notdir $(CURDIR))
PRJ.ENV     = .
PRJ.DIR.INC = $(PRJ.ENV)/include
PRJ.DIR.SRC = $(PRJ.ENV)/src
PRJ.DIR.BIN = $(PRJ.ENV)/bin
PRJ.DIR.LIB = $(PRJ.ENV)/lib
PRJ.DIR.ETC = $(PRJ.ENV)/etc
PRJ.DIR.DOC = $(PRJ.ENV)/doc
PRJ.DIR.LOG = $(PRJ.ENV)/log
PRJ.INC     = $(PRJ.DIR.INC)/$(PRJ)
PRJ.SRC     = $(PRJ.DIR.SRC)/$(PRJ)
PRJ.BIN     = $(PRJ.DIR.BIN)/$(PRJ)
PRJ.LIB     = $(PRJ.DIR.LIB)/$(PRJ).sh
PRJ.ETC     = $(PRJ.DIR.ETC)/$(PRJ).conf
PRJ.DOC     = $(PRJ.DIR.DOC)/$(PRJ).txt
PRJ.LOG     = $(PRJ.DIR.LOG)/$(PRJ).log

SYS.ENV     = $(HOME)/.local
SYS.DIR.INC = $(SYS.ENV)/include
SYS.DIR.SRC = $(SYS.ENV)/src
SYS.DIR.BIN = $(SYS.ENV)/bin
SYS.DIR.LIB = $(SYS.ENV)/lib
SYS.DIR.ETC = $(SYS.ENV)/etc
SYS.DIR.DOC = $(SYS.ENV)/doc
SYS.DIR.LOG = $(SYS.ENV)/log
SYS.INC     = $(SYS.DIR.INC)/$(PRJ)
SYS.SRC     = $(SYS.DIR.SRC)/$(PRJ)
SYS.BIN     = $(SYS.DIR.BIN)/$(PRJ)
SYS.LIB     = $(SYS.DIR.LIB)/$(PRJ).sh
SYS.ETC     = $(SYS.DIR.ETC)/$(PRJ).conf
SYS.DOC     = $(SYS.DIR.DOC)/$(PRJ).txt
SYS.LOG     = $(SYS.DIR.LOG)/$(PRJ).log

setup:
	@if [ ! -d $(PRJ.DIR.INC) ]; then mkdir -pv $(PRJ.DIR.INC); fi
	@if [ ! -d $(PRJ.DIR.SRC) ]; then mkdir -pv $(PRJ.DIR.SRC); fi
	@if [ ! -d $(PRJ.DIR.BIN) ]; then mkdir -pv $(PRJ.DIR.BIN); fi
	@if [ ! -d $(PRJ.DIR.LIB) ]; then mkdir -pv $(PRJ.DIR.LIB); fi
	@if [ ! -d $(PRJ.DIR.ETC) ]; then mkdir -pv $(PRJ.DIR.ETC); fi
	@if [ ! -d $(PRJ.DIR.DOC) ]; then mkdir -pv $(PRJ.DIR.DOC); fi
	@if [ ! -d $(PRJ.DIR.LOG) ]; then mkdir -pv $(PRJ.DIR.LOG); fi

build: setup
	@if [ ! -f $(PRJ.BIN) ]; then cp -fv $(PRJ.SRC) $(PRJ.DIR.BIN); fi
	@if [   -f $(PRJ.BIN) ]; then chmod +x $(PRJ.BIN); fi

list:
	@if [ -d $(PRJ.DIR.INC) ]; then ls -d $(PRJ.DIR.INC); ls -a $(PRJ.DIR.INC)/$(PRJ)*; fi
	@if [ -d $(PRJ.DIR.SRC) ]; then ls -d $(PRJ.DIR.SRC); ls -a $(PRJ.DIR.SRC)/$(PRJ)*; fi
	@if [ -d $(PRJ.DIR.BIN) ]; then ls -d $(PRJ.DIR.BIN); ls -a $(PRJ.DIR.BIN)/$(PRJ)*; fi
	@if [ -d $(PRJ.DIR.LIB) ]; then ls -d $(PRJ.DIR.LIB); ls -a $(PRJ.DIR.LIB)/$(PRJ)*; fi
	@if [ -d $(PRJ.DIR.ETC) ]; then ls -d $(PRJ.DIR.ETC); ls -a $(PRJ.DIR.ETC)/$(PRJ)*; fi
	@if [ -d $(PRJ.DIR.DOC) ]; then ls -d $(PRJ.DIR.DOC); ls -a $(PRJ.DIR.DOC)/$(PRJ)*; fi
	@if [ -d $(PRJ.DIR.LOG) ]; then ls -d $(PRJ.DIR.LOG); ls -a $(PRJ.DIR.LOG)/$(PRJ)*; fi
	@if [ -d $(SYS.DIR.INC) ]; then ls -d $(SYS.DIR.INC); ls -a $(SYS.DIR.INC)/$(PRJ)*; fi
	@if [ -d $(SYS.DIR.SRC) ]; then ls -d $(SYS.DIR.SRC); ls -a $(SYS.DIR.SRC)/$(PRJ)*; fi
	@if [ -d $(SYS.DIR.BIN) ]; then ls -d $(SYS.DIR.BIN); ls -a $(SYS.DIR.BIN)/$(PRJ)*; fi
	@if [ -d $(SYS.DIR.LIB) ]; then ls -d $(SYS.DIR.LIB); ls -a $(SYS.DIR.LIB)/$(PRJ)*; fi
	@if [ -d $(SYS.DIR.ETC) ]; then ls -d $(SYS.DIR.ETC); ls -a $(SYS.DIR.ETC)/$(PRJ)*; fi
	@if [ -d $(SYS.DIR.DOC) ]; then ls -d $(SYS.DIR.DOC); ls -a $(SYS.DIR.DOC)/$(PRJ)*; fi
	@if [ -d $(SYS.DIR.LOG) ]; then ls -d $(SYS.DIR.LOG); ls -a $(SYS.DIR.LOG)/$(PRJ)*; fi

test:
	@if [ ! -f $(PRJ.BIN) ]; then echo "ERROR: Test not found. Build the project."; fi
	@if [   -f $(PRJ.BIN) ]; then $(PRJ.BIN) bash  > $(PRJ.LOG) 2>&1; fi
	@if [   -f $(PRJ.BIN) ]; then $(PRJ.BIN) c    >> $(PRJ.LOG) 2>&1; fi
	@if [   -f $(PRJ.BIN) ]; then $(PRJ.BIN) help >> $(PRJ.LOG) 2>&1; fi
	@if [   -f $(PRJ.BIN) ]; then cat $(PRJ.LOG); fi

package:

install:
	@if [ ! -d $(SYS.DIR.INC) ]; then mkdir -pv $(SYS.DIR.INC); fi
	@if [ ! -d $(SYS.DIR.SRC) ]; then mkdir -pv $(SYS.DIR.SRC); fi
	@if [ ! -d $(SYS.DIR.BIN) ]; then mkdir -pv $(SYS.DIR.BIN); fi
	@if [ ! -d $(SYS.DIR.LIB) ]; then mkdir -pv $(SYS.DIR.LIB); fi
	@if [ ! -d $(SYS.DIR.ETC) ]; then mkdir -pv $(SYS.DIR.ETC); fi
	@if [ ! -d $(SYS.DIR.DOC) ]; then mkdir -pv $(SYS.DIR.DOC); fi
	@if [ ! -d $(SYS.DIR.LOG) ]; then mkdir -pv $(SYS.DIR.LOG); fi
	@if [   -f $(PRJ.BIN)     ]; then cp -fv $(PRJ.BIN) $(SYS.DIR.BIN); fi
	@if [   -f $(SYS.BIN)     ]; then chmod +x $(SYS.BIN); fi

uninstall:
	@if [ -f $(SYS.INC) ]; then rm -fv $(SYS.INC); fi
	@if [ -f $(SYS.BIN) ]; then rm -fv $(SYS.BIN); fi
	@if [ -f $(SYS.LIB) ]; then rm -fv $(SYS.LIB); fi
	@if [ -f $(SYS.ETC) ]; then rm -fv $(SYS.ETC); fi
	@if [ -f $(SYS.DOC) ]; then rm -fv $(SYS.DOC); fi

clean:
	@if [ -f $(PRJ.BIN) ]; then rm -fv $(PRJ.BIN); fi
	@if [ -f $(PRJ.LOG) ]; then rm -fv $(PRJ.LOG); fi

help:
	@echo "Usage: make {setup,build,list,test,package,install,uninstall,clean,help}"

