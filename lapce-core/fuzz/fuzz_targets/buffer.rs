#![no_main]

use lapce_core::buffer::Buffer;

use libfuzzer_sys::fuzz_target;

fuzz_target!(|data: &[u8]| {
    let s = String::from_utf8_lossy(data); 
    let buffer = Buffer::new(&s);
    let _ = buffer.is_pristine();
    let _ = buffer.num_lines();
});