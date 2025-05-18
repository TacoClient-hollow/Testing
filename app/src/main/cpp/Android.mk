LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

# Module name
LOCAL_MODULE := mc

# Source files
LOCAL_SRC_FILES := mcint.cpp \
                   imgui/imgui.cpp \
                   imgui/imgui_draw.cpp \
                   imgui/imgui_tables.cpp \
                   imgui/imgui_widgets.cpp \
                   imgui/imgui_internal.cpp \
                   imgui/imstb_rectpack.h \
                   imgui/imstb_textedit.h \
                   imgui/imstb_truetype.h \
                   backends/imgui_impl_android.cpp \
                   backends/imgui_impl_opengl3.cpp

# Include directories (for Dobby, ImGui, and ImGui backends)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/Dobby \
                    $(LOCAL_PATH)/Dobby/libraries \
                    $(LOCAL_PATH)/imgui \
                    $(LOCAL_PATH)/backends

# Linking Android, OpenGL, and Dobby libraries
LOCAL_LDLIBS := -landroid -llog -ldl -lEGL -lGLESv3

# Link Dobby library directly
LOCAL_STATIC_LIBRARIES := dobby

# Prebuilt static library for Dobby
include $(CLEAR_VARS)
LOCAL_MODULE := dobby
LOCAL_SRC_FILES := Dobby/libraries/libdobby.a
include $(PREBUILT_STATIC_LIBRARY)

# Build shared library
include $(BUILD_SHARED_LIBRARY)
