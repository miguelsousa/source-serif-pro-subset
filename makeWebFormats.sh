#!/usr/bin/env sh

styles_web=(black bold extralight light regular semibold blackitalic bolditalic extralightitalic lightitalic italic semibolditalic)

# generate all the fonts
doWebFormats.sh subset

function move_and_rename {
	# move the EOTs
	mv subset/EOT/sourceserifpro-$1-webfont.eot subset/sourceserifpro-$1-webfont.eot

	# move & rename the WOFF(2)s
	mv subset/WOFF/TTF/sourceserifpro-$1-webfont.ttf.woff subset/sourceserifpro-$1-webfont.woff
	mv subset/WOFF2/TTF/sourceserifpro-$1-webfont.ttf.woff2 subset/sourceserifpro-$1-webfont.woff2
}

for s in ${styles_web[@]}
do
	move_and_rename $s
done

# delete directories
rmdir subset/EOT
rm -rf subset/WOFF*
