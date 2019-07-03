import QtQuick 2.0
import Felgo 3.0
import myscore 1.0
import "../entities"

SceneBase {
//    id: balloonScene
    property int score : 0
    property int balloons : 0
//    property int balloonMax : 10
    property int gameTime : 20
    property int time : 0
    property bool gameRunning : false
    property double bgmVolume: 35
    property double seVolume: 35
    property int balloonGravity: 1
    property double balloonCreate: 1
    property alias breakSound: breakSound
    property int highScore: 0

    signal menuScenePressed
    Data{
        id:data3
        highscore: score
    }


    width: 480
    height: 320

    Timer{//load json
        interval: 10
        running: true
        onTriggered: {
            data3.loadData()
            datasotr.start()
//            console.log(data3.highscore)
        }
    }

    Timer{//save json
        id:datasotr
        interval: 500
        repeat: true
        running: true
        onTriggered: {
            data3.saveData()
//            console.log(JSON.parse(JSON.stringify(data3)).highscore)
            data3.highscore=score
        }
    }

    function getHighScore() {
        highScore = JSON.parse(JSON.stringify(data3)).highscore
    }


//    width: screenWidth
//    height: screenHeight


    EntityManager {
        id:entityManager
        entityContainer: balloonScene

    }


    PhysicsWorld {
        z: 1
        debugDrawVisible: false
        gravity.y: -balloonGravity
    }

    EntityManager {
        id: timeEntityManager
        entityContainer: balloonScene
    }

    Image {
        source: "../../assets/img/sky.jpg"
        anchors.fill: gameWindowAnchorItem
    }

    SoundEffect {
        id: breakSound
        volume: seVolume / 100
        source: "../../assets/snd/balloonshoot.wav"
    }

    BackgroundMusic {
        volume: bgmVolume / 100
        source: "../../assets/snd/music.m4a"
    }

    Wall {
        height: gameWindowAnchorItem.height + 50
        anchors.right: parent.left
    }

    Wall {
        height: gameWindowAnchorItem.height + 50
        anchors.left: parent.right
    }


    function start() {
        spawnBalloons.start()
        timeBalloons.start()
        gameRunning = true
        gameTimer.start()

    }

    function stop() {
        spawnBalloons.stop()
        timeBalloons.stop()
        gameTimer.stop()

    }

    function reset() {
        entityManager.removeEntitiesByFilter(["balloon"])
        balloons = 0
        time = gameTime
        score = 0
    }

    Timer {
        id: spawnBalloons
        interval: 500 / balloonCreate
        repeat: true
        onTriggered: {
            entityManager.createEntityFromUrl(Qt.resolvedUrl("../entities/Balloon.qml"))
            balloons++
        }
    }

    Timer {
        id: timeBalloons
        interval: 5000 / balloonCreate
        repeat: true
        onTriggered: {
            timeEntityManager.createEntityFromUrl(Qt.resolvedUrl("../entities/TimeBalloon.qml"))
        }
    }

    Timer {
        id: gameTimer
        running: gameRunning
        repeat: true
        onTriggered: {
            time--
            if(time === 0) {

                spawnBalloons.stop()
                timeBalloons.stop()
                gameRunning = false
                balloonScene.getHighScore()
                gameOverState.show()
            }
        }
    }

    Image {
        id: optionButton
        source: "../../assets/img/button-pause.png"
        anchors.right: parent.right
        scale: 0.5

        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log()
                if(gameOverState.opacity == 1)
                    gameOverState.hide()
                menuScenePressed()
            }
        }
    }

    Row {
        anchors.top: gameWindowAnchorItem.top
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
