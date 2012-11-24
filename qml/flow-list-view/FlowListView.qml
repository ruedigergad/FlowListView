/*
 *  Copyright 2012 Ruediger Gad
 *
 *  This file is part of FlowListView.
 *
 *  FlowListView is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU Lesser General Public License (LGPL)
 *  as published by the Free Software Foundation, either version 3 of the
 *  License, or (at your option) any later version.
 *
 *  FlowListView is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU Lesser General Public License
 *  along with FlowListView.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

import QtQuick 1.1

Flickable {
    id: flowListView
    anchors.fill: parent

    contentWidth: parent.width;
    contentHeight: flow.childrenRect.height

    property alias count: repeater.count
    property int currentIndex: -1
    property variant currentItem;
    property alias delegate: repeater.delegate
    property alias flow: flow.flow
    property alias model: repeater.model

    onCurrentIndexChanged: {
        currentItem = model.get(currentIndex)
    }

    Flow {
        id: flow
        width: parent.width

        Repeater {
            id: repeater

            onCountChanged: {
                if (flowListView.currentIndex === -1 && count > 0) {
                    flowListView.currentIndex = 0
                }
                if (flowListView.currentIndex >= count) {
                    flowListView.currentIndex = count - 1
                }
            }
        }
    }
}
