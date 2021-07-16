import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick 2.12

Page {
      id:page1GUI
      GridLayout{

          id: grid1
        anchors.fill:parent
  //          anchors.margins: 10
         anchors.bottomMargin: 50

         Label{

             Layout.row: 0
             Layout.column: 0
             text: "Экзаменационное задание"
             Layout.alignment: Qt.AlignCenter

         }

      }
}
