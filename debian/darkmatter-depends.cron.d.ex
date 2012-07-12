#
# Regular cron jobs for the darkmatter-depends package
#
0 4	* * *	root	[ -x /usr/bin/darkmatter-depends_maintenance ] && /usr/bin/darkmatter-depends_maintenance
