import QtQuick 2.15
import SddmComponents 2.0

Rectangle {
  id: root
  width: 1920
  height: 1080
  color: "#050B18"

  property string currentUser: userModel.lastUser
  property bool loginFailed: false
  property int sessionIndex: {
    for (var i = 0; i < sessionModel.rowCount(); i++) {
      var name = (sessionModel.data(sessionModel.index(i, 0), Qt.DisplayRole) || "").toString()
      if (name.indexOf("uwsm") !== -1)
        return i
    }
    return sessionModel.lastIndex
  }

  Image {
    anchors.fill: parent
    source: "../../backgrounds/blue-lock-login.svg"
    fillMode: Image.PreserveAspectCrop
    smooth: true
  }

  Rectangle {
    anchors.fill: parent
    color: "#050B18"
    opacity: 0.2
  }

  Rectangle {
    width: parent.width * 0.42
    height: parent.height
    anchors.left: parent.left
    color: "#02040B"
    opacity: 0.86
  }

  Rectangle {
    width: 610
    height: 320
    radius: 24
    anchors.left: parent.left
    anchors.leftMargin: 160
    anchors.verticalCenter: parent.verticalCenter
    color: "#0B1630"
    opacity: 0.88
    border.width: 2
    border.color: loginFailed ? "#FF4D4D" : "#197DFF"

    Rectangle {
      anchors.fill: parent
      anchors.margins: 1
      radius: 23
      color: "#0B1630"
      opacity: 0.55
      border.width: 1
      border.color: "#65D9FF"
    }

    Column {
      anchors.fill: parent
      anchors.margins: 28
      spacing: 18

      Text {
        text: "BLUE LOCK FACILITY"
        color: "#F4F8FF"
        font.pixelSize: 34
        font.family: "Space Grotesk"
        font.bold: true
        letterSpacing: 5
      }

      Text {
        text: loginFailed ? "AUTHENTICATION FAILED" : "ENTER ACCESS CREDENTIALS"
        color: loginFailed ? "#FF7777" : "#9AB5D6"
        font.pixelSize: 18
        font.family: "Space Grotesk"
        letterSpacing: 4
      }

      Rectangle {
        width: parent.width
        height: 76
        radius: 18
        color: "#050B18"
        opacity: 0.9
        border.width: 1
        border.color: loginFailed ? "#FF4D4D" : "#197DFF"

        TextInput {
          id: password
          anchors.fill: parent
          anchors.leftMargin: 22
          anchors.rightMargin: 22
          verticalAlignment: TextInput.AlignVCenter
          echoMode: TextInput.Password
          font.family: "JetBrains Mono Nerd Font"
          font.pixelSize: 28
          font.letterSpacing: 4
          passwordCharacter: "\u2022"
          color: "#F4F8FF"
          selectionColor: "#123C7C"
          selectedTextColor: "#F4F8FF"
          cursorDelegate: Rectangle {
            width: 2
            radius: 1
            color: "#65D9FF"
          }
          focus: true

          onTextChanged: root.loginFailed = false

          Keys.onPressed: {
            if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
              sddm.login(root.currentUser, password.text, root.sessionIndex)
              event.accepted = true
            }
          }
        }
      }

      Row {
        spacing: 10

        Rectangle {
          width: 138
          height: 42
          radius: 12
          color: "#197DFF"
          opacity: 0.94

          Text {
            anchors.centerIn: parent
            text: "LOGIN"
            color: "#050B18"
            font.family: "Space Grotesk"
            font.pixelSize: 16
            font.bold: true
            letterSpacing: 4
          }
        }

        Rectangle {
          width: 168
          height: 42
          radius: 12
          color: "#0B1630"
          border.width: 1
          border.color: "#65D9FF"

          Text {
            anchors.centerIn: parent
            text: "SESSION: UWSM"
            color: "#F4F8FF"
            font.family: "Space Grotesk"
            font.pixelSize: 14
            letterSpacing: 2
          }
        }
      }
    }
  }

  Connections {
    target: sddm
    function onLoginFailed() {
      root.loginFailed = true
      password.text = ""
      password.focus = true
    }
    function onLoginSucceeded() {
      root.loginFailed = false
    }
  }

  Component.onCompleted: password.forceActiveFocus()
}
