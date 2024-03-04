#include "lib.h"
#include "rust_foo/rust_foo.h"
#include <utility>

#ifdef __cplusplus
extern "C" {
#endif // __cplusplus

void reverse(char *s, size_t len) { rust_foo_reverse(s, len); }

void upper_case_first(char *s, size_t len) {
  if (len == 0)
    return;
  if ('a' <= s[0] && s[0] <= 'z')
    s[0] -= 'a' - 'A';
}

#ifdef __cplusplus
}
#endif
