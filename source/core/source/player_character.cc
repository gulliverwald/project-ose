#include "../include/player_character.h"

namespace core {
    bool PlayerCharacter::HasSkill(std::string name) {
        if (skills.empty()) {
            return false;
        }

        auto foundSkill = skills[name];
        if (foundSkill != NULL) {
            return true;
        } 

        return false;
    };

    Skill* PlayerCharacter::GetSkill(std::string name) {
        auto skill = skills[name];
        return skill;
    }

    void PlayerCharacter::UpdateSkillSet(Skill* skill) {
        skills.insert(std::pair<std::string, Skill*> { skill->name, skill });
    };
}