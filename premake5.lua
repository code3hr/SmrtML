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



    pchheader "smrtpch.h"
    pchsource "SmrtML/src/smrtpch.cpp"
    files 
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }
    includedirs
    {
     "%{prj.name}/src",
        "%{prj.name}/vendor/spdlog/include",
         "%{prj.name}/vendor/armadillo/include",
         "%{prj.name}/vendor/mkl/include",
         "%{prj.name}/vendor/hdf5/include",
         "SmrtML/vendor/imgui"
    }
    libdirs { "%{prj.name}/vendor/mkl/lib",
    "%{prj.name}/vendor/hdf5/lib" }
    links { "mkl_core.lib",
    "mkl_sequential.lib",
    "mkl_intel_lp64.lib",
    "szip.lib",
     "zlib.lib",
      "hdf5.lib",
       "hdf5_cpp.lib"
}
    filter "system:windows"
         cppdialect "c++17"
         staticruntime "off"
         systemversion "latest"
         defines
         {
            "SML_PLATFORM_WINDOWS",
            "SML_BUILD_DLL",
            "H5_BUILT_AS_DYNAMIC_LIB"

         }
         postbuildcommands
         {
             ("IF NOT EXIST ../bin/" .. outputdir .. "/Sandbox mkdir ../bin" .. outputdir .. "/Sandbox"),
             ("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
         }
    filter "configurations:Debug"
        defines "SML_DEBUG"
        buildoptions "/MDd"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
    runtime "Release"
    buildoptions "/MD"
        defines "SML_RELEASE"
        optimize "On"

    filter "configurations:Dist"
    buildoptions "/MD"
        defines "SML_DIST"
        buildoptions "/MD"
        runtime "Release"

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
  "SmrtML/src",
  "SmrtML/vendor/armadillo/include",
  "SmrtML/vendor/mkl/include",
  "SmrtML/vendor/hdf5/include",
  "SmrtML/vendor/imgui"
}


libdirs
 {
    "SmrtML/vendor/mkl/lib",
    "SmrtML/vendor/hdf5/lib",

 }
links
 {
"SmrtML",
"mkl_core.lib",
"mkl_sequential.lib",
"mkl_intel_lp64.lib",
"szip.lib",
"zlib.lib",
"hdf5.lib",
"hdf5_cpp.lib"
}
filter "system:windows"
     cppdialect "c++17"
     staticruntime "off"
     systemversion "latest"
     defines
     {
        "SML_PLATFORM_WINDOWS",
        "H5_BUILT_AS_DYNAMIC_LIB"
    
     }
    
filter "configurations:Debug"
    defines "SML_DEBUG"
    -- buildoptions "/MDd"
    runtime "Debug"
    symbols "On"

filter "configurations:Release"
defines "SML_RELEASE"
runtime "Release"

-- buildoptions "/MD"
optimize "On"

filter "configurations:Dist"
defines "SML_DIST"
buildoptions "/MD"
runtime "Release"

optimize "On"   