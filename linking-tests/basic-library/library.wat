(module $library.wasm
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
  (import "tex" "memory" (memory (;0;) 9))
  (func $args_get (type 0) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    i32.store
    local.get 0
    i32.const 8
    i32.add
    local.get 1
    i32.const 9
    i32.add
    i32.store
    local.get 0
    i32.const 4
    i32.add
    local.get 1
    i32.const 4
    i32.add
    i32.store
    local.get 1
    i32.const 0
    i64.load offset=29360209 align=1
    i64.store offset=13 align=1
    local.get 1
    i32.const 0
    i64.load offset=29360204 align=1
    i64.store offset=8 align=1
    local.get 1
    i32.const 0
    i64.load offset=29360196 align=1
    i64.store align=1
    i32.const 0)
  (func $args_sizes_get (type 0) (param i32 i32) (result i32)
    block  ;; label = @1
      i32.const 512
      memory.size
      i32.sub
      memory.grow
      i32.const -1
      i32.ne
      br_if 0 (;@1;)
      unreachable
    end
    i32.const 0
    i32.const 0
    i64.load offset=524301 align=1
    i64.store offset=29360209 align=1
    i32.const 0
    i32.const 0
    i64.load offset=524296 align=1
    i64.store offset=29360204 align=1
    i32.const 0
    i32.const 0
    i64.load offset=524288 align=1
    i64.store offset=29360196 align=1
    i32.const 0
    i32.const 0
    i64.load offset=524309 align=1
    i64.store offset=29360218 align=1
    i32.const 0
    i32.const 0
    i32.load offset=524316 align=1
    i32.store offset=29360225 align=1
    i32.const 29360384
    i32.const 524320
    i32.const 80
    memory.copy
    i32.const 29361152
    i32.const 524400
    i32.const 1296
    memory.copy
    i32.const 0
    i32.const 0
    i32.load8_u offset=525704
    i32.store8 offset=29360156
    i32.const 0
    i32.const 0
    i64.load offset=525696 align=1
    i64.store offset=29360148 align=1
    i32.const 0
    i32.const 0
    i64.load offset=525705 align=1
    i64.store offset=29360164 align=1
    i32.const 0
    i32.const 0
    i32.load8_u offset=525713
    i32.store8 offset=29360172
    i32.const 0
    i32.const 1769366574
    i32.store offset=29360180
    i32.const 0
    i32.const 12
    i32.store offset=29360136
    local.get 0
    i32.const 3
    i32.store
    local.get 1
    i32.const 21
    i32.store
    i32.const 0)
  (func $clock_time_get (type 1) (param i32 i64 i32) (result i32)
    i32.const 0)
  (func $environ_get (type 0) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    i32.store
    local.get 1
    i32.const 0
    i32.load offset=29360225 align=1
    i32.store offset=7 align=1
    local.get 1
    i32.const 0
    i64.load offset=29360218 align=1
    i64.store align=1
    i32.const 0)
  (func $environ_sizes_get (type 0) (param i32 i32) (result i32)
    local.get 0
    i32.const 1
    i32.store
    local.get 1
    i32.const 11
    i32.store
    i32.const 0)
  (func $fd_close (type 2) (param i32) (result i32)
    i32.const 0)
  (func $fd_fdstat_get (type 0) (param i32 i32) (result i32)
    (local i32)
    i32.const 8
    local.set 2
    block  ;; label = @1
      local.get 0
      i32.const 3
      i32.ne
      br_if 0 (;@1;)
      local.get 1
      i32.const 3
      i32.store8
      local.get 1
      i32.const 16
      i32.add
      i64.const -1
      i64.store
      local.get 1
      i32.const 8
      i32.add
      i64.const -1
      i64.store
      i32.const 0
      local.set 2
      local.get 1
      i32.const 2
      i32.add
      i32.const 0
      i32.store16
    end
    local.get 2)
  (func $fd_fdstat_set_flags (type 0) (param i32 i32) (result i32)
    i32.const 0)
  (func $fd_prestat_dir_name (type 3) (param i32 i32 i32) (result i32)
    (local i32)
    i32.const 8
    local.set 3
    block  ;; label = @1
      local.get 0
      i32.const 3
      i32.ne
      br_if 0 (;@1;)
      i32.const 0
      local.set 3
      local.get 2
      i32.const 1
      i32.lt_s
      br_if 0 (;@1;)
      local.get 1
      i32.const 46
      i32.store8
    end
    local.get 3)
  (func $fd_prestat_get (type 0) (param i32 i32) (result i32)
    (local i32)
    i32.const 8
    local.set 2
    block  ;; label = @1
      local.get 0
      i32.const 3
      i32.ne
      br_if 0 (;@1;)
      i32.const 0
      local.set 2
      local.get 1
      i32.const 0
      i32.store8
      local.get 1
      i32.const 4
      i32.add
      i32.const 1
      i32.store
    end
    local.get 2)
  (func $fd_read (type 4) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    i32.const 29360128
    local.set 4
    i32.const 80
    local.set 5
    i32.const 29360384
    local.set 6
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.const -10
          i32.add
          br_table 2 (;@1;) 1 (;@2;) 0 (;@3;)
        end
        unreachable
      end
      i32.const 29360132
      local.set 4
      i32.const 1296
      local.set 5
      i32.const 29361152
      local.set 6
    end
    local.get 4
    i32.load
    local.set 0
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.const 1
        i32.ge_s
        br_if 0 (;@2;)
        i32.const 0
        local.set 7
        br 1 (;@1;)
      end
      i32.const 0
      local.set 7
      loop  ;; label = @2
        block  ;; label = @3
          local.get 5
          local.get 0
          i32.sub
          local.tee 8
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          i32.load
          local.get 0
          local.get 6
          i32.add
          local.get 8
          memory.copy
        end
        local.get 1
        i32.const 8
        i32.add
        local.set 1
        local.get 8
        local.get 7
        i32.add
        local.set 7
        local.get 5
        local.set 0
        local.get 2
        i32.const -1
        i32.add
        local.tee 2
        br_if 0 (;@2;)
      end
      local.get 5
      local.set 0
    end
    local.get 4
    local.get 0
    i32.store
    local.get 3
    local.get 7
    i32.store
    i32.const 0)
  (func $fd_readdir (type 5) (param i32 i32 i32 i64 i32) (result i32)
    unreachable)
  (func $fd_seek (type 6) (param i32 i64 i32 i32) (result i32)
    (local i64 i32 i64)
    i64.const 80
    local.set 4
    i32.const 29360128
    local.set 5
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.const -10
          i32.add
          br_table 1 (;@2;) 0 (;@3;) 2 (;@1;)
        end
        i64.const 1296
        local.set 4
        i32.const 29360132
        local.set 5
      end
      i64.const 0
      local.set 6
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.const -1
            i32.add
            br_table 0 (;@4;) 1 (;@3;) 2 (;@2;)
          end
          local.get 5
          i64.load32_u
          local.set 6
          br 1 (;@2;)
        end
        local.get 4
        local.set 6
      end
      local.get 5
      local.get 6
      local.get 1
      i64.add
      local.tee 6
      i64.store32
      local.get 3
      local.get 6
      i64.const 4294967295
      i64.and
      i64.store
    end
    i32.const 0)
  (func $fd_write (type 4) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    i32.const 0
    local.set 4
    i32.const 0
    i32.load offset=29360144
    local.set 5
    i32.const 0
    i32.load offset=29360140
    local.set 6
    block  ;; label = @1
      local.get 2
      i32.const 1
      i32.lt_s
      br_if 0 (;@1;)
      i32.const 0
      local.set 4
      loop  ;; label = @2
        local.get 1
        i32.const 4
        i32.add
        i32.load
        local.set 7
        block  ;; label = @3
          local.get 0
          local.get 6
          i32.ne
          br_if 0 (;@3;)
          block  ;; label = @4
            i32.const 4128768
            local.get 5
            i32.sub
            local.tee 8
            local.get 7
            local.get 8
            local.get 7
            i32.lt_u
            select
            local.tee 8
            i32.eqz
            br_if 0 (;@4;)
            local.get 5
            i32.const 29425664
            i32.add
            local.get 1
            i32.load
            local.get 8
            memory.copy
          end
          local.get 8
          local.get 5
          i32.add
          local.set 5
        end
        local.get 7
        local.get 4
        i32.add
        local.set 4
        local.get 1
        i32.const 8
        i32.add
        local.set 1
        local.get 2
        i32.const -1
        i32.add
        local.tee 2
        br_if 0 (;@2;)
      end
    end
    block  ;; label = @1
      local.get 0
      local.get 6
      i32.ne
      br_if 0 (;@1;)
      i32.const 0
      local.get 5
      i32.store offset=29360144
    end
    local.get 3
    local.get 4
    i32.store
    i32.const 0)
  (func $path_filestat_get (type 7) (param i32 i32 i32 i32 i32) (result i32)
    (local i32 i64 i32 i32 i32)
    i32.const 3
    local.set 5
    i64.const 0
    local.set 6
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          br_table 2 (;@1;) 0 (;@3;) 1 (;@2;)
        end
        i64.const 0
        local.set 6
        local.get 2
        i32.load8_u
        i32.const 254
        i32.and
        i32.const 46
        i32.eq
        br_if 1 (;@1;)
      end
      local.get 3
      local.get 2
      i32.add
      local.set 7
      i32.const 0
      local.set 2
      i32.const -3
      local.set 5
      block  ;; label = @2
        block  ;; label = @3
          loop  ;; label = @4
            local.get 5
            i32.eqz
            br_if 1 (;@3;)
            local.get 7
            local.get 5
            i32.add
            local.set 8
            local.get 2
            i32.load8_u offset=29360196
            local.set 9
            local.get 5
            i32.const 1
            i32.add
            local.set 5
            local.get 2
            i32.const 1
            i32.add
            local.set 2
            local.get 9
            local.get 8
            i32.load8_u
            i32.eq
            br_if 0 (;@4;)
            br 2 (;@2;)
          end
        end
        i32.const 4
        local.set 5
        block  ;; label = @3
          local.get 3
          i32.const 3
          i32.ne
          br_if 0 (;@3;)
          i64.const 0
          local.set 6
          br 2 (;@1;)
        end
        i64.const 0
        local.set 6
        local.get 7
        i32.const -4
        i32.add
        i32.load8_u
        i32.const 47
        i32.eq
        br_if 1 (;@1;)
      end
      i32.const 0
      local.set 2
      i32.const -9
      local.set 5
      block  ;; label = @2
        block  ;; label = @3
          loop  ;; label = @4
            local.get 5
            i32.eqz
            br_if 1 (;@3;)
            local.get 7
            local.get 5
            i32.add
            local.set 8
            local.get 2
            i32.load8_u offset=29360148
            local.set 9
            local.get 5
            i32.const 1
            i32.add
            local.set 5
            local.get 2
            i32.const 1
            i32.add
            local.set 2
            local.get 9
            local.get 8
            i32.load8_u
            i32.eq
            br_if 0 (;@4;)
            br 2 (;@2;)
          end
        end
        i32.const 4
        local.set 5
        i64.const 80
        local.set 6
        local.get 3
        i32.const 9
        i32.eq
        br_if 1 (;@1;)
        local.get 7
        i32.const -10
        i32.add
        i32.load8_u
        i32.const 47
        i32.eq
        br_if 1 (;@1;)
      end
      i32.const 0
      local.set 2
      i32.const -9
      local.set 5
      block  ;; label = @2
        block  ;; label = @3
          loop  ;; label = @4
            local.get 5
            i32.eqz
            br_if 1 (;@3;)
            local.get 7
            local.get 5
            i32.add
            local.set 8
            local.get 2
            i32.load8_u offset=29360164
            local.set 9
            local.get 5
            i32.const 1
            i32.add
            local.set 5
            local.get 2
            i32.const 1
            i32.add
            local.set 2
            local.get 9
            local.get 8
            i32.load8_u
            i32.eq
            br_if 0 (;@4;)
            br 2 (;@2;)
          end
        end
        i32.const 4
        local.set 5
        i64.const 1296
        local.set 6
        local.get 3
        i32.const 9
        i32.eq
        br_if 1 (;@1;)
        local.get 7
        i32.const -10
        i32.add
        i32.load8_u
        i32.const 47
        i32.eq
        br_if 1 (;@1;)
      end
      i32.const 44
      return
    end
    local.get 4
    i64.const 0
    i64.store
    local.get 4
    i32.const 56
    i32.add
    i64.const 0
    i64.store
    local.get 4
    i32.const 48
    i32.add
    i64.const 0
    i64.store
    local.get 4
    i32.const 40
    i32.add
    i64.const 0
    i64.store
    local.get 4
    i32.const 32
    i32.add
    local.get 6
    i64.store
    local.get 4
    i32.const 24
    i32.add
    i64.const 1
    i64.store
    local.get 4
    i32.const 16
    i32.add
    local.get 5
    i32.store8
    local.get 4
    i32.const 8
    i32.add
    i64.const 0
    i64.store
    i32.const 0)
  (func $path_open (type 8) (param i32 i32 i32 i32 i32 i64 i64 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    i32.const -9
    local.set 9
    local.get 3
    local.get 2
    i32.add
    local.tee 10
    i32.const -9
    i32.add
    local.set 11
    i32.const 0
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          loop  ;; label = @4
            local.get 9
            i32.eqz
            br_if 1 (;@3;)
            local.get 10
            local.get 9
            i32.add
            local.set 12
            local.get 2
            i32.load8_u offset=29360148
            local.set 13
            local.get 9
            i32.const 1
            i32.add
            local.set 9
            local.get 2
            i32.const 1
            i32.add
            local.set 2
            local.get 13
            local.get 12
            i32.load8_u
            i32.eq
            br_if 0 (;@4;)
            br 2 (;@2;)
          end
        end
        i32.const 10
        local.set 9
        i32.const 29360128
        local.set 2
        local.get 3
        i32.const 9
        i32.eq
        br_if 1 (;@1;)
        local.get 11
        i32.const -1
        i32.add
        i32.load8_u
        i32.const 47
        i32.eq
        br_if 1 (;@1;)
      end
      i32.const 0
      local.set 2
      i32.const -9
      local.set 9
      block  ;; label = @2
        block  ;; label = @3
          loop  ;; label = @4
            local.get 9
            i32.eqz
            br_if 1 (;@3;)
            local.get 10
            local.get 9
            i32.add
            local.set 12
            local.get 2
            i32.load8_u offset=29360164
            local.set 13
            local.get 9
            i32.const 1
            i32.add
            local.set 9
            local.get 2
            i32.const 1
            i32.add
            local.set 2
            local.get 13
            local.get 12
            i32.load8_u
            i32.eq
            br_if 0 (;@4;)
            br 2 (;@2;)
          end
        end
        i32.const 11
        local.set 9
        i32.const 29360132
        local.set 2
        local.get 3
        i32.const 9
        i32.eq
        br_if 1 (;@1;)
        local.get 11
        i32.const -1
        i32.add
        i32.load8_u
        i32.const 47
        i32.eq
        br_if 1 (;@1;)
      end
      i32.const 0
      i32.const 0
      i32.load offset=29360136
      local.tee 9
      i32.const 1
      i32.add
      i32.store offset=29360136
      i32.const 0
      local.get 9
      i32.store offset=29360140
      i32.const 29360144
      local.set 2
    end
    local.get 2
    i32.const 0
    i32.store
    local.get 8
    local.get 9
    i32.store
    i32.const 0)
  (func $path_readlink (type 9) (param i32 i32 i32 i32 i32 i32) (result i32)
    unreachable)
  (func $proc_exit (type 10) (param i32)
    unreachable)
  (table (;0;) 1 1 funcref)
  (global $__stack_pointer (mut i32) (i32.const 524288))
  (export "args_get" (func $args_get))
  (export "args_sizes_get" (func $args_sizes_get))
  (export "clock_time_get" (func $clock_time_get))
  (export "environ_get" (func $environ_get))
  (export "environ_sizes_get" (func $environ_sizes_get))
  (export "fd_close" (func $fd_close))
  (export "fd_fdstat_get" (func $fd_fdstat_get))
  (export "fd_fdstat_set_flags" (func $fd_fdstat_set_flags))
  (export "fd_prestat_dir_name" (func $fd_prestat_dir_name))
  (export "fd_prestat_get" (func $fd_prestat_get))
  (export "fd_read" (func $fd_read))
  (export "fd_readdir" (func $fd_readdir))
  (export "fd_seek" (func $fd_seek))
  (export "fd_write" (func $fd_write))
  (export "path_filestat_get" (func $path_filestat_get))
  (export "path_open" (func $path_open))
  (export "path_readlink" (func $path_readlink))
  (export "proc_exit" (func $proc_exit))
  (export "path_rename" (func $path_readlink))
  (data $.rodata (i32.const 524288) "tex\00-ini\00./hello.tex\00TFMFONTS=.\00\5ccatcode`\5c{=1 \5ccatcode`\5c}=2\0a\5cfont\5crm=cmr10 \5crm\0a\5cshipout\5chbox{Hello, world!}\0a\5cend\01D\00\12\00\00\00\7f\00$\00\10\00\0a\00\05\00X\00\0a\00\00\00\07K\f1`y\00\a0\00\00\08TEX TEXT\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\03CMR\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\80\00\00\ea\12\c0\00\00\1e\c0\00\00\1c\c0\00\00\16\c0\00\00\14\c0\00\00\1a\c0\00\00\18\c0\00\00\1c\c0\00\00\18\c0\00\00\1c\c0\00\00\18\c0\00\00\10\d0\11\0a\0f\d0\00\00\0f\d0\00\00\1e\d0\00\00\1e\d0\00\00\010\00\00\028\00\00\0a\d0\00\00\0a\d0\00\00\0a\90\00\00\0a\d0\00\00\0a`\00\00\1a\d0\00\00\08\06\00\00\0b\d0\00\00\180\00\00\1c0\00\00\0aU\00\00\1f\c0\00\00\22\c0\00\00\1c\e2\00\00\010\01\00\01\d0\01\17\0a\d0\00\00\1e\d7\00\00\0a\f3\00\00\1e\f3\00\00\1c\d0\00\00\01\d0\01\12\05\f9\00\00\05\f9\00\00\0a\f0\00\00\1ct\00\00\01\18\00\00\030\01\15\01\10\00\00\0a\f9\00\00\0a\a0\00\00\0a\a0\00\00\0a\a0\00\00\0a\a0\00\00\0a\a0\00\00\0a\a0\00\00\0a\a0\00\00\0a\a0\00\00\0a\a0\00\00\0a\a0\00\00\010\00\00\018\00\00\01H\00\00\1c!\00\00\09H\00\00\09\d0\01\18\1c\d0\00\00\1a\c0\01L\17\c0\00\00\18\c0\00\00\1b\c0\015\15\c0\00\00\13\c0\01$\1d\c0\00\00\1a\c0\00\00\04\c0\01W\0c\c0\00\00\1c\c0\01*\12\c0\01R \c0\00\00\1a\c0\00\00\1c\c0\015\15\c0\01\1e\1c\c8\00\00\19\c0\01L\0f\c0\00\00\18\c0\01.\1a\c0\00\00\1a\c0\05$#\c0\05$\1a\c0\01*\1a\c0\09/\11\c0\00\00\01\f9\00\00\0a\d0\00\00\01\f9\00\00\0a\d0\00\00\01\b0\00\00\01\d0\01\11\0a0\01H\0f\d0\01B\080\01@\0f\d0\00\00\080\00\00\02\d0\11\02\0a8\05V\0f\d0\01:\01\b0\00\00\02\b8\00\00\0e\d0\01\19\01\d0\00\00\1e0\01:\0f0\01:\0a0\01B\0f8\01B\0d8\00\00\060\00\00\070\00\00\05\80\01J\0f0\01K\0e0\05\19\180\05\1a\0e0\00\00\0e8\05\1f\080\00\00\0a0\0d\16!0\0c\00\0a\d0\00\00\0a\b0\00\00\0a\b0\00\00\00\00\00\00\00\04q\c8\00\04\e3\90\00\05UV\00\05\c7\1d\00\068\e5\00\06DF\00\06O\a6\00\07\1cs\00\07\8e;\00\08\00\02\00\08\00\03\00\088\e5\00\08q\c8\00\08q\ca\00\08\e3\90\00\09UX\00\09\c7\1e\00\0a\00\02\00\0aq\ca\00\0a\aa\ad\00\0a\e3\90\00\0b\1cs\00\0bUX\00\0b\8e;\00\0b\c7\1e\00\0c\00\02\00\0c8\e6\00\0cq\ca\00\0c\8e;\00\0dUX\00\0eq\ca\00\0e\aa\ad\00\10\00\03\00\108\e6\00\10q\ca\00\00\00\00\00\01\b0[\00\05\de\b8\00\06\e3\8e\00\08\00\00\00\08q\c8\00\09\15\9d\00\09UV\00\09\d7^\00\0a\0e:\00\0aO\a5\00\0a\af\8d\00\0a\ee\ee\00\0b\1cr\00\0b\b6\0b\00\0c\00\00\00\00\00\00\ff\fd\de\b8\00\00\c7\1d\00\00\e3\8e\00\01UV\00\01\8e:\00\02\b8\e3\00\03\1cp\00\03\1cr\00\04\00\00\00\00\00\00\00\008\e3\00\00ff\00\00q\c8\00\01>\95\00l\80\00\80L\80\01\00i\00\0c\00f\00\0b\00l\00\0d\00'\80\02\00?\80\02\00!\80\02\00)\80\02\80]\80\02\00i\00\0e\00l\00\0f\00'\80\02\00?\80\02\00!\80\02\00)\80\02\80]\80\02\80`\00\5c\00'\00\22\00?\80\03\80!\80\03\80-\00{\80-\00|\80`\00<\80`\00>\00a\80\04\00e\80\05\00a\80\05\00o\80\05\80c\80\05\00A\80\06\00o\80\05\00e\80\05\00a\80\05\00.\80\06\80,\80\06\00o\80\06\00e\80\06\00u\80\06\00r\80\06\00a\80\06\00A\80\07\00O\80\05\00C\80\05\00G\80\05\80Q\80\05\00y\80\05\00e\80\06\00o\80\06\00r\80\06\00a\80\06\00A\80\06\80u\80\06\00X\80\05\00W\80\05\00A\80\05\00V\80\05\80Y\80\05\00t\80\05\00u\80\05\00b\80\05\00y\80\05\00v\80\05\80w\80\05\00h\80\05\80k\80\05\00e\80\08\00o\80\08\00x\80\05\00d\80\08\00c\80\08\00q\80\08\00v\80\05\00j\80\09\00y\80\05\80w\80\05\00t\80\05\00C\80\05\00O\80\05\00G\80\05\00U\80\05\00Q\80\05\00T\80\06\00Y\80\06\00V\80\07\80W\80\07\80j\80\08\80I\80\08\ff\fb\8e8\ff\fa\e3\8d\00\01>\95\00\01\c7\1d\ff\ff\1cr\ff\ff\8e8\ff\fe\aa\aa\ff\fe8\e3\00\00q\c8\00\00\e3\8e\00\00\00\00\00\05UV\00\02\aa\ab\00\01\c7\1d\00\06\e3\8e\00\10\00\03\00\01\c7\1dhello.texcmr10.tfm"))
