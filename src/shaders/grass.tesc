#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(vertices = 1) out;

layout(set = 0, binding = 0) uniform CameraBufferObject {
    mat4 view;
    mat4 proj;
} camera;

// TODO: Declare tessellation control shader inputs and outputs
in gl_PerVertex {
    vec4 gl_Position;
} gl_in[gl_MaxPatchVertices];

layout(location = 0)in vec4[] inV0;
layout(location = 1)in vec4[] inV1;
layout(location = 2)in vec4[] inV2;
layout(location = 3)in vec4[] inUp;

layout(location = 0)out vec4[] outV0;
layout(location = 1)out vec4[] outV1;
layout(location = 2)out vec4[] outV2;
layout(location = 3)out vec4[] outUp;

//#define tessLevel 8

float getTessLevelFromLOD() {
    vec3 cameraForward = normalize(vec3(camera.view[0].z, camera.view[1].z, camera.view[2].z)); 
    vec3 cameraPos = -camera.view[3].xyz;
    vec3 v0 = inV0[0].xyz;
    float dist = length(cameraPos - v0);
    return max(4, min(20, floor( 14 - dist)));
}

void main() {
	// Don't move the origin location of the patch
    gl_out[gl_InvocationID].gl_Position = gl_in[gl_InvocationID].gl_Position;

	// TODO: Write any shader outputs
    outV0[gl_InvocationID] = inV0[gl_InvocationID];
    outV1[gl_InvocationID] = inV1[gl_InvocationID];
    outV2[gl_InvocationID] = inV2[gl_InvocationID];
    outUp[gl_InvocationID] = inUp[gl_InvocationID];


	// TODO: Set level of tesselation
     float tessLevel = getTessLevelFromLOD();
     gl_TessLevelInner[0] = tessLevel;
     gl_TessLevelInner[1] = tessLevel;
     gl_TessLevelOuter[0] = tessLevel;
     gl_TessLevelOuter[1] = tessLevel;
     gl_TessLevelOuter[2] = tessLevel;
     gl_TessLevelOuter[3] = tessLevel;
}



