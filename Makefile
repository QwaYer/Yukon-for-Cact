KERN_ROOT ?= $(abspath ../CactKernel-x86_32)
LOCAL_REPO ?= $(abspath ../LocalRepoCactOS)

_ACTIVE := $(filter-out clean,$(or $(MAKECMDGOALS),all))
ifneq ($(_ACTIVE),)
ifndef KERN_ROOT
$(error KERN_ROOT is required — path to kernel sources with Cact/ headers)
endif
ifndef LOCAL_REPO
$(error LOCAL_REPO is required — directory whose lib/ receives *.cctk)
endif
endif
INSTALL_DIR := $(LOCAL_REPO)/lib

MOD_CFLAGS := -m32 -ffreestanding -fno-pie -fno-stack-protector -nostdlib \
	-I$(KERN_ROOT)/Cact/kernel/net \
	-I$(KERN_ROOT)/Cact/kernel/sync \
	-I$(KERN_ROOT)/Cact/kernel/core \
	-I$(KERN_ROOT)/Cact/drivers/pci/enum \
	-I$(KERN_ROOT)/Cact/drivers/pci \
	-I. \
	-Wall -O2

.PHONY: all install clean

all: yukon.cctk

yukon.cctk: yukon_mod.o
	cp -f $< $@

yukon_mod.o: yukon_mod.c yukon.h
	gcc $(MOD_CFLAGS) -c yukon_mod.c -o $@

install: yukon.cctk
	@mkdir -p $(INSTALL_DIR)
	cp -f yukon.cctk $(INSTALL_DIR)/yukon.cctk
	@echo "installed: $(INSTALL_DIR)/yukon.cctk"

clean:
	rm -f yukon_mod.o yukon.cctk
