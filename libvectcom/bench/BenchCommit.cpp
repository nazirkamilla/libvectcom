#include <vectcom/Configuration.h>
#include <typeinfo>

#include <vectcom/PolyCrypto.h>
#include <vectcom/PolyOps.h>
#include <vectcom/Utils.h>
#include <vectcom/KZG.h>
#include <vectcom/FFT.h>
#include <vectcom/KatePublicParameters.h>

#include <cmath>
#include <ctime>
#include <iostream>
#include <fstream>
#include <stdexcept>
#include <vector>
#include <chrono>

#include <xassert/XAssert.h>
#include <xutils/Log.h>
#include <xutils/Utils.h>
#include <xutils/NotImplementedException.h>
#include <xutils/Timer.h>


#include <libff/algebra/fields/field_utils.hpp>

using namespace std;
using namespace libfqfft;
using namespace libvectcom;
using namespace std::chrono;


int main(int argc, char *argv[]) {
    libvectcom::initialize(nullptr, 0);
    srand(static_cast<unsigned int>(time(NULL)));
    
    if(argc < 3) {
        cout << "Usage: " << argv[0] << "<k> <L> <iter>" << endl;
        cout << endl;
        cout << "OPTIONS: " << endl;
        cout << "   <k>      Parameter k of the scheme" << endl;
        cout << "   <L>      Parameter L of the scheme" << endl;
        cout << "   <iter>   How many random samples to average over" << endl;
        cout << endl;

        return 1;
    }
    
    size_t k = static_cast<size_t>(std::stoi(argv[1]));
    size_t L = static_cast<size_t>(std::stoi(argv[2]));
    size_t iter = static_cast<size_t>(std::stoi(argv[3]));
    

    std::unique_ptr<Dkg::KatePublicParameters> kpp(
        new Dkg::KatePublicParameters("public-params/65536/65536", L, true, true));
    
    double total_time = 0.0;
    for (size_t i = 0; i < iter; i++) {
        std::vector<Fr> f = random_field_elems(L + 1);
        
        auto start = high_resolution_clock::now();
        
        auto C =  KZG::commit<G1>(*kpp, f);
        
        auto stop = high_resolution_clock::now();
        auto duration = duration_cast<microseconds>(stop - start);
        
        total_time = total_time + duration.count();
        cerr << C << endl;
    }
    
    double average_time = total_time/iter;
    cout  << (double)(k*L*32) / 1.0e6 << " " << average_time*k / 1.0e6 << endl;
    return 0;
}
