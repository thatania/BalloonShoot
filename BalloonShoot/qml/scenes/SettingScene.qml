import QtQuick 2.0
import Felgo 3.0
import QtQuick.Controls.Styles 1.2
import QtQuick.Controls 2.0
import "../entities"

SceneBase {
    id: settingScene

    property bool sliderUpdate: false
    property int bgValue: 0 //bgmvolume
    property int seValue: 0 //sound effects volume
    property int bsValue: 0 //balloon speed
    property double csValue: 0 //create balloon speed

    width: screenWidth
    height: screenHeight

    signal menuScenePressed

    Image {//background
        source: "../../assets/img/setting.png"
        anchors.fill: gameWindowAnchorItem
    }

    Rectangle {
        id: titleRectangle
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 40
        Text {
//            anchors.centerIn: parent
            font.family: standardFont.name
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
        spacing: 40
        width: parent.width - 40

        Rectangle {
            width: parent.width / 6 + 20
            height: 50
            color: "transparent"
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("Background Music")
                font.family: standardFont.name
                font.pixelSize: 24
                color: "lightyellow"
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
            width: parent.width / 6 - 60
            height: 50
            color: "transparent"
            radius: 3
            Text {
                id: bgText
                font.family: standardFont.name
                font.pixelSize: 24
                color: "lightyellow"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                Component.onCompleted: {
                    text = bgValue
                }
            }
        }

        Rectangle {
            width: parent.width / 6 + 20
            height: 50
            color: "transparent"
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("Sound Effects")
                font.family: standardFont.name
                font.pixelSize: 24
                color: "lightyellow"
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
            width: parent.width / 6 - 60
            height: 50
            color: "transparent"
            radius: 3
            Text {
                id: seText
                font.family: standardFont.name
                font.pixelSize: 24
                color: "lightyellow"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                Component.onCompleted: {
                    text = seValue
                }
            }
        }

        Rectangle {
            width: parent.width / 6 + 20
            height: 50
            color: "transparent"
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("Balloon Speed")
                font.family: standardFont.name
                font.pixelSize: 24
                color: "lightyellow"
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
            width: parent.width / 6 - 60
            height: 50
            color: "transparent"
            radius: 3
            Text {
                id: bsText
                font.family: standardFont.name
                font.pixelSize: 24
                color: "lightyellow"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                Component.onCompleted: {
                    text = bsValue
                }
            }
        }

        Rectangle {
            width: parent.width / 6 + 20
            height: 50
            color: "transparent"
            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("Create Speed")
                font.family: standardFont.name
                font.pixelSize: 24
                color: "lightyellow"
            }
        }

        Rectangle {
            width: parent.width / 6 * 4
            height: 50
            color: "transparent"
            GameSlider {
                id: csSlider
                anchors.fill: parent
                style: settingStyle
                minimumValue: 0.1
                maximumValue: 10.0
                stepSize: 0.1
                value: balloonScene.balloonCreate
                onValueChanged: {
                    sliderUpdate = true
                    csValue = value
                    var i = csValue.toFixed(1)
                    csText.text = i
                    balloonScene.balloonCreate = csValue
                    console.log("cs_Slider: ", i)
                    sliderUpdate = false
                }
            }
        }

        Rectangle {
            width: parent.width / 6 - 60
            height: 50
            color: "transparent"
            radius: 3
            Text {
                id: csText
                font.family: standardFont.name
                font.pixelSize: 24
                color: "lightyellow"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                Component.onCompleted: {
                    text = csValue
                }
            }
        }

    }
    Image {
        id: settingBackButton
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        source: "../../assets/img/button-back.png"
        anchors.bottomMargin: 40

        MouseArea {
            anchors.fill: parent
            onClicked: {
                menuScenePressed()
            }
        }
    }



    Component { //sliderstyle
        id: settingStyle

        SliderStyle {
            handle: MultiResolutionImage {
                implicitHeight: 30
                implicitWidth: 30
                source: "../../assets/img/slider-handle.png"
            }

            groove: MultiResolutionImage {
                implicitHeight: 28
                implicitWidth: 300
                source: "../../assets/img/slider-background.png"
                Rectangle {
                    antialiasing: true
                    radius: 1
                }
            }
        }
    }
}
