cmake_minimum_required(VERSION 3.29)
project(untitled C)

set(CMAKE_C_STANDARD 11)

# Define the executable
add_executable(untitled main.c)

# Link CoreGraphics framework (required for macOS)
target_link_libraries(untitled "-framework CoreGraphics")
