#-------------------------------------------------
#
# Project created by QtCreator 2012-10-19T12:51:14
#
#-------------------------------------------------

QT += \
    core gui \
    opengl concurrent

TARGET = MapperTool
TEMPLATE = app

SOURCES += \
    main.cpp\
    mainwindow.cpp \
    aboutdialog.cpp \
    glwidget.cpp \
    unitmapdialog.cpp \
    mapmanager.cpp \
    mapoperations.cpp \
    displaytexturemanager.cpp \
    generatedimage.cpp \
    patternmanager.cpp \
    mt_graydecoder.cpp \
    patternsdialog.cpp \
    texturefrommat.cpp \
    inversedialog.cpp \
    filterdialog.cpp

HEADERS += \
    mainwindow.h \
    aboutdialog.h \
    glwidget.h \
    unitmapdialog.h \
    mapmanager.h \
    mapoperations.h \
    displaytexturemanager.h \
    generatedimage.h \
    threadSafeQueue.h \
    patternmanager.h \
    mt_graydecoder.h \
    patternsdialog.h \
    texturefrommat.h \
    inversedialog.h \
    filterdialog.h

FORMS += \
    mainwindow.ui \
    aboutdialog.ui \
    unitmapdialog.ui \
    patternsdialog.ui \
    inversedialog.ui \
    filterdialog.ui

RESOURCES += \
    resources.qrc

OTHER_FILES += \
    resources/uvMap_frag.glsl \
    resources/passThru_vert.glsl \
    resources/transparencyGrid_frag.glsl \
    resources/gradient_frag.glsl \
    resources/testGrid_frag.glsl

unix {
    LIBS += -I/usr/include/opencv -lopencv_world
}

macx {
    QMAKE_CXXFLAGS_WARN_ON += -Wno-reorder
    ICON = $$PWD/resources/icon.icns
    QMAKE_INFO_PLIST = $$PWD/resources/Info.plist
}

win32 {
    RC_FILE = $$PWD/resources/resource.rc
    # Copy Qt runtime

    CONFIG(debug, debug|release) {
        LIBS += -lopengl32
        Qt5Cored.commands = copy /Y %QTDIR%\\bin\\Qt5Cored.dll debug
        Qt5Cored.target = debug/Qt5Cored.dll
        Qt5Guid.commands = copy /Y %QTDIR%\\bin\\Qt5Guid.dll debug
        Qt5Guid.target = debug/Qt5Guid.dll
        Qt5OpenGLd.commands = copy /Y %QTDIR%\\bin\\Qt5OpenGLd.dll debug
        Qt5OpenGLd.target = debug/Qt5OpenGLd.dll
        Qt5Concurrentd.commands = copy /Y %QTDIR%\\bin\\Qt5Concurrentd.dll debug
        Qt5Concurrentd.target = debug/Qt5Concurrentd.dll

        QMAKE_EXTRA_TARGETS += Qt5Cored Qt5Guid Qt5OpenGLd Qt5Concurrentd
        PRE_TARGETDEPS += debug/Qt5Cored.dll debug/Qt5Guid.dll debug/Qt5OpenGLd.dll debug/Qt5Concurrentd.dll
    } else {
        LIBS += -lopengl32
        Qt5Core.commands = copy /Y %QTDIR%\\bin\\Qt5Core.dll release
        Qt5Core.target = release/Qt5Core.dll
        Qt5Gui.commands = copy /Y %QTDIR%\\bin\\Qt5Gui.dll release
        Qt5Gui.target = release/Qt5Gui.dll
        Qt5OpenGL.commands = copy /Y %QTDIR%\\bin\\Qt5OpenGL.dll release
        Qt5OpenGL.target = release/Qt5OpenGL.dll
        Qt5Concurrent.commands = copy /Y %QTDIR%\\bin\\Qt5Concurrent.dll release
        Qt5Concurrent.target = release/Qt5Concurrent.dll

        QMAKE_EXTRA_TARGETS += Qt5Core Qt5Gui Qt5OpenGL Qt5Concurrent
        PRE_TARGETDEPS += release/Qt5Core.dll release/Qt5Gui.dll release/Qt5OpenGL.dll release/Qt5Concurrent.dll\
    }

    # Include, link and copy opencv dependency

    OPENCVDIR = "C:\\Store\\Install\\OpenCV\\opencv\\build"
    OPENCVINCLUDEDIR = $${OPENCVDIR}\\include
    OPENCVLIBDIR = $${OPENCVDIR}\\x64\\vc14\\lib
    OPENCVBINDIR = $${OPENCVDIR}\\x64\\vc14\\bin
    exists($$OPENCVDIR) {
          DEFINES += USEOPENCV
          INCLUDEPATH += $${OPENCVINCLUDEDIR}
          DEPENDPATH += $${OPENCVINCLUDEDIR}
          CONFIG(release, debug|release) {
                  LIBS += -L$${OPENCVLIBDIR} \
                          -lopencv_world310
                  PRE_TARGETDEPS += \
                          $${OPENCVLIBDIR}/opencv_world310.lib

                  opencv_world310.commands = copy /Y $${OPENCVBINDIR}\\opencv_world310.dll release
                  opencv_world310.target = release/opencv_world310.dll

                  QMAKE_EXTRA_TARGETS += opencv_world310
                  PRE_TARGETDEPS += release/opencv_world310.dll

          } else {
                  LIBS += -L$${OPENCVLIBDIR} \
                          -lopencv_world310d
                  PRE_TARGETDEPS += \
                          $${OPENCVLIBDIR}/opencv_world310d.lib

                  opencv_world310d.commands = copy /Y $${OPENCVBINDIR}\\opencv_world310d.dll debug
                  opencv_world310d.target = debug/opencv_world310d.dll

                  QMAKE_EXTRA_TARGETS += opencv_world310d
                  PRE_TARGETDEPS += debug/opencv_world310d.dll

          }
    } else {
          message("OpenCV libraries not found.")
    }
}

