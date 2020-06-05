workspace "SmrtML"
    architecture "x64"

    configurations
    {
        "Debug",
        "Release",
        "Dist"
    }
outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
startproject "Sandbox"
project "SmrtML"
    location "SmrtML"
    kind "SharedLib"
    language "c++"
    targetdir("bin/" .. outputdir .. "/%{prj.name}")
    objdir("bin-int/" .. outputdir .. "/%{prj.name}")

    files 
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }
    includedirs
    {
      "%{prj.name}/vendor/spdlog/include"
    }

    filter "system:windows"
         cppdialect "c++17"
         staticruntime "On"
         systemversion "10.0.18362.0"
         defines
         {
            "SML_PLATFORM_WINDOWS",
            "SML_BUILD_DLL"
         }
         postbuildcommands
         {
             ("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
         }
    filter "configurations:Debug"
        defines "SML_DEBUG"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
    runtime "Release"

        defines "SML_RELEASE"
        optimize "On"

    filter "configurations:Dist"
    buildoptions "/MD"
        defines "SML_DIST"
        optimize "On"    
    -- filter {"system.windows", "configuration:Release"} for both if needed
    --   buildoptions "/MT" //FOR MULTI THREADING
project "Sandbox"
location "Sandbox"
kind "ConsoleApp"
language "c++"
targetdir("bin/" .. outputdir .. "/%{prj.name}")
objdir("bin-int/" .. outputdir .. "/%{prj.name}")

files 
{
    "%{prj.name}/src/**.h",
    "%{prj.name}/src/**.cpp"
}
includedirs
{
  "SmrtML/vendor/spdlog/include",
  "SmrtML/src"
}

links 
{
    "SmrtML"
}
filter "system:windows"
     cppdialect "c++17"
     staticruntime "On"
     systemversion "10.0.18362.0"
     defines
     {
        "SML_PLATFORM_WINDOWS",
    
     }
    
filter "configurations:Debug"
    defines "SML_DEBUG"
    symbols "On"

filter "configurations:Release"
defines "SML_RELEASE"
optimize "On"

filter "configurations:Dist"
defines "SML_DIST"
optimize "On"   