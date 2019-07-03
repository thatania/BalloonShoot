import QtQuick 2.0
import Felgo 3.0
import QtQuick.Controls.Styles 1.2
import QtQuick.Controls 2.0

//Item {
//    id: slider

//    property alias sliderStyle:settingStyle
//    property int value;
//    Component {
//        id: settingStyle

//    Slider {
//        x: (parent.width - width) / 2
//        y: (parent.height - height) / 2
//        width: 600
//        height: 20
//        onValueChanged: {
//            console.log(value)
//        }
//        SliderStyle {
//            groove: m_Slider
//            handle: m_handle
//        }
//    }
//    }
//    Component {
//        id: m_Slider
//        Rectangle {
//            implicitHeight: 8
//            color: "gray"
//            radius: 8
//        }
//    }

//    Component {
//        id: m_handle
//        Rectangle {
//            anchors.centerIn: parent
//            color: control.pressed ? "white":"lightgray"
//            border.color: "gray"
//            border.width: 2
//            width: 34
//            height: 34
//            radius: 12
//        }
//    }

//        SliderStyle {
//            handle: MultiResolutionImage {
//                implicitHeight: 30
//                implicitWidth: 30
//                source: "../assets/slider-handle.png"
//            }

//            groove: MultiResolutionImage {
//                implicitHeight: 28
//                implicitWidth: 200
//                source: "../assets/slider-background.png"
//                Rectangle {
//                    z: -1
//                    anchors.verticalCenter: parent.verticalCenter
//                    antialiasing: true
//                    radius: 1
//                }
//            }
//        }
//    }
//}
