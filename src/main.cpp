/**
 * @file main.cpp
 * @brief Just trying out doxygen
 * @author Does it matter?
 * @version 0.1
 * @date 2022-11-02
 *
 * @copyright Copyright (c) 2022
 *
 * Comments _must_ be written in [**Markdown**](https://www.markdownguide.org/cheat-sheet/).
 */

#include <iostream>

#include <stdio.h>
#include <stdlib.h>

/**
 * @brief Demonstrates an insecure array access.
 * Expected: The compiler protections will kick in at runtime.
 * @attention This function contains an off-by-one error that will lead to out-of-bounds access.
 */
void insecure_array_access()
{
	int arr[10];
	// This is an insecure array access
	for (int i = 0; i <= 10; i++) // Off-by-one error
	{
		arr[i] = i; // This will cause an out-of-bounds write on the last iteration
	}
}

void insecure_null_pointer_dereference()
{
	int *ptr = nullptr;
	// Dereferencing a null pointer is insecure
	std::cout << "Dereferenced null pointer: " << *ptr << std::endl; // This will lead to undefined behavior
	*ptr = 42;														 // This will cause a segmentation fault
}

void insecure_use_after_free()
{
	int *arr = new int[10];
	delete[] arr; // Free the memory
	// Using the pointer after freeing it is insecure
	std::cout << "Using freed memory:" << std::endl;
	for (int i = 0; i < 10; i++)
	{
		std::cout << arr[i] << std::endl; // This will lead to undefined behavior
	}
}

int main()
{
	std::cout << "Hello, World!" << std::endl;
	// insecure_array_access();
	insecure_use_after_free();
	insecure_null_pointer_dereference();
	return 0;
}
