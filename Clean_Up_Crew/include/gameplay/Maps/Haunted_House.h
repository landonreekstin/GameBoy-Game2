/**
 * @brief Haunted House map header.
 *
 * @details 32x32 tile map (256x256 pixels) with 5 distinct rooms:
 *            Entrance, Kitchen, Hallway, Living Room, Library, Master Bedroom
 *
 *          Tile types:
 *            0 = Floor    (lit wooden planks)
 *            1 = Wall     (stone blocks, solid)
 *            2 = DarkFloor (bedroom — same planks, dark palette)
 *            3 = Doorway  (walkable threshold between rooms)
 *
 *          World-space spawn positions (pixels):
 *            Player : (40, 40)   — Entrance
 *            Ghost  : (200, 136) — Library
 *            EMF    : (160, 40)  — Kitchen
 *            Flash  : (64, 144)  — Living Room
 *            Therm  : (176, 128) — Library
 *            SBox   : (160, 216) — Master Bedroom
 */

#ifndef HAUNTED_HOUSE_H
#define HAUNTED_HOUSE_H

#include <stdint.h>

#define HAUNTED_HOUSE_WIDTH       32
#define HAUNTED_HOUSE_HEIGHT      32
#define HAUNTED_HOUSE_TILE_COUNT   4   /* floor, wall, dark_floor, doorway */

extern const uint8_t haunted_house_tiles[];
extern const uint8_t haunted_house_data[];
extern const uint8_t haunted_house_collision[];

#endif /* HAUNTED_HOUSE_H */
