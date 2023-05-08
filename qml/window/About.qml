import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import FluentUI
<<<<<<< HEAD
=======
import AppInfo
>>>>>>> 642c2bd (Fixed some logics)

FluWindow {
    id: window
    title: qsTr("About")
    width: 380
    height: 200

<<<<<<< HEAD
=======
    AppInfo {
        id: appInfo
    }

>>>>>>> 642c2bd (Fixed some logics)

    FluAppBar{
        id:appbar
        title: qsTr("About")
        width:parent.width
    }

    ColumnLayout {
        anchors{
            top: appbar.bottom
            left: parent.left
            right: parent.right
        }

        ColumnLayout {
            Layout.topMargin: 20
            Layout.leftMargin: 15
            spacing: 14

            FluText {
                text: qsTr("QML_FluentUI_i18n_example")
                fontStyle: FluText.Title
            }

            FluText {
<<<<<<< HEAD
                text: qsTr("Version: 0.1.0")
=======
                text: appInfo.getAppVersion()
>>>>>>> 642c2bd (Fixed some logics)
                fontStyle: FluText.Body
                Layout.alignment: Qt.AlignBottom
            }


<<<<<<< HEAD
        }
=======
            FluText {
                text: qsTr("Made by parker-int64")
                fontStyle: FluText.Body
            }

        }


>>>>>>> 642c2bd (Fixed some logics)
    }

}
