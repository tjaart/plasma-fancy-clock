import QtQuick 2.2
import org.kde.plasma.configuration

ConfigModel {
    ConfigCategory {
         name: i18n('General')
         icon: 'folder-favorites'
         source: 'config/ConfigGeneral.qml'
    }
}
