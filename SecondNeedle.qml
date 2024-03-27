import QtQuick 2.15

Item {
    id:id_root
    property int value: 0
    property int granularity: 60
    property real centerX : (width / 2);
    property real centerY : (height / 2);
    Rectangle{
        id: rect
        width:2
        height:id_root.height * 0.5
        color: "red"
        anchors {
            horizontalCenter: id_root.horizantalCenter

        }
        antialiasing: true
        y: id_root.height * 0.05
        transformOrigin: Item.Bottom
        MouseArea {
                     anchors.fill: parent
                     drag.target: parent
                     drag.axis: Drag.XAndYAxis
                     onPositionChanged:(mouse) => {
                                             var point =  mapToItem (id_root, mouse.x, mouse.y);
                                             var diffX = (point.x - id_root.centerX);
                                             var diffY = -1 * (point.y - id_root.centerY);
                                             var rad = Math.atan (diffY / diffX);
                                             var deg = (rad * 180 / Math.PI);
                                             if (diffX > 0 && diffY > 0) {
                                                 rect.rotation = 90 - Math.abs (deg);
                                             }
                                             else if (diffX > 0 && diffY < 0) {
                                                 rect.rotation = 90 + Math.abs (deg);
                                             }
                                             else if (diffX < 0 && diffY > 0) {
                                                 rect.rotation = 270 + Math.abs (deg);
                                             }
                                             else if (diffX < 0 && diffY < 0) {
                                                 rect.rotation = 270 - Math.abs (deg);
                                             }
                                           rect.x = id_root.centerX - rect.width / 2;
                                           rect.y = id_root.centerY - rect.height;


        }

    }
    }
 rotation: 360/granularity * (value % granularity)
 antialiasing: true
}

