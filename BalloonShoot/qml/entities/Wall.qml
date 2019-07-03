import QtQuick 2.0
import Felgo 3.0
import "../scenes"

EntityBase {
    entityType: "wall"

    width: 1
    height: 1

    BoxCollider {
        anchors.fill: parent
        bodyType: Body.Static
    }
}
