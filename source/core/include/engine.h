#pragma once

#include <raylib.h>

namespace core
{
    class Engine {
    public:
        Camera camera;
        bool Initialize();
        void Shutdown();
    };
}
