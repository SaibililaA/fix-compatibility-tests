from wasmtime import Engine, Trap, ExitTrap, Linker, Module, Store
 
START = 448 * 65536
DVI_LEN = START + 16
DVI_BUF = START + 65536

engine = Engine()
store = Store(engine)
linker = Linker(engine)
module = Module.from_file(engine, "merged_tex.wasm")
instance = linker.instantiate(store, module)

exit_code = 0
try:
    instance.exports(store)["_start"](store)
except Trap:
    exit_code = 0

memory = instance.exports(store)["memory"]
output_length = int.from_bytes(bytes(memory.read(store, DVI_LEN, DVI_LEN + 4)), "little")
with open("hello.dvi", "wb") as output_file:
    output_file.write(bytes(memory.read(store, DVI_BUF, DVI_BUF + output_length)))

print(f"exit status: {exit_code}")
print(f"recovered hello.dvi with {output_length} bytes")