import QtQuick
import QtQuick.Layouts
import QtQuick.Window
import QtQuick.Controls
import FluentUI
import FluentExample

FluScrollablePage{

    title: qsTr("Settings")
    leftPadding:10
    rightPadding:10
    bottomPadding:20
    spacing: 0

    FluArea{
        Layout.fillWidth: true
        Layout.topMargin: 20
        height: 136
        paddings: 10

        ColumnLayout{
            spacing: 10
            anchors{
                top: parent.top
                left: parent.left
            }
            FluText{
                text: qsTr("Dark Mode")
                fontStyle: FluText.BodyStrong
                Layout.bottomMargin: 4
            }
            Repeater{
                model: [
                    {
                        title:qsTr("System"),
                        mode:FluDarkMode.System
                    },

                    {
                        title:qsTr("Light"),
                        mode:FluDarkMode.Light
                    },

                    {
                        title:qsTr("Dark"),
                        mode:FluDarkMode.Dark
                    }
                ]
                delegate:  FluRadioButton{
                    selected : FluTheme.darkMode === modelData.mode
                    text: modelData.title
                    onClicked:{
                        FluTheme.darkMode = modelData.mode
                    }
                }
            }


        }

    }

    FluArea{
        Layout.fillWidth: true
        Layout.topMargin: 20
        height: 168
        paddings: 10

        ColumnLayout{
            spacing: 10
            anchors{
                top: parent.top
                left: parent.left
            }

            FluText{
                text: qsTr("Navigation View Display Mode")
                fontStyle: FluText.BodyStrong
                Layout.bottomMargin: 4
            }
            Repeater{
                model: [
                    {
                        title:qsTr("Open"),
                        mode:FluNavigationView.Open
                    },

                    {
                        title: qsTr("Compact"),
                        mode:FluNavigationView.Compact
                    },

                    {
                        title:qsTr("Minimal"),
                        mode:FluNavigationView.Minimal
                    },

                    {
                        title:qsTr("Auto"),
                        mode:FluNavigationView.Auto
                    }
                ]
                delegate:  FluRadioButton{
                    selected : MainEvent.displayMode===modelData.mode
                    text: modelData.title
                    onClicked:{
                        MainEvent.displayMode = modelData.mode
                    }
                }
            }
        }
    }

    FluArea{


        Layout.fillWidth: true
        Layout.topMargin: 20
        height: 80
        paddings: 10

        ColumnLayout{
            spacing: 10
            anchors{
                top: parent.top
                left: parent.left
            }

            FluText{
                text: qsTr("Display Languages")
                fontStyle: FluText.BodyStrong
                Layout.bottomMargin: 4
            }

            FluDropDownButton {
                id: langSelect
                width: 300
                height: 75
                text: qsTr("Languages")

                items:[
                    FluMenuItem{
                        text: "简体中文"
                        onClicked: {
                            console.log("zh_CN")
                            localization.changeDisplayLanguage("zh_CN")
                            langSelect.text = "简体中文"
                        }
                    },

                    FluMenuItem{
                        text:"English"
                        onClicked: {
                            console.log("en_US")
                            localization.changeDisplayLanguage("en_US")
                            langSelect.text = "English"
                        }
                    }
                ]
            }

        }
    }

}
