#!/usr/bin/env bash

# carthage.sh
# Usage example: ./carthage.sh build --platform iOS

#!/bin/sh -e

set -euo pipefail

xcconfig=$(mktemp /tmp/static.xcconfig.XXXXXX)
trap 'rm -f "$xcconfig"' INT TERM HUP EXIT

echo "MACH_O_TYPE = staticlib" >> $xcconfig
echo "DEBUG_INFORMATION_FORMAT = dwarf" >> $xcconfig

echo 'EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64=arm64 arm64e armv7 armv7s armv6 armv8' >> $xcconfig
echo 'EXCLUDED_ARCHS=$(inherited) $(EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_$(EFFECTIVE_PLATFORM_SUFFIX)__NATIVE_ARCH_64_BIT_$(NATIVE_ARCH_64_BIT))' >> $xcconfig

export XCODE_XCCONFIG_FILE="$xcconfig"


carthage "$@"


# SCRIPT_DIR=$(cd $(dirname $0);pwd)
# CARTHAGE_DIR=${SCRIPT_DIR}/Carthage
# if [ ! -d ${CARTHAGE_DIR} ]; then
#   mkdir ${CARTHAGE_DIR}
# fi
#
# # ワークアラウンド用の xcconfig ファイルを設定する
# export XCODE_XCCONFIG_FILE=${CARTHAGE_DIR}/carthage_workaround_for_xcode12.xcconfig
# echo 'EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_simulator__NATIVE_ARCH_64_BIT_x86_64=arm64 arm64e armv7 armv7s armv6 armv8' > ${XCODE_XCCONFIG_FILE}
# echo 'EXCLUDED_ARCHS=$(inherited) $(EXCLUDED_ARCHS__EFFECTIVE_PLATFORM_SUFFIX_$(EFFECTIVE_PLATFORM_SUFFIX)__NATIVE_ARCH_64_BIT_$(NATIVE_ARCH_64_BIT))' >> ${XCODE_XCCONFIG_FILE}
#
# # Carthage を実行する
# carthage $@
