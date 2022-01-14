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
    
    if(argc < 4) {
        cout << "Usage: " << argv[0] << "<k> <n> <L> <iter>" << endl;
        cout << endl;
        cout << "OPTIONS: " << endl;
        cout << "   <k>      Parameter k of the scheme" << endl;
        cout << "   <n>      Parameter n of the scheme" << endl;
        cout << "   <L>      Parameter L of the scheme" << endl;
        cout << "   <iter>   How many random samples to average over" << endl;
        cout << endl;

        return 1;
    }

    size_t k = static_cast<size_t>(std::stoi(argv[1]));
    size_t n = static_cast<size_t>(std::stoi(argv[2]));
    size_t L = static_cast<size_t>(std::stoi(argv[3]));
    size_t iter = static_cast<size_t>(std::stoi(argv[4]));

    std::vector<Fr> a = random_field_elems(n);
    std::vector<Fr> c;
    
    double total_time = 0.0;
    for (size_t i = 0; i < iter; i++){
        c.clear();
        std::vector<Fr> u = random_field_elems(k);
        auto start = high_resolution_clock::now();
        
        for (size_t j = 0; j < n; j++) {
            Fr temp = 0;
            for (size_t l = 1; l <= k; l++) {
                temp = temp*a[j] + u[k-l];
            }
            c.push_back(temp);
        }
        
        auto stop = high_resolution_clock::now();
        auto duration = duration_cast<microseconds>(stop - start);
        total_time = total_time + duration.count();
    }
    double average_time = total_time/iter;
    
    
    cerr << c << endl;
    cout << n << " " << k << " " << L << " " << iter << " " << (double)(k*L*32) / 1.0e6 << " " << average_time*L / 1.0e6 << " " << (double)(n*(L*32 + k*32))/ 1.0e6 << endl;
    return 0;
}

