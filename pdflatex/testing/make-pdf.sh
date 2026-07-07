set -euo pipefail

PREVIEW_VERSION="1"
WASMTIME_FLAGS=("--dir=.")
BINARY_NAME="tex"
FILE_NAME="${1:-}"

if [ "${1:-}" = "-p3" ]; then
    PREVIEW_VERSION="3"
    WASMTIME_FLAGS=("-W" "component-model-async=y" "-S" "p3" "--dir=.")
    BINARY_NAME="tex3"
    FILE_NAME=${2:-}
fi

wasmtime "${WASMTIME_FLAGS[@]}" --env TFMFONTS=./tfm $BINARY_NAME "-ini" "./$FILE_NAME"
dvipdf "${FILE_NAME%.tex}.dvi"