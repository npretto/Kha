package kha.graphics;

import kha.Blob;
import kha.Image;

interface Graphics {
	function createVertexBuffer(vertexCount: Int, structure: VertexStructure): VertexBuffer;
	function setVertexBuffer(vertexBuffer: VertexBuffer): Void;
	
	function createIndexBuffer(indexCount: Int): IndexBuffer;
	function setIndexBuffer(indexBuffer: IndexBuffer): Void;
	
	function createTexture(image: Image): Texture;
	function setTexture(texture: Texture, stage: Int): Void;
	function setTextureWrap(stage: Int, u: TextureWrap, v: TextureWrap): Void;
	
	function createVertexShader(source: Blob): VertexShader;
	function createFragmentShader(source: Blob): FragmentShader;
	function createProgram(): Program;
	function setProgram(program: Program): Void;
	
	function setInt(location: Int, value: Int): Void;
	function setFloat(location: Int, value: Float): Void;
	function setFloat2(location: Int, value1: Float, value2: Float): Void;
	function setFloat3(location: Int, value1: Float, value2: Float, value3: Float): Void;
	function setMatrix(location: Int, matrix: Array<Float>): Void;
	
	function drawIndexedVertices(start: Int = 0, count: Int = -1): Void;
}
