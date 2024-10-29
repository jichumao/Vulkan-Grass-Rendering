#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(set = 0, binding = 0) uniform CameraBufferObject {
    mat4 view;
    mat4 proj;
} camera;

// TODO: Declare fragment shader inputs
layout(location = 0) in float inHeight;
layout(location = 1) in vec3 inNor;

layout(location = 0) out vec4 outColor;

void main() {
    // TODO: Compute fragment color

    // Hard coded base color and light direction
    vec3 lightDir = vec3(0.0, 5.0, 0.0);
    vec3 color1 = vec3(0.2, 0.2, 0.2);
    vec3 color2 =  vec3(0.1, 0.9, 0.1);
    vec3 albedo = mix(color1, color2, inHeight);

    float diffuse = dot(inNor, normalize(lightDir));
    diffuse = clamp(diffuse,0.0, 1.0);

    vec3 color = albedo * (0.5f + diffuse);
    outColor = vec4(color, 1.0);
}