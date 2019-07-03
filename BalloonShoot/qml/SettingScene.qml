import QtQuick 2.0
import Felgo 3.0
import QtQuick.Controls.Styles 1.2
import QtQuick.Controls 2.0

SceneBase {
    id: settingScene

    property bool sliderUpdate: false
    property int bgValue: 0
    property int seValue: 0
    property int bsValue: 0

    property int balloonSpeed: 1

    width: screenWidth
    height: screenHeight

    signal menuScenePressed

    Image {//background
        source: "../assets/room_4800x3200.png"
        anchors.fill: gameWindowAnchorItem
    }

    Rectangle {
        id: titleRectangle
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 40
        Text {
//            anchors.centerIn: parent
            font.pixelSize: 36
            text: qsTr("Settings")
            color: "white"
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Grid {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        columns: 3
        rows: 4
        spacing: 20
        width: parent.width - 40

        Rectangle {
            width: parent.width / 6
            height: 50
            color: "transparent"
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("Background Music")
                font.pixelSize: 24
            }
        }

        Rectangle {
            width: parent.width / 6 * 4
            height: 50
            color: "transparent"
            GameSlider {
                id: bgSlider
                anchors.fill: parent
                style: settingStyle
                minimumValue: 0
                maximumValue: 100
                stepSize: 1
                value: balloonScene.bgmVolume
                onValueChanged: {
                    sliderUpdate = true
                    bgValue = Math.round(value)
                    bgText.text = bgValue
                    balloonScene.bgmVolume = bgValue
                    console.log("bg_Slider: ", bgText.text)
                    sliderUpdate = false
                }
            }
        }

        Rectangle {
            width: parent.width / 6 - 40
            height: 50
            color: "transparent"
            radius: 3
            TextInput {
                id: bgText
                font.pixelSize: 24
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                Component.onCompleted: {
                    text = bgValue
                }
            }
        }

        Rectangle {
            width: parent.width / 6
            height: 50
            color: "transparent"
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("Sound Effects")
                font.pixelSize: 24
            }
        }

        Rectangle {
            width: parent.width / 6 * 4
            height: 50
            color: "transparent"
            GameSlider {
                id: seSlider
                anchors.fill: parent
                style: settingStyle
                minimumValue: 0
                maximumValue: 100
                stepSize: 1
                value: balloonScene.seVolume
                onValueChanged: {
                    sliderUpdate = true
                    seValue = Math.round(value)
                    seText.text = seValue
                    balloonScene.seVolume = seValue
                    console.log("se_Slider: ", seText.text)
                    sliderUpdate = false
                }
            }
        }

        Rectangle {
            width: parent.width / 6 - 40
            height: 50
            color: "transparent"
            radius: 3
            TextInput {
                id: seText
//                text: balloonScene.seVolume*100
                font.pixelSize: 24
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                Component.onCompleted: {
                    text = seValue
                }
            }
        }

        Rectangle {
            width: parent.width / 6
            height: 50
            color: "transparent"
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("Balloon Speed")
                font.pixelSize: 24
            }
        }

        Rectangle {
            width: parent.width / 6 * 4
            height: 50
            color: "transparent"
            GameSlider {
                id: bsSlider
                anchors.fill: parent
                style: settingStyle
                minimumValue: 1
                maximumValue: 10
                stepSize: 1
                value: balloonScene.balloonGravity
                onValueChanged: {
                    sliderUpdate = true
                    bsValue = Math.round(value)
                    bsText.text = bsValue
                    balloonScene.balloonGravity = bsValue
                    console.log("bs_Slider: ", bsText.text)
                    sliderUpdate = false
                }
            }
        }

        Rectangle {
            width: parent.width / 6 - 40
            height: 50
            color: "transparent"
            radius: 3
            TextInput {
                id: bsText
                font.pixelSize: 24
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                Component.onCompleted: {
                    text = bsValue
                }
            }
        }
    }
    Image {
        id: settingBackButton
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        source: "../assets/img/editor-back.png"
        anchors.bottomMargin: 40

        MouseArea {
            anchors.fill: parent
            onClicked: {
                menuScenePressed()
            }
        }
    }


//    Column {
//        anchors.top: titleRectangle.bottom
////        anchors.left: parent.left
//        anchors.topMargin: 70
////        anchors.horizontalCenter: parent.horizontalCenter
//        spacing: 20
//        width: parent.width - 40

//        Item {
//            width: parent.width
//            height: 50
////            Text {
////                text: "bg"
////                width: parent.width/6
////            }
////        }
////    }

////            width: parent.width - 40
//            id: bgItem
////            anchors.horizontalCenter: parent.horizontalCenter
////            anchors.verticalCenter: parent.verticalCenter
////            anchors.left: parent.left
//            Text {
//                id: bgmText
////                anchors.right: bgSlider.left
//                anchors.left: bgItem.left
////                anchors.leftMargin: 30
//                anchors.rightMargin: 20
//                font.pixelSize: 24
//                text: qsTr("Background Music")
//                color: "white"

//            }
//            GameSlider {
//                id:bgSlider
//                anchors.left: bgmText.right
//                anchors.leftMargin: 20
////                anchors.centerIn: parent
//                style: settingStyle
//                minimumValue: 0
//                maximumValue: 100
//                stepSize: 1
//                onValueChanged: {
//                    sliderUpdate = true
//                    bgValue = Math.round(value)
//                    bgText.text = bgValue
//                    console.log("bg_Slider: ", bgText.text)
//                    sliderUpdate = false
//                }
//            }

//            Rectangle {
//                width: 30
//                height: parent.height
//                radius: 3
//                anchors.left: bgSlider.right
//                anchors.leftMargin: 20
//                TextInput {
//                    id: bgText
////                    selectByMouse: true
////                    onTextChanged: {
////                        if(!sliderUpdate) {
////                            bgSlider
////                        }
//                    Component.onCompleted: {
//                        text = bgValue
//                    }
//                }
//            }
//        }
//    }
////        Text {
////            font.pixelSize: 24
////            text: qsTr("Sound Effects")
////            color: "white"
////        }
////        Text {
////            font.pixelSize: 24
////            text: qsTr("Balloon Speed")
////            color: "white"
////        }
////    }


    Component { //sliderstyle
        id: settingStyle

        SliderStyle {
            handle: MultiResolutionImage {
                implicitHeight: 30
                implicitWidth: 30
                source: "../assets/slider-handle.png"
            }

            groove: MultiResolutionImage {
                implicitHeight: 28
                implicitWidth: 300
                source: "../assets/slider-background.png"
                Rectangle {
//                    z: -1
//                    anchors.verticalCenter: parent.verticalCenter
                    antialiasing: true
                    radius: 1
                }
            }
        }
    }
}
