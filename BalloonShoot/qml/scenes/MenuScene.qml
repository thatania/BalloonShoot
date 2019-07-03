import QtQuick 2.0
import Felgo 3.0
import "../entities"

SceneBase {
//    id: menuScene

    signal gameScenePressed

    signal settingScenePressed

    Image {
        anchors.fill: menuScene.gameWindowAnchorItem
        source: "../../assets/img/background.jpg"
    }

    Column {
        anchors.centerIn: parent
        spacing: 20


        Rectangle {// title
            width: 200
            height: 50
            color: "transparent"

            Text {
                text: "Balloon Shoot"
                anchors.centerIn: parent
                font.family: standardFont.name
                font.pixelSize: 40
                color: "lightyellow"
            }
        }

        Rectangle {//continue
            width: 150
            height: 50
            radius: 8
            border.width: 3
            color: "lightblue"
            anchors.horizontalCenter: parent.horizontalCenter

                Text {
                    text: "Continue"
                    font.family: standardFont.name
                    font.pixelSize: 28
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                }


            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if(balloonScene.time !== balloonScene.gameTime && balloonScene.time !== 0)
                        gameScenePressed()
                    else {

                    }
                }
            }
        }

        Rectangle {//new play
            width: 150
            height: 50
            radius: 8
            border.width: 3
            color: "lightblue"
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                text: "New Play"
                font.family: standardFont.name
                font.pixelSize: 28
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    balloonScene.reset()
                    gameScenePressed()
                }
            }
        }

//        Rectangle {//score
//            width: 150
//            height: 50
//            Image {
//                id: scoreButton
//                source: "../../assets/scoreButton.png"
//                anchors.centerIn: parent
//            }

//            MouseArea {
//                anchors.fill: parent
////                onClicked:
//            }
//        }

        Rectangle {//settings
            width: 150
            height: 50
            radius: 8
            border.width: 3
            color: "lightblue"
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                text: "Settings"
                font.family: standardFont.name
                font.pixelSize: 28
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }

            MouseArea {
                anchors.fill: parent
                onClicked: settingScenePressed()
            }
        }

        Rectangle {//exit
            id: exitRectangle
            width: 150
            height: 50
            radius: 8
            border.width: 3
            color: "lightblue"
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                text: "Exit"
                font.family: standardFont.name
                font.pixelSize: 28
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    Qt.quit()
                }
            }
        }
    }
}
