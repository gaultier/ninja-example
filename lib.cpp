#include "lib.h"
#include <utility>

#ifdef __cplusplus
extern "C" {
#endif // __cplusplus

void reverse(char *s, uint64_t len) {
  for (uint64_t i = 0; i <= len / 2; i++) {
    std::swap(s[i], s[len - 1 - i]);
  }
}

void upper_case_first(char *s, uint64_t len) {
  if (len == 0)
    return;
  if ('a' <= s[0] && s[0] <= 'z')
    s[0] -= 'a' - 'A';
}

#ifdef __cplusplus
}
#endif
