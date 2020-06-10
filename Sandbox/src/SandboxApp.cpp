
#include"smrt_ml.h"
#include<iostream>
class Sandbox : public smrt_ml::Application
{
public:
	Sandbox() {}
	void print() {
		std::cout << "hello world from sandbox" << std::endl;
	}
	~Sandbox() {}
};
class joel {
public:
	static	void print() {
		std::cout << "hello world from  3 sandbox" << std::endl;

	}
};
smrt_ml::Application* smrt_ml::CreateApplication()
{
	Sandbox b = Sandbox();
	b.print();
	joel::print();
	//smrt_ml::printing();
	SML_WARN("Initialized log!");
	smrt_ml::print();
	SML_ERROR(" just messing with the api");
	return new Sandbox();
}