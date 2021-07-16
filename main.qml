import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.0
import QtGraphicalEffects 1.12
import QtQuick.Controls.Material 2.12

ApplicationWindow {
    id: mainWindow
    width: 640
    height: 480
    visible: true
    title: qsTr("Petrenko_191-352")

    ListModel{
        id: lena
    }
    header : Rectangle {
    id: header
    color: "#2f2f2f"
    height: 50
//    anchors.fill: parent



    RoundButton {
        id: list_button
        anchors.left: header.left
        anchors.verticalCenter: header.verticalCenter

        Image {
            width: 45
            height: 45
            source:  "qrc:/image/list.png"

        }
        ColorOverlay { //цвет для картинки
            anchors.fill: list_button // на весь слайдер
            source: list_button//источник
            color: "white"
        }
        flat: true
        onClicked: {
            drawer.open()

        }
    }

    RoundButton {
        anchors.right: header.right
        id: set_button
        anchors.verticalCenter: header.verticalCenter

        Image {
            width: 45
            height: 45
            source:  "qrc:/image/settings.png"

        }
        ColorOverlay { //цвет для картинки
            anchors.fill: set_button // на весь слайдер
            source: set_button//источник
            color: "white"
        }
        flat: true
        onClicked: {
            drawer.open()

        }
    }

    }

    Drawer {
        id: drawer
        width: Math.min(mainWindow.width, mainWindow.height) / 3 * 2
        height: mainWindow.height
//        dragMargin: stackView.depth > 1 ? 0 : undefined

        ListView {
            id: listView

            focus: true
            currentIndex: -1
            anchors.fill: parent

            delegate: ItemDelegate {
                width: parent.width
                text: model.title
                highlighted: ListView.isCurrentItem
                onClicked: {
                    listView.currentIndex = index
                    stackView.push(model.source)
                    drawer.close()
                }
            }

            model: ListModel {
                ListElement { title: "Публикации"; source: "qrc:/Page1GUI.qml" }
                ListElement { title: "Профиль"; source: "qrc:/Page2GUI.qml" }
                ListElement { title: "О программе"; source: "qrc:/Page3GUI.qml" }
            }

            ScrollIndicator.vertical: ScrollIndicator { }
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent

        initialItem: Pane {
            id: pane
        }

    }

//    Loader{
//    id:loader
//    anchors.fill: parent
////    source: "qrc:/Page1GUI.qml"
//    }

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: listView.currentIndex

        Page1GUI {
        }

        Page2GUI {
        }
        Page3GUI {
        }
    }

    footer: Rectangle {
        id: foot1
        color: "#2f2f2f"
        height: 50
    }
}
