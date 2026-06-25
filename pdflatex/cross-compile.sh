set -euo pipefail

root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
WASI_SDK="$root/../wasi-sdk-33.0-x86_64-linux"
WASI_SYSROOT="$WASI_SDK/share/wasi-sysroot"
native_web2c="$root/native-build/texk/web2c"
wasi_compatibility="$root/wasi-compatibility"

export PATH="$native_web2c:$PATH"
export TANGLE="$native_web2c/tangle"
export TANGLEBOOT="$native_web2c/tangle"
export CTANGLE="$native_web2c/ctangle"
export CTANGLEBOOT="$native_web2c/ctangle"
export TIE="$native_web2c/tie"
export OTANGLE="$native_web2c/otangle"

mkdir -p "$root/wasi-build" && cd "$root/wasi-build" && rm -rf ./* ./.??* 2>/dev/null || true

"$root/texlive-source/configure" \
	--build="$(gcc -dumpmachine)" \
	--host=wasm32-wasip1 \
	--prefix="$root/wasi-install" \
	--without-x \
	--disable-shared \
	--disable-all-pkgs \
	--disable-web-progs \
	--enable-tex \
	--disable-synctex \
	--disable-xetex \
	--enable-missing \
	BUILDCC=gcc \
	CC="$WASI_SDK/bin/clang" \
	CFLAGS="--target=wasm32-wasip1 --sysroot=$WASI_SYSROOT -O2 -I$wasi_compatibility -include $wasi_compatibility/wasi-compatibility.h" \
	LDFLAGS="-lwasi-emulated-signal -lwasi-emulated-getpid" \
	AR="$WASI_SDK/bin/llvm-ar" \
	RANLIB="$WASI_SDK/bin/llvm-ranlib"

make -j"$(nproc)"
cd texk/web2c
make tex