/*
  UmlSimpleStateDelegate.qml

  This file is part of the KDAB State Machine Editor Library.

  Copyright (C) 2014 Klarälvdalens Datakonsult AB, a KDAB Group company, info@kdab.com.
  All rights reserved.
  Author: Kevin Funk <kevin.funk@kdab.com>

  Licensees holding valid commercial KDAB State Machine Editor Library
  licenses may use this file in accordance with the KDAB State Machine Editor
  Library License Agreement provided with the Software.

  This file may be distributed and/or modified under the terms of the
  GNU Lesser General Public License version 2.1 as published by the
  Free Software Foundation and appearing in the file LICENSE.LGPL.txt included.

  This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING THE
  WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.

  Contact info@kdab.com if any conditions of this licensing are not
  clear to you.
*/

import QtQuick 2.0

import "qrc:///kdsme/qml/util/"
import "qrc:///kdsme/qml/util/theme.js" as Theme

Rectangle {
    id: root

    anchors.fill: parent

    color: Theme.stateBackgroundColor
    readonly property color activeBorderColor: Theme.stateBorderColor_Active // only needed to force type conversion to a color object
    border.color: Qt.tint(Theme.stateBorderColor, Qt.rgba(activeBorderColor.r, activeBorderColor.g, activeBorderColor.b, activeness))
    border.width: (activeness > 0 ? 2 : 1)
    radius: width*0.2

    Text {
        anchors.centerIn: parent

        text: control.name
        color: Theme.stateLabelFontColor
        elide: Text.ElideRight
    }

    ChannelizedDropArea {
        id: dropArea
        anchors.fill: parent
        keys: ["StateType", "TransitionType", "external"]
        item: control.item
    }

    states: [
        State {
            when: dropArea.containsDrag
            PropertyChanges {
                target: root
                color: "#DDDDDD"
            }
        }
    ]

}