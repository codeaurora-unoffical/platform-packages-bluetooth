LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
    com_android_bluetooth_btservice_AdapterService.cpp \
    com_android_bluetooth_hfp.cpp \
    com_android_bluetooth_hfpclient.cpp \
    com_android_bluetooth_a2dp.cpp \
    com_android_bluetooth_a2dp_sink.cpp \
    com_android_bluetooth_avrcp.cpp \
    com_android_bluetooth_avrcp_controller.cpp \
    com_android_bluetooth_hid.cpp \
    com_android_bluetooth_hidd.cpp \
    com_android_bluetooth_hdp.cpp \
    com_android_bluetooth_pan.cpp \
    com_android_bluetooth_gatt.cpp \
    com_android_bluetooth_sdp.cpp

ifneq ($(TARGET_SUPPORTS_WEARABLES),true)
LOCAL_C_INCLUDES += \
     $(JNI_H_INCLUDE) \
     vendor/qcom/opensource/bluetooth_ext/vhal/include
else
LOCAL_C_INCLUDES += \
     $(JNI_H_INCLUDE) \
     device/qcom/msm8909w/opensource/bluetooth/hal/include
endif

LOCAL_SHARED_LIBRARIES := \
    libandroid_runtime \
    libchrome \
    libnativehelper \
    libcutils \
    libutils \
    liblog \
    libhardware

LOCAL_CFLAGS += -Wall -Wextra -Wno-unused-parameter

LOCAL_MODULE := libbluetooth_jni
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)
