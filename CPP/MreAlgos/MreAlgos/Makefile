CC=g++
CFLAGS=-c -O3 -Wall -std=c++2a
LDFLAGS=
SOURCES=main.cpp
OBJECTS=$(SOURCES:.cpp=.o)
EXECUTABLE=MreAlgos

all: $(SOURCES) $(EXECUTABLE)
$(EXECUTABLE): $(OBJECTS)
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@

.cpp.o:
	$(CC) $(CFLAGS) $< -o $@

clean:
	-rm -f *.o $(EXECUTABLE)

install: clean all
	rm -rf .build
	mkdir .build
	cp $(EXECUTABLE) .build/
	rm *.o $(EXECUTABLE)

