pragma Singleton

import QtQuick
import FluentUI

FluObject{
    id:footer_items

    property var navigationView

    FluPaneItemSeparator{}
    FluPaneItem{
        title: qsTr("About")
        icon:FluentIcons.Contact
        tapFunc:function(){
            FluApp.navigate("/about")
        }
    }

    FluPaneItem{
        title: qsTr("Settings")
        icon:FluentIcons.Settings
        onTap:{
            FluApp.navigate("/about")
        }
    }
}
