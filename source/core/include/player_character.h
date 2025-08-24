#pragma once

#include "skills.h"

#include <string>
#include <cstdint>
#include <map>

typedef std::map<std::string, Skill*> SkillSet;

namespace core
{
    class PlayerCharacter {
    private:
        SkillSet skills;

    public:
        PlayerCharacter() {};

        bool HasSkill(std::string name);
        Skill* GetSkill(std::string name);
        void UpdateSkillSet(Skill* skill);
    };
}
