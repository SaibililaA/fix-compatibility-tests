#![no_std]
use core::arch::wasm32::{memory_grow, memory_size};
use core::ptr::{copy_nonoverlapping, write};

#[panic_handler]
fn panic(_info: &core::panic::PanicInfo) -> ! {
    core::arch::wasm32::unreachable()
}

const ERRNO_SUCCESS: i32 = 0;
const ERRNO_BADF: i32 = 8;
const ERRNO_NOENT: i32 = 44;

const FILETYPE_DIRECTORY: u8 = 3;
const FILETYPE_REGULAR_FILE: u8 = 4;

const PREOPENTYPE_DIR: u8 = 0;
const PREOPEN_FD: i32 = 3;
const PREOPEN_NAME: u8 = b'.';
const PREOPEN_NAME_LEN: u32 = 1;
const RIGHTS_ALL: u64 = u64::MAX;

const ARGS: &[u8] = b"tex\0-ini\0./hello.tex\0";
const ENV: &[u8] = b"TFMFONTS=.\0";
const HELLO_TEX: &[u8] = include_bytes!(concat!(env!("CARGO_MANIFEST_DIR"), "/../hello.tex"));
const CMR10_TFM: &[u8] = include_bytes!(concat!(env!("CARGO_MANIFEST_DIR"), "/../tfm/cmr10.tfm"));

const FD_HELLO: i32 = 10; // fd for hello.tex
const FD_CMR10: i32 = 11; // fd for cmr10.tfm

const PAGE: usize = 65536;
const TARGET_PAGES: usize = 512;
const START: usize = 448 * PAGE;

const HELLO_POSITION: usize = START; // hello.tex read cursor
const CMR10_POSITION: usize = START + 4; // cmr10.tfm read cursor
const OUTPUT_FD: usize = START + 8;
const DVI_FD: usize = START + 12;
const DVI_LEN: usize = START + 16;
const NAME_HELLO: usize = START + 20; // "hello.tex"
const NAME_CMR10: usize = START + 36; // "cmr10.tfm"
const NAME_DVI: usize = START + 52; // ".dvi"
const ARGS_DATA: usize = START + 68;
const ENV_DATA: usize = START + 90;
const HELLO_DATA: usize = START + 256;
const CMR10_DATA: usize = START + 1024;
const DVI_BUF: usize = START + PAGE;
const DVI_CAP: usize = 63 * PAGE;

fn init() {
    if memory_grow::<0>(TARGET_PAGES - memory_size::<0>()) == usize::MAX {
        core::arch::wasm32::unreachable();
    }
    unsafe {
        copy_nonoverlapping(ARGS.as_ptr(), ARGS_DATA as *mut u8, ARGS.len());
        copy_nonoverlapping(ENV.as_ptr(), ENV_DATA as *mut u8, ENV.len());
        copy_nonoverlapping(HELLO_TEX.as_ptr(), HELLO_DATA as *mut u8, HELLO_TEX.len());
        copy_nonoverlapping(CMR10_TFM.as_ptr(), CMR10_DATA as *mut u8, CMR10_TFM.len());
        copy_nonoverlapping(b"hello.tex".as_ptr(), NAME_HELLO as *mut u8, 9);
        copy_nonoverlapping(b"cmr10.tfm".as_ptr(), NAME_CMR10 as *mut u8, 9);
        copy_nonoverlapping(b".dvi".as_ptr(), NAME_DVI as *mut u8, 4);
        write(OUTPUT_FD as *mut u32, 12);
    }
}

fn name_is(path: i32, path_length: i32, name: usize, name_length: usize) -> bool {
    let path = path as usize;
    let start = path_length as usize - name_length;
    for i in 0..name_length {
        if unsafe { *((path + start + i) as *const u8) != *((name + i) as *const u8) } {
            return false;
        }
    }
    start == 0 || unsafe { *((path + start - 1) as *const u8) } == b'/'
}

fn is_dir_path(path: i32, path_length: i32) -> bool {
    let path = path as usize;
    match path_length {
        0 => true,
        1 => {
            let dir = unsafe { *(path as *const u8) };
            dir == b'.' || dir == b'/'
        }
        _ => false,
    }
}

#[unsafe(no_mangle)]
pub extern "C" fn args_get(argv: i32, argv_buf: i32) -> i32 {
    unsafe {
        write(argv as *mut i32, argv_buf); // "tex"
        write((argv + 4) as *mut i32, argv_buf + 4); // "-ini"
        write((argv + 8) as *mut i32, argv_buf + 9); // "./hello.tex"
        copy_nonoverlapping(ARGS_DATA as *const u8, argv_buf as *mut u8, ARGS.len());
    }
    ERRNO_SUCCESS
}

#[unsafe(no_mangle)]
pub extern "C" fn args_sizes_get(retpointer0: i32, retpointer1: i32) -> i32 {
    init();
    unsafe {
        write(retpointer0 as *mut i32, 3);
        write(retpointer1 as *mut i32, ARGS.len() as i32);
    }
    ERRNO_SUCCESS
}

#[unsafe(no_mangle)]
pub extern "C" fn environ_get(environ: i32, environ_buf: i32) -> i32 {
    unsafe {
        write(environ as *mut i32, environ_buf);
        copy_nonoverlapping(ENV_DATA as *const u8, environ_buf as *mut u8, ENV.len());
    }
    ERRNO_SUCCESS
}

#[unsafe(no_mangle)]
pub extern "C" fn environ_sizes_get(retptr0: i32, retptr1: i32) -> i32 {
    unsafe {
        write(retptr0 as *mut i32, 1);
        write(retptr1 as *mut i32, ENV.len() as i32);
    }
    ERRNO_SUCCESS
}

#[unsafe(no_mangle)]
pub extern "C" fn fd_fdstat_get(fd: i32, stat: i32) -> i32 {
    let filetype = match fd {
        PREOPEN_FD => FILETYPE_DIRECTORY,
        _ => return ERRNO_BADF,
    };
    unsafe {
        write(stat as *mut u8, filetype);
        write((stat + 2) as *mut u16, 0);
        write((stat + 8) as *mut u64, RIGHTS_ALL);
        write((stat + 16) as *mut u64, RIGHTS_ALL);
    }
    ERRNO_SUCCESS
}

#[unsafe(no_mangle)]
pub extern "C" fn fd_fdstat_set_flags(fd: i32, flags: i32) -> i32 {
    let _ = (fd, flags);
    ERRNO_SUCCESS
}

#[unsafe(no_mangle)]
pub extern "C" fn fd_prestat_get(fd: i32, prestat: i32) -> i32 {
    if fd != PREOPEN_FD {
        return ERRNO_BADF;
    }
    unsafe {
        write(prestat as *mut u8, PREOPENTYPE_DIR);
        write((prestat + 4) as *mut u32, PREOPEN_NAME_LEN);
    }
    ERRNO_SUCCESS
}

#[unsafe(no_mangle)]
pub extern "C" fn fd_prestat_dir_name(fd: i32, path: i32, path_len: i32) -> i32 {
    if fd != PREOPEN_FD {
        return ERRNO_BADF;
    }
    if path_len >= PREOPEN_NAME_LEN as i32 {
        unsafe { write(path as *mut u8, PREOPEN_NAME) };
    }
    ERRNO_SUCCESS
}

#[unsafe(no_mangle)]
pub extern "C" fn path_filestat_get(
    fd: i32,
    flags: i32,
    path: i32,
    path_len: i32,
    buf: i32,
) -> i32 {
    let _ = (fd, flags);
    let (filetype, size) = if is_dir_path(path, path_len) {
        (FILETYPE_DIRECTORY, 0u64)
    } else if name_is(path, path_len, ARGS_DATA, 3) {
        (FILETYPE_REGULAR_FILE, 0)
    } else if name_is(path, path_len, NAME_HELLO, 9) {
        (FILETYPE_REGULAR_FILE, HELLO_TEX.len() as u64)
    } else if name_is(path, path_len, NAME_CMR10, 9) {
        (FILETYPE_REGULAR_FILE, CMR10_TFM.len() as u64)
    } else {
        return ERRNO_NOENT;
    };
    unsafe {
        write(buf as *mut u64, 0);
        write((buf + 8) as *mut u64, 0);
        write((buf + 16) as *mut u8, filetype);
        write((buf + 24) as *mut u64, 1);
        write((buf + 32) as *mut u64, size);
        write((buf + 40) as *mut u64, 0);
        write((buf + 48) as *mut u64, 0);
        write((buf + 56) as *mut u64, 0);
    }
    ERRNO_SUCCESS
}

#[unsafe(no_mangle)]
pub extern "C" fn path_open(
    fd: i32,
    dirflags: i32,
    path: i32,
    path_len: i32,
    oflags: i32,
    fs_rights_base: i64,
    fs_rights_inheriting: i64,
    fdflags: i32,
    opened_fd: i32,
) -> i32 {
    let _ = (
        fd,
        dirflags,
        oflags,
        fs_rights_base,
        fs_rights_inheriting,
        fdflags,
    );
    let newfd = if name_is(path, path_len, NAME_HELLO, 9) {
        unsafe { write(HELLO_POSITION as *mut u32, 0) };
        FD_HELLO
    } else if name_is(path, path_len, NAME_CMR10, 9) {
        unsafe { write(CMR10_POSITION as *mut u32, 0) };
        FD_CMR10
    } else {
        let fd = unsafe { *(OUTPUT_FD as *const u32) };
        unsafe { write(OUTPUT_FD as *mut u32, fd + 1) };
        unsafe { write(DVI_FD as *mut u32, fd) };
        unsafe { write(DVI_LEN as *mut u32, 0) };
        fd as i32
    };
    unsafe { write(opened_fd as *mut i32, newfd) };
    ERRNO_SUCCESS
}

#[unsafe(no_mangle)]
pub extern "C" fn fd_read(fd: i32, iovs: i32, iovs_len: i32, nread: i32) -> i32 {
    let (data, length, position_slot) = match fd {
        FD_HELLO => (HELLO_DATA, HELLO_TEX.len(), HELLO_POSITION),
        FD_CMR10 => (CMR10_DATA, CMR10_TFM.len(), CMR10_POSITION),
        _ => core::arch::wasm32::unreachable(),
    };

    let mut position = unsafe { *(position_slot as *const u32) } as usize;
    let mut total: u32 = 0;
    for i in 0..iovs_len {
        let n = length - position;
        let buffer = unsafe { *((iovs + i * 8) as *const *mut u8) };
        unsafe { copy_nonoverlapping((data + position) as *const u8, buffer, n) };
        position += n;
        total += n as u32;
    }
    unsafe { write(position_slot as *mut u32, position as u32) };
    unsafe { write(nread as *mut u32, total) };
    ERRNO_SUCCESS
}

#[unsafe(no_mangle)]
pub extern "C" fn fd_write(fd: i32, iovs: i32, iovs_len: i32, nwritten: i32) -> i32 {
    let is_dvi = fd == unsafe { *(DVI_FD as *const u32) } as i32;
    let mut length = unsafe { *(DVI_LEN as *const u32) } as usize;
    let mut total: u32 = 0;
    for i in 0..iovs_len {
        let source = unsafe { *((iovs + i * 8) as *const u32) } as usize;
        let n = unsafe { *((iovs + i * 8 + 4) as *const u32) } as usize;
        total = total.wrapping_add(n as u32);
        if is_dvi {
            let dvi_buffer_length = core::cmp::min(n, DVI_CAP - length);
            unsafe {
                copy_nonoverlapping(
                    source as *const u8,
                    (DVI_BUF + length) as *mut u8,
                    dvi_buffer_length,
                )
            };
            length += dvi_buffer_length;
        }
    }
    if is_dvi {
        unsafe { write(DVI_LEN as *mut u32, length as u32) };
    }
    unsafe { write(nwritten as *mut u32, total) };
    ERRNO_SUCCESS
}

#[unsafe(no_mangle)]
pub extern "C" fn fd_seek(fd: i32, offset: i64, whence: i32, newoffset: i32) -> i32 {
    let (length, start) = match fd {
        FD_HELLO => (HELLO_TEX.len(), HELLO_POSITION),
        FD_CMR10 => (CMR10_TFM.len(), CMR10_POSITION),
        _ => return ERRNO_SUCCESS,
    };
    let base: i64 = match whence {
        1 => (unsafe { *(start as *const u32) }) as i64,
        2 => length as i64,
        _ => 0,
    };
    let position = (base + offset) as u32;
    unsafe { *(start as *mut u32) = position };
    unsafe { *(newoffset as *mut u64) = position as u64 };
    ERRNO_SUCCESS
}

#[unsafe(no_mangle)]
pub extern "C" fn clock_time_get(id: i32, precision: i64, time: i32) -> i32 {
    let _ = (id, precision, time);
    ERRNO_SUCCESS
}

#[unsafe(no_mangle)]
pub extern "C" fn fd_close(fd: i32) -> i32 {
    let _ = fd;
    ERRNO_SUCCESS
}

#[unsafe(no_mangle)]
pub extern "C" fn fd_readdir(fd: i32, buf: i32, buf_len: i32, cookie: i64, bufused: i32) -> i32 {
    let _ = (fd, buf, buf_len, cookie, bufused);
    core::arch::wasm32::unreachable()
}

#[unsafe(no_mangle)]
pub extern "C" fn path_readlink(
    fd: i32,
    path: i32,
    path_len: i32,
    buf: i32,
    buf_len: i32,
    bufused: i32,
) -> i32 {
    let _ = (fd, path, path_len, buf, buf_len, bufused);
    core::arch::wasm32::unreachable()
}

#[unsafe(no_mangle)]
pub extern "C" fn path_rename(
    fd: i32,
    old_path: i32,
    old_path_len: i32,
    new_fd: i32,
    new_path: i32,
    new_path_len: i32,
) -> i32 {
    let _ = (fd, old_path, old_path_len, new_fd, new_path, new_path_len);
    core::arch::wasm32::unreachable()
}

#[unsafe(no_mangle)]
pub extern "C" fn proc_exit(code: i32) -> ! {
    let _ = code;
    core::arch::wasm32::unreachable()
}
