#============================================================
# Target Definition 
#============================================================
# Target Name
TARGET		:= $(notdir $(CURDIR))
# out | exe
FILE_EXT 	:= out
# Release | Debug
BUILD_MODE	:= Debug
# x86 | x64
BUILD_ARCH	:= x86
# 0 | 1
VERBOSE		:= 0


#============================================================
# Target Definition 
#============================================================
ifeq ($(VERBOSE), 0)
V := @
endif


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
	@printf "%-10s Product of $(TARGET)\n" "RM" 
	$(V)rm -rf $(OBJ_DIR)/*
	$(V)rm -rf $(DEF_DIR)/*
	$(V)rm -rf $(ASM_DIR)/$(TARGET).asm
	$(V)rm -rf $(MAP_DIR)/$(TARGET).map
	$(V)rm -rf $(EXE_DIR)/$(TARGET).$(FILE_EXT)


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
	@printf "%-10s $@\n" "LD" 
	$(V)$(LD) -o $@ $< $(LDFLAGS) -Xlinker -Map=$(MAP_DIR)/$(TARGET).map $(LIB_DIR) $(LIBS)


#============================================================
# Dump Target
#============================================================
$(ASM_DIR)/$(TARGET).asm: $(EXE_DIR)/$(TARGET).$(FILE_EXT) 
	@mkdir -p $(ASM_DIR)
	@printf "%-10s $@\n" "OBJCOPY" 
	$(V)$(OBJDUMP) -d $(EXE_DIR)/$(TARGET).$(FILE_EXT) > $(ASM_DIR)/$(TARGET).asm


#============================================================
# Make dependency files
#============================================================
# From *.c files
$(DEF_DIR)/%.d: %.c
	@mkdir -p $(dir $@)
	$(V)$(CC) $(INCS) $(CFLAGS) -M $< > $@

# From *.cpp files
$(DEF_DIR)/%.d: %.cpp
	@mkdir -p $(dir $@)
	$(V)$(CXX) $(INCS) $(CXXFLAGS) -M $< > $@


#============================================================
# Compile Source files
#============================================================
# From *.c files
$(OBJ_DIR)/%.o: %.c
	@mkdir -p $(dir $@)
	@printf "%-10s $<\n" "CC" 
	$(V)$(CC) $(INCS) $(CFLAGS) -c $< -o $@ -MMD -MF $(DEF_DIR)/$*.d

# From *.cpp files
$(OBJ_DIR)/%.o: %.cpp
	@mkdir -p $(dir $@)
	@printf "%-10s $<\n" "CXX" 
	$(V)$(CXX) $(INCS) $(CXXFLAGS) -c $< -o $@ -MMD -MF $(DEF_DIR)/$*.d

