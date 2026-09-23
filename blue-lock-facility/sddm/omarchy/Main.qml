import QtQuick 2.15
import SddmComponents 2.0

Rectangle {
  id: root
  width: 1920
  height: 1080
  color: "#010A1E"

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
    color: "#010A1E"
    opacity: 0.14
  }

  // Facility side panel — brutalista
  Rectangle {
    width: parent.width * 0.44
    height: parent.height
    anchors.left: parent.left
    color: "#00030A"
    opacity: 0.88
    // borda neon direita
    Rectangle {
      width: 2
      height: parent.height
      anchors.right: parent.right
      color: "#0066FF"
      opacity: 0.55
    }
    Rectangle {
      width: 1
      height: parent.height
      anchors.right: parent.right
      anchors.rightMargin: 3
      color: "#00E5FF"
      opacity: 0.28
    }
  }

  Rectangle {
    width: 640
    height: 360
    radius: 24
    anchors.left: parent.left
    anchors.leftMargin: 150
    anchors.verticalCenter: parent.verticalCenter
    color: "#0A1E3D"
    opacity: 0.90
    border.width: 2
    border.color: loginFailed ? "#FF3B30" : "#0066FF"

    // inner glow
    Rectangle {
      anchors.fill: parent
      anchors.margins: 1
      radius: 23
      color: "transparent"
      border.width: 1
      border.color: loginFailed ? "#FF6B60" : "#00E5FF"
      opacity: 0.42
    }

    Column {
      anchors.fill: parent
      anchors.margins: 30
      spacing: 16

      Text {
        text: "BLUE LOCK"
        color: "#E6F0FF"
        font.pixelSize: 42
        font.family: "Space Grotesk"
        font.bold: true
        letterSpacing: 9
      }

      Text {
        text: "FACILITY FIVE  —  STRATUM 05"
        color: "#00E5FF"
        font.pixelSize: 12
        font.family: "Space Grotesk"
        font.bold: true
        letterSpacing: 5
      }

      Text {
        text: loginFailed ? "✖ AUTHENTICATION FAILED — EGO INSUFFICIENT" : "ENTER EGO CREDENTIALS"
        color: loginFailed ? "#FF6B60" : "#7AA0C8"
        font.pixelSize: 13
        font.family: "Space Grotesk"
        letterSpacing: 3
      }

      Rectangle {
        width: parent.width
        height: 72
        radius: 16
        color: "#010A1E"
        opacity: 0.92
        border.width: 1
        border.color: loginFailed ? "#FF3B30" : "#0066FF"

        TextInput {
          id: password
          anchors.fill: parent
          anchors.leftMargin: 22
          anchors.rightMargin: 22
          verticalAlignment: TextInput.AlignVCenter
          echoMode: TextInput.Password
          font.family: "JetBrains Mono Nerd Font"
          font.pixelSize: 26
          font.letterSpacing: 5
          passwordCharacter: "⬢"
          color: "#E6F0FF"
          selectionColor: "#0A2A6B"
          selectedTextColor: "#E6F0FF"
          cursorDelegate: Rectangle {
            width: 2
            radius: 1
            color: "#00E5FF"
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
          width: 148
          height: 44
          radius: 12
          color: loginFailed ? "#FF3B30" : "#0066FF"
          opacity: 0.96

          Text {
            anchors.centerIn: parent
            text: loginFailed ? "RETRY" : "DEVOUR"
            color: "#E6F0FF"
            font.family: "Space Grotesk"
            font.pixelSize: 15
            font.bold: true
            letterSpacing: 4
          }
        }

        Rectangle {
          width: 176
          height: 44
          radius: 12
          color: "#0A1E3D"
          border.width: 1
          border.color: "#00E5FF"
          opacity: 0.92

          Text {
            anchors.centerIn: parent
            text: "SESSION: UWSM"
            color: "#E6F0FF"
            font.family: "Space Grotesk"
            font.pixelSize: 13
            letterSpacing: 2
          }
        }
      }
    }
  }

  // Top bar — ego quote
  Text {
    anchors.top: parent.top
    anchors.topMargin: 28
    anchors.left: parent.left
    anchors.leftMargin: 150
    text: "ARE YOU AN EGOIST?  —  EGO JINPACHI"
    color: "#7AA0C8"
    font.family: "JetBrains Mono Nerd Font"
    font.pixelSize: 10
    letterSpacing: 4
    opacity: 0.72
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
