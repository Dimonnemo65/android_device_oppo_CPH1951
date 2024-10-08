#
# Copyright (C) 2019 Potato Open Sauce Project
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
#
# Dynamic

DEVICE_PATH := device/oppo/CPH1951

PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/pb/config/common.mk)

# Another common config inclusion
$(call inherit-product, $(SRC_TARGET_DIR)/product/embedded.mk)

#Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    android.hardware.fastboot@1.0-impl-mock.recovery

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := CPH1951
PRODUCT_NAME := omni_CPH1951
PRODUCT_BRAND := Oppo
PRODUCT_MODEL := CPH1951
PRODUCT_MANUFACTURER := Oppo

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=CPH1951 \
    BUILD_PRODUCT=CPH1951 \
    TARGET_DEVICE=CPH1951

# HACK: Set vendor patch level and enable Treble
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.build.security_patch=2099-12-31 \
    ro.treble.enabled=true
