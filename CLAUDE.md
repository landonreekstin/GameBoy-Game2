# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Game Boy game development project using GBDK (GameBoy Development Kit). The main game is "Clean Up Crew," a Phasmophobia-inspired horror puzzle and survival game for the Nintendo Game Boy.

**Authors:** Landon Reekstin (Software Development), Christian Blaney (Artistic Design)

### Engine Goals

The engine is being developed as a reusable library/API for top-down sprite-based character games similar to:
- **Phasmophobia** (horror/puzzle/survival concept)
- **Pokemon** (top-down RPG)
- **The Legend of Zelda** (top-down action/adventure)

**Target Features:**
- Camera/viewport system that follows the player
- Smooth map scrolling
- Tile-based collision detection
- Entity management system (NPCs, enemies, items)
- Sprite animation system
- Input handling and state management
- Modular, reusable architecture

## Build System

### Prerequisites
- GBDK installed at `/opt/gbdk/` (or set `GBDK_HOME` environment variable)
- The project uses the LCC compiler from GBDK
- Development environment configured for Nix

### Build Commands

All build commands must be run from the `Clean_Up_Crew/` directory:

```bash
cd Clean_Up_Crew

# Clean build artifacts
make clean

# Standard build
make

# Debug build (generates .cdb, .noi, .map files for debugging)
make debug
```

The output ROM is generated at `Clean_Up_Crew/build/Clean_Up_Crew.gb`

### VS Code Tasks

- **Build (Debug)**: Default build task (Ctrl+Shift+B) - runs `make debug` with automatic clean
- **Clean**: Removes all build artifacts

## Running and Debugging

### Emulator Testing
The ROM file can be tested in any Game Boy emulator. The project is configured for:
- **mGBA**: General emulator testing
- **Emulicious**: Debugging with breakpoints and symbol support

### Debugging in VS Code
The project includes an Emulicious debugger configuration:
1. Press F5 to launch debug session
2. Automatically builds with debug symbols
3. Stops on entry
4. Debug symbols (.cdb, .noi, .map files) are in the `build/` directory

## Project Architecture

### Directory Structure

```
Clean_Up_Crew/
├── src/                          # Source code
│   ├── Clean_Up_Crew.c          # Main entry point and game loop
│   ├── engine/                   # Core engine systems
│   │   ├── Map_Engine.c         # Background/tilemap rendering
│   │   ├── Sprite_Engine.c      # Sprite management and collision
│   │   ├── Sound.c              # Audio system
│   │   └── System.c             # Low-level system utilities
│   └── gameplay/                 # Game-specific logic
│       ├── Players/Player.c     # Player character logic
│       └── Maps/                # Map implementations
├── include/                      # Header files (mirrors src/ structure)
├── assets/                       # Game assets
│   └── sprites/                 # Sprite graphics
└── resources/                    # Additional resources
```

### Engine Systems

The codebase uses a custom engine architecture with several key systems:

#### 1. Sprite Engine (`Sprite_Engine.h/c`)
- **Sprite struct**: 8x8 pixel sprites with position, velocity, visibility, and hitbox
- **MetaSprite16x16 struct**: Composite sprites made of four 8x8 tiles (embedded array, not pointers)
  - Uses `Sprite tiles[4]` for better memory locality and cache performance
  - Tiles arranged as: [0]=top-left, [1]=top-right, [2]=bottom-left, [3]=bottom-right
- **Architecture improvements** (refactored 2025):
  - All repetitive operations use loops for code efficiency
  - Standardized on `uint8_t` types throughout
  - Single unified API (removed old/new API confusion)
  - Proper AABB collision detection
- Key functions:
  - `init_sprite()`: Initialize single sprite with all properties
  - `init_16x16_meta()`: Initialize meta sprite (no longer requires separate tile pointers)
  - `setup_sprite()` / `setup_16x16_meta()`: Load pixel data and configure sprite
  - `translate_sprite()` / `translate_16x16_meta()`: Handle joypad movement
  - `hide_16x16_meta()` / `show_16x16_meta()`: Visibility helpers
  - `detect_collision()`, `detect_meta_collision()`: Sprite-to-sprite collision (AABB)
  - `detect_map_collision()`, `detect_meta_map_collision()`: Sprite-to-tilemap collision (stubs)

#### 2. Map Engine (`Map_Engine.h/c`)
- Manages background tiles and scrolling
- `map_setup()`: Loads tile data and enables background layer
- `scroll_map()`: Scrolls the background map

#### 3. Game Loop (`Clean_Up_Crew.c`)
The main file follows a standard game loop pattern:
- `init_game()`: Initialize systems and load starting map
- `game_loop()`: Infinite loop calling update and input handlers
- `input()`: Process joypad input
- `update()`: Update game state (currently stubbed)

### Important Implementation Details

#### Sprite System
- Game Boy sprites are 8x8 pixels (hardware limitation)
- Larger sprites use the MetaSprite16x16 system (4 tiles arranged in 2x2 grid)
- **MetaSprite16x16 uses embedded array** (`Sprite tiles[4]`), not separate pointers
  - This improves memory layout and reduces fragmentation
  - No need to declare separate Sprite variables when creating meta sprites
- **Example usage**:
  ```c
  MetaSprite16x16 player;
  init_16x16_meta(&player, 0, 0, 4, 0, 50, 50);  // Simple, clean API
  setup_16x16_meta(&player, sprite_pixels);
  ```
- When working with sprites, always consider whether you need a Sprite or MetaSprite16x16

#### Build Process
- The Makefile uses `lcc` (GBDK's compiler) with `-msm83:gb` flag for Game Boy target
- Linking requires both `gb.lib` and `sm83.lib` libraries
- Debug builds add `-debug` flag to generate symbol files
- Object files are organized in `build/obj/` mirroring source structure
- Debug symbols (.cdb, .noi, .map) are automatically moved to `build/` directory

#### GBDK Integration
- Uses GBDK's `gb/gb.h` for hardware access
- Common GBDK macros: `SHOW_BKG`, `DISPLAY_ON`, `SPRITES_8x8`
- Uses GBDK types: `UINT8`, `INT8`, etc.

## Development Workflow

### Standard Workflow
1. Make source changes in `src/` or `include/`
2. Run `make clean && make debug` from `Clean_Up_Crew/` directory
3. Test ROM in emulator (`build/Clean_Up_Crew.gb`)
4. For debugging, use VS Code's Emulicious debugger (F5)

### Incremental Changes During Refactoring
**IMPORTANT**: When making incremental changes to the codebase (especially engine refactors):
1. Make a logical set of changes (e.g., one phase of a refactor)
2. **Always build immediately** with `cd Clean_Up_Crew && make clean && make debug`
3. Verify the build succeeds before proceeding to next changes
4. If build fails, fix errors before continuing
5. This ensures changes are validated incrementally and prevents cascading errors

Example workflow:
```bash
# After editing Sprite_Engine.h and Sprite_Engine.c
cd Clean_Up_Crew
make clean && make debug

# If successful, proceed to next changes
# If errors, fix them before moving forward
```

## File Permissions

When creating or modifying files, ensure they have appropriate permissions for the user `lando`:
```bash
chown lando:lando <filename>
chmod 644 <filename>  # For regular files
chmod 755 <filename>  # For executable files
```

## Git Workflow

- Main branch: `master`
- Build artifacts (`build/`, `*.gb`, `*.cdb`, `*.noi`, `*.map`) are gitignored
- Emulicious debug files are excluded from version control

### Commit Message Style

Follow the established commit message convention:
```
type(scope): description
```

**Types**: `feat`, `fix`, `refactor`, `tweak`, `test`, `docs`
- `feat` - New features or functionality
- `fix` - Bug fixes
- `refactor` - Code restructuring without behavior change
- `tweak` - Minor adjustments or configuration changes
- `test` - Testing changes
- `docs` - Documentation updates

**Guidelines**:
- Use lowercase for the description
- No period at the end
- Keep descriptions concise
- Scope should be the relevant system or module (e.g., `sprite`, `map`, `player`, `build`, `env`)
- **Do not add Co-Authored-By or AI attribution lines**

**Examples**:
```
feat(sprite): add 16x16 meta sprite animation support
fix(player): correct collision detection offset
refactor(map): simplify tile loading loop
tweak(build): adjust lcc optimization flags
docs(claude): update debugging workflow
```

### Branching Strategy

- **Direct to master**: Documentation changes (`docs`), minor tweaks (`tweak`), and simple fixes can be committed directly to master after a successful build
- **Feature/PR branches**: Use branches for new features, significant refactors, or changes that need review. Build and verify on the branch first, then open a PR to merge into master
- **Never commit broken builds to master**: Only merge once `make debug` succeeds and the ROM runs correctly in the emulator

### Workflow

**CRITICAL: Always build before committing.** A successful `make debug` is required before any commit.

1. **Branch** (if needed) — create a feature/fix branch
2. **Edit** source files in `src/` or `include/`
3. **Build** — `cd Clean_Up_Crew && make clean && make debug`
4. **Verify** — test the ROM in mGBA or Emulicious
5. **Commit** — only after steps 3 and 4 succeed
6. **PR** — open via `gh pr create` if on a feature branch

**Workflow by scenario**:
1. **Feature/fix**: Branch → Edit → Build → Verify → Commit → PR → Merge
2. **Docs/tweak**: Edit → Commit directly to master (no build required for docs-only)
