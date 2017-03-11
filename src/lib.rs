extern crate slug;
extern crate libc;

use std::ptr;
use libc::c_char;
use std::ffi::{CStr, CString};

#[no_mangle]
pub extern fn slug_generate(input: *const c_char) -> *mut c_char {
    if input.is_null() { return ptr::null_mut(); }

    let c_str = unsafe { CStr::from_ptr(input) };
    let input = c_str.to_string_lossy();
    let output = slug::slugify(input);
    CString::new(output).unwrap().into_raw()
}

#[no_mangle]
pub extern fn slug_free(s: *mut c_char) {
    if s.is_null() { return }

    unsafe {
        CString::from_raw(s)
    };
}
