import QtQuick 2.0
import Felgo 3.0

SceneBase {
//    id: menuScene

    signal gameScenePressed

    signal settingScenePressed

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

        Rectangle {
            width: 150
            height: 50
            Image {
                id: continueButton
                source: "../assets/scoreButton.png"
                anchors.centerIn: parent
            }

            MouseArea {
                anchors.fill: parent
//                onClicked:
            }
        }

        Rectangle {
            width: 150
            height: 50
            Image {
                id: scoreButton
                source: "../assets/scoreButton.png"
                anchors.centerIn: parent
            }

            MouseArea {
                anchors.fill: parent
//                onClicked:
            }
        }

        Rectangle {
            width: 150
            height: 50
            Image {
                id: settingsButton
                source: "../assets/scoreButton.png"
                anchors.centerIn: parent
            }

            MouseArea {
                anchors.fill: parent
                onClicked: settingScenePressed()
            }
        }

        Rectangle {
            width: 150
            height: 50
            Image {
                id: exitButton
                source: "../assets/scoreButton.png"
                anchors.centerIn: parent
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
