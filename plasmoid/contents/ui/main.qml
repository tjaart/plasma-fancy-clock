import QtQuick 2.2
import QtQuick.Layouts 1.3
import org.kde.plasma.plasmoid 2.0
import QtQml 2.0

import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import QtGraphicalEffects 1.0

Item {
    id: root

    anchors.fill: parent
    Plasmoid.backgroundHints: "NoBackground";
    
    PlasmaCore.DataSource {
        id: dataSource
        engine: "time"
        connectedSources: ["Local"]
        interval: 500
    }
    
    ColumnLayout {
        PlasmaComponents.Label {
            //width: 300;
            //height: 20;
            //color: "#ffffff";
            text: Qt.formatTime(dataSource.data.Local.DateTime, "<b>HH</b>:mm:ss");
            font.pixelSize: 34;
            font.family: "Lato";
            font.bold: true
            id: timeLabel
        }
         
        PlasmaComponents.Label {
            //color: "#ffffff";
            font.pixelSize: 20;
            font.family: "Lato";
            text: Qt.formatDate(dataSource.data.Local.DateTime, "yy/MM/dd");
        }
    
    
     DropShadow {
        anchors.fill: timeLabel
        horizontalOffset: 3
        verticalOffset: 3
        radius: 8.0
        samples: 17
        color: "#80000000"
        source: timeLabel
    }
    }
    
    
    
     
}
