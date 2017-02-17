BIN := bin
NAME := out

all: ikvm

run: ikvm
	./proof-of-concept.exe

ikvm: $(NAME).jar GuiceRepro.cs
	ikvmc -assemblyattributes:$(BIN)/AssemblyInfo.class -target:library $<
	mcs -target:exe -main:foo.MainClass -r:System.dll,IKVM.Runtime.dll,IKVM.OpenJDK.Core.dll,$(NAME).dll -out:proof-of-concept.exe GuiceRepro.cs AssemblyInfo.cs

compile-java:
	mkdir -p $(BIN)
	javac -d $(BIN) -classpath $(CLASSPATH) $$(find src/ -name "*.java")

%.jar: compile-java
	cd $(BIN) && jar cf ../$(NAME).jar `find . -name "*.class"`

clean:
	rm -rf $(BIN)
	rm -f $(NAME).jar
	rm -f $(NAME).dll
	rm -f $(NAME).exe
