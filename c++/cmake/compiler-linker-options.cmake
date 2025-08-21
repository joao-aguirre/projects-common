# Compiler and linker options.

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Compiler options.
# Set the C++ standard to c++23  and disable non-standard features.
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Display the available compiler features and the compiler extensions.
message("Compiler features = ${CMAKE_CXX_COMPILE_FEATURES}")
message("Compiler extensions = ${CMAKE_CXX_EXTENSIONS}")
# Display the current compilation flags defined for each configuration.
message("CMAKE_CXX_FLAGS_DEBUG is ${CMAKE_CXX_FLAGS_DEBUG}")
message("CMAKE_CXX_FLAGS_RELEASE is ${CMAKE_CXX_FLAGS_RELEASE}")
message("CMAKE_CXX_FLAGS_RELWITHDEBINFO is ${CMAKE_CXX_FLAGS_RELWITHDEBINFO}")
message("CMAKE_CXX_FLAGS_MINSIZEREL is ${CMAKE_CXX_FLAGS_MINSIZEREL}")

# Linker options.
# Check availability of interprocedural optimization (IPO) for the current
# compiler. Later on the targets can use the `has_ipo_support` to activate IPO
# during linkage.
include(CheckIPOSupported)
check_ipo_supported(RESULT has_ipo_support OUTPUT check_ipo_errors)
message(STATUS "IPO support = ${has_ipo_support}")
if(check_ipo_errors)
    message(WARNING "IPO check errors = ${check_ipo_errors}")
endif()

# Solve issues with this project dependencies paths when linked by other
# applications. See [this video](https://youtu.be/m0DwB4OvDXk?t=2321) for a nice
# introduction of the problem.
if(NOT APPLE)
    set(CMAKE_INSTALL_RPATH $ORIGIN)
endif()
