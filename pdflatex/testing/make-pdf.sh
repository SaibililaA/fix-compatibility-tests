set -euo pipefail

VERSION="1"
FLAGS=("--dir=.")
FILE_NAME="${1:-}"

case "${1:-}" in
    -p2)
        VERSION="2"
        FLAGS=("-W" "component-model-async=y" "-S" "preview2" "--dir=.")
        FILE_NAME="${2:-}"
        ;;
    -p3)
        VERSION="3"
        FLAGS=("-W" "component-model-async=y" "-S" "preview3" "--dir=.")
        FILE_NAME="${2:-}"
        ;;
esac

wasmtime "${FLAGS[@]}" --env TFMFONTS=./tfm "tex$VERSION" "-ini" "./$FILE_NAME"
dvipdf "${FILE_NAME%.tex}.dvi"