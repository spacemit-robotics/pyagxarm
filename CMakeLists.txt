# Copyright (C) 2026 SpacemiT (Hangzhou) Technology Co. Ltd.
# SPDX-License-Identifier: Apache-2.0
cmake_minimum_required(VERSION 3.16)
project(pyagxarm VERSION 0.1.0 LANGUAGES NONE)
set(CMAKE_INSTALL_DATADIR share CACHE STRING "Prefix-relative data installation directory")
if(IS_ABSOLUTE "${CMAKE_INSTALL_DATADIR}")
    message(FATAL_ERROR "CMAKE_INSTALL_DATADIR must be relative for a relocatable installation")
endif()
file(READ "${CMAKE_CURRENT_SOURCE_DIR}/UPSTREAM_COMMIT" revision)
string(STRIP "${revision}" revision)
if(NOT revision STREQUAL "e7aef17d54cac80cbaeb1b4110ab3d8f1337a95b")
    message(FATAL_ERROR "Unexpected pyAgxArm revision")
endif()
install(DIRECTORY pyAgxArm DESTINATION ${CMAKE_INSTALL_DATADIR}/pyagxarm
    PATTERN "__pycache__" EXCLUDE PATTERN "*.pyc" EXCLUDE PATTERN "*.log" EXCLUDE)
install(FILES LICENSE UPSTREAM_COMMIT README.vendor.md
    DESTINATION ${CMAKE_INSTALL_DATADIR}/pyagxarm)
