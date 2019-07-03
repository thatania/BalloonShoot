import QtQuick 2.0
import Felgo 3.0
import "../scenes"

EntityBase {
    entityType: "balloon"
    width: sprite.width
    height: sprite.height

    MultiResolutionImage {
        id: sprite
        source: "../../assets/img/balloon_30x60.png" //balloon image
    }

    CircleCollider {
        radius: sprite.width/2
        fixture.restitution: 0.5
    }

    Component.onCompleted: {
        x = utils.generateRandomValueBetween(0, balloonScene.width - sprite.width)
        y = balloonScene.height
    }

    MouseArea {
        anchors.fill: sprite
        onPressed: {
            if(balloonScene.gameRunning) {
//                balloonBroken.visible = true
//                balloonSprite.jumpTo("broken")
//                balloonBroken.visible = false
                balloonScene.balloons--
                balloonScene.score++
                breakSound.play()
                removeEntity()
            }
        }
    }

//    TexturePackerSpriteSequence {
//        id: balloonSprite
//        anchors.fill:
//        TexturePackerSprite {
//            id: sprite
//            name: "create"
//            source: "../assets/img/balloonSprite.json"
//            frameNames: ["balloon_r-0.png", "balloon_r-1.png", "balloon_r-2.png", "balloon_r-3.png", "balloon_r-4.png"]
//            frameRate: 4
//            loops: 1
//        }

//        TexturePackerSprite {
//            id: balloonBroken
//            name: "broken"
//            source: "../assets/img/balloonSprite.json"
//            frameNames: ["balloon_r-5.png", "balloon_r-6.png", "balloon_r-7.png"]
//            frameRate: 60
//            loops: 1
//        }
//    }
}
