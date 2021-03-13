#============================================================
# Path of Build Product
#============================================================
BIN_DIR		:= ../build
OBJ_DIR		:= $(BIN_DIR)/obj/$(TARGET)
DEF_DIR		:= $(BIN_DIR)/dep/$(TARGET)
EXE_DIR		:= $(BIN_DIR)/exe
LIB_DIR		:= $(BIN_DIR)/lib
MAP_DIR		:= $(BIN_DIR)/map
ASM_DIR		:= $(BIN_DIR)/asm


#============================================================
# Path of Include directoies
#============================================================
INC_PATH	:= Include


#============================================================
# Path of Source lists
#============================================================
CSRCS		:= Source/main.c


#============================================================
# Path of Libraries
#============================================================
LIB_PATH	:=

#============================================================
# Name of Libraries
#============================================================
LIB_NAME	:=

#============================================================
# Convert Object & Denpendency file lists from Source Lists
# Add compiler option(-L, -l)
# (Must be Located at last line)
#============================================================
OBJS		:= $(addprefix $(OBJ_DIR)/, $(CSRCS:.c=.o))
DEPS		:= $(addprefix $(DEF_DIR)/, $(CSRCS:.c=.d))
LIBS		:= $(addprefix -l, $(LIB_NAME))
LIB_DIR		:= $(addprefix -L , $(LIB_PATH))
INCS		:= $(addprefix -I , $(INC_PATH))
