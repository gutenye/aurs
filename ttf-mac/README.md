ttf-mac, a Archlinux package of Mac OS X TrueType fonts
--------------------------------------------------

|    |                                                |
|----|------------------------------------------------|
|AUR | https://aur.archlinux.org/packages.php?ID=62850|

It contains following fonts

	Apple Braille.ttf
	Apple Braille Outline 6 Dot.ttf
	Apple Braille Outline 8 Dot.ttf
	Apple Braille Pinpoint 6 Dot.ttf
	Apple Braille Pinpoint 8 Dot.ttf
	Courier.dfont
	Geeza Pro.ttf, Geeza Pro Bold.ttf
	Geneva.dfont
	Helvetica.dfont
	HelveticaNeue.dfont
	HelveticaNeueDeskUI.ttc
	Keyboard.ttf
	LucidaGrande.ttc
	MarkerFelt.ttc
	Menlo.ttc
	Monaco.dfont
	Symbol.ttf
	ThonburiBold.ttf
	Thonburi.ttf
	Times.dfont
	ZapfDingbats.ttf

without

	Apple Symbols.ttf
	Apple Color Emoji.ttf
	AppleGothic.ttf
	AquaKana.ttc
	LastResort.ttf
	STHeiti Light.ttc
	STHeiti Medium.ttc

Install
-------

Please consult Apple license before using fonts.

You can acquire fonts from Mac OS X.

On the installed Mac OS X fonts are located in 
	
	/System/Library/Fonts

Copy all `*.dfont`, `*.ttf`, `*.ttc` fonts into source directory, and start to build.  

Note: Directly cp theses fonts under Linux get zero size file.

	$ makepkg -s 
	$ pacman -U ttf-mac-*.pkg.tar.xz

Wow, It's too complex, it there a easy way? sure, you can find a download link at [here](https://github.com/GutenYe/aur/releases/download/ttf-mac/ttf-mac.tar.gz)
