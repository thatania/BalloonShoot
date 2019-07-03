import QtQuick 2.0
import Felgo 3.0
import "../scenes"

EntityBase {
    entityType: "timeBalloon"
    width: timeBImage.width
    height: timeBImage.height

    MultiResolutionImage {
        id: timeBImage
        source: "../../assets/img/balloon_b.png"
    }

    CircleCollider {
        radius: timeBImage.width / 2
        fixture.restitution: 0.5
    }

    Component.onCompleted: {
        x = utils.generateRandomValueBetween(0, balloonScene.width - timeBImage.width)
        y = balloonScene.height
    }


    MouseArea {
        anchors.fill: timeBImage
        onPressed: {
            if(balloonScene.gameRunning) {
                balloonScene.time+= 3
                breakSound.play()
                removeEntity()
            }
        }
    }
}
