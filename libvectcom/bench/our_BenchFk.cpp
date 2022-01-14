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

#include <xassert/XAssert.h>
#include <xutils/Log.h>
#include <xutils/Utils.h>
#include <xutils/NotImplementedException.h>
#include <xutils/Timer.h>
//#include <ctime>

#include <libff/algebra/fields/field_utils.hpp>

using namespace std;
using namespace libfqfft;
using namespace libvectcom;


int main(int argc, char *argv[]){
    libvectcom::initialize(nullptr, 0);
    srand(static_cast<unsigned int>(time(NULL)));
    if(argc < 6) {
        cout << "Usage: " << argv[0] << "<min_file_size> <step> <iterations> <k> <lap>" << endl;
        cout << endl;
        cout << "OPTIONS: " << endl;
        cout << "   <min_file_size>      Minimal file size to commit" << endl;
        cout << "   <step>           Step between file sizes" << endl;
        cout << "   <iterations>             How many files" << endl;
        cout << "   <k>   Parameter k of the scheme" << endl;
        cout << "   <lap>   How many laps" << endl;
        cout << endl;

        return 1;
    }
    
    size_t min_file_size = static_cast<size_t>(std::stoi(argv[1]));
    size_t step = static_cast<size_t>(std::stoi(argv[2]));
    size_t iterations = static_cast<size_t>(std::stoi(argv[3]));
    size_t k = static_cast<size_t>(std::stoi(argv[4]));
    size_t lap = static_cast<size_t>(std::stoi(argv[5]));
    
    
    for(size_t j = 0; j < iterations*step; j = j+step) {
        size_t deg = (min_file_size + j)*(size_t)1.0e6/(size_t)(32*k);
        std::unique_ptr<Dkg::KatePublicParameters> kpp(
            new Dkg::KatePublicParameters("public-params/65536/65536", deg, true, true));
        auto total_time = 0.0;
        for(size_t i = 0; i < lap; i++) {
            std::vector<Fr> f = random_field_elems(deg + 1);
            time_t start = time(0);
            KZG::commit<G1>(*kpp, f);
            time_t diff = time(0) - start;
            total_time = total_time + diff;
        }
        auto average_time = total_time/lap;
        auto commit_time = average_time * k;
        
        
        cout
            << "File size: " << min_file_size + j << "MB, "
            <<  commit_time
            << endl;

    }
        


    loginfo << "Exited successfully!" << endl;


    return 0;
}
