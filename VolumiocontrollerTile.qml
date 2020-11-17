//
// Volumio app by Oepi-Loepi
//

import QtQuick 2.1
import BasicUIControls 1.0
import qb.components 1.0

Tile {
	id: volumiocontrollerTile

	property bool dimState: screenStateController.dimmedColors

	Rectangle {
     		id: simplebutton
     		color: "transparent"
     		width: isNxt ? 285 : 220; height: isNxt ? 25 : 20
		
		radius: 4
     		Text{
         		id: buttonLabel
         		anchors.centerIn: parent
			font.pixelSize:  isNxt ? 20 : 16
			font.family: qfont.regular.name
			text: app.actRadio ? app.actualStation : "Volumio"
			font.bold: true
			color: !dimState? "black" : "white"
		}
		anchors {
			top: parent.top
			topMargin: 2
			horizontalCenter: parent.horizontalCenter	 		
		}
    		visible:  !dimState
	}


/////////////////////////radio station sessions start here

	Rectangle {
     		id: simplebutton7
     		color: "springgreen"
     		width: isNxt ? 66 : 53; height: isNxt ? 53 : 42 
		radius: 4    		     		
		Text{
			id: buttonLabel7
			anchors.centerIn: parent
			font.pixelSize:  isNxt ? 20 : 16
			font.family: qfont.regular.name
         	        text: app.radioStation1
     	}
		anchors {
			top: simplebutton.bottom
			topMargin: 3
			left: simplebutton.left	
		}
		MouseArea{
			id: buttonMouseArea7
			anchors.fill: parent 
			onClicked: {app.simpleSynchronous(app.volumioURL + "/api/v1/commands?cmd=playplaylist&name=1");}
		}
		visible: !dimState  && !app.showButtons && app.actRadio
	}

	Rectangle {
		id: simplebutton8
		color: "cyan"
		width: isNxt ? 66 : 53; height: isNxt ? 53 : 42 
		radius: 4    		     		
		Text{
			id: buttonLabel8
			anchors.centerIn: parent
			font.pixelSize:  isNxt ? 20 : 16
			font.family: qfont.regular.name
         	text: app.radioStation2
     	}
		anchors {
			top: simplebutton7.top
			left: simplebutton7.right
			leftMargin:  isNxt ? 6 : 4 		
		}

		MouseArea{
			id: buttonMouseArea8
			anchors.fill: parent 
			onClicked: {app.simpleSynchronous(app.volumioURL + "/api/v1/commands?cmd=playplaylist&name=2");}
		}
		visible: !dimState  && !app.showButtons && app.actRadio
	}

	Rectangle {
		id: simplebutton9
		color: "magenta"
		width: isNxt ? 66 : 53; height: isNxt ? 53 : 42 
		radius: 4    		     		
		Text{
			id: buttonLabel9
			anchors.centerIn: parent
			font.pixelSize:  isNxt ? 20 : 16
			font.family: qfont.regular.name
			text: app.radioStation3
		}
		anchors {
			top: simplebutton7.top
			right: simplebutton10.left
			rightMargin:  isNxt ? 6 : 4 		
		}

		MouseArea{
			id: buttonMouseArea9
			anchors.fill: parent 
			onClicked: {app.simpleSynchronous(app.volumioURL + "/api/v1/commands?cmd=playplaylist&name=3");}
		}
		visible: !dimState  && !app.showButtons && app.actRadio
	}

	Rectangle {
		id: simplebutton10
		color: "orange"
		width: isNxt ? 66 : 53; height: isNxt ? 53 : 42 
		radius: 4    		     		
		Text{
			id: buttonLabel10
			anchors.centerIn: parent
			font.pixelSize:  isNxt ? 20 : 16
			font.family: qfont.regular.name
         	text: app.radioStation4
     	}
		anchors {
			top: simplebutton7.top
			right: simplebutton.right 		
		}
		MouseArea{
			id: buttonMouseArea10
			anchors.fill: parent 
			onClicked: {app.simpleSynchronous(app.volumioURL + "/api/v1/commands?cmd=playplaylist&name=4");}
		}
		visible: !dimState  && !app.showButtons && app.actRadio
	}


///////////////////////////////// selectors sessions starts here
	Rectangle {
		id: simplebutton3
		color: "blue"
		width: isNxt ? 66 : 53; height: isNxt ? 53 : 42
		radius: 4    		
		Text{
			id: buttonLabel3
			anchors.centerIn: parent
			font.pixelSize:  isNxt ? 20 : 16
			font.family: qfont.regular.name
			text: "RADIO"
     		}
		anchors {
			top: simplebutton7.top
			left: simplebutton7.left
		}

    		MouseArea{
         		id: buttonMouseArea3
         		anchors.fill: parent 
         		onClicked: {app.actRadio=true;app.showButtons=false;}
     		}
    		visible: !dimState && app.showButtons
	}

	Rectangle {
		id: simplebutton4
		color: "green"
		width: isNxt ? 66 : 53; height: isNxt ? 53 : 42
		radius: 4    		     		
		Text{
			id: buttonLabel4
			anchors.centerIn: parent
			font.pixelSize:  isNxt ? 20 : 16
			font.family: qfont.regular.name
			text: "TV"
     		}
		anchors {
			top: simplebutton8.top
			left: simplebutton8.left
		
		}

    		MouseArea{
         		id: buttonMouseArea4
         		anchors.fill: parent 
         		onClicked: {app.simpleSynchronous(app.volumioURL + "/api/v1/commands/?cmd=tracktype&tracktype=tv");app.showButtons=false}
     		}
    		visible: false
	}

	Rectangle {
		id: simplebutton5
		color: "magenta"
		width: isNxt ? 66 : 53; height: isNxt ? 53 : 42
		radius: 4    		     		
		Text{
			id: buttonLabel5
			anchors.centerIn: parent
			font.pixelSize:  isNxt ? 20 : 16
			font.family: qfont.regular.name
         	text: "MP3"
     		}
		anchors {
			top: simplebutton9.top
			left: simplebutton9.left
 		
		}

    		MouseArea{
         		id: buttonMouseArea5
         		anchors.fill: parent 
         		onClicked: {app.simpleSynchronous(app.volumioURL + "/api/v1/commands/?cmd=tracktype&tracktype=mp3");app.showButtons=false}
     		}
    		visible: false
	}

	Rectangle {
		id: simplebutton6
		color: "cyan"
		width: isNxt ? 66 : 53; height: isNxt ? 53 : 42
		radius: 4    		     		
		Text{
			id: buttonLabel6
			anchors.centerIn: parent
			font.pixelSize:  isNxt ? 20 : 16
			font.family: qfont.regular.name
         	text: "BT"
     		}
		anchors {
			top: simplebutton10.top
			left: simplebutton10.left		
		}

    		MouseArea{
         		id: buttonMouseArea6
         		anchors.fill: parent 
         		onClicked: {app.simpleSynchronous(app.volumioURL + "/api/v1/commands/?cmd=tracktype&tracktype=bluetooth");app.showButtons=false}
     		}
    		visible: false
	}



	Rectangle {
		id: simplebutton61
		color: "grey"
		//width: isNxt ? 66 : 53; height: isNxt ? 53 : 42 
		width: isNxt ? 66 : 53; height: isNxt ? 33 : 26
		radius: 4    		     		
		Text{
			id: buttonLabel61
			anchors.centerIn: parent
			font.pixelSize:  isNxt ? 20 : 16
			font.family: qfont.regular.name
         		text: "<>"
     		}
		anchors {
			top: simplebutton10.bottom
			topMargin : isNxt ? 27 : 21
			left: simplebutton10.left
		}
    		MouseArea{
         		id: buttonMouseArea61
         		anchors.fill: parent 
         		onClicked: {app.showButtons = true;}
     		}
    		visible: !dimState  && !app.showButtons
	}

///////////////////////////////// titles session starts here

	Rectangle {
     		id: itemText
     		color: "transparent"
		width: isNxt ? 200 : 160; height: isNxt ? 53 : 42
		Text{
         		id: iText
         		width: parent.width
			font.pixelSize: ((app.actualTitleLong||!dimState) && !isNxt)? 12 : 22
			wrapMode: Text.WordWrap
         		text: app.actualArtist
			font.family: qfont.regular.name
			font.bold: true
			color: !dimState? "black" : "white"
     		}
		anchors {
			top: simplebutton.bottom
			topMargin: 2
			left: simplebutton.left		
		}
    		visible:  (app.enableSleep||!dimState) && !app.actRadio  && !app.showButtons
	}

	Rectangle {
     		id: titleText
     		color: "transparent"
		width: isNxt ? 200 : 160; height: isNxt ? 53 : 42
		Text{
         		id: tText
         		width: parent.width
			font.pixelSize: ((app.actualTitleLong||!dimState) && !isNxt)? 12 : 22 
			wrapMode: Text.WordWrap
         		text: app.actualTitle
			font.family: qfont.regular.name
			font.bold: true
			color: !dimState? "black" : "white"
     		}
		anchors {
			top: itemText.bottom
			topMargin: 2
			left: simplebutton.left		
		}
    		visible: app.enableSleep||!dimState

	}

////////////////	//volume control session start here, first you'll find the first button.
	IconButton {
		id: volumeDown
		anchors {
			bottom: parent.bottom
			bottomMargin: 5
			left: simplebutton.left 		
		}

		iconSource: "qrc:/tsc/volume_down_small.png"
		onClicked: {
			app.simpleSynchronous(app.volumioURL + "/api/v1/commands/?cmd=volume&volume=minus");
		}
		visible: !dimState 
	}


	IconButton {
		id: prevButton
		anchors {
			left: volumeDown.right
			leftMargin:  isNxt ? 3 : 2 
			bottom: parent.bottom
			bottomMargin: 5
		}

		iconSource: "qrc:/tsc/left.png"
		onClicked: {
			app.simpleSynchronous(app.volumioURL + "/api/v1/commands/?cmd=prev");
		}
		visible:  !dimState && !app.actRadio	
	}

	IconButton {
		id: playButton
		anchors {
			left: prevButton.right
			leftMargin:  isNxt ? 3 : 2 
			bottom: parent.bottom
			bottomMargin: 5
		}

		iconSource: !app.actPause ? "qrc:/tsc/pause.png" :  "qrc:/tsc/play.png"
		onClicked: {
			app.actPause ? app.simpleSynchronous(app.volumioURL + "/api/v1/commands/?cmd=play") : app.simpleSynchronous(app.volumioURL + "/api/v1/commands/?cmd=pause")
		}
		visible: !dimState	
	}

	IconButton {
		id: shuffleOnButton
		anchors {
			left: playButton.right
			leftMargin:  isNxt ? 3 : 2 
			bottom: parent.bottom
			bottomMargin: 5
		}

		iconSource: "qrc:/tsc/shuffle.png"
		onClicked: {
			app.shuffleButtonVisible = false;
			app.shuffleOnButtonVisible = false;
			app.simpleSynchronous(app.volumioURL + "/api/v1/commands/?cmd=random");
		}
		visible: !dimState && !app.actRadio		
	}

	IconButton {
		id: nextButton
		anchors {
			left: shuffleOnButton.right
			leftMargin:  isNxt ? 3 : 2 
			bottom: parent.bottom
			bottomMargin: 5

		}

		iconSource: "qrc:/tsc/right.png"
		onClicked: {
			app.simpleSynchronous(app.volumioURL + "/api/v1/commands/?cmd=next");
		}
		visible: !dimState && !app.actRadio	
	}	
	
	IconButton {
		id: volumeUp
		anchors {
			left: nextButton.right
			leftMargin: isNxt ? 3 : 2
			bottom: parent.bottom
			bottomMargin: 5
		}

		iconSource: "qrc:/tsc/volume_up_small.png"
		onClicked: {
			app.simpleSynchronous(app.volumioURL + "/api/v1/commands/?cmd=volume&volume=plus");		
		}
		visible: !dimState
	}


	Rectangle {
     		id: simplebutton11
     		color: "red"
     		//width: isNxt ? 66 : 53; height: isNxt ? 53 : 42 
		width: isNxt ? 66 : 53; height: isNxt ? 33 : 26 

		radius: 4    		     		
		Text{
         		id: buttonLabel11
         		anchors.centerIn: parent
			font.pixelSize:  isNxt ? 20 : 16
			font.family: qfont.regular.name
         		text: "Set"
     		}
		anchors {
			bottom: simplebutton61.bottom
			left: simplebutton61.left		
		}

    		MouseArea{
         		id: buttonMouseArea11
         		anchors.fill: parent 
         		onClicked: {stage.openFullscreen(app.volumiocontrollerConfigScreenUrl);}
     		}
    		visible: !dimState  && app.showButtons 
	}
}
