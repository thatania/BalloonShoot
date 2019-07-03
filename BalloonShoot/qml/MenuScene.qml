import QtQuick 2.0
import Felgo 3.0

Scene {
//    id: menuScene

    signal gameScenePressed

    opacity: 0

    visible: opacity > 0

    enabled: visible

    Image {
        anchors.fill: menuScene.gameWindowAnchorItem
        source: "../assets/background.png"
    }

    Column {
        anchors.centerIn: parent
        spacing: 20


        Rectangle {
            width: 150
            height: 50
            Image {
                id: playButton
                source: "../assets/playButton.png"
                anchors.centerIn: parent
            }

            MouseArea {
                anchors.fill: parent
                onClicked: gameScenePressed()
            }
        }

//    Rectangle {
//        width: 150
//        height: 50
//        Image {
//            id: scoreButton
//            source: "../assets/scoreButton.png"
//            anchors.centerIn: parent
//        }

//        MouseArea {
//            anchors.fill: parent
////            onClicked:
//        }
//    }
    }
}
