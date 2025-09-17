# AGENTS.md

## General

General rules for any AI agent interaction.

### Writing Style

- Always, always, check English orthography and grammar on my questions,
starting any answer with comments about any found issue or improvement
suggestions on my writing
- When adding comments, format them in correct English grammar, including
punctuation
- Comments and generated text must be wrapped at 80 columns

### Code Checking

- Check for possible floating point errors
- Check code for compliance to the SOLID principles
- Avoid and warn about boolean traps
    - Usage of Boolean variables as function parameters
    - Suggest replace the Boolean parameter by an enumeration

## Python Development

Specific rules for Python development.

### Code Formatting

- Use "" instead of '' whenever possible
- Follow PEP-8 formating
- Do not use single-line docstrings, always break after the initial and before
the final triple quotes.
- Do not indent the docstring related to the triple quotes
- Generate docstrings in Restructured text, particularly the format used by
Sphinx to generate documentation
- Do not add the types of the arguments in the docstring if they are already
defined as type hints in the function/method signature

### Code Checking

### Libraries and Modules

- Prefer using standard library modules over library/modules that would need to
be added to the environment
- Prefer `pathlib` over `os` for path handling

### Unit Tests

- Always use `pytest`!

## C/C++ Development

Specific rules for C/C++ development.

### Code Formatting

- If the `.clang-format` file is present, use it to format the code
- Use Doxygen style comments for documentation
- Use `snake_case` for function and variable names
- Use `CamelCase` for class names
- Use `UPPER_CASE` for constants
- Use `UPPER_CASE_HPP` for header guards
- Prefer placing the pointer and reference symbol as suffixes after the type
(without space) than before the variable name (e.g., `int* pointer` or
`double& reference`)

### Code Checking

- Use the [C++ Core Guidelines](https://isocpp.github.io/CppCoreGuidelines) to
check for code quality
- Check if all header files have include guards

### Build Systems, Libraries and Tools

- Use CMake as the default build system
- Use `vcpkg` for package management
- Use `catch2` for unit testing
- Use `Eigen` for linear algebra and vector/matrix operations
