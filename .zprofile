if [ "$XDG_SESSION_DESKTOP" = "sway" ] ; then
	# to fix problems with screensharing
	export XDG_CURRENT_DESKTOP=sway

	# to fix dark theme in qt apps
	QT_QPA_PLATFORMTHEME=gnome

	# https://github.com/swaywm/sway/issues/595
	export _JAVA_AWT_WM_NONREPARENTING=1
fi
