# TWRP device tree for POCO F4 (munch)
For building TWRP Recovery for POCO F4

The POCO F4 (codenamed _"munch"_) is a high end smartphone from POCO.

## Device specifications

| Device       | POCO F4                                     |
| -----------: | :------------------------------------------ |
| SoC          | Qualcomm SM8250-AC Snapdragon 870 5G           |
| CPU          | 4x Kryo 585 1804MHz, 3x Cortex-A77 2419MHz, Cortex-A77 3187MHz |
| GPU          | Adreno 650                                  |
| Memory       | 12GB / 8GB / 6GB  (LPDDR 5)                        |
| Shipped Android version | 12  (MIUI 13)                             |
| Storage      | 128/256GB  (UFS 3.1)                            |
| Battery      | Li-Po 4500 mAh, non-removable               |
| Dimensions   | 163.2 x 75.95 x 7.7 mm                       |
| Display      | 1080 x 2400 (20:9), 6.67 inches             |

## Device picture

![POCO F4](https://i01.appmifile.com/webfile/globalimg/pic/POCO-F4-BLACK!800x800!85.png)

## Features

**Works**

- Booting.
- **Decryption** (Android 12+)
- ADB
- MTP
- OTG
- vA/B partition functions
- Haptics (Vibration)

POCO F4 uses a Virtual A/B Partition Scheme!

## Compile

1. Init repo && sync sources
https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp

2. Make sure to clone Proton clang 13:
```
git clone https://github.com/kdrag0n/proton-clang --depth=1 prebuilts/clang/host/linux-x86/clang-13.0.0
```

3. Clone the kernel:
```
git clone https://github.com/AOSPA/android_kernel_xiaomi_sm8250 --depth=1 kernel/xiaomi/munch
```

4. Clone this repo in device/xiaomi/munch

Build command :
```
export ALLOW_MISSING_DEPENDENCIES=true && lunch twrp_munch-eng && mka adbd bootimage
```



## Credits
- [Original Tree By Darth9](https://gitlab.com/OrangeFox/device/alioth)
- [AOSPA uvite kernel](https://github.com/AOSPA/android_kernel_xiaomi_sm8250)
