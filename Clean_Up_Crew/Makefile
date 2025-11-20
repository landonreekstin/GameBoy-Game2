# Get the GBDK location from the environment.
GBDK_HOME ?= /opt/gbdk/

# --- Tool Definitions ---
LCC = $(GBDK_HOME)/bin/lcc

# --- Flags ---
LCC_FLAGS = -msm83:gb
LCC_FLAGS += $(DEBUG_FLAGS)

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

all: $(ROM_FILE)

$(ROM_FILE): $(OBJECTS)
	@mkdir -p $(BUILD_DIR)
	@echo "Linking $(PROJECT_NAME)..."
	$(LCC) $(LCC_FLAGS) -o $@ -no-crt -no-libs $(GBDK_CRT) $(OBJECTS) $(GBDK_GB_LIB) $(GBDK_CORE_LIB)
	@# Move debug symbols to build dir
	@mv *.cdb $(BUILD_DIR)/ 2>/dev/null || true
	@mv *.noi $(BUILD_DIR)/ 2>/dev/null || true
	@mv *.map $(BUILD_DIR)/ 2>/dev/null || true
	@echo "Successfully created $(ROM_FILE)"

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(@D)
	@echo "Compiling $<..."
	$(LCC) $(LCC_FLAGS) -c -o $@ $<

clean:
	@echo "Cleaning build artifacts..."
	rm -rf $(BUILD_DIR)

.PHONY: all clean debug

debug:
	$(MAKE) all DEBUG_FLAGS="-debug"