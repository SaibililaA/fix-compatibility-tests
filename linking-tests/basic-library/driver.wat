(module $driver.wasm
  (type (;0;) (func (param i32 i32) (result i32)))
  (type (;1;) (func (param i32 i64 i32) (result i32)))
  (type (;2;) (func (param i32) (result i32)))
  (type (;3;) (func (param i32 i32 i32) (result i32)))
  (type (;4;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;5;) (func (param i32 i32 i32 i64 i32) (result i32)))
  (type (;6;) (func (param i32 i64 i32 i32) (result i32)))
  (type (;7;) (func (param i32 i32 i32 i32 i32) (result i32)))
  (type (;8;) (func (param i32 i32 i32 i32 i32 i64 i64 i32 i32) (result i32)))
  (type (;9;) (func (param i32 i32 i32 i32 i32 i32) (result i32)))
  (type (;10;) (func (param i32)))
  (type (;11;) (func (result i32)))
  (import "wasi_snapshot_preview1" "args_get" (func $_RNvCs8WEg45iyuX8_6driver8args_get (type 0)))
  (import "wasi_snapshot_preview1" "args_sizes_get" (func $_RNvCs8WEg45iyuX8_6driver14args_sizes_get (type 0)))
  (import "wasi_snapshot_preview1" "environ_get" (func $_RNvCs8WEg45iyuX8_6driver11environ_get (type 0)))
  (import "wasi_snapshot_preview1" "environ_sizes_get" (func $_RNvCs8WEg45iyuX8_6driver17environ_sizes_get (type 0)))
  (import "wasi_snapshot_preview1" "clock_time_get" (func $_RNvCs8WEg45iyuX8_6driver14clock_time_get (type 1)))
  (import "wasi_snapshot_preview1" "fd_close" (func $_RNvCs8WEg45iyuX8_6driver8fd_close (type 2)))
  (import "wasi_snapshot_preview1" "fd_fdstat_get" (func $_RNvCs8WEg45iyuX8_6driver13fd_fdstat_get (type 0)))
  (import "wasi_snapshot_preview1" "fd_fdstat_set_flags" (func $_RNvCs8WEg45iyuX8_6driver19fd_fdstat_set_flags (type 0)))
  (import "wasi_snapshot_preview1" "fd_prestat_get" (func $_RNvCs8WEg45iyuX8_6driver14fd_prestat_get (type 0)))
  (import "wasi_snapshot_preview1" "fd_prestat_dir_name" (func $_RNvCs8WEg45iyuX8_6driver19fd_prestat_dir_name (type 3)))
  (import "wasi_snapshot_preview1" "fd_read" (func $_RNvCs8WEg45iyuX8_6driver7fd_read (type 4)))
  (import "wasi_snapshot_preview1" "fd_readdir" (func $_RNvCs8WEg45iyuX8_6driver10fd_readdir (type 5)))
  (import "wasi_snapshot_preview1" "fd_seek" (func $_RNvCs8WEg45iyuX8_6driver7fd_seek (type 6)))
  (import "wasi_snapshot_preview1" "fd_write" (func $_RNvCs8WEg45iyuX8_6driver8fd_write (type 4)))
  (import "wasi_snapshot_preview1" "path_filestat_get" (func $_RNvCs8WEg45iyuX8_6driver17path_filestat_get (type 7)))
  (import "wasi_snapshot_preview1" "path_open" (func $_RNvCs8WEg45iyuX8_6driver9path_open (type 8)))
  (import "wasi_snapshot_preview1" "path_readlink" (func $_RNvCs8WEg45iyuX8_6driver13path_readlink (type 9)))
  (import "wasi_snapshot_preview1" "path_rename" (func $_RNvCs8WEg45iyuX8_6driver11path_rename (type 9)))
  (import "wasi_snapshot_preview1" "proc_exit" (func $_RNvCs8WEg45iyuX8_6driver9proc_exit (type 10)))
  (func $__original_main (type 11) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    i32.const 0
    i32.const 0
    call $_RNvCs8WEg45iyuX8_6driver8args_get
    local.set 0
    i32.const 0
    i32.const 0
    call $_RNvCs8WEg45iyuX8_6driver14args_sizes_get
    local.set 1
    i32.const 0
    i32.const 0
    call $_RNvCs8WEg45iyuX8_6driver11environ_get
    local.set 2
    i32.const 0
    i32.const 0
    call $_RNvCs8WEg45iyuX8_6driver17environ_sizes_get
    local.set 3
    i32.const 0
    i64.const 0
    i32.const 0
    call $_RNvCs8WEg45iyuX8_6driver14clock_time_get
    local.set 4
    i32.const 0
    call $_RNvCs8WEg45iyuX8_6driver8fd_close
    local.set 5
    i32.const 0
    i32.const 0
    call $_RNvCs8WEg45iyuX8_6driver13fd_fdstat_get
    local.set 6
    i32.const 0
    i32.const 0
    call $_RNvCs8WEg45iyuX8_6driver19fd_fdstat_set_flags
    local.set 7
    i32.const 0
    i32.const 0
    call $_RNvCs8WEg45iyuX8_6driver14fd_prestat_get
    local.set 8
    i32.const 0
    i32.const 0
    i32.const 0
    call $_RNvCs8WEg45iyuX8_6driver19fd_prestat_dir_name
    local.set 9
    i32.const 0
    i32.const 0
    i32.const 0
    i32.const 0
    call $_RNvCs8WEg45iyuX8_6driver7fd_read
    local.set 10
    i32.const 0
    i32.const 0
    i32.const 0
    i64.const 0
    i32.const 0
    call $_RNvCs8WEg45iyuX8_6driver10fd_readdir
    local.set 11
    i32.const 0
    i64.const 0
    i32.const 0
    i32.const 0
    call $_RNvCs8WEg45iyuX8_6driver7fd_seek
    local.set 12
    i32.const 0
    i32.const 0
    i32.const 0
    i32.const 0
    call $_RNvCs8WEg45iyuX8_6driver8fd_write
    local.set 13
    i32.const 0
    i32.const 0
    i32.const 0
    i32.const 0
    i32.const 0
    call $_RNvCs8WEg45iyuX8_6driver17path_filestat_get
    local.set 14
    i32.const 0
    i32.const 0
    i32.const 0
    i32.const 0
    i32.const 0
    i64.const 0
    i64.const 0
    i32.const 0
    i32.const 0
    call $_RNvCs8WEg45iyuX8_6driver9path_open
    local.set 15
    i32.const 0
    i32.const 0
    i32.const 0
    i32.const 0
    i32.const 0
    i32.const 0
    call $_RNvCs8WEg45iyuX8_6driver13path_readlink
    local.set 16
    i32.const 0
    i32.const 0
    i32.const 0
    i32.const 0
    i32.const 0
    i32.const 0
    call $_RNvCs8WEg45iyuX8_6driver11path_rename
    local.set 17
    i32.const 0
    call $_RNvCs8WEg45iyuX8_6driver9proc_exit
    local.get 17
    local.get 16
    local.get 15
    local.get 14
    local.get 13
    local.get 12
    local.get 11
    local.get 10
    local.get 9
    local.get 8
    local.get 7
    local.get 6
    local.get 5
    local.get 4
    local.get 3
    local.get 2
    local.get 1
    local.get 0
    i32.add
    i32.add
    i32.add
    i32.add
    i32.add
    i32.add
    i32.add
    i32.add
    i32.add
    i32.add
    i32.add
    i32.add
    i32.add
    i32.add
    i32.add
    i32.add
    i32.add)
  (func $main (type 0) (param i32 i32) (result i32)
    call $__original_main)
  (memory (;0;) 16)
  (global $__stack_pointer (mut i32) (i32.const 1048576))
  (export "memory" (memory 0))
  (export "main" (func $main)))
