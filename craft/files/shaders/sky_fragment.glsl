// NebulaEdit port: GLSL ES (WebGL) instead of desktop GLSL 1.20
#version 100
precision highp float;
precision highp int;

uniform sampler2D sampler;
uniform float timer;

varying vec2 fragment_uv;

void main() {
    vec2 uv = vec2(timer, fragment_uv.t);
    gl_FragColor = texture2D(sampler, uv);
}
