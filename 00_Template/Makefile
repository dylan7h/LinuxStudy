#============================================================
# Target Definition 
#============================================================
TARGET		:= 00_Template
FILE_EXT 	:= out
BUILD_MODE	:= Release

VERBOSE		:= 0

#============================================================
# Include Build Environments
#============================================================
include BuildEnv/toolchain.mk
include BuildEnv/path.mk


#============================================================
# Default Make Target
#============================================================
all: $(DEPS) $(ASM_DIR)/$(TARGET).asm


#============================================================
# Clean Target
#============================================================
clean:
ifeq ($(VERBOSE), 1)
	rm -rf $(OBJ_DIR)/*
	rm -rf $(DEF_DIR)/*
	rm -rf $(ASM_DIR)/$(TARGET).asm
	rm -rf $(MAP_DIR)/$(TARGET).map
	rm -rf $(EXE_DIR)/$(TARGET).$(FILE_EXT)
else
	@printf "%-10s Product of $(TARGET)\n" "RM" 
	@rm -rf $(OBJ_DIR)/*
	@rm -rf $(DEF_DIR)/*
	@rm -rf $(ASM_DIR)/$(TARGET).asm
	@rm -rf $(MAP_DIR)/$(TARGET).map
	@rm -rf $(EXE_DIR)/$(TARGET).$(FILE_EXT)
endif


#============================================================
# Run Target
#============================================================
run:
	@$(EXE_DIR)/$(TARGET).$(FILE_EXT)


#============================================================
# Link Object files --> Make Executable file
#============================================================
$(EXE_DIR)/$(TARGET).$(FILE_EXT): $(OBJS)
	@mkdir -p $(EXE_DIR)
	@mkdir -p $(MAP_DIR)
	@mkdir -p $(ASM_DIR)
ifeq ($(VERBOSE), 1)
	$(LD) -o $@ $< $(LDFLAGS) -Xlinker -Map=$(MAP_DIR)/$(TARGET).map $(LIB_DIR) $(LIBS)
else
	@printf "%-10s $@\n" "LD" 
	@$(LD) -o $@ $< $(LDFLAGS) -Xlinker -Map=$(MAP_DIR)/$(TARGET).map $(LIB_DIR) $(LIBS)
endif


#============================================================
# Dump Target
#============================================================
$(ASM_DIR)/$(TARGET).asm: $(EXE_DIR)/$(TARGET).$(FILE_EXT) 
	@mkdir -p $(ASM_DIR)
ifeq ($(VERBOSE), 1)
	$(OBJDUMP) -d $(EXE_DIR)/$(TARGET).$(FILE_EXT) > $(ASM_DIR)/$(TARGET).asm
else
	@printf "%-10s $@\n" "OBJCOPY" 
	@$(OBJDUMP) -d $(EXE_DIR)/$(TARGET).$(FILE_EXT) > $(ASM_DIR)/$(TARGET).asm
endif


#============================================================
# Make dependency files
#============================================================
# From *.c files
$(DEF_DIR)/%.d: %.c
	@mkdir -p $(dir $@)
ifeq ($(VERBOSE), 1)
	$(CC) $(INCS) $(CFLAGS) -M $< > $@
endif

# From *.cpp files
$(DEF_DIR)/%.d: %.cpp
	@mkdir -p $(dir $@)
ifeq ($(VERBOSE), 1)
	$(CXX) $(INCS) $(CXXFLAGS) -M $< > $@
endif


#============================================================
# Compile Source files
#============================================================
# From *.c files
$(OBJ_DIR)/%.o: %.c
	@mkdir -p $(dir $@)
ifeq ($(VERBOSE), 1)
	$(CC) $(INCS) $(CFLAGS) -c $< -o $@ -MMD -MF $(DEF_DIR)/$*.d
else
	@printf "%-10s $<\n" "CC" 
	@$(CC) $(INCS) $(CFLAGS) -c $< -o $@ -MMD -MF $(DEF_DIR)/$*.d
endif

# From *.cpp files
$(OBJ_DIR)/%.o: %.cpp
	@mkdir -p $(dir $@)
ifeq ($(VERBOSE), 1)
	$(CC) $(INCS) $(CFLAGS) -c $< -o $@ -MMD -MF $(DEF_DIR)/$*.d
else
	@printf "%-10s $<\n" "CXX" 
	@$(CXX) $(INCS) $(CXXFLAGS) -c $< -o $@ -MMD -MF $(DEF_DIR)/$*.d
endif
