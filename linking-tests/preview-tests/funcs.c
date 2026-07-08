#import "strfuncs.h"
#include <string.h>
#include <stdio.h>

uint32_t exports_strfuncs_funcs_funcs_len(strfuncs_string_t *str) {
    return str -> len;
}

void exports_strfuncs_funcs_funcs_print(strfuncs_string_t *str) {
    printf("%.*s\n", (int)str->len, (char*)str->ptr);
}