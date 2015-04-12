#!/bin/bash
echo "Enter the URL of the coursera course"
read course
while true;
 do
	
	echo "Enter the choice you want to download"
	echo "1. Lecture Videos"
	echo "2. Lecture Videos with subtitles"
	echo "3. PDF's"
	echo "4. PPT's"
	read ch

	

	arr=(dummy .mp4 .srt .pdf .ppt)
	ext=${arr[${ch}]}
	#echo $ext

	content=$(wget "$course"  -O -)

	for word in $content
		do
			if [[ sed"$word" == *"${ext}"* ]]
			then 
				
				SUBSTRING=`echo $word| cut -d'"' -f 2`
				wget "$SUBSTRING";
				


			fi
	    done
	if [[ "$ch" == 2 ]]
				then 
					
				for word in $content
				do
					if [[ sed"$word" == *.mp4* ]]
					then 
			
						SUBSTRING=`echo $word| cut -d'"' -f 2`
						wget "$SUBSTRING";
					fi	
				done		
	fi

done
