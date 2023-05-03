pragma Singleton

import QtQuick
import FluentUI

FluObject{

    property var navigationView

    FluPaneItem{
        title: qsTr("Home")
        icon:FluentIcons.Home
//        cusIcon: Image{
//            anchors.centerIn: parent
//            source: FluTheme.dark ? "qrc:/res/svg/home_dark.svg" : "qrc:/res/svg/home.svg"
//            sourceSize: Qt.size(30,30)
//            width: 18
//            height: 18
//        }
        onTap:{
            navigationView.push("qrc:/FluentExample/qml/views/T_Home.qml")
        }
    }



    function getRecentlyAddedData(){
        var arr = []
        for(var i=0;i<children.length;i++){
            var item = children[i]
            if(item instanceof FluPaneItem && item.recentlyAdded){
                arr.push(item)
            }
            if(item instanceof FluPaneItemExpander){
                for(var j=0;j<item.children.length;j++){
                    var itemChild = item.children[j]
                    if(itemChild instanceof FluPaneItem && itemChild.recentlyAdded){
                        arr.push(itemChild)
                    }
                }
            }
        }
        arr.sort(function(o1,o2){ return o2.order-o1.order })
        return arr
    }

    function getRecentlyUpdatedData(){
        var arr = []
        var items = navigationView.getItems();
        for(var i=0;i<items.length;i++){
            var item = items[i]
            if(item instanceof FluPaneItem && item.recentlyUpdated){
                arr.push(item)
            }
        }
        return arr
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

    function startPageByItem(data){
        navigationView.startPageByItem(data)
    }

}
