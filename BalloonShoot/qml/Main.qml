import Felgo 3.0
import QtQuick 2.2
import myscore 1.0
import "scenes"
import "entities"

GameWindow {
    id:gameWindow

    screenWidth: 960
    screenHeight: 640

//    onSplashScreenFinished: balloonScene.start()
    onSplashScreenFinished: balloonScene.stop()

    FontLoader {
        id: standardFont
        source: "fonts/pudding.ttf"
    }

    MenuScene {
        id: menuScene
        onGameScenePressed: {
            gameWindow.state = "game"
            balloonScene.start()
        }
        onSettingScenePressed: {
            gameWindow.state = "settings"
        }
    }

    BalloonScene {
        id: balloonScene
        onMenuScenePressed: {
            gameWindow.state = "menu"
            balloonScene.stop()
        }
    }

    SettingScene {
        id: settingScene
        onMenuScenePressed: {
            gameWindow.state = "menu"
        }
    }

    GameOverScreen {
        id: gameOverState

        onGameScenePressed: {
                gameOverState.hide()
                balloonScene.reset()
                balloonScene.start()
        }

        onMenuScenePressed: {
                gameOverState.hide()
                gameWindow.state = "menu"
        }
    }

    state: "menu"

    states: [
    State {
            name: "menu"
            PropertyChanges {
                target: menuScene
                opacity: 1
            }
        },
    State {
            name: "game"
            PropertyChanges {
                target: balloonScene
                opacity: 1
            }
    },
    State {
            name: "settings"
            PropertyChanges {
                target: settingScene
                opacity: 1
            }
        }
    ]
}
