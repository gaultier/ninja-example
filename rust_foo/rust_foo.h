#include <cstdarg>
#include <cstdint>
#include <cstdlib>
#include <ostream>
#include <new>

extern "C" {

void rust_foo_reverse(char *s, uintptr_t len);

} // extern "C"
