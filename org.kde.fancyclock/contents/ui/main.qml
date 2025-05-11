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
import QtQuick 2.15
import QtQuick.Layouts 1.3
import QtQml 2.0

import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.plasmoid

import org.kde.plasma.components as PlasmaComponents
import Qt5Compat.GraphicalEffects
import org.kde.plasma.plasma5support as Plasma5Support
import QtQuick.Effects


PlasmoidItem {
    id: root
    
    property bool enableTimeDisplay: plasmoid.configuration.enableTimeDisplay
    property bool enableTimeShadow: plasmoid.configuration.enableTimeShadow
    property string timeFormat: plasmoid.configuration.timeFormat
    property int timeFontSize: plasmoid.configuration.timeFontSize
    property bool useSystemFontForTime: plasmoid.configuration.useSystemFontForTime
    property font textTimeFont: plasmoid.configuration.textTimeFont
    property bool useSystemColorForTime: plasmoid.configuration.useSystemColorForTime
    property string textTimeColor: plasmoid.configuration.textTimeColor
    property double timeLetterSpacing: plasmoid.configuration.timeLetterSpacing
    property double timeOpacity: plasmoid.configuration.timeOpacity / 100.0
    
    
    property bool enableDateDisplay: plasmoid.configuration.enableDateDisplay
    property bool enableDateShadow: plasmoid.configuration.enableDateShadow
    property string dateFormat: plasmoid.configuration.dateFormat
    property int dateFontSize: plasmoid.configuration.dateFontSize
    property bool useSystemFontForDate: plasmoid.configuration.useSystemFontForDate
    property font textDateFont: plasmoid.configuration.textDateFont
    property bool useSystemColorForDate: plasmoid.configuration.useSystemColorForDate
    property string textDateColor: plasmoid.configuration.textDateColor
    property string dateLetterSpacing: plasmoid.configuration.dateLetterSpacing
    property double dateOpacity: plasmoid.configuration.dateOpacity / 100.0
    
    property int widgetWidth: width
    
     Plasmoid.backgroundHints: PlasmaCore.Types.NoBackground
    
    Plasma5Support.DataSource {
        id: dataSource
        engine: "time"
        connectedSources: ["Local"]
        interval: 500
    }
    
    ColumnLayout {
        id: columns
        spacing: 10;
        width: root.width;
        
        PlasmaComponents.Label {
            id: timeLabel
            visible: root.enableTimeDisplay;
            //text: Qt.formatTime(dataSource.data.Local.DateTime, timeFormat, Qt.SystemLocaleShortDate);
            text: Qt.locale().toString(dataSource.data.Local.DateTime, timeFormat)
            font.pixelSize: root.widgetWidth / timeFontSize;
            font.family: root.useSystemFontForTime ? theme.defaultFont.family : textTimeFont.family;
            font.italic: root.useSystemFontForTime ? theme.defaultFont.italic : textTimeFont.italic;
            font.weight: root.useSystemFontForTime ? theme.defaultFont.weight : textTimeFont.weight;
            font.letterSpacing: root.timeLetterSpacing;
            opacity: root.timeOpacity;
            
            color: root.useSystemColorForTime ? PlasmaCore.ColorScope.textColor : textTimeColor;
            
            Layout.alignment: root.columns.horizontalCenter;
        }
         
        PlasmaComponents.Label {
            id: dateLabel

            visible: root.enableDateDisplay;
            //text: Qt.formatDate(dataSource.data.Local.DateTime, dateFormat, Qt.SystemLocaleShortDate);
            text: Qt.locale().toString(dataSource.data.Local.DateTime, dateFormat)
            renderType: Text.QtRendering
            font.pixelSize: root.widgetWidth / dateFontSize;
            font.family: root.useSystemFontForDate ? theme.defaultFont.family : textDateFont.family;
            font.italic: root.useSystemFontForDate ? theme.defaultFont.italic : textDateFont.italic;
            font.weight: root.useSystemFontForDate ? theme.defaultFont.weight : textDateFont.weight;
            font.letterSpacing: root.dateLetterSpacing;
            opacity: root.dateOpacity
            
            color: root.useSystemColorForDate ? PlasmaCore.ColorScope.textColor : textDateColor;
            
            Layout.alignment: root.columns.horizontalCenter;
            
        }
        // MultiEffect {
        //     source: timeLabel
        //     anchors.fill: timeLabel
        //     saturation: -1.0
        //     shadowEnabled: enableTimeShadow
        //     autoPaddingEnabled: true
        //     shadowBlur: 0.4
        //     shadowColor: "#80000000"
        //     shadowOpacity: timeOpacity
        //     shadowVerticalOffset: 3
        //     shadowHorizontalOffset: 3
        // }

        DropShadow {
            anchors.fill: timeLabel
            horizontalOffset: 3
            verticalOffset: 3
            radius: 8.0
            samples: 17
            color: "#80000000"
            source: timeLabel
            visible: enableTimeDisplay && enableTimeShadow
            opacity: timeOpacity;
        }
    
        DropShadow {
            anchors.fill: dateLabel
            horizontalOffset: 3
            verticalOffset: 3
            radius: 8.0
            samples: 17
            color: "#80000000"
            source: dateLabel
            visible: enableDateDisplay && enableDateShadow
            opacity: dateOpacity
        }
        
    }
     
}
