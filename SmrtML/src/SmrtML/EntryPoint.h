#pragma once

#ifdef SML_PLATFORM_WINDOWS
extern smrt_ml::Application* smrt_ml::CreateApplication();


int main(int agrc, char ** agrv)
{

	smrt_ml::Log::Init();
	SML_CORE_WARN("Initialized log!");
	float version = 1.0f;
	SML_CORE_INFO("Hello VERSION = {0}", version);

	auto app = smrt_ml::CreateApplication();
	//app->Run();
	//app->print();
	delete app;
}
#else
#error smrt_ml only supports windows! 
#endif // SML_PLATFORM_WINDOWS
