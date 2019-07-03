import QtQuick 2.0
import Felgo 3.0
//lack end game
SceneBase {
//    id: balloonScene
    property int balloons : 0
    property int balloonMax : 10
    property int time : 10
    property bool gameRunning : false
    property int score : 0
    property double bgmVolume: 35
    property double seVolume: 35
    property int balloonGravity: 1
    property alias breakSound: breakSound
    signal menuScenePressed

    width: 480
    height: 320

//    width: screenWidth
//    height: screenHeight

//    sceneAlignmentY: "top"

    EntityManager {
        id:entityManager
        entityContainer: balloonScene

    }

    PhysicsWorld {
        z: 1
        debugDrawVisible: false
        gravity.y: -balloonGravity
    }

    Image {
        source: "../assets/sky.jpg"
        anchors.fill: gameWindowAnchorItem
    }

    SoundEffect {
        id: breakSound
        volume: seVolume / 100
        source: "../assets/snd/balloonPop.wav"
    }

    BackgroundMusic {
        volume: bgmVolume / 100
        source: "../assets/snd/music.mp3"
    }

    Wall {
        height: gameWindowAnchorItem.height + 50
        anchors.right: parent.left
    }

    Wall {
        height: gameWindowAnchorItem.height + 50
        anchors.left: parent.right
    }

//    Timer {
//        interval: 50
//        running: true
//        repeat: true
//        onTriggered: {
//            entityManager.createEntityFromUrl(Qt.resolvedUrl("../qml/Balloon.qml"))
//            balloons++
//            if(balloons == balloonMax) {
//                running = false
//                gameRunning = true
//            }
//        }
//    }

    function start() {
        spawnBalloons.start()
        gameRunning = true
        gameTimer.start()
        console.log("balloonScene width: " + balloonScene.width)
        console.log("balloonScene height: " + balloonScene.height)
        console.log("parent width: " + parent.width)
        console.log("parent height: " + parent.height)
    }

    function stop() {
        spawnBalloons.stop()
        gameTimer.stop()
    }

    Timer {
        id: spawnBalloons
        interval: 500
        repeat: true
        onTriggered: {
//            if(balloons < balloonMax) {
            entityManager.createEntityFromUrl(Qt.resolvedUrl("../qml/Balloon.qml"))
            balloons++

//            if()
//            if(balloons == balloonMax) {
//                running = false
//                gameRunning = true
//            }
//            balloons++
//            gameRunning = true
//            balloons++
//                running = false
//            }
//            gameRunning = true

        }
    }

    Timer {
        id: gameTimer
        running: gameRunning
        repeat: true
        onTriggered: {
            time--
//            if(time == 0 || balloons == 0) {
            if(time == 0) {
//                running = false
                spawnBalloons.stop()
                gameRunning = false
            }
        }
    }

    Image {
        id: optionButton
        source: "../assets/optionsButton.png"
        x: balloonScene.width - 96
        y: -40
        scale: 0.5

        MouseArea {
            anchors.fill: parent
            onClicked: {
                menuScenePressed()
            }
        }
    }

    Row {
        anchors.top: gameWindowAnchorItem.top
//        z: 2
        Text {
            id: scoreText
            width: balloonScene.width / 4
            height: balloonScene.height / 6
            text: "score: " + balloonScene.score
            font.pixelSize: 20
        }

        Text {
            id: timeText
            width: balloonScene.width / 4
            height: balloonScene.height / 6
            text: "time: " + balloonScene.time
            font.pixelSize: 20
        }
    }
}
