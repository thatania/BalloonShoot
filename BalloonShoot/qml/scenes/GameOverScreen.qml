import QtQuick 2.0
import Felgo 3.0
import myscore 1.0
import "../entities"

Item {
    width: parent.width
    height: parent.height
    opacity: 0

    signal menuScenePressed
    signal gameScenePressed


    MultiResolutionImage {
        id: gameOverImage
        source: "../../assets/img/gameOver.png"
        anchors.top: parent.top
        anchors.topMargin: 80
        anchors.horizontalCenter: parent.horizontalCenter

    }

    Rectangle{
        id:gameOverRec
        color: "lightyellow"
        border.width: 3
        radius: 10
        width: parent.width / 2
        height: parent.height / 3
        anchors.centerIn: parent
            Text {
                anchors.top: parent.top
                anchors.topMargin: 30
                anchors.horizontalCenter: parent.horizontalCenter
                id: playerScore
                text: "your score:   " + balloonScene.score
                font.family: standardFont.name
                font.pixelSize: 24
            }
            Text {
                id: highScore
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 30
                text: "best score:   " + balloonScene.highScore
                font.family: standardFont.name
                font.pixelSize: 24
                anchors.horizontalCenter: parent.horizontalCenter
            }
    }

    Image {
        id: catImage
        anchors.left: gameOverRec.right
        height: gameOverRec.height
        width: gameOverRec.height / 4 * 3
        source: "../../assets/img/cat.png"
        anchors.verticalCenter: gameOverRec.verticalCenter
    }




    Image {
        id: backToMenu
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        source: "../../assets/img/button-back.png"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                if(gameOverState.opacity === 1) {
                    menuScenePressed()
                }
            }
        }
    }

    Image {
        anchors.left: backToMenu.right
        anchors.verticalCenter: backToMenu.verticalCenter
        anchors.leftMargin: parent.width - 128
        source: "../../assets/img/button-replay.png"

        MouseArea {
            anchors.fill: parent
            onClicked:  {
                if(gameOverState.opacity === 1) {
                    balloonScene.reset()
                    gameScenePressed()
                }
            }
        }
    }

    function show() {
        gameOverState.opacity = 1
    }

    function hide() {
        gameOverState.opacity = 0
    }
}
