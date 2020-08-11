CXX=g++
OBJDIR=source/obj
SRCDIR=source

SOURCES:=$(wildcard $(SRCDIR)/*.cpp)
OBJECTS:=$(SOURCES:$(SRCDIR)/%.cpp=$(OBJDIR)/%.o)
INCLUDES:=$(wildcard $(SRCDIR)/*.h)

CFLAGS=-std=gnu++11 -Wall -Wextra -pedantic -I . -I /usr/include/
CC_OPT=-O3 -ffast-math -fno-common
BIN=nm

all: $(BIN)

$(BIN) : $(OBJECTS)
	@$(CXX) $(OBJECTS) $(CC_OPT) -o $(BIN) $(LIBS)

$(OBJECTS) : $(OBJDIR)/%.o : $(SRCDIR)/%.cpp
	@$(CXX) $(CFLAGS) -c -g $< -o $@

test: all
	./$(BIN)

clean:
	rm -f $(BIN) $(OBJECTS)
