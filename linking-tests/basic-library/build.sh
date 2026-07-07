cargo rustc -p library --release --target wasm32-unknown-unknown -- \
  -C link-arg=--import-memory=tex,memory \
  -C link-arg=-zstack-size=524288 \
  -C link-arg=--global-base=524288
cargo build -p driver --release --target wasm32-unknown-unknown
cp ./target/wasm32-unknown-unknown/release/library.wasm ./library.wasm
wasm2wat ./library.wasm -o library.wat
wasm-merge ./tex tex ./library.wasm wasi_snapshot_preview1 -o merged_tex.wasm --all-features -g
wasm2wat --enable-multi-memory ./merged_tex.wasm -o merged_tex.wat
python3 run_binary.py