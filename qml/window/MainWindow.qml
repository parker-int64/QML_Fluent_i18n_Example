import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import Qt.labs.platform
import FluentUI
import "../components"

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
        icon.source: "/icons/favicon.ico"
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
            system_tray.showMessage(qsTr("A Notice"), qsTr("FluentUI is hidden in tray, click the icon in tray to show."));
            window.hide()
        }
        positiveText: qsTr("Exit")
        neutralText: qsTr("Cancel")
        onPositiveClicked:{
            window.destoryWindow()
            FluApp.closeApp()
        }

    }



    FluNavigationView{
        id:nav_view
        anchors.fill: parent
        items: Sidebar
        footerItems:Footer
        z:11
        displayMode:MainEvent.displayMode
        logo: "/icons/favicon.ico"
        title: qsTr("FluentUI")
        autoSuggestBox: FluAutoSuggestBox{
            width: 280
            anchors.centerIn: parent
            iconSource: FluentIcons.Search
            items: Sidebar.getSearchData()
            placeholderText: qsTr("Search")
            onItemClicked:
                (data)=>{
                    Sidebar.startPageByItem(data)
                }
        }


        Component.onCompleted: {
            Sidebar.navigationView = nav_view
            Footer.navigationView = nav_view
            nav_view.setCurrentIndex(0)
        }


    }

}
