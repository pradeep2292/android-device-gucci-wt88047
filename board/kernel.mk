# Kernel
BOARD_DTBTOOL_ARGS := -2
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_SEPARATED_DT := false
TARGET_KERNEL_SOURCE := kernel/wingtech/msm8916
TARGET_KERNEL_CONFIG := lineageos_wt88047_defconfig
BOARD_KERNEL_CMDLINE += sched_enable_hmp=1 phy-msm-usb.floated_charger_enable=1
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-linux-androideabi-
