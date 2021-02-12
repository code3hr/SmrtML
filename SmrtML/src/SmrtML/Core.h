#pragma once

#ifdef SML_PLATFORM_WINDOWS
#ifdef SML_BUILD_DLL

#define SML_API __declspec(dllexport)
#else
#define SML_API __declspec(dllimport)
#endif // SML_BUILD_DLL

#else
   #error Smrt_ML only supports windows!
#endif //SML_PLATFORM_WINDOWS
