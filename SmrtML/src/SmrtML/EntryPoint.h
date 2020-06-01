#pragma once

#ifdef SML_PLATFORM_WINDOWS
extern smrt_ml::Application* smrt_ml::CreateApplication();

int main(int agrc, char ** agrv)
{
	auto app = smrt_ml::CreateApplication();
	app->Run();
	delete app;
}
#else
#error smrt_ml only supports windows! 
#endif // SML_PLATFORM_WINDOWS
