CC=/usr/bin/g++
CFLAGS=-c
LIB=-lglut -lGLU -lGL -lglfw -lGLEW -lpng
BUILD_DIR=./build

all: main

main: Block.o Lighting.o Lightmap.o LightSolver.o LineBatch.o files.o voxel_engine.o Events.o Window.o png_loading.o Shader.o Texture.o Mesh.o VoxelRenderer.o Chunk.o Chunks.o voxel.o Camera.o
	$(CC) $(BUILD_DIR)/Block.o $(BUILD_DIR)/Lighting.o $(BUILD_DIR)/Lightmap.o $(BUILD_DIR)/LightSolver.o $(BUILD_DIR)/LineBatch.o $(BUILD_DIR)/files.o $(BUILD_DIR)/Camera.o $(BUILD_DIR)/Chunk.o $(BUILD_DIR)/Chunks.o $(BUILD_DIR)/voxel.o $(BUILD_DIR)/Mesh.o $(BUILD_DIR)/VoxelRenderer.o $(BUILD_DIR)/voxel_engine.o $(BUILD_DIR)/Events.o $(BUILD_DIR)/Window.o $(BUILD_DIR)/Texture.o $(BUILD_DIR)/png_loading.o $(BUILD_DIR)/Shader.o $(LIB) -o $(BUILD_DIR)/main	

voxel_engine.o: ./src/voxel_engine.cpp
	$(CC) $(CFLAGS) ./src/voxel_engine.cpp -o $(BUILD_DIR)/voxel_engine.o

Events.o: ./src/window/Events.cpp
	$(CC) $(CFLAGS) ./src/window/Events.cpp -o $(BUILD_DIR)/Events.o

Window.o: ./src/window/Window.cpp
	$(CC) $(CFLAGS) ./src/window/Window.cpp -o $(BUILD_DIR)/Window.o

Camera.o: ./src/window/Camera.cpp
	$(CC) $(CFLAGS) ./src/window/Camera.cpp -o $(BUILD_DIR)/Camera.o

png_loading.o: ./src/loaders/png_loading.cpp
	$(CC) $(CFLAGS) ./src/loaders/png_loading.cpp -o $(BUILD_DIR)/png_loading.o

LineBatch.o: ./src/graphics/LineBatch.cpp
	$(CC) $(CFLAGS) ./src/graphics/LineBatch.cpp -o $(BUILD_DIR)/LineBatch.o

Shader.o: ./src/graphics/Shader.cpp
	$(CC) $(CFLAGS) ./src/graphics/Shader.cpp -o $(BUILD_DIR)/Shader.o

Texture.o: ./src/graphics/Texture.cpp
	$(CC) $(CFLAGS) ./src/graphics/Texture.cpp -o $(BUILD_DIR)/Texture.o

Mesh.o: ./src/graphics/Mesh.cpp
	$(CC) $(CFLAGS) ./src/graphics/Mesh.cpp -o $(BUILD_DIR)/Mesh.o

VoxelRenderer.o: ./src/graphics/VoxelRenderer.cpp
	$(CC) $(CFLAGS) ./src/graphics/VoxelRenderer.cpp -o $(BUILD_DIR)/VoxelRenderer.o

Chunk.o: ./src/voxels/Chunk.cpp
	$(CC) $(CFLAGS) ./src/voxels/Chunk.cpp -o $(BUILD_DIR)/Chunk.o

Chunks.o: ./src/voxels/Chunks.cpp
	$(CC) $(CFLAGS) ./src/voxels/Chunks.cpp -o $(BUILD_DIR)/Chunks.o

voxel.o: ./src/voxels/voxel.cpp
	$(CC) $(CFLAGS) ./src/voxels/voxel.cpp -o $(BUILD_DIR)/voxel.o

Block.o: ./src/voxels/Block.cpp
	$(CC) $(CFLAGS) ./src/voxels/Block.cpp -o $(BUILD_DIR)/Block.o

files.o: ./src/files/files.cpp
	$(CC) $(CFLAGS) ./src/files/files.cpp -o $(BUILD_DIR)/files.o

Lighting.o: ./src/lighting/Lighting.cpp
	$(CC) $(CFLAGS) ./src/lighting/Lighting.cpp -o $(BUILD_DIR)/Lighting.o

Lightmap.o: ./src/lighting/Lightmap.cpp
	$(CC) $(CFLAGS) ./src/lighting/Lightmap.cpp -o $(BUILD_DIR)/Lightmap.o

LightSolver.o: ./src/lighting/LightSolver.cpp
	$(CC) $(CFLAGS) ./src/lighting/LightSolver.cpp -o $(BUILD_DIR)/LightSolver.o

clean:
	rm -rf $(BUILD_DIR)/main $(BUILD_DIR)/*.o