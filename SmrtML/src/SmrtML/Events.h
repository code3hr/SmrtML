#pragma once
#include "Core.h"


namespace smrt_ml {

	//abstract class for cost functions
	class SML_API Events
	{

	public:
		Events();


		virtual ~Events();
	};

	//cost functions and gradients

	class SML_API Layers : public Events
	{
	public:
		Layers();
		~Layers();
	};
}