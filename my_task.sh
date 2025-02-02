#!/bin/bash
var=gistraining
welcome1() {
	echo -e "\n\nThis program is a work of Jagoum Richmond and Mbiti Louise Have fun\n\n\a"


}

welcome() {
echo -e "Hello Welcome to GIS STUDENT registration for the examms\n\a"
echo -e "Please Enter \n1 To include your name in the list\n2 To see the other students in the list\n3 To reset database \n4 To exit \n5 To select student for the exams\n6 to clear your screen.\a" 
read -p "Enter : " chioce
}
touch student.txt

touch selected.txt
select_student() {
	choosed=$(sort -R random.txt | head -1)
	existed=$(grep -w $choosed selected.txt)
	if [ "$choosed" != "$existed" ]; then
		echo "Mr/Mrs $choosed selected on $(date)" >> selected.txt
		nl selected.txt
        else
		echo -e " Mr/Mrs $existed has already been selected\a\n"
		grep "$existed" selected.txt
	fi


}
authen(){
	read -p "Please enter your name : " name1
	read -p "Hello Mr/Mrs $name1 are you an admin [y/n] : " ans
	if [ "$ans" = "y" ];then
		read -p "Password : " auth
		if [ "$auth" = "$var" ]; then
			echo " Authentication completed "
			select_student 

		fi
	fi
}
accept_student() {
	case $chioce in
		1)
			read -p "First and Last name : " name lastname
			echo "$name" >> random.txt
			read -p "Date Of Birth [DOB] : " dob
			read -p "Do you have a pass [passport/ID card/Driver liscense] ? [y/n] " pass
		if [ $name="" ]||[ $lastname="" ]||[ $dob -gt 2006 ]||[ $dob -lt 2000 ] ; then
			echo -e " Sorry But you must enter you firstname and your lastname\n\nAnd check your age is DOB is not lower than than 2000 or greater than 2006\n\n"
			exit ;
		else
			if [ "$pass" = "y" ]; then
				echo -e "Stuentname\t   Date of Birth\t   Pass\t   RegisteredOn\n\n"
				echo -e "$name\t $dob\t $pass\t $(date)" >> student.txt
				cat -n student.txt
			elif [ "$pass" = "n" ];then
				echo -e "Stuentname\t   Date of Birth\t   Pass\t   RegisteredOn\n\n"
				echo -e "$name**\t $dob\t $pass\t $(date)" >> student.txt
				cat -n student.txt
			else
				echo -e " Enter Either Yes or no [y/n] in the pass field\n"
				accept_student
			fi
		fi
		;;
		2)	
		#	nl student.txt
			echo -e "\a\nList of already registered sudent \n\n"
			 nl student.txt
		;;
		4)
			exit
		;;
		5)

			authen

		;;
		3)
			read -p "Enter the authentication password to reset the database : " auth
			if [ "$auth"  = "$var" ]; then
				rm student.txt random.txt selected.txt
				touch student.txt random.txt selected.txt
				echo -e "\a\n Reseted successfully\n"

			fi
		;;
		6)
			clear
		;;
		*)
			echo -e "\a\nSorry but you must enter atleast one of the options above\n"
		;;

esac
}
<<<<<<< HEAD
echo "This application is meant to help you register and selects students for the LPI examinations"
while true
do 
 read -p "Do you want to continue [y/n]: " yeah
=======
welcome1

while true
do
  read -p "Do you want to continue [y/n] : " yeah
>>>>>>> a69c081 ( added some modifications like option 6. and name validation)
 if [ "$yeah" = "y" ]; then
	welcome ; accept_student
elif [ "$yeah" = "n" ]; then

	echo "Thanks for using this app"
	exit 0
else
	echo -e "\n\nsorry but you must enter one of the above options\n\a"
 fi
done

			
	
	
