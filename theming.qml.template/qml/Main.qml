/*
 * Copyright (C) 2020  Matthias Dahlmanns
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * theming.qml.template is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.7
import Ubuntu.Components 1.3
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0

MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'theming.qml.template.matdahl'
    automaticOrientation: true

    width: units.gu(45)
    height: units.gu(75)

    /* the object storing all color informations */
    Colors{
        id: colors
        currentIndex: settings.colorIndex
        darkMode:  settings.darkMode
        onCurrentIndexChanged: settings.colorIndex = currentIndex
    }

    /* save preferences in config file */
    Settings{
        id: settings
        property bool darkMode:  true
        property int colorIndex: 0
    }

    // decide whether to use dark (Suru Dark) or light (Ambiance) theme
    theme.name: settings.darkMode ? "Ubuntu.Components.Themes.SuruDark" : "Ubuntu.Components.Themes.Ambiance"

    Page {
        anchors.fill: parent

        header: PageHeader {
            id: header
            title: i18n.tr('TEMPLATE: Theming in QML')

            // set the background color of the header to the current color
            StyleHints{backgroundColor: colors.currentHeader}
        }

        // the bachground in the current background color
        Rectangle{
            id: background
            anchors.fill: parent
            color: colors.currentBackground
        }

        Column{
            id: col
            anchors.top: header.bottom
            width: parent.width
            SettingsEntrySwitch{
                id: darkModeSwitch
                text: i18n.tr("Dark Mode")
                onCheckedChanged: settings.darkMode = checked
                Component.onCompleted: checked = settings.darkMode
            }
            SettingsEntryColorSelector{
                id: colorSelector
                text: i18n.tr("Color")
                model: colors.headerColors
                currentSelectedColor: colors.currentIndex
                onCurrentSelectedColorChanged: colors.currentIndex = currentSelectedColor
            }
        }

        Label {
            anchors.centerIn: parent
            text: i18n.tr('This is a template to demonstrate<br>how to include theming to an QML app.')
        }
    }
}
