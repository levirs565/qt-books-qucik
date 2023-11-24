import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Kelompok7.Perpus

Item {
    Layout.fillHeight: true
    Layout.fillWidth: true

    property BukuViewModel currentViewModel

    signal addClicked()

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 16
        anchors.bottomMargin: 64 + 16 + 16

        GridLayout {
            columns: 2
            rowSpacing: 0

            Label {
                text: "Kategori"
            }

            Label {
                text: "Penerbit"
            }

            ComboBox {
                model: currentViewModel.kategoriFilterModel
                valueRole: "kode"
                textRole: "jenis"
                editable: true
                currentIndex: 0
                onCurrentValueChanged: currentViewModel.kategoriFilter = currentValue
                Layout.fillWidth: true
                Layout.maximumWidth: 200
            }

            ComboBox {
                model: currentViewModel.penerbitFilterModel
                valueRole: "kode"
                textRole: "name"
                editable: true
                currentIndex: 0
                onCurrentValueChanged: currentViewModel.penerbitFilter = currentValue
                Layout.fillWidth: true
                Layout.maximumWidth: 200
            }
        }

        BukuListView {
            Layout.fillHeight: true
            Layout.fillWidth: true
            id: listView
            onCurrentIndexChanged: currentViewModel.setSelectedIndex(currentIndex)
            model: currentViewModel.listModel
            highlightedText: currentViewModel.textQuery
        }
    }

    FloatingActionButton {
        onClicked: addClicked()
    }
}
