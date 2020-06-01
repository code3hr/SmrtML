#pragma once
#include "Core.h"
namespace smrt_ml {
	class SML_API Application
	{

	public:
		Application();
		void Run();
		virtual ~Application();
	};
	//to be define in client
	Application* CreateApplication();

}
