import QtQuick
import QtQuick.Layouts
import QtQuick.Window
import QtQuick.Controls
import FluentUI
import FluentExample
<<<<<<< HEAD
import QtMultimedia
=======
>>>>>>> 642c2bd (Fixed some logics)

FluScrollablePage{

    title: qsTr("Demo")
    leftPadding:10
    rightPadding:10
    bottomPadding:20
    spacing: 0


    FluArea {

        Layout.fillWidth: true
        height: 800
        Layout.topMargin: 20
        paddings: 10

        FluText {
            id: text1
            anchors.horizontalCenter: parent.horizontalCenter

            text: qsTr("May the Force be with you.")
            font.italic: true;
            font.pixelSize: 24
        }


        TextArea {
            id: scriptsArea
            anchors.top: text1.bottom
            selectByMouse: false
            anchors.horizontalCenter: parent.horizontalCenter
<<<<<<< HEAD
            text: qsTr( "Obi-Wan : You were the chosen one! \n\tIt was said that you would destroy the Sith, not join them!\n\t Bring balance to the force... not leave it in darkness!\n\t" +
=======
            text: qsTr( "Obi-Wan : You were the chosen one! \n\tIt was said that you would destroy the Sith, not join them!\n\t Bring balance to the force... not leave it in darkness!\n" +
>>>>>>> 642c2bd (Fixed some logics)
                        "Anakin Skywalker : I hate you!!!\n" +
                        "Obi-Wan : You were my brother Anakin! I loved you")
            font.italic: true;
            font.pixelSize: 18
        }

<<<<<<< HEAD
=======

>>>>>>> 642c2bd (Fixed some logics)
    }
}
