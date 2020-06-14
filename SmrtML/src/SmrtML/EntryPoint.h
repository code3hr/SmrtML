#pragma once
#include "smrtpch.h"
#include <armadillo>

#ifdef SML_PLATFORM_WINDOWS
extern smrt_ml::Application* smrt_ml::CreateApplication();


int main(int agrc, char ** agrv)
{

	smrt_ml::Log::Init();
	SML_CORE_WARN("Initialized log!");
	float version = 1.0f;
	SML_CORE_INFO("Hello VERSION = {0}", version);
	/// testing armadillo

		
		   // Initialize the random generator
		   arma::arma_rng::set_seed_random();
		
			   // Create a 4x4 random matrix and print it on the screen
			    arma::Mat<double> A = arma::randu(4, 4);
		    std::cout << "A:\n" << A << "\n";
		
			    // Multiply A with his transpose:
			    std::cout << "A * A.t() =\n";
		     std::cout << A * A.t() << "\n";
		
			  // Access/Modify rows and columns from the array:
			    A.row(0) = A.row(1) + A.row(3);
		    A.col(3).zeros();
		    std::cout << "add rows 1 and 3, store result in row 0, also fill 4th column with zeros:\n";
		  std::cout << "A:\n" << A << "\n";
		
			  // Create a new diagonal matrix using the main diagonal of A:
			    arma::Mat<double>B = arma::diagmat(A);
		 std::cout << "B:\n" << B << "\n";
		
			   // Save matrices A and B:
			   A.save("A_mat.txt", arma::arma_ascii);
		  B.save("B_mat.txt", arma::arma_ascii);
	auto app = smrt_ml::CreateApplication();
	//app->Run();
	//app->print();
	delete app;
}
#else
#error smrt_ml only supports windows! 
#endif // SML_PLATFORM_WINDOWS
