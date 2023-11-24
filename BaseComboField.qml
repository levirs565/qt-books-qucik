import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Kelompok7.Perpus

ColumnLayout {
    property ComboFieldData field
    property var selectionModel
    property string displayRole

    Label {
        text : field.name
    }

    ComboBox {
        currentIndex: field.index
        onCurrentIndexChanged: field.index = currentIndex
        textRole: displayRole
        model: selectionModel
        editable: true
        Layout.fillWidth: true
    }

    Label {
        text: field.errorText
        color: Material.color(Material.Red)
        visible: !field.isValid
    }
}
