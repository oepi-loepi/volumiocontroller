//
// Volumio v1.0.0 by Oepi-Loepi
//

import QtQuick 2.1
import qb.components 1.0
import qb.base 1.0;
import ScreenStateController 1.0
import FileIO 1.0

App {
	id: volumiocontrollerApp

	property url tileUrl : "VolumiocontrollerTile.qml"
	property url thumbnailIcon: "qrc:/tsc/volumio.png"
	property url volumiocontrollerConfigScreenUrl : "VolumiocontrollerConfigScreen.qml"

	property VolumiocontrollerConfigScreen volumiocontrollerConfigScreen

	property string actualArtist
	property string actualTitle
	property string actualStation

	property bool actualArtistLong : false
	property bool actualTitleLong : false
	property bool enableSleep : false
	property bool showButtons : false
	property bool actRadio : false
	property bool actMP3 : false
	property bool actPause : false

	property string volumioURL : "http://volumio.local"

	property string radioStation1 : "NL"
	property string radioStation2 : "538"
	property string radioStation3 : "Q"
	property string radioStation4 : "Sky"
	property string tmpSleep : "No"


	// user settings from config file
	property variant volumiocontrollerSettingsJson : {
		'volumioURL': "",
		'radioStation1': "",
		'radioStation2': "",
		'radioStation3': "",
		'radioStation4': "",

		'tmpSleep': ""
	}

	FileIO {
		id: volumiocontrollerSettingsFile
		source: "file:///mnt/data/tsc/volumiocontroller_userSettings.json"
 	}


	function init() {
		registry.registerWidget("tile", tileUrl, this, null, {thumbLabel: qsTr("Volumio"), thumbIcon: thumbnailIcon, thumbCategory: "general", thumbWeight: 30, baseTileWeight: 10, thumbIconVAlignment: "center"});
		registry.registerWidget("screen", volumiocontrollerConfigScreenUrl, this, "volumiocontrollerConfigScreen");
	}
	
	Connections {
		target: screenStateController
		onScreenStateChanged: {
			if (screenStateController.screenState == ScreenStateController.ScreenColorDimmed || screenStateController.screenState == ScreenStateController.ScreenOff) {
				volumiocontrollerTimerTimer.stop();
				volumiocontrollerTimer.interval = 10000;
				volumiocontrollerTimer.start();
			} else {
				volumiocontrollerTimer.stop();
				volumiocontrollerTimer.interval = 5000;
				volumiocontrollerTimer.start();
			}
		}
	}

/////////////////////////////


	function readVolumioState() {
	try {

		var xmlhttp4 = new XMLHttpRequest();
		xmlhttp4.onreadystatechange=function() {
			if (xmlhttp4.readyState == XMLHttpRequest.DONE) {
				if (xmlhttp4.status == 200) {
						var JsonString4 = xmlhttp4.responseText;
        					var JsonObject4= JSON.parse(JsonString4);

						actualTitle = JsonObject4.title;

						if (JsonObject4.trackType == "webradio") {
							actRadio = true;
							actualStation = JsonObject4.artist;
						} else {
							actRadio = false;
							actualStation = "";
						}

						if (JsonObject4.trackType == "mp3") {
							actMP3 = true;
							actualArtist = JsonObject4.artist;
							actStation = ""
						}else{
							actMP3 = false;
							actualArtist = "";
						}

						if ((JsonObject4.status == "pause")||(JsonObject4.status == "stop")) {
							actPause = true;
						} else {
							actPause = false;
						}
						
					 	if (actualTitle.length > 35) {
							actualTitleLong = true;
						}else{
							actualTitleLong = false;
						}

						if (actualArtist.length > 35) {
							actualArtistLong = true;
						}else{
							actualArtistLong = false;
						}

						if (actualStation.length > 27) {
							actualStation = actualStation.substring(0,24);
							actualStation += "..."	
						}
				}
			}
		}

		xmlhttp4.open("GET", volumioURL + "/api/v1/getState");
		xmlhttp4.send();

		} catch(e) {
		}


	}

	function simpleSynchronous(request) {
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.open("GET", request, true);
		xmlhttp.timeout = 1500;
		xmlhttp.send();
		xmlhttp.onreadystatechange=function() {
			if (xmlhttp.readyState == 4) {
				if (xmlhttp.status == 200) {
					if (typeof(functie) !== 'undefined') {
						functie(parameter);
					}
				}
			}
		}
	}
	
	Timer {
		id: volumiocontrollerTimer
		interval: 5000
		triggeredOnStart: true
		running: true
		repeat: true
		onTriggered: readVolumioState()
	}


	Component.onCompleted: {
		try {
			volumiocontrollerSettingsJson = JSON.parse(volumiocontrollerSettingsFile.read());
			if (volumiocontrollerSettingsJson['tmpSleep'] == "Yes") {
				enableSleep = true
			} else {
				enableSleep = false
			}

			volumioURL = volumiocontrollerSettingsJson['volumioURL'];
			radioStation1 = volumiocontrollerSettingsJson['radioStation1'];
			radioStation2 = volumiocontrollerSettingsJson['radioStation2'];
			radioStation3 = volumiocontrollerSettingsJson['radioStation3'];
			radioStation4 = volumiocontrollerSettingsJson['radioStation4'];
		
		} catch(e) {
		}
	}


	function saveSettings() {
		if (enableSleep == true) {
			tmpSleep = "Yes";
		} else {
			tmpSleep = "No";
		}

 		var setJson = {
			"volumioURL" : volumioURL,
			"radioStation1" : radioStation1,
			"radioStation2" : radioStation2,
			"radioStation3" : radioStation3,
			"radioStation4" : radioStation4,

			"tmpSleep" : tmpSleep
		}
  		var doc3 = new XMLHttpRequest();
   		doc3.open("PUT", "file:///mnt/data/tsc/volumiocontroller_userSettings.json");
   		doc3.send(JSON.stringify(setJson));
	}

}
