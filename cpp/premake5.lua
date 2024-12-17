-- premake5.lua
workspace "Workspace_Name"
   configurations { "Debug", "Release" }

   project "Project_Name"
   kind "ConsoleApp"
   language "C++"
   cppdialect "C++17"
   architecture "x64"
   targetdir "bin/%{cfg.buildcfg}"

   includedirs {
        "./src",
        "./src/include",
    }

   files { "**.h", "**.hpp", "**.cpp", "**.cc", "**.cx", "**.c" }

   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
      defines { "NDEBUG" }
      optimize "On"
