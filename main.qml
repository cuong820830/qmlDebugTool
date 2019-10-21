import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

/*** giới thiệu công cụ debug/ tìm lỗi trong QML

  1./ console.log()/debug()/info()/warn()/error(): In thông tin ra console và application output
  2./ console.trace():tìm chuỗi sự kiện
  3./ console.assert(): kiểm tra input đúng sai, nếu sai trả lỗi ra console:
  4./ console.time("ten") - console.timeEnd("ten"): Đo thời gian giữa time() and timeEnd()
  5./ console.count() : đếm số lần một hàm/ sự kiện được gọi
  6./ dùng breakpoint trong debug mode của qt creatoreator

Bonus: format code trong Qt Creator => CTRL + I
  ****/
Window {
    id: root
    visible: true
    width: 640
    height: 480
    title: qsTr("Debug tools")

    function countThis(){
        console.count("đếm số lần hàm countThis được chạy")
        console.trace()
    }

    Column{
        anchors.fill: parent
        spacing: 10

        Button{
            id: consoleLogButton
            text: "console log,debug,infor,warn,error"
            width: parent.width
            onClicked: {
                console.log("log: Subcribe Điện Tử lụi")
                console.info("info: Subcribe Điện Tử lụi")
                console.warn("warn: Subcribe Điện Tử lụi")
                console.debug("debug: Subcribe Điện Tử lụi")
                console.error("error: Subcribe Điện Tử lụi")
            }
        }

        Button{
            id: consoleAssertWrongButton
            width: parent.width
            text: "console.assert"
            onClicked:
            {
                const x = 12
                console.assert(x===5, "sai rồi")
            }
        }

        Button{
            id: consoleTractButton
            text: "console.trace"
            width: parent.width
            onClicked:
            {
                root.countThis();
            }
        }

        Button{
            id: timeMeasuringButton
            width: parent.width
            text: "How long did you press the mouse?"

            onPressed: {
                console.time("measure")
            }
            onReleased: {
                console.timeEnd("measure")
            }
        }

        Button{
            id: countThisButton
            width: parent.width
            text:"Count this"

            onClicked: {
                root.countThis()
            }
        }


    }
}
