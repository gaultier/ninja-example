#include "lib.h"
#include <utility>

void reverse(char *s, uint64_t len) {
  for (int64_t i = len; i >= 0; i--) {
    std::swap(s[len - i], s[i]);
  }
}

void upper_case_first(char *s, uint64_t len) {
  if (len == 0)
    return;
  if ('a' <= s[0] && s[0] <= 'z')
    s[0] += 'a' - 'A';
}
