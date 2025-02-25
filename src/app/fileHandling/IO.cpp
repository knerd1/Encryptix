#include "IO.hpp"
#include <fstream>
#include <iostream>

using namespace std;
IO::IO(const std::string &file_path) {
  file_stream.open(file_path, std::ios::in | std::ios::out | std::ios::binary);
  if (!file_stream.is_open()) {
    std::cout << "Unable to open file: " << file_path << std::endl;
  }
}

IO::~IO() {
  if (file_stream.is_open()) {
    file_stream.close();
  }
}

std::fstream IO::getFileStream() { return std::move(file_stream); }
