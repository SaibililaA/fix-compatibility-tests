#ifndef _WASI_EMULATED_SIGNAL
#define _WASI_EMULATED_SIGNAL
#endif
#ifndef _WASI_EMULATED_GETPID
#define _WASI_EMULATED_GETPID
#endif
#ifndef WASI_COMPAT_H
#define WASI_COMPAT_H

#include <stdio.h>
#include <sys/types.h>
#include <errno.h>

static inline void flockfile(FILE * f) {
  (void) f;
}
static inline int ftrylockfile(FILE * f) {
  (void) f;
  return 0;
}
static inline void funlockfile(FILE * f) {
  (void) f;
}

static inline int dup(int fd) { 
    (void)fd; 
    errno = ENOSYS; 
    return -1; 
}
static inline pid_t fork(void) {
  errno = ENOSYS;
  return -1;
}
static inline int pipe(int fds[2]) {
  (void) fds;
  errno = ENOSYS;
  return -1;
}
static inline int execvp(const char * p, char *
  const a[]) {
  (void) p;
  (void) a;
  errno = ENOSYS;
  return -1;
}
static inline pid_t wait(int * s) {
  (void) s;
  errno = ENOSYS;
  return -1;
}
static inline int system(const char * cmd) {
  (void) cmd;
  errno = ENOSYS;
  return -1;
}

#endif