-- YOU MUST define SPDLOG_COMPILED_LIB in your application as well!!! 
project "spdlog"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    targetdir "%{_WORKING_DIR}/builds/%{cfg.shortname}/"
    objdir "%{_WORKING_DIR}/obj/%{prj.name}_%{cfg.shortname}/"

    files {
        "src/**.cpp",
        "src/**.c",
        "include/**.h"
    }

    includedirs {
        "include/"

    }

    defines {
        "SPDLOG_COMPILED_LIB"
    }

    -- Debug All Operate Systems & Configurations
    filter{}
    filter "configurations:debug"
        runtime "Debug"
        symbols "on"

    -- Dist All Operate Systems & Configurations
    filter{}
    filter "configurations:dist"
        runtime "Release"
        optimize "on"

    -- Release All Operate Systems & Configurations
    filter{}
    filter "configurations:release"
        runtime "Release"
        optimize "on"

    -- Linux All Configurations
    filter{}
    filter "system:Linux"
        buildoptions {
            "-Wall",
            "-Wextra",
            "-Wconversion",
            "-pedantic",
            "-Werror",
            "-Wfatal-errors",
            "-fpic",
            "-pthread"
        }


    -- Windows All Configurations
    filter{}
    filter "system:Windows"

        buildoptions {
            "/W3",
            "/WX"
        }
