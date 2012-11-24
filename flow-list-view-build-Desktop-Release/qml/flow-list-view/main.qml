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

Rectangle {
    id: win
    width: 200
    height: 700

    ListModel {
        id: myModel
        ListElement { foo: 1 }
        ListElement { foo: 1 }
        ListElement { foo: 2 }
        ListElement { foo: 1 }
        ListElement { foo: 3 }
        ListElement { foo: 3 }
        ListElement { foo: 1 }
        ListElement { foo: 2 }
        ListElement { foo: 2 }
        ListElement { foo: 3 }
        ListElement { foo: 3 }
        ListElement { foo: 3 }
        ListElement { foo: 1 }
        ListElement { foo: 2 }
        ListElement { foo: 3 }
        ListElement { foo: 1 }
        ListElement { foo: 3 }
        ListElement { foo: 1 }
        ListElement { foo: 1 }
    }


    FlowListView{
        id: flv
        model: myModel
        anchors{top: parent.top; left: parent.left; right: parent.right; bottom: btnRow.top}

        delegate: Item {
            width: win.width / foo
            height: 40

            Rectangle {
                id: rect
                anchors.fill: parent
                color: {
                    switch (foo) {
                        case 1:
                            "green"
                            break;
                        case 2:
                            "yellow"
                            break;
                        case 3:
                            "red"
                            break;
                    }
                }

                Text {
                    text: foo
                    anchors.centerIn: parent
                }

                Rectangle {
                    id: highlight
                    anchors.fill: parent
                    color: "gray"
                    opacity: flv.currentIndex === index ? 0.5 : 0
                }

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        flv.currentIndex = index
                    }
                }
            }
        }

        onCurrentItemChanged: {
            console.log(currentItem.foo)
        }
    }

    Row {
        id: btnRow
        anchors{left: parent.left; right: parent.right; bottom: parent.bottom}

        height: 40

        Rectangle {
            width: win.width / 4
            height: btnRow.height

            color: "green"

            Text {
                anchors.centerIn: parent
                text: "1"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: myModel.append({"foo": 1})
            }
        }

        Rectangle {
            width: win.width / 4
            height: btnRow.height

            color: "yellow"

            Text {
                anchors.centerIn: parent
                text: "2"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: myModel.append({"foo": 2})
            }
        }

        Rectangle {
            width: win.width / 4
            height: btnRow.height

            color: "red"

            Text {
                anchors.centerIn: parent
                text: "3"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: myModel.append({"foo": 3})
            }
        }

        Rectangle {
            width: win.width / 4
            height: btnRow.height

            color: "gray"

            Text {
                anchors.centerIn: parent
                text: "-"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: myModel.remove(flv.currentIndex)
            }
        }

    }
}
