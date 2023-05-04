pragma Singleton

import QtQuick
import FluentUI

FluObject{

    property var navigationView

    FluPaneItem{
        title: qsTr("Home")
        icon:FluentIcons.Home
        onTap:{
            navigationView.push("/FluentExample/qml/views/V_Home.qml")
        }
    }


    FluPaneItem {
        title: qsTr("Demo")
        icon: FluentIcons.Page
        onTap: {
            navigationView.push("/FluentExample/qml/views/V_Demo.qml")
        }
    }


    function getSearchData(){
        var arr = []
        var items = navigationView.getItems();
        for(var i=0;i<items.length;i++){
            var item = items[i]
            if(item instanceof FluPaneItem){
                arr.push({title:item.title,key:item.key})
            }
        }
        return arr
    }
}
