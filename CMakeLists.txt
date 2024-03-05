project(foo LANGUAGES C CXX)

add_library(foo STATIC lib.cpp)

add_executable(example example.c)
target_link_libraries(example foo)
