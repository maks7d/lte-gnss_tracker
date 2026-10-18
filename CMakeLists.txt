#
# Copyright (c) 2019 Nordic Semiconductor
#
# SPDX-License-Identifier: LicenseRef-Nordic-5-Clause
#

cmake_minimum_required(VERSION 3.20.0)
list(APPEND ZEPHYR_EXTRA_MODULES ${CMAKE_CURRENT_LIST_DIR}/nrf-softsim)
list(APPEND OVERLAY_CONFIG ${CMAKE_CURRENT_LIST_DIR}/nrf-softsim/overlay-softsim.conf)

find_package(Zephyr REQUIRED HINTS $ENV{ZEPHYR_BASE})
project(gnss)

zephyr_library_sources(src/main.c)

zephyr_library_sources_ifdef(CONFIG_GNSS_SAMPLE_ASSISTANCE_NRF_CLOUD src/assistance.c)
zephyr_library_sources_ifdef(CONFIG_GNSS_SAMPLE_ASSISTANCE_SUPL src/assistance_supl.c)
zephyr_library_sources_ifdef(CONFIG_GNSS_SAMPLE_ASSISTANCE_MINIMAL src/assistance_minimal.c)
zephyr_library_sources_ifdef(CONFIG_GNSS_SAMPLE_ASSISTANCE_MINIMAL src/mcc_location_table.c)
