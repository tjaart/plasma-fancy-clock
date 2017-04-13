/*
 * Copyright 2017  Tjaart Blignaut <tjaartblig@gmail.com>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http: //www.gnu.org/licenses/>.
 */
import QtQuick 2.2
import QtQuick.Layouts 1.3
import org.kde.plasma.plasmoid 2.0
import QtQml 2.0

import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import QtGraphicalEffects 1.0

Item {
    id: root

    Layout.fillWidth: true;
    Layout.fillHeight: true;
    
    property bool showBackground: plasmoid.configuration.showBackground
    
    property string timeFormat: plasmoid.configuration.timeFormat
    property int timeFontSize: plasmoid.configuration.timeFontSize
    property bool useSystemFontForTime: plasmoid.configuration.useSystemFontForTime
    property string textTimeFontFamily: plasmoid.configuration.textTimeFontFamily
    property bool useSystemColorForTime: plasmoid.configuration.useSystemColorForTime
    property string textTimeColor: plasmoid.configuration.textTimeColor
    
    property string dateFormat: plasmoid.configuration.dateFormat
    property int dateFontSize: plasmoid.configuration.dateFontSize
    property bool useSystemFontForDate: plasmoid.configuration.useSystemFontForDate
    property string textDateFontFamily: plasmoid.configuration.textDateFontFamily
    property bool useSystemColorForDate: plasmoid.configuration.useSystemColorForDate
    property string textDateColor: plasmoid.configuration.textDateColor
    
    
    property int widgetWidth: width
    
    anchors.fill: parent
    anchors.margins: 5
    Layout.minimumHeight: columns.height
    Plasmoid.backgroundHints: showBackground ? "StandardBackground" : "NoBackground";
    
    PlasmaCore.DataSource {
        id: dataSource
        engine: "time"
        connectedSources: ["Local"]
        interval: 500
    }
    
    ColumnLayout {
        
        id: columns
        
        
        Layout.fillWidth: true;
        Layout.fillHeight: true;
        
        PlasmaComponents.Label {
            id: defaultLabel
            visible: false;
            anchors.horizontalCenter: parent.horizontalCenter
        }
        
        PlasmaComponents.Label {
            id: timeLabel
            text: Qt.formatTime(dataSource.data.Local.DateTime, timeFormat);
            font.pixelSize: widgetWidth / timeFontSize;
            font.family: useSystemFontForTime ? defaultLabel.font.family : textTimeFontFamily;
            font.bold: true
            color: useSystemColorForTime ? defaultLabel.color : textTimeColor;
            anchors.horizontalCenter: defaultLabel.horizontalCenter
        }
         
        PlasmaComponents.Label {
            id: dateLabel
            font.pixelSize: widgetWidth / dateFontSize;
            text: Qt.formatDate(dataSource.data.Local.DateTime, dateFormat);
            color: useSystemColorForDate ? defaultLabel.color : textDateColor;
            font.family: useSystemFontForDate ? defaultLabel.font.family : textDateFontFamily;
            anchors.horizontalCenter: defaultLabel.horizontalCenter
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
    
        DropShadow {
            anchors.fill: dateLabel
            horizontalOffset: 3
            verticalOffset: 3
            radius: 8.0
            samples: 17
            color: "#80000000"
            source: dateLabel
        }
    }
     
}
