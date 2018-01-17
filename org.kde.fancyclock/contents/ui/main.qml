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
    
    property bool showBackground: plasmoid.configuration.showBackground
    
    property string timeFormat: plasmoid.configuration.timeFormat
    property int timeFontSize: plasmoid.configuration.timeFontSize
    property bool useSystemFontForTime: plasmoid.configuration.useSystemFontForTime
    property font textTimeFont: plasmoid.configuration.textTimeFont
    property bool useSystemColorForTime: plasmoid.configuration.useSystemColorForTime
    property string textTimeColor: plasmoid.configuration.textTimeColor
    
    property string dateFormat: plasmoid.configuration.dateFormat
    property int dateFontSize: plasmoid.configuration.dateFontSize
    property bool useSystemFontForDate: plasmoid.configuration.useSystemFontForDate
    property font textDateFont: plasmoid.configuration.textDateFont
    property bool useSystemColorForDate: plasmoid.configuration.useSystemColorForDate
    property string textDateColor: plasmoid.configuration.textDateColor
    
    property int widgetWidth: width
    
    Plasmoid.backgroundHints: showBackground ? "StandardBackground" : "NoBackground";
    
    PlasmaCore.DataSource {
        id: dataSource
        engine: "time"
        connectedSources: ["Local"]
        interval: 500
    }
    
    ColumnLayout {
        id: columns
        spacing: 0;
        width: root.width;
        
        PlasmaComponents.Label {
            id: timeLabel
            text: Qt.formatTime(dataSource.data.Local.DateTime, timeFormat);
            
            font.pixelSize: widgetWidth / timeFontSize;
            font.family: useSystemFontForTime ? theme.defaultFont.family : textTimeFont.family;
            font.italic: useSystemFontForTime ? theme.defaultFont.italic : textTimeFont.italic;
            font.weight: useSystemFontForTime ? theme.defaultFont.weight : textTimeFont.weight;
            
            color: useSystemColorForTime ? PlasmaCore.ColorScope.textColor : textTimeColor;
            
            anchors.horizontalCenter: columns.horizontalCenter;
        }
         
        PlasmaComponents.Label {
            id: dateLabel
            text: Qt.formatDate(dataSource.data.Local.DateTime, dateFormat);
            
            font.pixelSize: widgetWidth / dateFontSize;
            font.family: useSystemFontForTime ? theme.defaultFont.family : textDateFont.family;
            font.italic: useSystemFontForTime ? theme.defaultFont.italic : textDateFont.italic;
            font.weight: useSystemFontForTime ? theme.defaultFont.weight : textDateFont.weight;
            
            
            color: useSystemColorForDate ? PlasmaCore.ColorScope.textColor : textDateColor;
            
            anchors.horizontalCenter: columns.horizontalCenter;
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
