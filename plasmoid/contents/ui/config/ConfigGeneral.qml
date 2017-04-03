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
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1

Item {
    property alias cfg_showBackground: showBackground.checked
    property alias cfg_dateFontSize: dateFontSize.value
    property alias cfg_timeFontSize: timeFontSize.value
    property alias cfg_timeFormat: timeFormat.text
    property alias cfg_dateFormat: dateFormat.text
    
    GridLayout {
        columns: 2
        Layout.fillWidth: true;
        CheckBox {
            id: showBackground
            text: i18n('Show plasmoid background')
            Layout.columnSpan: 2
        }

        Label {
            text: i18n('Time font size ratio:')
        }

        SpinBox {
            id: timeFontSize
            minimumValue: 4
            maximumValue: 10
            decimals: 0
            stepSize: 1
        }
        
        Label {
            text: i18n('Date font size ratio:')
        }

        SpinBox {
            id: dateFontSize
            minimumValue: 4
            maximumValue: 10
            decimals: 0
            stepSize: 1
        }
        
        Label {
            text: i18n('Time format:')
            
        }
            
        TextField {
            id: timeFormat
            width: 200
        }
        
        Label {
            text: i18n('Date format:')
            
        }
            
        TextField {
            id: dateFormat
            width: 200
        }
    }
}
