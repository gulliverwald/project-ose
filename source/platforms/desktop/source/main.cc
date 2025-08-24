#include <raylib.h>
#include <player_character.h>
#include <skills.h>

#include <iostream>

#include "engine.cc"

int main()
{
    Engine engine;

    Skill skill{"AG", 2, "Agilidade"};

    core::PlayerCharacter playerCharacter;
    playerCharacter.UpdateSkillSet(&skill);

    bool hasStarted = {engine.Initialize()};

    if (!hasStarted)
    {
        return 0;
    }

    bool exitWindowRequested = false;
    bool exitWindow = false;

    while (!exitWindow)
    {
        BeginDrawing();
        ClearBackground(Color{1, 11, 19});

        if (WindowShouldClose() || IsKeyPressed(KEY_ESCAPE))
        {
            exitWindowRequested = true;
        }

        if (exitWindowRequested)
        {
            // A request for close window has been issued, we can save data before closing
            // or just show a message asking for confirmation
            if (IsKeyPressed(KEY_Y))
            {
                exitWindow = true;
            }
            else if (IsKeyPressed(KEY_N))
            {
                exitWindowRequested = false;
            }
        }

        UpdateCamera(&engine.camera, CAMERA_THIRD_PERSON);

        BeginMode3D(engine.camera);

            DrawPlane(Vector3{0.0f, 0.0f, 0.0f}, Vector2{32.0f, 32.0f}, LIGHTGRAY);
            DrawCube(engine.camera.target, 0.5f, 0.5f, 0.5f, PURPLE);
            DrawCubeWires(engine.camera.target, 0.5f, 0.5f, 0.5f, DARKPURPLE);

        EndMode3D();

        if (exitWindowRequested)
        {
            Vector2 screenPosition = GetWorldToScreen(engine.camera.target, engine.camera);
            const char *confirmTxt = "Are you sure you want to exit program? [Y/N]";

            DrawRectangle(0, 0, 400, 240, BLACK);
            DrawText(confirmTxt, 200 - (MeasureText(confirmTxt, 16) / 2), 120, 16, WHITE);
        }

        EndDrawing();
    }

    engine.Shutdown();

    return 0;
}