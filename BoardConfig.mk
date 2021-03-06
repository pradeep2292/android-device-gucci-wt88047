#
# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FORCE_32_BIT := true

#include device/qcom/common
DEVICE_PATH := device/xiaomi/gucci
#DEVICE_PATH := device/wingtech/wt88047
include $(DEVICE_PATH)/board/*.mk

# inherit from the proprietary version
include vendor/xiaomi/gucci/BoardConfigVendor.mk

USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/xiaomi/gucci/BoardConfigVendor.mk

TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := unknown
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a7
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

#ARGET_BOOTLOADER_BOARD_NAME := gucci

#BOARD_KERNEL_CMDLINE := androidboot.console=ttyHSL0 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci
#BOARD_KERNEL_BASE := 0x
#BOARD_KERNEL_PAGESIZE := 2048

# Kernel
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET     := 0x01000000
#BOARD_KERNEL_SEPARATED_DT := true

# Partitions
#BOARD_CUSTOM_BOOTIMG_MK := $(LOCAL_PATH)/mkbootimg.mk
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 838860800
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2631680000
BOARD_CACHEIMAGE_PARTITION_SIZE := 134217728
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

#TARGET_KERNEL_SOURCE := kernel/xiaomi/gucci

# build old-style zip files (required for ota updater)
BLOCK_BASED_OTA := false

# system.prop
#TARGET_SYSTEM_PROP := $(LOCAL_PATH)/system.prop

BOARD_HAS_NO_SELECT_BUTTON := true

#TARGET_KERNEL_CONFIG := gucci_defconfig

TARGET_GPS_HAL_PATH := $(DEVICE_PATH)/gps
TARGET_NO_RPC := true

TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom

TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/zImage

ifeq ($(TARGET_PRODUCT),lineage_gucci)
PRODUCT_COPY_FILES += \
$(TARGET_PREBUILT_KERNEL):kernel
endif

TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-linux-androideabi-

#include device/cyanogen/msm8916-common/BoardConfigCommon.mk
