/**
 * @brief Inventory implementation.
 *
 * @details Equipment use dispatches here. Each item type calls the appropriate
 *          evidence collection or game state function.
 */

#include "../../../include/gameplay/Inventory/Inventory.h"
#include "../../../include/gameplay/Evidence/Evidence.h"
#include "../../../include/gameplay/GameState/GameState.h"
#include "../../../include/engine/Debug.h"

uint8_t inventory[INVENTORY_SIZE];
uint8_t active_slot = 0;

void inventory_init(void)
{
    uint8_t i;
    for (i = 0; i < INVENTORY_SIZE; i++) {
        inventory[i] = ITEM_NONE;
    }
    active_slot = 0;
}

uint8_t inventory_add(uint8_t subtype)
{
    uint8_t i;
    uint8_t item_type = subtype + 1;  /* ITEM_SUBTYPE_* + 1 = ITEM_* */

    for (i = 0; i < INVENTORY_SIZE; i++) {
        if (inventory[i] == ITEM_NONE) {
            inventory[i] = item_type;
            debug_print("Item picked up!");
            debug_print_value("Item type", item_type);
            debug_print_value("Slot", i);
            return 1;
        }
    }
    debug_print("Inventory full!");
    return 0;
}

void inventory_cycle_slot(void)
{
    uint8_t i;
    /* Find next occupied slot after active_slot (wraps) */
    for (i = 1; i <= INVENTORY_SIZE; i++) {
        uint8_t next = (active_slot + i) % INVENTORY_SIZE;
        if (inventory[next] != ITEM_NONE) {
            active_slot = next;
            debug_print_value("Active item", inventory[active_slot]);
            return;
        }
    }
    /* No other item found; show current */
    debug_print_value("Active item (only)", inventory[active_slot]);
}

uint8_t inventory_get_active(void)
{
    return inventory[active_slot];
}

void inventory_use_active(void)
{
    uint8_t item = inventory_get_active();
    uint8_t near = is_near_ghost();

    switch (item) {
        case ITEM_NONE:
            debug_print("No item equipped");
            break;

        case ITEM_EMF_READER:
            debug_print("Using EMF Reader...");
            if (near) {
                evidence_collect(EVIDENCE_EMF5);
            } else {
                debug_print("Ghost not in range");
            }
            break;

        case ITEM_FLASHLIGHT:
            toggle_flashlight();
            break;

        case ITEM_THERMOMETER:
            debug_print("Using Thermometer...");
            if (near) {
                evidence_collect(EVIDENCE_FREEZING);
            } else {
                debug_print("Ghost not in range");
            }
            break;

        case ITEM_SPIRIT_BOX:
            debug_print("Using Spirit Box...");
            if (near) {
                evidence_collect(EVIDENCE_SPIRIT_BOX);
            } else {
                debug_print("Ghost not in range");
            }
            break;
    }
}
