#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform float amplitude = 0.1;
uniform float freq = 1; // expressada en Hz
uniform float time;
uniform float PI = 3.141592;

void main()
{
    float dt = amplitude*(sin(2*PI*freq*time));
    vec3 N = normalize(normalMatrix * normal);    //N esta es eye space 
    frontColor = vec4(vec3(N.z),1.0);   //
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex + normal*dt, 1.0);
    
}
