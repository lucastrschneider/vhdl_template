# Name: Makefile
# Author: Lucas Haug
# Author: Lucas Schneider
# 06/2020

# Makefile for VHDL projects

###############################################################################
## Input files
###############################################################################

# Build directory
WORK_DIR := work

# Source directories
CPNT_DIR := component
TB_DIR := testbench

# Source Files
CPNT_TARGETS	:= $(wildcard $(CPNT_DIR)/*.vhd)
TB_TARGETS		:= $(wildcard $(TB_DIR)/*.vhd)
ALL_TARGETS		:= $(CPNT_TARGETS) $(TB_TARGETS)

# Name of the component to be tested
CPNT ?= mux_4t1

# Default values, can be set on the command line or here
DEBUG	?= 1
VISUAL	?= 0
VERBOSE	?= 1

###############################################################################
## Compiler settings
###############################################################################

# Executable
GHDL := ghdl
VERSION := 93c

# Generic flags
GHDL_FLAGS := --std=$(VERSION) --workdir=$(WORK_DIR)

ifeq ($(DEBUG), 1)
GHDL_FLAGS += -v
endif

# Verbosity
ifeq ($(VERBOSE),0)
AT := @
else
AT :=
endif

###############################################################################
## Build and Auxiliary Targets
###############################################################################

# General
analyse: | $(WORK_DIR)
	$(AT)$(GHDL) -a $(GHDL_FLAGS) $(ALL_TARGETS)

check_syntax: | $(WORK_DIR)
	$(AT)$(GHDL) -s $(GHDL_FLAGS) $(ALL_TARGETS)

clean:
	$(AT)rm -rf $(WORK_DIR)

$(WORK_DIR):
	$(AT)mkdir -p $(WORK_DIR)


# Tests
test: | $(WORK_DIR)
	$(AT)$(GHDL) -r $(GHDL_FLAGS) $(CPNT)_tb --vcd=$(WORK_DIR)/$(CPNT)_test.vcd
ifeq ($(VISUAL), 1)
	gtkwave $(WORK_DIR)/$(CPNT)_test.vcd
endif

###############################################################################

.PHONY: analyse check_syntax clean test

.DEFAULT_GOAL := analyse