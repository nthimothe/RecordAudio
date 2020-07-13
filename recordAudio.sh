#!/bin/bash
#(c) 2019 Nathan Thimothe

#Make sure homebrew is installed and sox is installed
#----------------------------------------------------------------------
#How To Install Homebrew:
#ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null
# brew install sox
#sox -d audioFileName.wav
#----------------------------------------------------------------------


date=`date "+%m.%d"`
timeOf=`date +"%I.%M %p"`

function createi { #or createi () { 
    #i, the number of letters that will be passed into SHA encryption 
    i=$RANDOM
    #random number between 0 and 999999
    i=$((i%=1000000))
}
 
#define fileName function
function defFN {
    fileName=`echo -n $1 | shasum -a 512`
}

#there are $i random (lowercase) letters to create fileName out of
function randLetters {
    #i letters
    str=""
    limit=$i
    for ((j =0; j< limit; j++)); do
	#get a random number
	ranNum=$RANDOM
	#mod that number by 25 so that it's between 1 and 24
	ranNum=$((ranNum%25))
	#add 97 to that number
	ranNum=$((ranNum+97))
	#turn that ASCII number value into a character (which must be lowercase as the program is now)
	str+=`printf "\x$(printf %x $ranNum)"`
    done
}

#truncate the dash, add .txt to the end, send it to dropbox in a text file
function package {   
    length=${#fileName}
    #we need to truncate that extra dash at the end
    fileName=${fileName:0:$length-3}
    #since all we need to put in the initiate txt file is the fileName's Name, i created a new variable for that
    fileNameName=$fileName
    #the actual file name must include the txt hence the following line:
    fileName+=.txt
    #fullDate wasn't updating with each iteration of the program...because it's in a function,
    #the variable is not being updated for some reason
    fullDate=`date +"%A, %b,%d, %Y %I:%M:%S %p"`
    printf "The filename needs to be ${fileNameName} \nCurrent Date & Time: ${fullDate}\n" > ~/Dropbox/initiate.txt
}
#make sure to create i before we run other functions
createi
#create the fileName variable out of random lowercase letters (letters --(SHA)>> $fileName)
defFN randLetters${i}
#format $fileName and send it to my Dropbox
package
while True ; do 
    #find the fileName in Downloads (via AirDrop) or DropBox (via adding to Dropbox)
    found=`mdfind -onlyin ~/Downloads ${fileName} && mdfind -onlyin ~/Dropbox ${fileName}`
    #we can start recording if we find that file!
    if [[ $found != "" ]]; then
	#since only one process can occur at a time, the script to look for the text file 	to end this program must be in a separate program
	# see killRecordAudio.sh
	sox -d ~/Dropbox/Recordings/"rec${i}|${date}|${timeOf}".wav
	#***It will only move on to the following commands if sox is terminated:
	createi
	#delete the path of the file that started the most recent recording aka $found
	rm ${found}
        #create new $fileName and $fileNameName variables
	defFN randLetters${i}
        #send it off to my dropbox so I can look for it!
	package
    fi
done
