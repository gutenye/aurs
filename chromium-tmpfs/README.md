chromium-tmpfs, sync Chromium profile to tmpfs
================================================

| Homepage:      |  https://github.com/GutenYe/chromium-tmpfs       |
|----------------|------------------------------------------------------       |
| Author:	       | Guten Ye                                                 |
| License:       | MIT-LICENSE                                                |
| Issue Tracker: | https://github.com/GutenYe/chromium-tmpfs/issues |

Overview
--------

For Arch Linux. 

Usage
-----

Normal use

	$ sudo rc.d start chromium-tmpfs # move profiles to tmpfs
	$ sudo rc.d stop chromium-tmpfs  # sync profiles to your disk
	$ sudo rc.d restart chromium-tmpfs # stop and start
	$ sudo rc.d save chromium-tmpfs  # sync your profile to your disk, but do not stop using tmpfs

Put it into startup

	# /etc/rc.conf
		DAEMONS=(... @chromium-tmpfs ...)

Put it into crontab

	$ sudo crontabe -e
		# every 15 minutes
		15 * * * * /etc/rc.d/chromium-tmpfs save

Put it into hibernate and suspend

	# /etc/pm/sleep.d/20-tmpfs.conf
		#!/bin/bash
		case $1 in
				hibernate|suspend)
						/etc/rc.d/chromium-tmpfs save
						;;
		esac

see https://wiki.archlinux.org/index.php/Pm-utils#Creating_your_own_hooks

Install
----------

	# install chromium-tmpfs from AUR 
	pacaur -S chromium-tmpfs

Contributing
-------------

* Feel free to join the project and make contributions (by submitting a pull request)
* Submit any bugs/features/ideas to issue tracker

Credits
--------

* [Contributors](https://github.com/GutenYe/chromium-tmpfs/contributors)

Resources
---------

* [firefox-tmpfs-daemon](https://bbs.archlinux.org/viewtopic.php?id=118576) sync firefox profiles to tmpfs

Copyright
---------

(the MIT License)

Copyright (c) 2011 Guten Ye

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
