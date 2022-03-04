# openwrt-builder

| License | Versioning | Build |
| ------- | ---------- | ----- |
| [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) | [![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release) | [![Build status](https://ci.appveyor.com/api/projects/status/et63s0fvdboso4r8/branch/master?svg=true)](https://ci.appveyor.com/project/nikAizuddin/openwrt-builder/branch/master) |

OpenWrt image builder.


## Cloning repositories

Clone the following repositories:
```
git clone https://github.com/extra2000/openwrt-builder.git openwrt-builder
git clone https://github.com/openwrt/openwrt.git openwrt-builder/src/openwrt
chcon -r -v -t container_file_t openwrt-builder/src/openwrt
```

Then `cd` into the project root directory:
```
cd openwrt-builder
```


## Building OpenWrt builder image

Build image:
```
podman build -t extra2000/openwrt-builder .
```


## Building OpenWrt source

```
podman run -it --rm -v ./src/openwrt:/opt/src:rw --workdir /opt/src localhost/extra2000/openwrt-builder bash
```

Update and install all feeds. Note that these steps are required for the fresh OpenWrt repository only. You don't need to re-execute these steps everytime you run the `extra2000/firmwarebuilder` Podman container:
```
./scripts/feeds update -a
./scripts/feeds install -a
```

Configure build:
```
FORCE_UNSAFE_CONFIGURE=1 make menuconfig
```

To find out what parameters have been set by the `make menuconfig`, execute the following command:
```
grep -v "^\s*$\|^\s*\#" .config | less
```

Build firmware:
```
FORCE_UNSAFE_CONFIGURE=1 make clean
FORCE_UNSAFE_CONFIGURE=1 make download
FORCE_UNSAFE_CONFIGURE=1 make -j1 V=s
```

Output can be found in `/opt/src/bin/`.
