#pragma once

#include <stdint.h>

typedef struct 
{
    char name[4];
    int8_t bonus;
    char description[256];
} Skill;