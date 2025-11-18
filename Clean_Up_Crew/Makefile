# Get the GBDK location from the environment.
GBDK_HOME ?= /opt/gbdk/

# --- Tool Definitions ---
LCC = $(GBDK_HOME)/bin/lcc

# --- Flags ---
LCC_FLAGS = -msm83:gb

# --- File Paths ---
PROJECT_NAME = Clean_Up_Crew
SRC_DIR      = src
BUILD_DIR    = build
OBJ_DIR      = $(BUILD_DIR)/obj

# Define the final ROM and find all sources/objects.
ROM_FILE     = $(BUILD_DIR)/$(PROJECT_NAME).gb
SOURCES      := $(shell find $(SRC_DIR) -name '*.c')
OBJECTS      := $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SOURCES))

# Explicitly define the GBDK startup object and BOTH required libraries.
GBDK_CRT = $(GBDK_HOME)/lib/gb/crt0.o
GBDK_GB_LIB = $(GBDK_HOME)/lib/gb/gb.lib
GBDK_CORE_LIB = $(GBDK_HOME)/lib/sm83/sm83.lib

# --- Build Rules ---

# The default target is the final ROM.
all: $(ROM_FILE)

# This is the main rule to link the final ROM from all object files.
$(ROM_FILE): $(OBJECTS)
	@echo "Linking $(PROJECT_NAME)..."
	# Final, explicit linking command:
	# 1. Call lcc with flags and the output file (-o $@)
	# 2. Tell lcc NOT to add its own crt0.o or any libraries.
	# 3. Provide the full path to the correct C runtime object (crt0.o).
	# 4. Provide all of our project's compiled object files.
	# 5. Provide the Game Boy library, then the core C library, at the very end.
	$(LCC) $(LCC_FLAGS) -o $@ -no-crt -no-libs $(GBDK_CRT) $(OBJECTS) $(GBDK_GB_LIB) $(GBDK_CORE_LIB)
	@echo "Successfully created $(ROM_FILE)"

# Rule to compile a C source file (.c) into an object file (.o).
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(@D)
	@echo "Compiling $<..."
	$(LCC) $(LCC_FLAGS) -c -o $@ $<

# Rule to clean up all build artifacts.
clean:
	@echo "Cleaning build artifacts..."
	rm -rf $(BUILD_DIR)

# Mark these targets as "phony" so make doesn't confuse them with files.
.PHONY: all clean