import QtQuick 2.7
import Ubuntu.Components.Themes 1.3
import Qt.labs.settings 1.0

Item {
    id: root

    /* save preferences in config file */
    Settings{
        id: settings
        category: "colors"
        property alias darkMode: root.darkMode
        property alias index:    root.currentIndex
    }

    property int currentIndex: 0
    property bool darkMode: true

    onCurrentIndexChanged: {
        if (currentIndex<0) {
            currentIndex = 0
        } else if (currentIndex>maxIndex) {
            currentIndex = maxIndex
        }
    }
    readonly property int maxIndex: headerColors.length-1

    readonly property int indexTheme: darkMode ? 0 : 1

    // the current colors
    readonly property color currentHeader:     headerColors[currentIndex][indexTheme]
    readonly property color currentBackground: backgroundColors[currentIndex][indexTheme]

    readonly property var headerColors:
        [["#000000","#ffffff"], // black and white
         ["#960334","#FB3778"], // 'magenta' gpick: hue: 340, saturation:  96%, lightness -20%/+10%
         ["#7C0396","#D937FB"], // 'purple'  gpick: hue: 290, saturation:  96%, lightness -20%/+10%
         ["#030396","#3737FB"], // 'blue'    gpick: hue: 240, saturation:  96%, lightness -20%/+10%
         ["#008585","#33FFFF"], // 'cyan'    gpick: hue: 180, saturation: 100%, lightness -24%/+10%
         ["#038203","#37FB37"], // 'green'   gpick: hue: 120, saturation:  96%, lightness -24%/+10%
         ["#787802","#FBFB37"], // 'yellow'  gpick: hue:  60, saturation:  96%, lightness -26%/+10%
         ["#964D03","#FB9937"]  // 'orange'  gpick: hue:  30, saturation:  96%, lightness -20%/+10%
        ]
    readonly property var backgroundColors:
        [["#000000","#ffffff"], // black and white
         ["#1E010A","#FEE1EB"], // 'magenta' gpick: hue: 340, saturation:  96%, lightness -44%/+44%
         ["#19011E","#F9E1FE"], // 'purple'  gpick: hue: 290, saturation:  96%, lightness -44%/+44%
         ["#01011E","#E1E1FE"], // 'blue'    gpick: hue: 240, saturation:  96%, lightness -44%/+44%
         ["#001F1F","#E0FFFF"], // 'cyan'    gpick: hue: 180, saturation: 100%, lightness -44%/+44%
         ["#011E01","#E1FEE1"], // 'green'   gpick: hue: 120, saturation:  96%, lightness -44%/+44%
         ["#1E1E01","#FEFEE1"], // 'yellow'  gpick: hue:  60, saturation:  96%, lightness -44%/+44%
         ["#1E0F01","#FEF0E1"]  // 'orange'  gpick: hue:  30, saturation:  96%, lightness -44%/+44%
        ]
}
