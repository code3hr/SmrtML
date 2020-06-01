
#include"smrt_ml.h"

class Sandbox : public smrt_ml::Application
{
public:
	Sandbox() {}
	~Sandbox() {}
};

smrt_ml::Application* smrt_ml::CreateApplication()
{
	return new Sandbox();
}