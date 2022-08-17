#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

COMMON_PATH := device/realme/sm7125-common

# Android Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --set_hashtree_disabled_flag
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 2
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA2048
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1
BOARD_AVB_VBMETA_SYSTEM := system product
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1

# APEX image
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Build
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
#BUILD_BROKEN_VENDOR_PROPERTY_NAMESPACE := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a76

# Audio
AUDIO_FEATURE_ENABLED_EXTN_FORMATS := true
AUDIO_FEATURE_ENABLED_HDMI_SPK := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true

# Audio policy
USE_CUSTOM_AUDIO_POLICY := 1
USE_XML_AUDIO_POLICY_CONF := 1

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(COMMON_PATH)/bluetooth/include
#TARGET_USE_QTI_BT_STACK := true
BOARD_HAVE_BLUETOOTH_QCOM := true

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := atoll

# Camera
TARGET_USES_QTI_CAMERA_DEVICE := true

# Dex
ifeq ($(HOST_OS),linux)
    WITH_DEXPREOPT ?= false
endif
WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY ?= true

# Display
TARGET_SCREEN_DENSITY := 440
TARGET_USES_HWC2 := true

# Filesystem
TARGET_FS_CONFIG_GEN := $(COMMON_PATH)/config.fs

# FM
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true
BOARD_HAS_QCA_FM_SOC := cherokee
BOARD_HAVE_QCOM_FM := true

# HIDL
DEVICE_MANIFEST_FILE := $(COMMON_PATH)/manifest.xml
DEVICE_MATRIX_FILE := $(COMMON_PATH)/compatibility_matrix.xml

ODM_MANIFEST_SKUS += nfc
ODM_MANIFEST_NFC_FILES := $(COMMON_PATH)/manifest_nfc.xml

# Init
TARGET_INIT_VENDOR_LIB := //$(COMMON_PATH):libinit_realme_sm7125
TARGET_RECOVERY_DEVICE_MODULES := libinit_realme_sm7125

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_IMAGE_NAME := Image.gz
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET := 0x01000000

BOARD_BOOT_HEADER_VERSION := 2
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

KERNEL_LD := LD=ld.lld
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_CLANG_VERSION := proton
KERNEL_TOOLCHAIN_PATH := $(shell pwd)/prebuilts/clang/host/linux-x86/clang-proton
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-gnu-
TARGET_KERNEL_CROSS_COMPILE_ARM32_PREFIX := arm-linux-gnueabi-
TARGET_KERNEL_SOURCE := kernel/realme/sm7125
TARGET_KERNEL_CONFIG := falcon_defconfig
TARGET_KERNEL_ADDITIONAL_FLAGS := \
    HOSTCFLAGS="-fuse-ld=lld -Wno-unused-command-line-argument"

BOARD_KERNEL_CMDLINE += androidboot.console=ttyMSM0
BOARD_KERNEL_CMDLINE += androidboot.fstab_suffix=default
BOARD_KERNEL_CMDLINE += androidboot.hardware=qcom
BOARD_KERNEL_CMDLINE += androidboot.init_fatal_reboot_target=recovery
BOARD_KERNEL_CMDLINE += androidboot.memcg=1
#BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_CMDLINE += androidboot.usbcontroller=a600000.dwc3
BOARD_KERNEL_CMDLINE += console=ttyMSM0,115200n8
BOARD_KERNEL_CMDLINE += earlycon=msm_geni_serial,0xa88000
BOARD_KERNEL_CMDLINE += loop.max_part=7
BOARD_KERNEL_CMDLINE += lpm_levels.sleep_disabled=1
BOARD_KERNEL_CMDLINE += msm_rtb.filter=0x237
BOARD_KERNEL_CMDLINE += service_locator.enable=1
BOARD_KERNEL_CMDLINE += swiotlb=1
BOARD_KERNEL_CMDLINE += video=vfb:640x400,bpp=32,memsize=3072000
BOARD_KERNEL_CMDLINE += kpti=off

# Media
TARGET_USES_ION := true
TARGET_DISABLED_UBWC := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_CACHEIMAGE_PARTITION_SIZE := 100663296
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SUPER_PARTITION_SIZE := 8476688384
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12884901888
#BOARD_ODMIMAGE_PARTITION_SIZE := 104857600

BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := odm system system_ext vendor product
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 8472494080

BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_PRODUCTIMAGE_EXTFS_INODE_COUNT := -1
BOARD_SYSTEM_EXTIMAGE_EXTFS_INODE_COUNT := -1
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := -1

BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE := 1048576000
BOARD_SYSTEM_EXTIMAGE_PARTITION_RESERVED_SIZE := 62914560
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 1572864000

BOARD_ODMIMAGE_PARTITION_RESERVED_SIZE := 524288000
BOARD_VENDORIMAGE_PARTITION_RESERVED_SIZE := 524288000

TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_ODM := odm

BOARD_USES_METADATA_PARTITION := true

BOARD_FLASH_BLOCK_SIZE := 262144

# Platform
TARGET_BOARD_PLATFORM := atoll
TARGET_BOOTLOADER_BOARD_NAME := atoll

# Power
TARGET_POWERHAL_BOOST_EXT := $(COMMON_PATH)/power/boost-ext.cpp
TARGET_POWERHAL_MODE_EXT := $(COMMON_PATH)/power/mode-ext.cpp

# Properties
TARGET_ODM_PROP += $(COMMON_PATH)/odm.prop
TARGET_PRODUCT_PROP += $(COMMON_PATH)/product.prop
TARGET_SYSTEM_PROP += $(COMMON_PATH)/system.prop
TARGET_VENDOR_PROP += $(COMMON_PATH)/vendor.prop

# QCOM
BOARD_USES_QCOM_HARDWARE := true
TARGET_FWK_SUPPORTS_FULL_VALUEADDS := true

# Recovery
BOARD_INCLUDE_RECOVERY_DTBO := true
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/rootdir/etc/fstab.default
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USES_MKE2FS := true

# RenderScript
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(COMMON_PATH)

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# Security patch level
VENDOR_SECURITY_PATCH := 2020-10-01

# Sepolicy
include device/qcom/sepolicy_vndr/SEPolicy.mk
BOARD_VENDOR_SEPOLICY_DIRS += $(COMMON_PATH)/sepolicy/vendor
#BOARD_PLAT_PRIVATE_SEPOLICY_DIR += $(COMMON_PATH)/sepolicy/private

# Treble
BOARD_VNDK_VERSION := current

# UDFPS
TARGET_SURFACEFLINGER_UDFPS_LIB := //$(COMMON_PATH):libudfps_extension.realme_sm7125

# WiFi
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
QC_WIFI_HIDL_FEATURE_DUAL_AP := true
WIFI_DRIVER_DEFAULT := qca_cld3
WIFI_DRIVER_STATE_CTRL_PARAM := "/dev/wlan"
WIFI_DRIVER_STATE_OFF := "OFF"
WIFI_DRIVER_STATE_ON := "ON"
WIFI_HIDL_FEATURE_AWARE := true
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
WPA_SUPPLICANT_VERSION := VER_0_8_X

# Inherit proprietary blobs
-include vendor/realme/sm7125-common/BoardConfigVendor.mk
