TARGET = Trivia
TEMPLATE = lib
CONFIG += staticlib c++11
CONFIG -= qt

SOURCES += Game.cc
HEADERS += Game.h

unix {
    target.path = /usr/lib
    INSTALLS += target
}
