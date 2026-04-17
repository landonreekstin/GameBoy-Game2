/**
 * @brief Extern declarations for item sprite pixel arrays.
 *
 * @details Defined in resources/Sprites/ItemSprites.c.
 *          Each is 64 bytes (4 tiles × 16 bytes, 16×16 meta sprite).
 *          Pass to entity_spawn() with the init_tile values below:
 *
 *            EMFReaderSprite    init_tile=8   (VRAM tiles 8-11)
 *            FlashlightSprite   init_tile=12  (VRAM tiles 12-15)
 *            ThermometerSprite  init_tile=16  (VRAM tiles 16-19)
 *            SpiritBoxSprite    init_tile=20  (VRAM tiles 20-23)
 */

#ifndef ITEM_SPRITES_H
#define ITEM_SPRITES_H

#include <stdint.h>

#define ITEM_SPRITE_EMF_INIT_TILE    8
#define ITEM_SPRITE_FLASH_INIT_TILE  12
#define ITEM_SPRITE_THERM_INIT_TILE  16
#define ITEM_SPRITE_SBOX_INIT_TILE   20
#define ITEM_SPRITE_TILE_COUNT       4

extern uint8_t EMFReaderSprite[];
extern uint8_t FlashlightSprite[];
extern uint8_t ThermometerSprite[];
extern uint8_t SpiritBoxSprite[];

#endif /* ITEM_SPRITES_H */
