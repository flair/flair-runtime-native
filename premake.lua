solution "flair"
   configurations { "Debug", "Release" }

project "flair"
   kind "StaticLib"
   language "C++"
   targetdir "bin/%{cfg.buildcfg}"

   includedirs "include"

   files { "include/**.h", "src/**.cc" }

   filter "configurations:Debug"
      defines { "DEBUG" }
      flags { "Symbols" }

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"

project "tests"
   kind "ConsoleApp"
   language "C++"
   targetdir "bin/%{cfg.buildcfg}"

   includedirs { "include", "vendor/googletest/include", "vendor/googletest/" }

   files { "tests/**.cc", "vendor/googletest/src/gtest_main.cc", "vendor/googletest/src/gtest-all.cc" }

   links "flair"

   filter "configurations:Debug"
      defines { "DEBUG" }
      flags { "Symbols" }

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"
