
#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(set = 1, binding = 0) uniform ModelBufferObject {
    mat4 model;
};

// TODO: Declare vertex shader inputs and outputs
layout(location = 0) in vec4 inV0;
layout(location = 1) in vec4 inV1;
layout(location = 2) in vec4 inV2;
layout(location = 3) in vec4 inUp;
layout(location = 0) out vec4 outV0;
layout(location = 1) out vec4 outV1;
layout(location = 2) out vec4 outV2;
layout(location = 3) out vec4 outUp;

out gl_PerVertex {
    vec4 gl_Position;
};

void main() {
	// TODO: Write gl_Position and any other shader outputs
    //Note we are NOT transforming into screen space bc we will have to use world space pos for positioning tessellated points later in evaluation shader
    outV0.xyz = (model * inV0).xyz;
    outV0.w = inV0.w;

    outV1.xyz = (model * inV1).xyz;
    outV1.w = inV1.w;

    outV2.xyz = (model * inV2).xyz;
    outV2.w = inV2.w;

    outUp = inUp;
	gl_Position = outV0;
}