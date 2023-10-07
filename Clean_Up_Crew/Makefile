# GBDK root directory
GBDK_HOME = C:/gbdk/

# Compiler and linker flags for Game Boy
LCC = $(GBDK_HOME)bin/lcc -Wa-l -Wl-m -Wl-j -DUSE_SFR_FOR_REG -debug

PROJECTNAME = build/buildfiles/Clean_Up_Crew.gb

SRC_DIR = src

BUILD_DIR = build/buildfiles

CSOURCES := $(wildcard $(SRC_DIR)/*.c) $(wildcard $(SRC_DIR)/engine/*.c) $(wildcard $(SRC_DIR)/gameplay/*.c) $(SRC_DIR)/Clean_Up_Crew.c

COBJECTS := $(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.o,$(CSOURCES))

DEPFILES := $(CSOURCES:$(SRC_DIR)/%.c=$(BUILD_DIR)/%.d)

BINS := $(PROJECTNAME)

all: $(BINS)

$(BUILD_DIR)/%.d: $(SRC_DIR)/%.c
	@set -e; rm -f $@; \
	$(LCC) -MM $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
	rm -f $@.$$$$

-include $(DEPFILES)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(@D)
	$(LCC) -c $< -o $@

$(PROJECTNAME): $(COBJECTS)
	$(LCC) -o $@ $^

clean: 
	rm -rf $(BUILD_DIR)/*.o $(BUILD_DIR)/*.d $(BUILD_DIR)/*.lst $(BUILD_DIR)/*.map $(BUILD_DIR)/*.gb $(BUILD_DIR)/*.ihx $(BUILD_DIR)/*.sym $(BUILD_DIR)/*.cdb $(BUILD_DIR)/*.adb $(BUILD_DIR)/*.asm

.PHONY: all clean



