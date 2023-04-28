import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import FluentUI

Window {
    id:app

    Component.onCompleted: {
        FluApp.init(app)
        FluTheme.frameless = ("windows" === Qt.platform.os)
        FluTheme.darkMode = FluDarkMode.System
        FluApp.routes = {
             "/":"qrc:/FluentExample/qml/window/MainWindow.qml"
        }
        FluApp.initialRoute = "/"
        FluApp.run()
    }
}
