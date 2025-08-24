#include "engine.h"
#include <raylib.h>

class Engine : public core::Engine
{
public:
    Camera camera = {0};

    bool Initialize()
    {
        const int screenWidth = 400;
        const int screenHeight = 240;

        InitWindow(screenWidth, screenHeight, "Project OSE");

        SetExitKey(KEY_NULL);
        
        camera.position = Vector3{0.0f, 2.0f, 4.0f}; // Camera position
        camera.target = Vector3{0.0f, 2.0f, 0.0f};   // Camera looking at point
        camera.up = Vector3{0.0f, 1.0f, 0.0f};       // Camera up vector (rotation towards target)
        camera.fovy = 60.0f;                           // Camera field-of-view Y
        camera.projection = CAMERA_PERSPECTIVE;        // Camera projection type

        DisableCursor();
        SetTargetFPS(60);

        return true;
    }

    void Shutdown()
    {
        CloseWindow();
    }
};