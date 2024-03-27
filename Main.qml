import QtQuick 2.15


Window{
    id:id_root
    visible:true
    height:500
    width:500
    color:"black"

Clock{
    id:clock
    height:450
    width:450
    anchors{
        horizontalCenter: parent.horizontalCenter
        verticalCenter: parent.verticalCenter
    }
   }
}
