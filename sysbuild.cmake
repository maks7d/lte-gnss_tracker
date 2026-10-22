#
# SPDX-License-Identifier: LicenseRef-Nordic-5-Clause
#

# nrf-softsim is a git submodule rather than a west module, so sysbuild does not load its
# sysbuild CMake on its own. Do it here, unless it is already known as a module (for example
# through -DZEPHYR_EXTRA_MODULES).
if(NOT "softsim" IN_LIST SYSBUILD_MODULE_NAMES)
  set(SYSBUILD_SOFTSIM_MODULE_DIR ${CMAKE_CURRENT_LIST_DIR}/nrf-softsim)
  set(SYSBUILD_CURRENT_MODULE_NAME softsim)
  add_subdirectory(${SYSBUILD_SOFTSIM_MODULE_DIR}/sysbuild
                   ${CMAKE_BINARY_DIR}/modules/softsim)
endif()
