// NebulaEdit port: GLSL ES (WebGL) instead of desktop GLSL 1.20
#version 100
precision highp float;
precision highp int;

uniform mat4 matrix;

attribute vec4 position;

void main() {
    gl_Position = matrix * position;
}
