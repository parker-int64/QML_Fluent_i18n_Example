import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import FluentUI

FluWindow {
    id: window
    title: qsTr("About")
    width: 380
    height: 200


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
                text: qsTr("Version: 0.1.0")
                fontStyle: FluText.Body
                Layout.alignment: Qt.AlignBottom
            }


        }
    }

}
