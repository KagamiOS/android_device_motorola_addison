DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay

TARGET_USES_QCOM_BSP := true

# Add QC Video Enhancements flag
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
TARGET_USES_NQ_NFC := true
TARGET_KERNEL_VERSION := 3.18

# Enable features in video HAL that can compile only on this platform
TARGET_USES_MEDIA_EXTENSIONS := true

# media_profiles and media_codecs xmls for msm8953
ifeq ($(TARGET_ENABLE_QC_AV_ENHANCEMENTS), true)
PRODUCT_COPY_FILES += $(LOCAL_PATH)/media/media_profiles_8953.xml:system/etc/media_profiles.xml \
                      $(LOCAL_PATH)/media/media_codecs_8953.xml:system/etc/media_codecs.xml \
                      $(LOCAL_PATH)/media/media_codecs_performance_8953.xml:system/etc/media_codecs_performance.xml \
                      $(LOCAL_PATH)/media/media_profiles_8953_v1.xml:system/etc/media_profiles_8953_v1.xml \
                      $(LOCAL_PATH)/media/media_codecs_8953_v1.xml:system/etc/media_codecs_8953_v1.xml \
                      $(LOCAL_PATH)/media/media_codecs_performance_8953_v1.xml:system/etc/media_codecs_performance_8953_v1.xml
endif

PRODUCT_COPY_FILES += $(LOCAL_PATH)/whitelistedapps.xml:system/etc/whitelistedapps.xml \
                      $(LOCAL_PATH)/gamedwhitelist.xml:system/etc/gamedwhitelist.xml

PRODUCT_PROPERTY_OVERRIDES += \
       dalvik.vm.heapminfree=6m \
       dalvik.vm.heapstartsize=14m
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)
$(call inherit-product, $(LOCAL_PATH)/base.mk)

PRODUCT_NAME := Moto Z Play
PRODUCT_DEVICE := addison

#PRODUCT_BOOT_JARS += vcard \
                     com.qti.dpmframework
PRODUCT_BOOT_JARS += qcom.fmradio

ifneq ($(strip $(QCPATH)),)
    PRODUCT_BOOT_JARS += WfdCommon
    PRODUCT_BOOT_JARS += oem-services
    PRODUCT_BOOT_JARS += tcmiface
  #  PRODUCT_BOOT_JARS += dpmapi
   # PRODUCT_BOOT_JARS += com.qti.location.sdk
endif

# Audio configuration file
-include $(TOPDIR)hardware/qcom/audio/configs/msm8953/msm8953.mk

# ANT+ stack
PRODUCT_PACKAGES += \
    AntHalService \
    libantradio \
    antradio_app

# Feature definition files for msm8953
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml

# MIDI feature
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml

#fstab.qcom
PRODUCT_PACKAGES += fstab.qcom

PRODUCT_PACKAGES += wcnss_service

# MSM IRQ Balancer configuration file
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/msm_irqbalance.conf:system/vendor/etc/msm_irqbalance.conf

#wlan driver
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_wlan_nv.bin:persist/WCNSS_qcom_wlan_nv.bin \
    $(LOCAL_PATH)/wifi/WCNSS_wlan_dictionary.dat:persist/WCNSS_wlan_dictionary.dat


PRODUCT_PACKAGES += \
    wpa_supplicant_overlay.conf \
    p2p_supplicant_overlay.conf
#ANT+ stack
PRODUCT_PACKAGES += \
AntHalService \
libantradio \
antradio_app

# Defined the locales
PRODUCT_LOCALES += th_TH vi_VN tl_PH hi_IN ar_EG ru_RU tr_TR pt_BR bn_IN mr_IN ta_IN te_IN zh_HK \
        in_ID my_MM km_KH sw_KE uk_UA pl_PL sr_RS sl_SI fa_IR kn_IN ml_IN ur_IN gu_IN or_IN

PRODUCT_PACKAGES += telephony-ext
PRODUCT_BOOT_JARS += telephony-ext

#for android_filesystem_config.h
PRODUCT_PACKAGES += \
    fs_config_files

# Sensor HAL conf file
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/sensors/hals.conf:system/etc/sensors/hals.conf

# Disable Verity boot feature
PRODUCT_SUPPORTS_VERITY := true

#FEATURE_OPENGLES_EXTENSION_PACK support string config file
PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml

# Keylayout
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/keylayout/fpc1020.kl:system/usr/keylayout/fpc1020.kl

# Ramdisk
PRODUCT_PACKAGES += \
    init.mmi.touch.sh \
    wlan_carrier_bin.sh \
    init.qcom.bt.sh \
    init.qcom.ril.sh

PRODUCT_PACKAGES += \
    fstab.qcom \
    init.mmi.boot.sh \
    init.mmi.laser.sh \
    init.mmi.rc \
    init.mmi.usb.rc \
    init.qcom.rc \
    ueventd.qcom.rc
