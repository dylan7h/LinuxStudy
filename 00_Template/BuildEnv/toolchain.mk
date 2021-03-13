#============================================================
# Set Toolchain
#============================================================
AS		:= clang
CC		:= clang
CXX		:= clang++
AR		:= clang
LD		:= clang++
OBJDUMP	:= llvm-objdump

#============================================================
# Set Toolchain Options
#============================================================
AFLAGS		:= 
CFLAGS		:= -std=c99 -Wall
CXXFLAGS	:= -std=c++17 -Wall
LDFLAGS		:= 

ifeq ($(BUILD_MODE), Release)
CFLAGS		+= -O2
CXXFLAGS	+= -O2
endif

ifeq ($(BUILD_MODE), Debug)
CFLAGS		+= -g
CXXFLAGS	+= -g
endif
