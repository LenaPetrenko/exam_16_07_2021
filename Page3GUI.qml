import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Window 2.0
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.0
import QtMultimedia 5.12

Page {
      id:page3GUI
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
                  text: qsTr("О программе")
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
                  onClicked: {

                     swipeView.currentIndex = 0
                  }
              }
          }

      }

      GridLayout{

        id: grid2
        anchors.fill: parent
        anchors.margins: 50


        Rectangle {
            Layout.column: 0
            Layout.row: 0
            Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
            id: rect2

            height: 25
            color: "#9ae0de"
            Layout.fillWidth: true

            Label {
                id: label2
                Layout.fillWidth: true
                height: 13
                color: "black"
                text: qsTr("Рабочий макет мобильного клиента блога - 1")
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
        }

        Rectangle {
            Layout.column: 0
            Layout.row: 1
            Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter

            height: 25
            color: "#9ae0de"
            Layout.fillWidth: true

            Label {
                id: label3
                Layout.fillWidth: true
                height: 13
                color: "black"
                text: qsTr("Разработка безопасных сетевых приложений")
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
        }



            Image {
                Layout.row: 2
                id: img1
                source: "qrc:/image/logo.png"
//                width: parent.width
//                height: parent.height
                anchors.horizontalCenter: parent.horizontalCenter
//                fillMode: Image.PreserveAspectFit
                smooth: true
            }

                    Rectangle {
                        Layout.column: 0
                        Layout.row: 3
                        Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter

                        height: 25
                        color: "#9ae0de"
                        Layout.fillWidth: true

                        Label {
                            id: label4
                            Layout.fillWidth: true
                            height: 13
                            color: "black"
                            text: qsTr("lena.petrenko.lena@yandex.ru")
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                        }
                    }


                    Rectangle {
                        Layout.column: 0
                        Layout.row: 4
                        Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter

                        height: 25
                        color: "#9ae0de"
                        Layout.fillWidth: true

                        Label {
                            id: label5
                            Layout.fillWidth: true
                            height: 13
                            color: "black"
                            text: '<html><style type="text/css"></style><a href="https://github.com/LenaPetrenko/exam_16_07_2021">https://github.com/LenaPetrenko/exam_16_07_2021</a></html>'
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            onLinkActivated: Qt.openUrlExternally(link)
                        }
                    }


      }
}
