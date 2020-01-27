#!/bin/bash
cd "$HOME/managebac"
mapfile -t a < raw

# Colors
RESET=$(echo -en '\033[0m')
RED=$(echo -en '\033[00;31m')
BLUE=$(echo -en '\033[00;34m')

# Setting Variables
Monday=("${a[0]}" "${a[1]}" "${a[2]}" "${a[3]}")
Tuesday=("${a[4]}" "${a[5]}" "${a[6]}" "${a[7]}")
Wednesday=("${a[8]}" "${a[9]}" "${a[10]}" "${a[11]}")
Thursday=("${a[12]}" "${a[13]}" "${a[14]}" "${a[15]}")
Friday=("${a[16]}" "${a[17]}" "${a[18]}" "${a[19]}")

function Day() {
    for (( i = 0; i < 4; i++ ))
    do
        case $date in
            Monday)
            echo ${Monday[$i]}
                ;;
            Tuesday)
            echo ${Tuesday[$i]}
                ;;
            Wednesday)
            echo ${Wednesday[$i]}
                ;;
            Thursday)
            echo ${Thursday[$i]}
                ;;
            Friday)
            echo ${Friday[$i]} 
                ;;
        esac
    done
    echo
}

function Today() {
    #Prints today's timetable
    echo ${BLUE}Today\'s Classes are:${RESET} 
    date=`date +"%A"`
    Day
}

function Tomorrow() {
    echo ${BLUE}Tomorrow\'s Classes are:${RESET} 
    date=`date -d tomorrow +"%A"`
    Day
}

function Yesterday() {
    echo ${BLUE}Yesterday\'s Classes are:${RESET} 
    date=`date -d tomorrow +"%A"`
    Day
}

function Date() {
    num=${OPTARG}
    date=`date --date="$num day" +"%A"`
    echo ${BLUE}`date --date="$num day" +"%A"` \($num\) Days Later\'s Classes are:${RESET} 
    Day
}

__ScriptVersion="1.0"
function usage ()
{
    echo "Usage :  $0 [options]

    Options:
    -h|help       Display this message
    -v|version    Display script version
    -n|now        Display today's classes
    -t|tomorrow   Display tomorrow's classes
    -y|yesterday  Display yesterday's classes
    -d|date       Display classes in +days (example ./timetable.sh -d +10)
    "
}

#-----------------------------------------------------------------------
#  Handle command line arguments
#-----------------------------------------------------------------------

while getopts ":hvntyd:" opt
do
  case $opt in

    h|help      )  usage; exit 0   ;;

    v|version   )  echo "$0 -- Version $__ScriptVersion"; exit 0   ;;

    n|now       )  Today;;

    t|tomorrow  )  Tomorrow;;

    y|yesterday )  Yesterday;;

    d|date      )  Date;;

    * )  echo -e "\n  Option does not exist : $OPTARG\n"
          usage; exit 1   ;;

  esac    # --- end of case ---
done
shift $(($OPTIND-1))
