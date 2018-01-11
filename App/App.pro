TARGET = TriviaTextTests
TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG -= qt

SOURCES += TriviaTextTests.cc

# depends "Trivia" Library
win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../Library/release/ -lTrivia
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../Library/debug/ -lTrivia
else:unix: LIBS += -L$$OUT_PWD/../Library/ -lTrivia

INCLUDEPATH += $$PWD/../Library
DEPENDPATH += $$PWD/../Library

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../Library/release/libTrivia.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../Library/debug/libTrivia.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../Library/release/Trivia.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../Library/debug/Trivia.lib
else:unix: PRE_TARGETDEPS += $$OUT_PWD/../Library/libTrivia.a
