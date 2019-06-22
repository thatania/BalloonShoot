import Felgo 3.0
import QtQuick 2.2


GameWindow {
    id:gameWindow

    screenWidth: 640
    screenHeight: 960

//    onSplashScreenFinished: balloonScene.start()
    onSplashScreenFinished: balloonScene.stop()

    MenuScene {
        id: menuScene
        onGameScenePressed: {
            gameWindow.state = "game"
            balloonScene.start()
        }
    }

    BalloonScene {
        id: balloonScene
        onMenuScenePressed: {
            gameWindow.state = "menu"
            balloonScene.stop()
        }
    }

    state: "menu"

    states: [
    State {
            name: "menu"
            PropertyChanges {
                target: menuScene
                opacity: 1 //窗口透明度
            }
        },
    State {
            name: "game"
            PropertyChanges {
                target: balloonScene
                opacity: 1
            }
    }
    ]
}
