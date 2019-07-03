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


        Rectangle {//continue
            width: 150
            height: 50
            Image {
                id: playButton
                source: "../assets/playButton.png"
                anchors.centerIn: parent
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if(balloonScene.gameTime != 20 && balloonScene.gameTime != 0)
                        gameScenePressed()
                    else {

                    }
                }
            }
        }

        Rectangle {//new play
            width: 150
            height: 50
            Image {
                id: continueButton
                source: "../assets/scoreButton.png"
                anchors.centerIn: parent
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    balloonScene.reset()
                    gameScenePressed()
                }
            }
        }

        Rectangle {//解谜
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

        Rectangle {//settings
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

        Rectangle {//exit
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
