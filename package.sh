POPPLER_VERSION=21.08.0
POPPLER_DATA_URL="https://poppler.freedesktop.org/poppler-data-0.4.10.tar.gz"

set -e 
set -o pipefail

mkdir "poppler-$POPPLER_VERSION"
cd "poppler-$POPPLER_VERSION" || exit

cp -a "$PKGS_PATH_DIR"/poppler-$POPPLER_VERSION*/Library/ .
cp "$PKGS_PATH_DIR"/freetype*/Library/bin/freetype.dll ./Library/bin/
cp "$PKGS_PATH_DIR"/zlib*/Library/bin/zlib.dll ./Library/bin/
cp -a "$PKGS_PATH_DIR"/zstd*/Library/bin/. ./Library/bin/
cp "$PKGS_PATH_DIR"/libtiff*/Library/bin/tiff.dll ./Library/bin/
cp "$PKGS_PATH_DIR"/libtiff*/Library/bin/libtiff.dll ./Library/bin/
cp "$PKGS_PATH_DIR"/libssh2*/Library/bin/libssh2.dll ./Library/bin/
cp "$PKGS_PATH_DIR"/libpng*/Library/bin/libpng16.dll ./Library/bin/
cp "$PKGS_PATH_DIR"/libcurl*/Library/bin/libcurl.dll ./Library/bin/
cp "$PKGS_PATH_DIR"/openssl*/Library/bin/libcrypto-1_1-x64.dll ./Library/bin/
cp "$PKGS_PATH_DIR"/openjpeg*/Library/bin/openjp2.dll ./Library/bin/
cp "$PKGS_PATH_DIR"/xz*/Library/bin/liblzma.dll ./Library/bin/
cp "$PKGS_PATH_DIR"/cairo*/Library/bin/cairo.dll ./Library/bin/
cp "$PKGS_PATH_DIR"/libdeflate*/Library/bin/libdeflate.dll ./Library/bin/
cp "$PKGS_PATH_DIR"/lerc*/Library/bin/Lerc.dll ./Library/bin/
cp "$PKGS_PATH_DIR"/jbig*/Library/bin/jbig.dll ./Library/bin/
cp "$PKGS_PATH_DIR"/lcms2*/Library/bin/lcms2.dll ./Library/bin/
cp "$PKGS_PATH_DIR"/libxml2*/Library/bin/libxml2.dll ./Library/bin/
cp "$PKGS_PATH_DIR"/libiconv*/Library/bin/iconv.dll ./Library/bin/

rm -rf "$PKGS_PATH_DIR"

mkdir -p share/poppler
cd share || exit
curl $POPPLER_DATA_URL --output poppler-data.tar.gz
tar xvzf poppler-data.tar.gz -C poppler --strip-components 1
rm poppler-data.tar.gz

echo "POPPLER_VERSION=$POPPLER_VERSION" >> "$GITHUB_ENV"
