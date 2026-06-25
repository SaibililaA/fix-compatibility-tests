set -euo pipefail

if [ -z "$1" ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

FILE_NAME="$1"

wasmtime --dir=. --env TFMFONTS=./tfm tex "-ini" "./$FILE_NAME"
dvipdf "${FILE_NAME%.tex}.dvi"