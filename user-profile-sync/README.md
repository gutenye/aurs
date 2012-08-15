user-profile-sync,  sync browser profiles to tmpfs.
==================================================

| Homepage:      |  https://github.com/GutenYe/user-profile-sync       |
|----------------|------------------------------------------------------       |
| Author:	       | Guten                                                 |
| License:       | MIT-LICENSE                                                |
| Issue Tracker: | https://github.com/GutenYe/user-profile-sync/issues |

Since the profile(s), browser cache, etc. are relocated into tmpfs, the corresponding onslaught of I/O associated with using the browser is also redirected from the physical disc to RAM, thus reducing wear to the physical disc and also greatly improving browser speed and responsiveness. The access time of RAM is on the order of nanoseconds while the access time of physical discs is on the order of milliseconds. This is a difference of six orders of magnitude or 1,000,000 times faster. 

**Support Browsers**: firefox, chromium, opera, midori

It based on [user-daemon-system](https://github.com/GutenYe/user-daemon-system).

Install
-------

	$ yaourt -S user-profile-sync-daemon-git

Chromium actually keeps its cache directory separate from its browser profile directory.

	$ chromium --disk-cache-dir=/tmp/cache/chromium/Default  # for Default profile

Sync all profiles every ten minutes.

	$ crontab -e   # optional
		*/10 * * * *  ~/etc/rc.d/profile-sync sync &> /dev/null

Put it into hibernate and suspend

	# /etc/pm/sleep.d/20-profile-sync.conf
		case $1 in
				hibernate|suspend) su <user> -c '~/etc/rc.d/profile-sync sync' ;;
		esac

see https://wiki.archlinux.org/index.php/Pm-utils#Creating_your_own_hooks

Note on Patches/Pull Requests
-----------------------------

1. Fork the project.
2. Make your feature addition or bug fix.
3. Add tests for it. This is important so I don't break it in a future version unintentionally.
4. Commit, do not mess with rakefile, version, or history. (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
5. Send me a pull request. Bonus points for topic branches.

Credits
-------

* profile-sync-daemon by graysky 
* [Contributors](https://github.com/GutenYe/user-profile-sync/contributors)

Resources
--------

* [profile-sync-daemon](https://bbs.archlinux.org/viewtopic.php?pid=1026974): sync brower profiles to tmpfs.
* [user-daemon-system](https://github.com/GutenYe/user-daemon-system): The missing daemon system for user.

Copyright
---------

(the MIT License)

Copyright (c) 2011 Guten

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
