import QtQuick 2.0
import Felgo 3.0

EntityBase {
    entityType: "balloon"
    width: sprite.width
    height: sprite.height

    MultiResolutionImage {
        id: sprite
        source: "../assets/balloon.png" //balloon image

    }

    CircleCollider {
        radius: sprite.width/2
        fixture.restitution: 0.5
    }

    MouseArea {
        anchors.fill: sprite
    }

    Component.onCompleted: {
        x = utils.generateRandomValueBetween(0, balloonScene.width - sprite.width)
        y = balloonScene.height
    }

    MouseArea {
        anchors.fill: sprite
        onPressed: {
            if(balloonScene.gameRunning) {
                balloonScene.balloons--
                balloonScene.score++
//                balloonScene.popSound.play()
                removeEntity()
            }
        }
    }
}
