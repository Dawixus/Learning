#include <iostream>
#include "Input.h"

void printSubset(const char items[], const bool signature[], const size_t count)
{
    std::cout << "{";
    bool isFirstPrintedItem = true;
 
    for (size_t index = 0; index < count; ++index)
    {
        if (signature[index])
        {
            std::cout << (isFirstPrintedItem ? " " : ", ") << items[index];
            isFirstPrintedItem = false;
        }
    }
 
    std::cout << " }" << std::endl;
}

void findSubsetsRecursive(const char items[], bool signature[], const size_t count, const size_t index)
{
    if (index == count)
    {
        printSubset(items, signature, count);
        return;
    }
 
    signature[index] = true;
    findSubsetsRecursive(items, signature, count, index + 1);
 
    signature[index] = false;
    findSubsetsRecursive(items, signature, count, index + 1);
}

void findSubsets(const char items[], const size_t count)
{
    bool* signature = new bool[count];
 
    findSubsetsRecursive(items, signature, count, 0);
 
    delete[] signature;
}
 
int main()
{
    findSubsets(ITEMS, COUNT);
 
    return 0;
}