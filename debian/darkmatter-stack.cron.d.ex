#
# Regular cron jobs for the darkmatter-stack package
#
0 4	* * *	root	[ -x /usr/bin/darkmatter-stack_maintenance ] && /usr/bin/darkmatter-stack_maintenance
