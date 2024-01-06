# Define the source and header directories
SRC_DIR = src
INC_DIR = include

# List all source files and header files
SRC_FILES := $(wildcard $(SRC_DIR)/*.cpp)
HDR_FILES := $(wildcard $(INC_DIR)/*.h)

# Create object file names from source files
OBJ_FILES := $(patsubst $(SRC_DIR)/%.cpp,obj/%.o,$(SRC_FILES))

# Binary file name
BIN_FILE = fractal.bin

# Specify the compiler and compiler flags
CXX = g++
CXXFLAGS = -std=c++17

# Build the binary target
$(BIN_FILE): $(OBJ_FILES)
	$(CXX) $(OBJ_FILES) -o $(BIN_FILE) -lsfml-graphics -lsfml-window -lsfml-system

# Compile source files into object files
obj/%.o: $(SRC_DIR)/%.cpp $(HDR_FILES)
	$(CXX) $(CXXFLAGS) -I$(INC_DIR) -c $< -o $@

# Clean up generated files
clean:
	rm -f $(OBJ_FILES) $(BIN_FILE)

# Specify the default target to build when 'make' is invoked
.PHONY: default
default: $(BIN_FILE)
