# Record Audio

Seamlessly begin recording from your laptop as long as you have an internet connection.

## Running The Program

### Setup
* Ensure that you are running MacOS or Linux or that your command line prompt supports the bash language.
* Ensure that you have [homebrew](https://brew.sh/) downloaded on your machine.
* Download and install the SOund eXchange or [sox](https://formulae.brew.sh/formula/sox) package using homebrew.
* In order to truly best use the program, configure your Dropbox to be in your home directory. This way, after the program finishes recording, you will be able to listen to the recording from whatever device you have that allows you to access your Dropbox.
* Download an app that allows you to export .txt files such as [Pretext](https://apps.apple.com/us/app/pretext/id1347707000)

### Executing the Script
* Execute startRec.sh with the following command `./startRec.sh`
* Navigate to your Dropbox on another device and there should be a file named "initiate.txt" with a unique string inside and the date and time corresponding to the most recent execution of the script.  Copy the unique text that follows the "The filename needs to be" and navigate to Pretext on your device. 
* Create a .txt file that has the unique string as its name (e.g. dc73496645248a219cd0a19d329d1394581d5e6625d24818dc7000fe820198899367624f3f6e8b675aa4749ead509056b0179936ec28fc2b0ceadb33d63076e3.txt). 
* AirDrop that text file to your laptop or place it in your Dropbox (NOT in a subdirectory! i.e. /Users/USER/Dropbox).
* Your laptop will begin the process of recording until it receieves a file named "stopRec.txt" either via AirDrop or Dropbox addition (again, not in a subdirectory).
* The recording will save to your dropbox in a directory named "Recordings". You can record from your laptop without interacting with your computer at all! 
* If you plan on using the program often, consider adding it to your list of jobs so that it runs on a regular basis!

Check out the screenshots to see what the process typically looks like and guide yourself through the process.

## Screenshots

![Program Start](https://github.com/nthimothe/RecordAudio/blob/master/Screenshots/programStart.png)

Navigate to your Dropbox on your mobile device and find the file initiate.txt, it should look lke this once you tap it.

![Initiate.txt](https://github.com/nthimothe/RecordAudio/blob/master/Screenshots/initiateInDropbox.JPG)

Navigate to Pretext and create a text with the name and send it to your laptop.

![Start File](https://github.com/nthimothe/RecordAudio/blob/master/Screenshots/pretext.JPG)

Your Terminal Window should then look like...

![Recording Start](https://github.com/nthimothe/RecordAudio/blob/master/Screenshots/startRecording.png)

which indicates that it has begun recording.

To end recording, navigate back to Pretext and send stopRec.txt to your laptop at which point your Terminal should look like

![Terminal Stop](https://github.com/nthimothe/RecordAudio/blob/master/Screenshots/terminalStop.png)

The recording should appear in your Dropbox...

![Rec In Dropbox](https://github.com/nthimothe/RecordAudio/blob/master/Screenshots/recordingPresent.jpeg)






