CXX=g++
CPPFLAGS=-Wall -std=c++14
SRCDIR=.
BINDIR=bin
GTESTDIR=thirdparty/googletest/googletest
INCLUDES=-I$(GTESTDIR) -I$(GTESTDIR)/include
LINKFLAGS=

ifeq ($(shell echo "check_quotes"),"check_quotes")
	PATHSEP2=\\
	BINEXT=.exe
	DELFILE=del
	MKDIRP=md	
else
	PATHSEP2=/
	BINEXT=
	DELFILE=rm -f
	MKDIRP=mkdir -p
	LINKFLAGS=-lpthread
endif
PATHSEP=$(strip $(PATHSEP2))

all: build

bin:
	$(MKDIRP) $(BINDIR)

build: build-unit build-text
build-unit: bin $(BINDIR)/TriviaUnitTests$(BINEXT)
build-text: bin $(BINDIR)/TriviaTextTests$(BINEXT)

$(BINDIR)/TriviaUnitTests$(BINEXT): $(SRCDIR)/Game.cc $(SRCDIR)/Game.h $(SRCDIR)/TriviaUnitTests.cc $(GTESTDIR)/src/gtest-all.cc $(GTESTDIR)/src/gtest_main.cc
	$(CXX) $(CPPFLAGS) $(INCLUDES) -I$(SRCDIR) -o $(BINDIR)/TriviaUnitTests$(BINEXT) $(SRCDIR)/Game.cc $(SRCDIR)/TriviaUnitTests.cc $(GTESTDIR)/src/gtest-all.cc $(GTESTDIR)/src/gtest_main.cc $(LINKFLAGS)

$(BINDIR)/TriviaTextTests$(BINEXT): $(SRCDIR)/Game.cc $(SRCDIR)/Game.h $(SRCDIR)/TriviaTextTests.cc
	$(CXX) $(CPPFLAGS) $(INCLUDES) -I$(SRCDIR) -o $(BINDIR)/TriviaTextTests$(BINEXT) $(SRCDIR)/Game.cc $(SRCDIR)/TriviaTextTests.cc $(LINKFLAGS)

test: $(BINDIR)/TriviaUnitTests$(BINEXT)
	$(BINDIR)/TriviaUnitTests$(BINEXT)

run: $(BINDIR)/TriviaTextTests$(BINEXT)
	$(BINDIR)/TriviaTextTests$(BINEXT)

clean:
	- $(DELFILE) $(BINDIR)$(PATHSEP)TriviaUnitTests$(BINEXT)
	- $(DELFILE) $(BINDIR)$(PATHSEP)TriviaTextTests$(BINEXT)
