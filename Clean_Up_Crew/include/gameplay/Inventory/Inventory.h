/**
 * @brief 3-slot player inventory for equipment items.
 *
 * @details Items are stored by type (ITEM_* constants). The active slot
 *          is cycled with J_B. The active item is used with J_A, which
 *          dispatches to equipment-specific logic (evidence detection,
 *          flashlight toggle, etc.).
 *
 *          Item subtypes are stored in entity->ai_dir for ENTITY_ITEM
 *          entities (avoids adding a field to the Entity struct).
 *          Subtype constants map to item type constants via +1 offset:
 *            ITEM_SUBTYPE_EMF=0  ->  ITEM_EMF_READER=1
 *            ITEM_SUBTYPE_FLASHLIGHT=1  ->  ITEM_FLASHLIGHT=2
 *            ITEM_SUBTYPE_THERMOMETER=2  ->  ITEM_THERMOMETER=3
 *            ITEM_SUBTYPE_SPIRIT_BOX=3  ->  ITEM_SPIRIT_BOX=4
 */

#ifndef INVENTORY_H
#define INVENTORY_H

#include <stdint.h>

/***************************************
 * Item type constants
 **************************************/
#define ITEM_NONE          0
#define ITEM_EMF_READER    1
#define ITEM_FLASHLIGHT    2
#define ITEM_THERMOMETER   3
#define ITEM_SPIRIT_BOX    4

/***************************************
 * Entity ai_dir subtypes (used during spawn, converted on pickup)
 **************************************/
#define ITEM_SUBTYPE_EMF          0
#define ITEM_SUBTYPE_FLASHLIGHT   1
#define ITEM_SUBTYPE_THERMOMETER  2
#define ITEM_SUBTYPE_SPIRIT_BOX   3

#define INVENTORY_SIZE  3

/***************************************
 * State
 **************************************/
extern uint8_t inventory[INVENTORY_SIZE];
extern uint8_t active_slot;

/***************************************
 * Function Prototypes
 **************************************/

/**
 * @brief Clear all inventory slots and reset active slot to 0.
 */
void inventory_init(void);

/**
 * @brief Add an item to the first free slot. Converts ai_dir subtype to ITEM_* type.
 *
 * @param subtype  Entity ai_dir value (ITEM_SUBTYPE_*).
 * @return 1 if the item was added successfully, 0 if inventory is full.
 */
uint8_t inventory_add(uint8_t subtype);

/**
 * @brief Advance active_slot to the next occupied slot (wraps around).
 */
void inventory_cycle_slot(void);

/**
 * @brief Return the item type in the currently active slot.
 */
uint8_t inventory_get_active(void);

/**
 * @brief Use the item in the active slot. Dispatches by item type.
 */
void inventory_use_active(void);

#endif /* INVENTORY_H */
