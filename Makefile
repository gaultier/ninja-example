CFLAGS := -Wall -Wextra -g -fPIE
CXXFLAGS := -Wall -Wextra -g -fPIE

BUILD_DIR := .build_make
SRC_DIR := .


$(BUILD_DIR)/example: $(BUILD_DIR)/example.o $(BUILD_DIR)/libfoo.a $(SRC_DIR)/rust_foo/target/debug/librust_foo.a
	$(CXX) $(LDFLAGS) $^ -o $@

$(BUILD_DIR)/lib.o: $(SRC_DIR)/lib.cpp $(SRC_DIR)/lib.h $(SRC_DIR)/rust_foo/rust_foo.h
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(BUILD_DIR)/libfoo.a: $(BUILD_DIR)/lib.o
	$(AR) rcs $@ $<

$(BUILD_DIR)/example.o: $(SRC_DIR)/example.c
	$(CC) $(CFLAGS) -c $< -o $@

$(SRC_DIR)/rust_foo/target/debug/librust_foo.a: $(SRC_DIR)/rust_foo/src/lib.rs
	cd $(SRC_DIR)/rust_foo && cargo build

$(SRC_DIR)/rust_foo/rust_foo.h: $(SRC_DIR)/rust_foo/src/lib.rs
	cbindgen --lang=c --cpp-compat $(SRC_DIR)/rust_foo -o $@
