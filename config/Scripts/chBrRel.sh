#!/bin/bash

#path dealing with screen brightness stuff
path='/sys/class/backlight/intel_backlight'
#echo $path

#percent brightness increase is declared in first command line arg
declare -i percentBright=$1
#echo "${path}/brightness"

#path of max brightness value
declare -i maxBrightness=$(cat "${path}/max_brightness")
#echo $maxBrightness

#path of brightness changer value
brightPath="${path}/brightness"
#echo $brightPath

declare -i brOffset=$maxBrightness*$percentBright/100
declare -i currBright=$(cat $brightPath)
declare -i brVal=brOffset+currBright
#echo $newBrightness
echo $brVal

exec echo $brVal > $brightPath
