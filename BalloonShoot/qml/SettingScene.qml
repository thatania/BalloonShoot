import QtQuick 2.0
import Felgo 3.0
import QtQuick.Controls.Styles 1.2
//import QtQuick.Controls 2.0

SceneBase {
    id: settingScene

    property bool sliderUpdate: false
    property int bgValue: 0
//    property variant currentItemEditor: parent

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
            anchors.centerIn: parent
            font.pixelSize: 36
            text: qsTr("Settings")
            color: "blue"
        }
    }

    Column {
        anchors.top: titleRectangle.bottom
//        anchors.left: parent.left
        anchors.topMargin: 70
//        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 20
        width: parent.width - 40

        Item {
            width: parent.width
            height: 50
//            Text {
//                text: "bg"
//                width: parent.width/6
//            }
//        }
//    }

//            width: parent.width - 40
            id: bgItem
//            anchors.horizontalCenter: parent.horizontalCenter
//            anchors.verticalCenter: parent.verticalCenter
//            anchors.left: parent.left
            Text {
                id: bgmText
//                anchors.right: bgSlider.left
                anchors.left: bgItem.left
//                anchors.leftMargin: 30
                anchors.rightMargin: 20
                font.pixelSize: 24
                text: qsTr("Background Music")
                color: "white"

            }
            GameSlider {
                id:bgSlider
                anchors.left: bgmText.right
                anchors.leftMargin: 20
//                anchors.centerIn: parent
                style: settingStyle
                minimumValue: 0
                maximumValue: 100
                stepSize: 1
                onValueChanged: {
                    sliderUpdate = true
                    bgValue = Math.round(value)
                    bgText.text = bgValue
                    console.log("bg_Slider: ", bgText.text)
                    sliderUpdate = false
                }
            }

            Rectangle {
                width: 30
                height: parent.height
                radius: 3
                anchors.left: bgSlider.right
                anchors.leftMargin: 20
                TextInput {
                    id: bgText
//                    selectByMouse: true
//                    onTextChanged: {
//                        if(!sliderUpdate) {
//                            bgSlider
//                        }
                    Component.onCompleted: {
                        text = bgValue
                    }
                }
            }
        }
    }
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


    Component {
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
