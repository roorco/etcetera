#!/bin/bash
# Default acpi script that takes an entry for all actions

case "$1" in
	button/power)
		case "$2" in
			PBTN|PWRF)
				logger 'PowerButton pressed'
				;;
			*)
				logger "ACPI action undefined: $2"
				;;
		esac
		;;
	button/sleep)
		case "$2" in
			SLPB|SBTN)
				logger 'SleepButton pressed'
				;;
			*)
				logger "ACPI action undefined: $2"
				;;
		esac
		;;
	ac_adapter)
		case "$2" in
			AC*|AD*)
				case "$4" in
					00000000)
		echo -n 50 > /sys/class/backlight/acpi_video0/brightness
						;;
					00000001)
		echo -n 100 > /sys/class/backlight/acpi_video0/brightness
						;;
				esac
				;;
			*)
				logger "ACPI action undefined: $2"
				;;
		esac
		;;
	battery)
		case "$2" in
			BAT0)
				case "$4" in
					00000000)
						logger 'Battery online'
						;;
					00000001)
						logger 'Battery offline'
						;;
				esac
				;;
			CPU0)
				;;
			*)  logger "ACPI action undefined: $2" ;;
		esac
		;;
	button/lid)
		case $3 in
			close)
				#echo "LID switched!">/dev/tty5
				/usr/bin/systemctl suspend &
				DISPLAY=:0.0 su -c - orco /usr/bin/slimlock
				;;

				# vim:set ts=4 sw=4 ft=sh et:
