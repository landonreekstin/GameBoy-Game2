/**
 * @brief Debug utilities implementation
 */

#include "../../include/engine/Debug.h"
#include "../../include/engine/Map_Engine.h"
#include <gb/emu_debug.h>
#include <stdio.h>

#if DEBUG_ENABLED

void debug_print(const char* msg)
{
    // Use EMU_printf for Emulicious console output
    EMU_printf("%s\n", msg);
}

void debug_print_value(const char* label, uint16_t value)
{
    EMU_printf("%s: %u\n", label, value);
}

void debug_print_camera(const void* cam)
{
    const Camera* camera = (const Camera*)cam;
    EMU_printf("=== CAMERA DEBUG ===\n");
    EMU_printf("Camera X: %u\n", camera->x);
    EMU_printf("Camera Y: %u\n", camera->y);
    EMU_printf("Target X: %u\n", camera->target_x);
    EMU_printf("Target Y: %u\n", camera->target_y);
    EMU_printf("Map W: %u, H: %u\n", camera->map_width_pixels, camera->map_height_pixels);
    EMU_printf("==================\n");
}

#endif
