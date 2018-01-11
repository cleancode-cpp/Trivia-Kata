cmake_minimum_required(VERSION 3.0.2)
project(Trivia)

set (CMAKE_CXX_STANDARD 11)
set (gtest_force_shared_crt ON CACHE BOOL "MSVC defaults to shared CRT" FORCE)

add_subdirectory(thirdparty/googletest/googletest)
target_compile_definitions(gtest PUBLIC GTEST_LANG_CXX11 GTEST_HAS_TR1_TUPLE=0)

# domain library
add_library(trivia "" Game.cc)
set_target_properties(trivia PROPERTIES COMPILE_FLAGS "${cxx_strict}")

# text tests
add_executable(trivia_app TriviaTextTests.cc)
set_target_properties(trivia_app PROPERTIES COMPILE_FLAGS "${cxx_strict}")
target_link_libraries(trivia_app trivia)

# unit tests
add_executable(trivia_tests TriviaUnitTests.cc)
set_target_properties(trivia_tests PROPERTIES COMPILE_FLAGS "${cxx_strict}")
target_link_libraries(trivia_tests trivia gtest gtest_main)
add_test(trivia_tests trivia_tests)
