# Clean Up Crew — Development Todo

> A Phasmophobia-inspired horror puzzle/survival game for the Nintendo Game Boy.
> Engine is designed as a reusable library for top-down sprite-based games.

---

## Phase 1: Engine Foundation

Core systems that everything else depends on.

### Sprite Engine
- [x] Sprite struct (8x8, position, velocity, visibility, hitbox)
- [x] MetaSprite16x16 struct (2x2 grid of sub-sprites, embedded array)
- [x] `init_sprite` / `init_16x16_meta`
- [x] `setup_sprite` / `setup_16x16_meta` (load pixel data, configure hardware)
- [x] `set_16x16_meta_position` (update OAM with hardware offsets)
- [x] `hide_16x16_meta` / `show_16x16_meta`
- [x] `detect_collision` (AABB, sprite vs sprite)
- [x] `detect_meta_collision` (AABB, sprite vs meta sprite)
- [x] `animate_16x16_meta` / `reset_16x16_meta_anim` — frame-counter-based walk animation (non-blocking); each frame is a 4-tile group; no-op until art adds a second frame

### Map Engine
- [x] `map_init` / `map_load` (tile graphics + tile map + collision map)
- [x] `map_get_tile_collision` (lookup collision value by tile coordinate)
- [x] `camera_init` / `camera_update` / `camera_apply` (follow player, clamp to map bounds)
- [x] **Tile collision integrated into `move_player()`** — per-axis AABB check against collision map; wall slide included

### Player
- [x] World-space position tracking (`player_world_x/y`)
- [x] Camera follows player; sprite stays fixed at screen center
- [x] Map boundary clamping (coordinate-based, pixel precision)
- [x] OAM hardware offset applied correctly to `move_sprite` calls
- [x] **Tile-based collision** — stop player from entering solid tiles (wall, box obstacles)
- [x] **Tile type response** — water tiles (`TILE_WATER`) halve movement speed; solid tiles block

---

## Phase 2: Player Polish

- [x] Wall slide — per-axis collision resolution (both axes checked independently)
- [x] Walk animation — `animate_16x16_meta` called every `PLAYER_ANIM_RATE` ticks while input held
- [x] Idle frame — `reset_16x16_meta_anim` returns to tile 0 when no input
- [x] Facing direction — `S_FLIPX` on all 4 sub-sprites + column swap in `set_16x16_meta_position` via `flip_x` flag
- [x] Movement speed — configurable per-axis (`player_speed_x/y`), foundation for later slow/speed effects

---

## Phase 3: Entity System

Game Boy can't do dynamic allocation. All entities live in fixed pools.

- [ ] `Entity` base type — position, type tag, active flag, optional sprite ref
- [ ] Entity pool — fixed-size array (size TBD based on ROM/RAM budget)
- [ ] Entity update loop — called each frame from `update()`
- [ ] Entity visibility culling — skip update/render for entities outside camera view
- [ ] Entity-to-player collision — trigger response when entity overlaps player
- [ ] Entity-to-tile collision — entities respect map solid tiles
- [ ] Simple patrol AI — entity walks a fixed path (A→B→A)
- [ ] Random walk AI — entity wanders within a bounded area

---

## Phase 4: Game Systems (Clean Up Crew Specific)

### Ghost
- [ ] Ghost entity — moves independently, has a home room/area
- [ ] Ghost AI states: idle, roaming, hunting
- [ ] Ghost visibility — can be toggled (ghost may be invisible at times)
- [ ] Ghost-player interaction — triggers fear/sanity effect on contact

### Equipment & Items
- [ ] Item entity type — static, player can walk over to collect
- [ ] Player inventory — fixed-slot system (e.g. 3 held items max)
- [ ] Equipment types (concept): EMF reader, flashlight, thermometer, spirit box
- [ ] Equipment use — mapped to A/B buttons, consumes battery or charges

### Evidence & Core Loop
- [ ] Evidence detection mechanic — equipment reads environmental data near ghost
- [ ] Evidence types: EMF level, temperature drop, ghost writing, etc.
- [ ] Evidence log — player records findings (select screen or journal item)
- [ ] Ghost identification — match 3 evidence types to identify ghost species
- [ ] Win condition — correctly identify ghost and escape
- [ ] Lose condition — sanity hits 0 or ghost catches player

### Sanity / Fear
- [ ] Sanity value (0–100, starts at 100, decays over time and near ghost)
- [ ] Fear events tied to low sanity (screen effects, ghost aggression increase)
- [ ] Sanity recovery mechanic (e.g. standing in lit area)

### Rooms & Areas
- [ ] Multi-room map layout (distinct areas within one large map, or separate maps)
- [ ] Map transition — move between rooms (door trigger → load next map, preserve player state)
- [ ] Lights system — rooms start dark; player can toggle lights (costs power?)
- [ ] Power/fuse box mechanic — ghost can cut power, disabling lights

---

## Phase 5: UI & Menus

- [ ] Title screen — game name, start prompt
- [ ] HUD — minimal in-game overlay (sanity indicator, held item icon)
- [ ] Pause menu — resume, quit
- [ ] Journal/evidence screen — review collected evidence, input ghost guess
- [ ] Game over screen — death or escape result

---

## Phase 6: Audio

- [ ] Footstep sound effect (tied to movement)
- [ ] Ambient background loop per area (silence, static, wind)
- [ ] Ghost event stingers (audio cue when ghost is active)
- [ ] Item pickup / use sounds
- [ ] Door open/close sound

---

## Phase 7: Polish & Release

- [ ] Real hardware testing (physical Game Boy or cartridge flash)
- [ ] Battery-backed save (SRAM) if targeting cartridge — save ghost journal, progress
- [ ] Credits screen
- [ ] ROM size audit — stay within target cartridge size (MBC type TBD)
- [ ] Final playtesting pass

---

## Deferred / Backlog

Items that are known but not yet scoped into a phase:

- **mGBA Lua test harness** — automate input simulation + memory assertion. Useful once 2–3 systems interact and cause regressions. Deferred until Phase 3.
- **Multiple player characters** — sprite retexture system exists (`texture_idx`), needs gameplay hook
- **Co-op concept** — second player sprite sharing the same map (stretch goal)
- **Custom font / text engine** — needed for evidence log and dialogue, not yet designed
- **Sprite flicker management** — GB hardware limits 10 sprites per scanline; may need priority/rotation system at higher entity counts

---

## Current Focus

> **Phase 3 → Entity System**
> Phases 1 and 2 are complete. Next: entity base type, fixed pool, and update loop. Walk animation
> requires a second art frame from Christian before it is visually active — the mechanism is wired
> and ready.
