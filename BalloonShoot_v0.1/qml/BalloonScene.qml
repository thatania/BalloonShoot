import QtQuick 2.0
import Felgo 3.0

Scene {
    property int balloons : 0
    property int balloonMax : 10
    property int time : 10
    property bool gameRunning : false
    property int score : 0

    signal menuScenePressed

    opacity: 0

    visible: opacity > 0

    enabled: visible

    EntityManager {
        id:entityManager
        entityContainer: balloonScene

    }

    PhysicsWorld {
        z: 1
        gravity.y: -1
    }

    Image {
        source: "../assets/sky.jpg"
        anchors.fill: gameWindowAnchorItem
    }
    SoundEffect {

    }
    BackgroundMusic {

    }

    Wall {
        height: parent.height + 50
        anchors.right: parent.left
    }

    Wall {
        height: parent.height + 50
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
        anchors.bottom: gameWindowAnchorItem.bottom
        z: 2
        Text {
            id: scoreText
            width: 100
            height: 40
            text: "score: " + balloonScene.score
        }

        Text {
            id: timeText
            height: 40
            text: "time: " + balloonScene.time
        }
    }
}
