#
# SPDX-License-Identifier: Apache-2.0
#
# Copyright (C) 2022-2025 The OrangeFox Recovery Project
# SPDX-License-Identifier: GPL-3.0-or-later
#

DEVICE_PATH := device/xiaomi/munch

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a76
TARGET_CPU_VARIANT_RUNTIME := kryo585

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a55
TARGET_2ND_CPU_VARIANT_RUNTIME := kryo585

TARGET_USES_64_BIT_BINDER := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := kona
TARGET_NO_BOOTLOADER := true

# Platform
BOARD_USES_QCOM_HARDWARE := true
TARGET_BOARD_PLATFORM := kona
TARGET_BOARD_PLATFORM_GPU := qcom-adreno650
BOARD_VENDOR := xiaomi

# Kernel
BOARD_BOOTIMG_HEADER_VERSION := 3
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_KERNEL_IMAGE_NAME := Image
TARGET_KERNEL_CONFIG := munch_defconfig
TARGET_KERNEL_SOURCE := kernel/xiaomi/munch

VENDOR_CMDLINE := "console=ttyMSM0,115200n8 \
		androidboot.hardware=qcom \
		androidboot.console=ttyMSM0 \
		androidboot.memcg=1 \
		lpm_levels.sleep_disabled=1 \
		androidboot.usbcontroller=a600000.dwc3 \
		swiotlb=2048 \
		loop.max_part=7 \
		cgroup.memory=nokmem,nosocket \
		reboot=panic_warm \
		androidboot.init_fatal_reboot_target=recovery"

TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/board-info.txt

# Kernel - Default to building from source
ifneq ($(FOX_BUILD_FULL_KERNEL_SOURCES),0)
# -----------------------------------------------------
TARGET_KERNEL_SOURCE := kernel/xiaomi/$(PRODUCT_RELEASE_NAME)
TARGET_KERNEL_CONFIG := vendor/$(PRODUCT_RELEASE_NAME)_defconfig
TARGET_KERNEL_CLANG_COMPILE := true
KERNEL_SUPPORTS_LLVM_TOOLS := true
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-gnu-
TARGET_KERNEL_CLANG_VERSION := 13.0.0
TARGET_KERNEL_CLANG_PATH := $(shell pwd)/prebuilts/clang/host/linux-x86/clang-$(TARGET_KERNEL_CLANG_VERSION)
TARGET_KERNEL_ADDITIONAL_FLAGS := DTC_EXT=$(shell pwd)/prebuilts/misc/$(HOST_OS)-x86/dtc/dtc
LLVM := 1
LLVM_IAS := 1
else
  TARGET_PREBUILT_KERNEL := device/xiaomi/munch/prebuilt/kernel
endif
# -----------------------------------------------------

# 12.1 manifest requirements
TARGET_SUPPORTS_64_BIT_APPS := true
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_MISSING_REQUIRED_MODULES := true # may not really be needed

#A/B
BOARD_USES_RECOVERY_AS_BOOT := true
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
AB_OTA_UPDATER := true

# Metadata
BOARD_USES_METADATA_PARTITION := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144 
BOARD_BOOTIMAGE_PARTITION_SIZE := 201326592
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE:= 100663296

BOARD_SUPER_PARTITION_SIZE := 6536585216
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 6532390912
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := system product odm system_ext vendor

BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_USES_MKE2FS := true

# AVB
BOARD_AVB_ENABLE := true
BOARD_AVB_VBMETA_SYSTEM := system
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1

# Configuration
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_DEFAULT_BRIGHTNESS := 750
TW_MAX_BRIGHTNESS := 2047
TW_DEVICE_VERSION := -olzhas0986
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXTRA_LANGUAGES := true
TW_DEFAULT_LANGUAGE := en
TW_NO_SCREEN_BLANK := true
TARGET_USES_MKE2FS := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_USE_TOOLBOX := true
TW_INCLUDE_NTFS_3G := true
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_RESETPROP := true
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TW_EXCLUDE_APEX := true
TW_SUPPORT_INPUT_AIDL_HAPTICS := true

TW_STATUS_ICONS_ALIGN := center
TW_CUSTOM_CPU_POS := "50"
TW_CUSTOM_CLOCK_POS := "340" 
TW_CUSTOM_BATTERY_POS := "800"

# Python
TW_INCLUDE_PYTHON := true
