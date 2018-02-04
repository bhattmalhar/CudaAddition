/**
* Vector Addition - Simple addition using Cuda.
* Author - Malhar Bhatt
* Subject - High Performance Computing
*/

#include <iostream>
#include "headers.cuh"

/** Function Add - 
* Usage - Add 2 values
* Returns - Void
*/
__global__ void add( int num1, int num2, int *ans ) 
{
	*ans = num1 + num2;
}
int main( void ) 
{
	int numc;
	int *dev_numc;
	HANDLE_ERROR( cudaMalloc( (void**)&dev_numc, sizeof(int) ) );
	add<<<1,1>>>( 10, 10, dev_numc ); // 1 thread and 1 kernel
	HANDLE_ERROR( cudaMemcpy( &numc,dev_numc,sizeof(int),cudaMemcpyDeviceToHost ) );
	printf( "10 + 10 = %d\n", numc );
	cudaFree( dev_numc );
	system("pause");
	return 0;
}