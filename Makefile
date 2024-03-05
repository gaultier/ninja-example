CFLAGS := -Wall -Wextra -g -fPIE
CXXFLAGS := -Wall -Wextra -g -fPIE

BUILD_DIR := .build
SRC_DIR := .


$(BUILD_DIR)/example: $(SRC_DIR)/example.o $(BUILD_DIR)/libfoo.a
	$(CC) $(LDFLAGS) $^ -o $@

$(BUILD_DIR)/lib.o: $(SRC_DIR)/lib.cpp $(SRC_DIR)/lib.h
	$(CXX) $(CXXFLAGS) $< -o $@

$(BUILD_DIR)/libfoo.a: $(BUILD_DIR)/lib.o
	$(AR) rcs $@ $<

$(BUILD_DIR)/example.o: $(SRC_DIR)/example.c
	$(CC) $(CFLAGS) $< -o $@

