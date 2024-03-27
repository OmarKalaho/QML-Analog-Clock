import QtQuick 2.15

Item {
    id:id_root
    Rectangle {
        //time values
        property var currentDate: new Date()
        property int hours: currentDate.getHours()
        property int minutes: currentDate.getMinutes()
        property int seconds: currentDate.getSeconds()
        //updated time values every second
        Timer{
            id: timer
            repeat: true
            interval: 1000
            running: true

            onTriggered: id_plate.currentDate = new Date()
        }

        // clock circle
        id: id_plate
        height: 450
        width: 450
        radius:width/2
        color: "black"
        border.color: "darkgrey"
        border.width: 4

// marks of the hours in the clock
        Repeater{
            model:12
         Item{
            id: hoursContainer
            property int hour: index
            height: id_plate.height/2
            transformOrigin: Item.Bottom
            rotation: index * 30
            x: id_plate.width/2
            y:0

         Rectangle{
             height:id_plate.height*0.04
             width:height/2
             // radius:width/2
             color:"white"
             anchors.horizontalCenter: parent.horizontalCenter
             anchors.top: parent.top
             anchors.topMargin: 4
            }
         Text{
             anchors{
                 horizontalCenter: parent.horizantalCenter
             }
             x:0
             y:id_plate.height*0.06
             rotation: 360 - index * 30
             text: hoursContainer.hour == 0 ? "12" : hoursContainer.hour
             font.pixelSize: id_plate.height*0.1
             font.family: "Comic Sans MS"
            }
         }

       }



// middle dot in the clock
        Rectangle{
            id: id_center
            anchors.centerIn: parent
            height: id_plate.height * 0.04
            width: height
            radius: width/2
            color: "white"
        }


        SecondNeedle{
            anchors{
                top:id_plate.top
                bottom:id_plate.bottom
                horizontalCenter: parent.horizontalCenter
            }
            value:id_plate.seconds
        }


        MinuteNeedle{
            anchors{
                top:id_plate.top
                bottom:id_plate.bottom
                horizontalCenter: parent.horizontalCenter
            }
            value:id_plate.minutes
        }

        HourNeedle{
            anchors{
                top:id_plate.top
                bottom:id_plate.bottom
                horizontalCenter: parent.horizontalCenter
            }
            value:id_plate.hours
            valueminute: id_plate.hours
        }


    }
}
