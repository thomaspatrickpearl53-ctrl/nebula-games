// NebulaEdit port: GLSL ES (WebGL) instead of desktop GLSL 1.20
#version 100
precision highp float;
precision highp int;

uniform mat4 matrix;

attribute vec4 position;
attribute vec2 uv;

varying vec2 fragment_uv;

void main() {
    gl_Position = matrix * position;
    fragment_uv = uv;
}
