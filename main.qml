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
GridLayout{
    anchors.fill: drawer

    Image{
        id: mainimg
        Layout.row: 0
        Layout.column: 0
        sourceSize.width: 100
               sourceSize.height: 100
        source: "qrc:/image/avatar.jpg"
Layout.margins: 5
        Layout.alignment: Qt.AlignCenter

        property bool rounded: true //вводим временую переменеую

        layer.enabled: rounded
        layer.effect: OpacityMask {
            maskSource: Item {
                width: mainimg.width
                height: mainimg.height
                Rectangle {
                    anchors.centerIn: parent
                    width: mainimg.adapt ? mainimg.width : Math.min(mainimg.width, mainimg.height)
                    height: mainimg.adapt ? mainimg.height : width
                    radius: Math.min(width, height)
                }
            }
        }
    }
    Label{
    text: "login"
    id: mylog
    Layout.row: 0
    Layout.column: 1
    Layout.margins: 5
    Layout.alignment: Qt.AlignCenter

    }



    Button{
        Layout.margins: 5
    Layout.row: 1
    Layout.column: 0
    Layout.columnSpan: 2
    text: "Публикации"
    onClicked: {
        swipeView.currentIndex = 0
        drawer.close()
    }
    background: Rectangle {
        implicitWidth: 100
        implicitHeight: 40
        opacity: enabled ? 1 : 0.3
        border.color: "white"
        border.width: 1
        radius: 2
    }
    }

    Button{
        Layout.margins: 5
    Layout.row: 2
    Layout.column: 0
    Layout.columnSpan: 2
    text: "Профиль"
    onClicked: {
        swipeView.currentIndex = 1
        drawer.close()
    }
    background: Rectangle {
        implicitWidth: 100
        implicitHeight: 40
        opacity: enabled ? 1 : 0.3
        border.color: "white"
        border.width: 1
        radius: 2
    }
    }

    Button{
        Layout.margins: 5
    Layout.row: 3
    Layout.column: 0
    Layout.columnSpan: 2
    text: "О программе"
    onClicked: {
        swipeView.currentIndex = 2
        drawer.close()
    }
    background: Rectangle {
        implicitWidth: 100
        implicitHeight: 40
        opacity: enabled ? 1 : 0.3
        border.color: "white"
        border.width: 1
        radius: 2
    }
    }


                }




            ScrollIndicator.vertical: ScrollIndicator { }
        }


    StackView {
        id: stackView
        anchors.fill: parent

        initialItem: Pane {
            id: pane
        }

    }

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

