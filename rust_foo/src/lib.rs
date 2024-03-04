use std::ffi::c_char;

#[no_mangle]
pub extern "C" fn rust_foo_reverse(s: &mut c_char, len: usize) {
    let slice = unsafe { &mut *core::ptr::slice_from_raw_parts_mut(s, len) };
    slice.reverse();
}
