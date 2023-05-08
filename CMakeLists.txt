cmake_minimum_required(VERSION 3.16)

<<<<<<< HEAD
project(FluentExample VERSION 0.1 LANGUAGES CXX)
=======
project(FluentExample VERSION 0.1.1 LANGUAGES CXX)
>>>>>>> 642c2bd (Fixed some logics)

# set(CMAKE_AUTORCC ON) # since we use the qt_add_xx() functions in cmake
                        # we won't need to use the auto rcc
                        # In fact, we don't need to add `.qrc` files anymore
set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

<<<<<<< HEAD
=======
# configure file for auto generate header
# e.g. version directly from CMakeLists.
#      OpenGL, Vulkan and some features
#
configure_file(config.h.in ${CMAKE_CURRENT_SOURCE_DIR}/include/config.h)

>>>>>>> 642c2bd (Fixed some logics)
find_package(Qt6 REQUIRED COMPONENTS Quick LinguistTools)

file(GLOB TS_FILES "${CMAKE_CURRENT_SOURCE_DIR}/translations/*.ts")
file(GLOB IMAGE_FILES "${CMAKE_CURRENT_SOURCE_DIR}/res/images/*")
file(GLOB ICON_FILES "${CMAKE_CURRENT_SOURCE_DIR}/res/icons/*")
file(GLOB FONT_FILES "${CMAKE_CURRENT_SOURCE_DIR}/res/fonts/*")


# !WARNING: Do not add ${CMAKE_CURRENT_SOURCE_DIR} in set function
#           Use RELATIVE PATH instead
set(QML_FILES   qml/App.qml
                qml/window/MainWindow.qml
                qml/window/About.qml
                qml/components/Footer.qml
                qml/components/Sidebar.qml
                qml/components/MainEvent.qml
                qml/views/V_Home.qml
                qml/views/V_Settings.qml
                qml/views/V_Demo.qml
            )

<<<<<<< HEAD
set(APP_SOURCES

        src/main.cpp
)
=======

include_directories(./include)

set(APP_SOURCES
        include/config.h
        include/appInfo.h
        include/localization.h
        include/util.h
        src/appInfo.cpp
        src/localization.cpp
        src/util.cpp
        src/main.cpp


)

>>>>>>> 642c2bd (Fixed some logics)
qt_add_executable(appFluentExample
    ${APP_SOURCES}
)


# Singleton type in QML must add properties
# So the generated qmldir will add "singleton"
set_source_files_properties(qml/components/Footer.qml
                            qml/components/Sidebar.qml
                            qml/components/MainEvent.qml
                            PROPERTIES
                            QT_QML_SINGLETON_TYPE TRUE
)


qt_add_qml_module(appFluentExample
    URI FluentExample
    VERSION 1.0
    QML_FILES ${QML_FILES}

)



<<<<<<< HEAD
=======

>>>>>>> 642c2bd (Fixed some logics)
# compiled into the source file
# access translation files via `:/i18n`
qt_add_translations(appFluentExample
                    TS_FILES ${TS_FILES}
<<<<<<< HEAD
=======
#                    LUPDATE_OPTIONS "-no-obsolete"
>>>>>>> 642c2bd (Fixed some logics)
)

# images
qt_add_resources(appFluentExample "images"
                PREFIX "/images"
                BASE "res/images" # alias
                FILES ${IMAGE_FILES})

# fonts
qt_add_resources(appFluentExample "fonts"
                PREFIX "/fonts"
                FILES ${FONT_FILES})

# program icons 
qt_add_resources(appFluentExample "icons"
                PREFIX "/icons"
                BASE "res/icons"
                FILES ${ICON_FILES})


target_link_libraries(appFluentExample
                     PRIVATE Qt6::Quick
)
<<<<<<< HEAD
=======



# POST BUILD
# Copy Config files
set(CONFIG_FILE ${CMAKE_CURRENT_BINARY_DIR}/conf/config.json)

if(NOT EXISTS ${CONFIG_FILE})
    add_custom_command(appFluentExample
        POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_CURRENT_SOURCE_DIR}/conf ${CMAKE_CURRENT_BINARY_DIR}/conf
    )
endif()


>>>>>>> 642c2bd (Fixed some logics)
