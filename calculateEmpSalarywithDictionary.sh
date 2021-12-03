#!/bin/bash -x

PRESENT=1;
PART_TIME=2;
PAY_PER_HOUR=20;
MAX_WORKING_DAY=20;
MAX_WORKING_HOUR=40;

function calculateWorkingHour() {
	case $1 in
		$PRESENT)
			empHr=8;
		;;

		$PART_TIME)
			empHr=4;
		;;

		*)
			empHr=0;
		;;
	esac;
	echo $empHr;
}

declare -A dailyWage;

totalWorkingHr=0;

day=0;
while [[ $day -lt $MAX_WORKING_DAY && $(($totalWorkingHr+4)) -lt $MAX_WORKING_HOUR ]]
do
	workingHour=$( calculateWorkingHour $((RANDOM%3)) );
	dailyWage["Day$day"]=$(( $workingHour * $PAY_PER_HOUR ));
	totalWorkingHr=$(($totalWorkingHr + $workingHour));
	((day++));
done

salary=$(($totalWorkingHr * $PAY_PER_HOUR));

echo "Emp Salary of month : $salary (Total Working Hour : $totalWorkingHr)"

#echo ${dailyWage[@]};


for d in ${!dailyWage[@]}
do
	echo "$d == ${dailyWage[$d]}"
done