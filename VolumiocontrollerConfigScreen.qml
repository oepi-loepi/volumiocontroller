import QtQuick 2.1
import qb.components 1.0
import BasicUIControls 1.0;

Screen {
	id: volumiocontrollerConfigScreen
	screenTitle: "Volumio Setup"

	function savevolumiocontrollerURL(text) {
		if (text) {
			app.volumioURL = text;
		}
	}

	function saveradioStation1(text) {
		if (text) {
			app.radioStation1 = text;
		}
	}

	function saveradioStation2(text) {
		if (text) {
			app.radioStation2 = text;
		}
	}

	function saveradioStation3(text) {
		if (text) {
			app.radioStation3 = text;
		}
	}

	function saveradioStation4(text) {
		if (text) {
			app.radioStation4 = text;
		}
	}


	onShown: {
		volumiocontrollerURL.inputText = app.volumioURL;
		radioStation1.inputText = app.radioStation1;
		radioStation2.inputText = app.radioStation2;
		radioStation3.inputText = app.radioStation3;
		radioStation4.inputText = app.radioStation4;
		enableSleepToggle.isSwitchedOn = app.enableSleep;
		addCustomTopRightButton("Save");
	}

	onCustomButtonClicked: {
		app.saveSettings();
		hide();
	}

	Text {
		id: myLabel
		text: "URL to Volumio (example: http://192.168.10.65   or http://volumio.local)"
		font.pixelSize:  isNxt ? 20 : 16
		font.family: qfont.regular.name

		anchors {
			left: parent.left
			top: parent.top			
			leftMargin: 20
			topMargin: 10
		}
	}

	EditTextLabel4421 {
		id: volumiocontrollerURL
		width: parent.width - 40
		height: 35
		leftTextAvailableWidth: 300
		leftText: "Volumio URL"

		anchors {
			left: myLabel.left
			top: myLabel.bottom
			topMargin: 10
		}

		onClicked: {
			qkeyboard.open("URL to Volumio", volumiocontrollerURL.inputText, savevolumiocontrollerURL)
		}
	}

	Text {
		id: myLabel22
		text: "Name (3 Letter, e.g. \"R10\"):"
		font.pixelSize:  isNxt ? 20 : 16
		font.family: qfont.regular.name

		anchors {
			left: myLabel.left
			top: volumiocontrollerURL.bottom
			topMargin: 30
		}
	}

	Text {
		id: myLabelr1
		text: "Name of station 1:"
		font.pixelSize:  isNxt ? 20 : 16
		font.family: qfont.regular.name

		anchors {
			left: myLabel.left
			top: myLabel22.bottom
			topMargin: 16
		}
	}

	EditTextLabel4421 {
		id: radioStation1
		width: 80
		height: 35
		leftTextAvailableWidth: 200

		anchors {
			left: myLabelr1.right
			leftMargin: 10
			top: myLabelr1.top
		}

		onClicked: {
			qkeyboard.open("Radiostation 1 Name (3 Letter)", radioStation1.inputText, saveradioStation1)
		}
	}

	Text {
		id: myLabelr2
		text: "Name of station 2:"
		font.pixelSize:  isNxt ? 20 : 16
		font.family: qfont.regular.name

		anchors {
			left: myLabel.left
			top: myLabelr1.bottom
			topMargin: 16
		}
	}

	EditTextLabel4421 {
		id: radioStation2
		width: 80
		height: 35
		leftTextAvailableWidth: 200

		anchors {
			left: myLabelr2.right
			leftMargin: 10
			top: myLabelr2.top
		}

		onClicked: {
			qkeyboard.open("Radiostation 2 Name (3 Letter)", radioStation2.inputText, saveradioStation2)
		}
	}

	Text {
		id: myLabelr3
		text: "Name of station 3:"
		font.pixelSize:  isNxt ? 20 : 16
		font.family: qfont.regular.name

		anchors {
			left: myLabel.left
			top: myLabelr2.bottom
			topMargin: 16
		}
	}

	EditTextLabel4421 {
		id: radioStation3
		width: 80
		height: 35
		leftTextAvailableWidth: 200

		anchors {
			left: myLabelr3.right
			leftMargin: 10
			top: myLabelr3.top
		}

		onClicked: {
			qkeyboard.open("Radiostation 3 Name (3 Letter)", radioStation3.inputText, saveradioStation3)
		}
	}

	Text {
		id: myLabelr4
		text: "Name of station 4:"
		font.pixelSize:  isNxt ? 20 : 16
		font.family: qfont.regular.name

		anchors {
			left: myLabel.left
			top: myLabelr3.bottom
			topMargin: 16
		}
	}

	EditTextLabel4421 {
		id: radioStation4
		width: 80
		height: 35
		leftTextAvailableWidth: 200

		anchors {
			left: myLabelr4.right
			leftMargin: 10
			top: myLabelr4.top
		}

		onClicked: {
			qkeyboard.open("Radiostation 4 Name (3 Letter)", radioStation4.inputText, saveradioStation4)
		}
	}

	Text {
		id: showInSleep
		width:  160
		text: "Show in Sleepmode"
		font.pixelSize:  isNxt ? 20 : 16
		font.family: qfont.regular.name

		anchors {
			left: myLabel.left
			top: myLabelr4.bottom
			topMargin: 30
		}
	}

	OnOffToggle {
		id: enableSleepToggle
		height:  30
		anchors.left: showInSleep.right
		anchors.leftMargin: isNxt ? 65 : 30
		anchors.top: showInSleep.top
		leftIsSwitchedOn: false
		onSelectedChangedByUser: {
			if (isSwitchedOn) {
				app.enableSleep = true;
			} else {
				app.enableSleep = false;
			}
		}
	}


}

