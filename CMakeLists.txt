project(foo LANGUAGES C CXX)

add_library(foo STATIC lib.cpp)

add_executable(example example.c)
target_link_libraries(example foo ${CMAKE_SOURCE_DIR}/rust_foo/target/debug/librust_foo.a)


add_custom_command(
    OUTPUT ${CMAKE_SOURCE_DIR}/rust_foo/target/debug/librust_foo.a
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}/rust_foo
    COMMAND cargo build
    DEPENDS
        ${CMAKE_SOURCE_DIR}/rust_foo/src/lib.rs
    VERBATIM
)
add_custom_target(librust_foo DEPENDS ${CMAKE_SOURCE_DIR}/rust_foo/target/debug/librust_foo.a)
