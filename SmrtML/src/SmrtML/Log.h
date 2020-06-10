#pragma once

#include "Core.h"
#include "spdlog/spdlog.h"
namespace smrt_ml{
class SML_API Log
{
public:
	static void Init();

	inline static std::shared_ptr<spdlog::logger> GetCoreLogger() { return s_CoreLogger; }
	inline static std::shared_ptr<spdlog::logger> GetClientLogger() { return s_ClientLogger; }
private:
	static std::shared_ptr<spdlog::logger> s_CoreLogger;
	static std::shared_ptr<spdlog::logger> s_ClientLogger;


};

}

//core log macros
#define SML_CORE_ERROR(...) ::smrt_ml::Log::GetCoreLogger()->error(__VA_ARGS__)
#define SML_CORE_WARN(...) ::smrt_ml::Log::GetCoreLogger()->warn(__VA_ARGS__)
#define SML_CORE_INFO(...) ::smrt_ml::Log::GetCoreLogger()->info(__VA_ARGS__)
#define SML_CORE_TRACE(...) ::smrt_ml::Log::GetCoreLogger()->trace(__VA_ARGS__)
#define SML_CORE_FATAL(...) ::smrt_ml::Log::GetCoreLogger()->fatal(__VA_ARGS__) 


//client log macros
#define SML_ERROR(...) ::smrt_ml::Log::GetClientLogger()->error(__VA_ARGS__)
#define SML_WARN(...) ::smrt_ml::Log::GetClientLogger()->warn(__VA_ARGS__)
#define SML_INFO(...) ::smrt_ml::Log::GetClientLogger()->info(__VA_ARGS__)
#define SML_TRACE(...) ::smrt_ml::Log::GetClientLogger()->trace(__VA_ARGS__)
#define SML_FATAL(...) ::smrt_ml::Log::GetClientLogger()->fatal(__VA_ARGS__) 
