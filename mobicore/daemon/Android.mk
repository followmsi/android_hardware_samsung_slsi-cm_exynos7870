# =============================================================================
#
# MobiCore Android build components
#
# =============================================================================

LOCAL_PATH := $(call my-dir)

# Client Library
# =============================================================================
include $(CLEAR_VARS)
LOCAL_MODULE := libMcClient
LOCAL_MODULE_TAGS := debug eng optional
LOCAL_C_INCLUDES += $(GLOBAL_INCLUDES)
LOCAL_SHARED_LIBRARIES += $(GLOBAL_LIBRARIES) liblog

LOCAL_CFLAGS := -fvisibility=hidden -fvisibility-inlines-hidden
LOCAL_CFLAGS += -include buildTag.h
LOCAL_CFLAGS += -DLOG_TAG=\"McClient\"
LOCAL_CFLAGS += -DTBASE_API_LEVEL=3

# Add new source files here
LOCAL_SRC_FILES += \
	ClientLib/Device.cpp \
	ClientLib/ClientLib.cpp \
	ClientLib/Session.cpp \
	Common/CMutex.cpp \
	Common/Connection.cpp \
	ClientLib/GP/tee_client_api.cpp

LOCAL_C_INCLUDES +=\
	$(LOCAL_PATH)/Common \
	$(LOCAL_PATH)/ClientLib/public \
	$(LOCAL_PATH)/ClientLib/public/GP \
	$(LOCAL_PATH)/../common/LogWrapper \
	$(COMP_PATH_MobiCore)/inc/McLib

LOCAL_EXPORT_C_INCLUDE_DIRS +=\
	$(COMP_PATH_MobiCore)/inc \
	$(LOCAL_PATH)/ClientLib/public

LOCAL_CFLAGS += -DLOG_ANDROID

include $(LOCAL_PATH)/Kernel/Android.mk

include $(BUILD_SHARED_LIBRARY)

# Registry Shared Library
# =============================================================================
include $(CLEAR_VARS)

LOCAL_MODULE := libMcRegistry
LOCAL_MODULE_TAGS := debug eng optional
LOCAL_CFLAGS += -DLOG_TAG=\"McRegistry\"
LOCAL_C_INCLUDES += $(GLOBAL_INCLUDES)
LOCAL_SHARED_LIBRARIES += $(GLOBAL_LIBRARIES) liblog

LOCAL_C_INCLUDES += $(LOCAL_PATH)/Common \
	$(LOCAL_PATH)/Daemon/public \
	$(LOCAL_PATH)/ClientLib/public \
	$(LOCAL_PATH)/../common/LogWrapper

# Common Source files required for building the daemon
LOCAL_SRC_FILES += Common/CMutex.cpp \
	Common/Connection.cpp \
	Common/CSemaphore.cpp \
#	Common/CThread.cpp

#LOCAL_LDLIBS := -lthread_db

include $(LOCAL_PATH)/Registry/Android.mk

LOCAL_CFLAGS += -DLOG_ANDROID

include $(BUILD_SHARED_LIBRARY)
