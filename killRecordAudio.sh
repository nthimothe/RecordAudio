#!/bin/bash
#(c) 2019 Nathan Thimothe
 #This program is meant to stop recording audio when certain conditions are met by airdropping a text
 #file 'stopRec' to your computer or adding it to your Dropbox, as long as it exists in the 
 #home directory

 #clarifications:
 #   $stoprec is the actual string name of the textfile
 #   $stopRec is $stoprec's path, wherever that may be
 #   $stopRecNN is the new name for $stopRec after its contents have been turned into lowercase

function remove {
    rm $stopRec
}


while True; do
    #if I Airdrop stopRec or add it to my Dropbox, then it should stop rec
    #nowhere in this file can it directly say "s\t\o\p\R\e\c. txt" since the computer will be looking for that 
    #literal string
    stoprec="stopRec"
    stoprec+=.txt    
    stopRec=`mdfind -onlyin ~/Downloads $stoprec && mdfind -onlyin ~/Dropbox $stoprec`
    #if mdfind finds $stoprec then stop recording
    if [[ $stopRec != "" ]]; then
	killall "sox"
    #if the stopRec file says "kill" (IGNORE CASE), the program stops
	stopRecNN=$stopRec
	srLength=${#stopRec}
	stopRecNN=${stopRec:0:srLength-4}
	#since stopRecNN needs to be a different string, I added 14
	stopRecNN+=14.txt
	#(tr)anslate all upper case letters (A-Z) (in original path) to lowercase (a-z)(into temp path)
	#input and output cannot be the same name with tr command, so I have to create temp nam
	#aka stopRecNN	
	tr A-Z a-z < $stopRec > $stopRecNN
	#copy contents of temp path to original path, thereby rewriting it
	cp $stopRecNN $stopRec
	#remove temporary path
	rm $stopRecNN
	while read -r line; do
	    if [[ $line =~ "kill" ]]; then
		#I need to delete $stopRec before I kill all processes
		remove
		#absolute destruction of all processes
		killall ./startRec.sh
		killall sh
		exit 0
	    fi
	done < $stopRec
	#remove $stoprec, so that I can start recording again and still name
        #my file stopRec
	remove
    fi
done