for svg in ../img/*.svg; do
    inkscape ${svg} --export-ps=/io/img/`basename ${svg/svg/ps}`
done
