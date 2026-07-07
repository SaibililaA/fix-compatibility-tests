set -euo pipefail

root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
WASI_SDK="$root/../wasi-sdk-34.0-rc.1-x86_64-linux"
WASI_SYSROOT="$WASI_SDK/share/wasi-sysroot"
native_web2c="$root/native-build/texk/web2c"

# Use native tangle
export PATH="$native_web2c:$PATH"
export TANGLE="$native_web2c/tangle"
export TANGLEBOOT="$native_web2c/tangle"
export CTANGLE="$native_web2c/ctangle"
export CTANGLEBOOT="$native_web2c/ctangle"
export TIE="$native_web2c/tie"
export OTANGLE="$native_web2c/otangle"

mkdir -p "$root/wasip3-build" && cd "$root/wasip3-build" && rm -rf ./* ./.??* 2>/dev/null || true

"$root/texlive-source/configure" \
	--build="$(gcc -dumpmachine)" \
	--host=wasm32-wasip3 \
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
	CPPFLAGS="-D_WASI_EMULATED_SIGNAL -D_WASI_EMULATED_GETPID" \
	CFLAGS="--target=wasm32-wasip3 --sysroot=$WASI_SYSROOT -O2 -I$root/wasi-compatibility -include $root/wasi-compatibility/wasi-compatibility.h" \
	LDFLAGS="-lwasi-emulated-signal -lwasi-emulated-getpid" \
	AR="$WASI_SDK/bin/llvm-ar" \
	RANLIB="$WASI_SDK/bin/llvm-ranlib"

make -j"$(nproc)"
cd texk/web2c
make tex