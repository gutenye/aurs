ttf-mac, a Archlinux package of Mac OS X TrueType fonts
--------------------------------------------------

|    |                                                |
|----|------------------------------------------------|
|AUR | https://aur.archlinux.org/packages.php?ID=62850|

It doesn't include following fonts

	LastResort.ttf
	Apple Symbols.ttf
	Apple Color Emoji.ttf
	AppleGothic.ttf

Install
-------

Please consult Apple license before using fonts.

You can acquire fonts from Mac OS X.

On the installed Mac OS X fonts are located in 
	
	/System/Library/Fonts

Copy all `*.dfont`, `*.ttf` fonts into source directory, and start to build.

	$ makepkg -s 
	$ pacman -U ttf-mac-*.pkg.tar.xz
