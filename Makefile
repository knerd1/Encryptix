CXX = g++                                    # Created a varibale CXX and store g++.


# Created variable CXXFLAG and tells which version of c++ we will use with -g
# (g flag will use in debugging and it will give warning also with linker(I)).
# Now it will tell link all the folders.
CXXFLAGS = -std=c++17 -g -Wall -I. -Isrc/app/encryptDecrypt -Isrc/app/fileHandling -Isrc/app/processes   

MAIN_TARGET = encrypt_decrypt         # Main file will be created with name of encrypt_decrypt
CRYPTION_TARGET = cryption            # All cryption file will be use and it will create a executable of cryption

MAIN_SRC = main.cpp \
           src/app/processes/ProcessManagement.cpp \
           src/app/fileHandling/IO.cpp \
           src/app/fileHandling/ReadEnv.cpp \
           src/app/encryptDecrypt/Cryption.cpp

CRYPTION_SRC = src/app/encryptDecrypt/CryptionMain.cpp \
               src/app/encryptDecrypt/Cryption.cpp \
               src/app/fileHandling/IO.cpp \
               src/app/fileHandling/ReadEnv.cpp

MAIN_OBJ = $(MAIN_SRC:.cpp=.o)          # Now we will create object files from every cpp files(every cpp f               ile will have .O file)
CRYPTION_OBJ = $(CRYPTION_SRC:.cpp=.o)    # Same with cryption, create object files 

all: $(MAIN_TARGET) $(CRYPTION_TARGET)

$(MAIN_TARGET): $(MAIN_OBJ)
	$(CXX) $(CXXFLAGS) $^ -o $@

$(CRYPTION_TARGET): $(CRYPTION_OBJ)
	$(CXX) $(CXXFLAGS) $^ -o $@

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -f $(MAIN_OBJ) $(CRYPTION_OBJ) $(MAIN_TARGET) $(CRYPTION_TARGET)

.PHONY: clean all
