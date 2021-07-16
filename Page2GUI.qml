import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Window 2.0
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.0
import QtMultimedia 5.12
import QtQuick.Dialogs 1.2

Page {
      id:page2GUI



property StackView stackView: StackView.view
    RowLayout{
          id: grid1
        anchors.fill:parent
//          anchors.margins: 10
         anchors.bottomMargin: 50

        Rectangle {

            Layout.row: 0
            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
            id: rect1
            Layout.fillWidth: true
            height: 30
            color: "#13acb4"


            Label {
//                  Layout.column: 0
//                  Layout.alignment: Qt.AlignCenter
                id: label1
//                  width: 74
//                  height: 13
                color: "#000000"
                text: qsTr("Профиль")
                anchors.horizontalCenter: rect1.horizontalCenter
                anchors.verticalCenter: rect1.verticalCenter
            }
            RoundButton {
                anchors.right: rect1.right
                id: back_button
                Image {
                    width: 25
                    height: 25
                    source:  "qrc:/image/back.png"

                }
                ColorOverlay { //цвет для картинки
                    anchors.fill: back_button // на весь слайдер
                    source: back_button//источник
                    color: "white"
                }
                flat: true
//                  onClicked: {
//                    swipeView.goBack()
//                  }
            }
        }

    }

    GridLayout{

        id: grid2
        anchors.fill: parent
        anchors.margins: 50

        Image{
            MouseArea {
            anchors.fill: parent
            Layout.fillWidth: true
            onClicked: fileDialoglab.open()
            FileDialog {
                    id: fileDialoglab
                    folder: "/Users/admin/Desktop"
                }
            }
            id: img
            Layout.row: 0
            Layout.column: 0
            Layout.columnSpan: 2
            Layout.fillHeight: true
            Layout.fillWidth: true
            source: "qrc:/image/avatar.jpg"
//                  Layout.margins: 5
            Layout.alignment: Qt.AlignCenter
            fillMode: Image.PreserveAspectFit //равномерное масштабирование изображения, чтобы соответствовать без обрезки

            property bool rounded: true //вводим временую переменеую

            layer.enabled: rounded
            layer.effect: OpacityMask {
                maskSource: Item {
                    width: img.width
                    height: img.height
                    Rectangle {
                        anchors.centerIn: parent
                        width: img.adapt ? img.width : Math.min(img.width, img.height)
                        height: img.adapt ? img.height : width
                        radius: Math.min(width, height)
                    }
                }
            }
        }


        Label{
            Layout.row: 1
            Layout.column: 0
            text: "Задайте логин"
            Layout.alignment: Qt.AlignCenter
        }

        TextField{
            id: inputlogin
            Layout.row: 1
            Layout.column: 1
            Layout.alignment: Qt.AlignCenter
        }

        Button{
          id: enterlog
          text: "задать"
          Layout.row: 2
          Layout.column: 0
          Layout.columnSpan: 2
          Layout.alignment: Qt.AlignCenter
          onClicked: {
              lena.append({
                              "ava": img.source,
                              "login": inputlogin.text,
                          });

          }
        }


    }

}
