#!/bin/bash

export MAKEFLAGS="-j$(nproc)"
make $MAKEFLAGS clean && make $MAKEFLAGS mrproper && git reset --hard
cp -fv CONFIGS/xanmod/gcc/config_x86-64-v4 .config
unset CONFIG_DEBUG_INFO && make $MAKEFLAGS menuconfig
unset CONFIG_DEBUG_INFO && make $MAKEFLAGS bindeb-pkg

exit 0
