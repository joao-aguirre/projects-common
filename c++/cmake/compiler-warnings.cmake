# Set of compiler warnings for the most common compilers.

# Notes:
# - not treating warnings as errors (`/WX` and `-Werror` are not used)
# - I will increase the list of warnings over time and filter some that show troublesome
#   if needed. I will try to keep some equivalence in the warnings list among compilers.

# References:
# - [CMake compiler ID](https://cmake.org/cmake/help/latest/variable/CMAKE_LANG_COMPILER_ID.html)
# - [MSVC Warnings](https://docs.microsoft.com/en-us/cpp/error-messages/compiler-warnings/compiler-warnings-c4000-through-c4199?view=msvc-160)
# - [GCC warnings](https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html)
# - [Clang warnings](https://clang.llvm.org/docs/DiagnosticsReference.html)

if(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    set(_msvc_compile_warnings
        /permissive  # Enforces standards conformance. 
        /Wall  # All reasonable warnings.
        /w14640  # Construction not thread-safe.
        /w14242  # Conversion with possible loss of data.
        /w14254  # Conversion of `field_bits` with possible loss of data.
        /w14263  # Not overriding any base class virtual member function.
        /w14265  # Class has virtual functions, but destructor is not virtual.
        /w14287  # Unsigned/negative constant mismatch.
        /we4289  # Loop control variable declared in the for-loop is used outside the for-loop scope.
        /w14296  # Expression is always `boolean_value`.
        /w14311  # Pointer truncation.
        /w14545  # Expression before comma evaluates to a function which is missing an argument list.
        /w14546  # function call before comma missing argument list.
        /w14547  # Operator before comma has no effect, expected operator with side-effect.
        /w14549  # Operator before comma has no effect, did you intend `operator`?
        /w14555  # Expression has no effect.
        /w14619  # There is no warning number `number`.
        /w14640  # Enable warning on thread un-safe static member initialization.
        /w14826  # Conversion is sign-extended. This may cause unexpected runtime behavior.
        /w14905  # Wide string literal cast to 'LPSTR'
        /w14906  # String literal cast to 'LPWSTR'
        /w14928  # Illegal copy-initialization.
        /w14061  # Missing explicit switch case for an `enum` item.
        /w14062  # Missing switch case handling an `enum` item (can be default).
        # /WX  # Threats warnings as errors.    
    )
    add_compile_options("$<$<COMPILE_LANGUAGE:CXX>:${_msvc_compile_warnings}>")
elseif(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    set(_gcc_compile_warnings
            -Wall  # Default checks on.
            -Wextra  # Extra checks on.
            -Wpedantic  # Non-standard C++ is used
            -Wshadow  # Variable declaration shadows one from a parent context.
            -Wnon-virtual-dtor  # Class with virtual functions has a non-virtual destructor.
            -Wold-style-cast  # `c-style` casts
            -Wcast-align  # Potential performance problematic casts.
            -Wunused  # Something being unused.
            -Woverloaded-virtual  # Overloading (not overriding) a virtual function.
            -Wconversion  # Type conversions that may lose data.
            -Wsign-conversion  # Signed conversions
            -Wmisleading-indentation  # Indentation implies blocks where blocks do not exist
            -Wduplicated-cond  # `if/else` chain has duplicated conditions.
            -Wduplicated-branches  # `if/else` branches have duplicated code.
            -Wlogical-op  # Logical operations being used where bitwise were probably wanted.
            -Wnull-dereference  # Null dereference is detected.
            -Wuseless-cast  # Cast to the same type.
            -Wdouble-promotion # Float implicitly promoted to double.
            -Wformat=2  # Security issues around functions that format output (i.e. `printf`).
            #-Werror  # Not using because some third-party libraries generate warnings I can't fix.
    )
    add_compile_options("$<$<COMPILE_LANGUAGE:CXX>:${_gcc_compile_warnings}>")
elseif(CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    set(_clang_compile_warnings
            -Wall  # Default checks on.
            -Wextra  # Extra checks on.
            -Wpedantic  # Non-standard C++ is used
            -Wshadow  # Variable declaration shadows one from a parent context.
            -Wnon-virtual-dtor  # Class with virtual functions has a non-virtual destructor.
            -Wold-style-cast  # `c-style` casts
            -Wcast-align  # Potential performance problematic casts.
            -Wunused  # Something being unused.
            -Woverloaded-virtual  # Overloading (not overriding) a virtual function.
            -Wconversion  # Type conversions that may lose data.
            -Wsign-conversion  # Signed conversions
            -Wnull-dereference  # Null dereference is detected.
            -Wdouble-promotion # Float implicitly promoted to double.
            -Wlifetime  # Object lifetime issues.
            -Wformat=2  # Security issues around functions that format output (i.e. `printf`).
            #-Werror  # Not using because some third-party libraries generate warnings I can't fix.
    )
    add_compile_options("$<$<COMPILE_LANGUAGE:CXX>:${_clang_compile_warnings}>")
endif()