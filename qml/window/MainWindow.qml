import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import Qt.labs.platform
import FluentUI

FluWindow {

    id:window
    title: qsTr("FluentUI")
    width: 1000
    height: 640
    closeDestory:false
    minimumWidth: 520
    minimumHeight: 460

    closeFunc:function(event){
        close_app.open()
        event.accepted = false
    }


    FluAppBar{
        id:appbar
        z:9
        showDark: true
        width:parent.width
    }

    SystemTrayIcon {
        id:system_tray
        visible: true
        icon.source: "/res/icons/favicon.ico"
        tooltip: "FluentUI"
        menu: Menu {
            MenuItem {
                text: qsTr("Exit")
                onTriggered: {
                    window.destoryWindow()
                    FluApp.closeApp()
                }
            }
        }
        onActivated:
            (reason)=>{
                if(reason === SystemTrayIcon.Trigger){
                    window.show()
                    window.raise()
                    window.requestActivate()
                }
            }
    }

    FluContentDialog{
        id:close_app
        title: qsTr("Exit the program")
        message: qsTr("Are you sure you want to exit the program ?")
        negativeText: qsTr("Minimize")
        buttonFlags: FluContentDialog.NeutralButton | FluContentDialog.NegativeButton | FluContentDialog.PositiveButton
        onNegativeClicked:{
            system_tray.showMessage(qsTr("FluentUI is hidden in tray, click the icon in tray to show."));
            window.hide()
        }
        positiveText: qsTr("Exit")
        neutralText: qsTr("Cancel")
        onPositiveClicked:{
            window.destoryWindow()
            FluApp.closeApp()
        }
    }

}
