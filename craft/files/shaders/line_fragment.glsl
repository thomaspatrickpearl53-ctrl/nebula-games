// NebulaEdit port: GLSL ES (WebGL) instead of desktop GLSL 1.20
#version 100
precision highp float;
precision highp int;

void main() {
    // white: drawn with "invert" blending for the crosshair and block outline (see src/GL/glew.h)
    gl_FragColor = vec4(1.0, 1.0, 1.0, 1.0);
}
