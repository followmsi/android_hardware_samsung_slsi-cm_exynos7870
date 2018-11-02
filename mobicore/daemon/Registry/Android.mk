# =============================================================================
#
# Module: MobiCore driver registry
#
# =============================================================================

# Add new folders with header files here
LOCAL_C_INCLUDES += $(LOCAL_PATH)/Registry/Public

# Add new source files here
LOCAL_SRC_FILES	 += Registry/Registry.cpp

LOCAL_CFLAGS += -Wno-unused-parameter
LOCAL_CFLAGS += -Wno-unused-variable
LOCAL_CFLAGS += -Wno-gnu-designator
LOCAL_CFLAGS += -Wno-format
