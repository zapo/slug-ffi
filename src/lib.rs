extern crate slug;
extern crate libc;

use libc::c_char;
use std::ffi::{CStr, CString};

#[no_mangle]
pub extern fn slugify(input: *const c_char) -> *const c_char {
    if input.is_null() { return input; }

    let c_str = unsafe { CStr::from_ptr(input) };
    let input = c_str.to_str().unwrap();
    let output = slug::slugify(input);
    CString::new(output).unwrap().into_raw()
}
