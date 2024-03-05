project(foo LANGUAGES C CXX)

add_library(foo STATIC lib.cpp)
add_dependencies(foo rust_c_header)

add_executable(example example.c)
target_link_libraries(example foo ${CMAKE_SOURCE_DIR}/rust_foo/target/debug/librust_foo.a)


add_custom_command(
    OUTPUT ${CMAKE_SOURCE_DIR}/rust_foo/target/debug/librust_foo.a
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/rust_foo
    COMMAND cargo build
    DEPENDS ${CMAKE_SOURCE_DIR}/rust_foo/src/lib.rs
    VERBATIM
)
add_custom_target(librust_foo DEPENDS ${CMAKE_SOURCE_DIR}/rust_foo/target/debug/librust_foo.a)

# Generate the C header for the Rust library.
add_custom_command(
    OUTPUT ${CMAKE_SOURCE_DIR}/rust_foo/rust_foo.h
    COMMAND cbindgen --lang=c --cpp-compat ${CMAKE_SOURCE_DIR}/rust_foo -o ${CMAKE_SOURCE_DIR}/rust_foo/rust_foo.h
    DEPENDS ${CMAKE_SOURCE_DIR}/rust_foo/src/lib.rs
    VERBATIM
)
add_custom_target(rust_c_header 
    DEPENDS ${CMAKE_SOURCE_DIR}/rust_foo/rust_foo.h
)
