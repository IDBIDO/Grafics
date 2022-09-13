#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform float speed = 0.5;
uniform float time;
uniform float PI = 3.141592;

void main()
{
    float angulo = speed* time;
    mat3 rotateY = mat3(vec3(cos(angulo), 0, -sin(angulo)),
                     vec3(0, 1, 0),
                    vec3(sin(angulo), 0, cos(angulo)));
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(color,1.0);
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(rotateY*vertex, 1.0);
}
