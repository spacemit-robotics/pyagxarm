#!/usr/bin/env bash
# Copyright (C) 2026 SpacemiT (Hangzhou) Technology Co. Ltd.
# SPDX-License-Identifier: Apache-2.0
# Connect the repository's dependency metadata to the SDK's third-party package registry.
set -euo pipefail
VENDOR_ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd -P)"
SDK_ROOT="$(cd -- "$VENDOR_ROOT/../../.." && pwd -P)"
if [[ ! -f "$SDK_ROOT/build/envsetup.sh" ]]; then
    printf 'Place this repository at components/thirdparty/pyagxarm inside the SDK.\n' >&2
    exit 1
fi
METADATA_DIRECTORY="$SDK_ROOT/platform/generic/components/thirdparty/pyagxarm"
METADATA_FILE="$METADATA_DIRECTORY/package.xml"
if [[ -L "$METADATA_FILE" && "$(readlink -f -- "$METADATA_FILE")" == "$VENDOR_ROOT/package.xml" ]]; then
    printf 'SDK dependency metadata is linked.\n'
    exit 0
fi
if [[ -e "$METADATA_FILE" || -L "$METADATA_FILE" ]]; then
    printf 'Existing SDK dependency metadata was not replaced: %s\n' "$METADATA_FILE" >&2
    exit 1
fi
mkdir -p -- "$METADATA_DIRECTORY"
ln -sr -- "$VENDOR_ROOT/package.xml" "$METADATA_FILE"
printf 'SDK dependency metadata is linked.\n'
