module shaders.noninterleaved;
import sg = sokol.gfx;
import m = handmade.math;
extern(C):

/*
    #version:1# (machine generated, don't edit!)

    Generated by sokol-shdc (https://github.com/floooh/sokol-tools)

    Cmdline:
        sokol-shdc -i src/shaders/noninterleaved.glsl -o src/shaders/noninterleaved.d -l glsl430:metal_macos:hlsl4:glsl300es:wgsl -f sokol_d

    Overview:
    =========
    Shader program: 'noninterleaved':
        Get shader desc: noninterleavedShaderDesc(sg.queryBackend());
        Vertex shader: vs
            Attributes:
                ATTR_VS_POSITION => 0
                ATTR_VS_COLOR0 => 1
            Uniform block 'vs_params':
                D struct: VsParams
                Bind slot: SLOT_VS_PARAMS => 0
        Fragment shader: fs
*/
enum ATTR_VS_POSITION = 0;
enum ATTR_VS_COLOR0 = 1;
enum SLOT_VS_PARAMS = 0;
struct VsParams {
    align(16) m.Mat4 mvp;
}
/*
    #version 430

    uniform vec4 vs_params[4];
    layout(location = 0) in vec4 position;
    layout(location = 0) out vec4 color;
    layout(location = 1) in vec4 color0;

    void main()
    {
        gl_Position = mat4(vs_params[0], vs_params[1], vs_params[2], vs_params[3]) * position;
        color = color0;
    }

*/
__gshared char[284] VS_SOURCE_GLSL430 = [
    0x23,0x76,0x65,0x72,0x73,0x69,0x6f,0x6e,0x20,0x34,0x33,0x30,0x0a,0x0a,0x75,0x6e,
    0x69,0x66,0x6f,0x72,0x6d,0x20,0x76,0x65,0x63,0x34,0x20,0x76,0x73,0x5f,0x70,0x61,
    0x72,0x61,0x6d,0x73,0x5b,0x34,0x5d,0x3b,0x0a,0x6c,0x61,0x79,0x6f,0x75,0x74,0x28,
    0x6c,0x6f,0x63,0x61,0x74,0x69,0x6f,0x6e,0x20,0x3d,0x20,0x30,0x29,0x20,0x69,0x6e,
    0x20,0x76,0x65,0x63,0x34,0x20,0x70,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x3b,0x0a,
    0x6c,0x61,0x79,0x6f,0x75,0x74,0x28,0x6c,0x6f,0x63,0x61,0x74,0x69,0x6f,0x6e,0x20,
    0x3d,0x20,0x30,0x29,0x20,0x6f,0x75,0x74,0x20,0x76,0x65,0x63,0x34,0x20,0x63,0x6f,
    0x6c,0x6f,0x72,0x3b,0x0a,0x6c,0x61,0x79,0x6f,0x75,0x74,0x28,0x6c,0x6f,0x63,0x61,
    0x74,0x69,0x6f,0x6e,0x20,0x3d,0x20,0x31,0x29,0x20,0x69,0x6e,0x20,0x76,0x65,0x63,
    0x34,0x20,0x63,0x6f,0x6c,0x6f,0x72,0x30,0x3b,0x0a,0x0a,0x76,0x6f,0x69,0x64,0x20,
    0x6d,0x61,0x69,0x6e,0x28,0x29,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x67,0x6c,0x5f,
    0x50,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x20,0x3d,0x20,0x6d,0x61,0x74,0x34,0x28,
    0x76,0x73,0x5f,0x70,0x61,0x72,0x61,0x6d,0x73,0x5b,0x30,0x5d,0x2c,0x20,0x76,0x73,
    0x5f,0x70,0x61,0x72,0x61,0x6d,0x73,0x5b,0x31,0x5d,0x2c,0x20,0x76,0x73,0x5f,0x70,
    0x61,0x72,0x61,0x6d,0x73,0x5b,0x32,0x5d,0x2c,0x20,0x76,0x73,0x5f,0x70,0x61,0x72,
    0x61,0x6d,0x73,0x5b,0x33,0x5d,0x29,0x20,0x2a,0x20,0x70,0x6f,0x73,0x69,0x74,0x69,
    0x6f,0x6e,0x3b,0x0a,0x20,0x20,0x20,0x20,0x63,0x6f,0x6c,0x6f,0x72,0x20,0x3d,0x20,
    0x63,0x6f,0x6c,0x6f,0x72,0x30,0x3b,0x0a,0x7d,0x0a,0x0a,0x00,
];
/*
    #version 430

    layout(location = 0) out vec4 frag_color;
    layout(location = 0) in vec4 color;

    void main()
    {
        frag_color = color;
    }

*/
__gshared char[135] FS_SOURCE_GLSL430 = [
    0x23,0x76,0x65,0x72,0x73,0x69,0x6f,0x6e,0x20,0x34,0x33,0x30,0x0a,0x0a,0x6c,0x61,
    0x79,0x6f,0x75,0x74,0x28,0x6c,0x6f,0x63,0x61,0x74,0x69,0x6f,0x6e,0x20,0x3d,0x20,
    0x30,0x29,0x20,0x6f,0x75,0x74,0x20,0x76,0x65,0x63,0x34,0x20,0x66,0x72,0x61,0x67,
    0x5f,0x63,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x6c,0x61,0x79,0x6f,0x75,0x74,0x28,0x6c,
    0x6f,0x63,0x61,0x74,0x69,0x6f,0x6e,0x20,0x3d,0x20,0x30,0x29,0x20,0x69,0x6e,0x20,
    0x76,0x65,0x63,0x34,0x20,0x63,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x0a,0x76,0x6f,0x69,
    0x64,0x20,0x6d,0x61,0x69,0x6e,0x28,0x29,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x66,
    0x72,0x61,0x67,0x5f,0x63,0x6f,0x6c,0x6f,0x72,0x20,0x3d,0x20,0x63,0x6f,0x6c,0x6f,
    0x72,0x3b,0x0a,0x7d,0x0a,0x0a,0x00,
];
/*
    #version 300 es

    uniform vec4 vs_params[4];
    layout(location = 0) in vec4 position;
    out vec4 color;
    layout(location = 1) in vec4 color0;

    void main()
    {
        gl_Position = mat4(vs_params[0], vs_params[1], vs_params[2], vs_params[3]) * position;
        color = color0;
    }

*/
__gshared char[266] VS_SOURCE_GLSL300ES = [
    0x23,0x76,0x65,0x72,0x73,0x69,0x6f,0x6e,0x20,0x33,0x30,0x30,0x20,0x65,0x73,0x0a,
    0x0a,0x75,0x6e,0x69,0x66,0x6f,0x72,0x6d,0x20,0x76,0x65,0x63,0x34,0x20,0x76,0x73,
    0x5f,0x70,0x61,0x72,0x61,0x6d,0x73,0x5b,0x34,0x5d,0x3b,0x0a,0x6c,0x61,0x79,0x6f,
    0x75,0x74,0x28,0x6c,0x6f,0x63,0x61,0x74,0x69,0x6f,0x6e,0x20,0x3d,0x20,0x30,0x29,
    0x20,0x69,0x6e,0x20,0x76,0x65,0x63,0x34,0x20,0x70,0x6f,0x73,0x69,0x74,0x69,0x6f,
    0x6e,0x3b,0x0a,0x6f,0x75,0x74,0x20,0x76,0x65,0x63,0x34,0x20,0x63,0x6f,0x6c,0x6f,
    0x72,0x3b,0x0a,0x6c,0x61,0x79,0x6f,0x75,0x74,0x28,0x6c,0x6f,0x63,0x61,0x74,0x69,
    0x6f,0x6e,0x20,0x3d,0x20,0x31,0x29,0x20,0x69,0x6e,0x20,0x76,0x65,0x63,0x34,0x20,
    0x63,0x6f,0x6c,0x6f,0x72,0x30,0x3b,0x0a,0x0a,0x76,0x6f,0x69,0x64,0x20,0x6d,0x61,
    0x69,0x6e,0x28,0x29,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x67,0x6c,0x5f,0x50,0x6f,
    0x73,0x69,0x74,0x69,0x6f,0x6e,0x20,0x3d,0x20,0x6d,0x61,0x74,0x34,0x28,0x76,0x73,
    0x5f,0x70,0x61,0x72,0x61,0x6d,0x73,0x5b,0x30,0x5d,0x2c,0x20,0x76,0x73,0x5f,0x70,
    0x61,0x72,0x61,0x6d,0x73,0x5b,0x31,0x5d,0x2c,0x20,0x76,0x73,0x5f,0x70,0x61,0x72,
    0x61,0x6d,0x73,0x5b,0x32,0x5d,0x2c,0x20,0x76,0x73,0x5f,0x70,0x61,0x72,0x61,0x6d,
    0x73,0x5b,0x33,0x5d,0x29,0x20,0x2a,0x20,0x70,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,
    0x3b,0x0a,0x20,0x20,0x20,0x20,0x63,0x6f,0x6c,0x6f,0x72,0x20,0x3d,0x20,0x63,0x6f,
    0x6c,0x6f,0x72,0x30,0x3b,0x0a,0x7d,0x0a,0x0a,0x00,
];
/*
    #version 300 es
    precision mediump float;
    precision highp int;

    layout(location = 0) out highp vec4 frag_color;
    in highp vec4 color;

    void main()
    {
        frag_color = color;
    }

*/
__gshared char[175] FS_SOURCE_GLSL300ES = [
    0x23,0x76,0x65,0x72,0x73,0x69,0x6f,0x6e,0x20,0x33,0x30,0x30,0x20,0x65,0x73,0x0a,
    0x70,0x72,0x65,0x63,0x69,0x73,0x69,0x6f,0x6e,0x20,0x6d,0x65,0x64,0x69,0x75,0x6d,
    0x70,0x20,0x66,0x6c,0x6f,0x61,0x74,0x3b,0x0a,0x70,0x72,0x65,0x63,0x69,0x73,0x69,
    0x6f,0x6e,0x20,0x68,0x69,0x67,0x68,0x70,0x20,0x69,0x6e,0x74,0x3b,0x0a,0x0a,0x6c,
    0x61,0x79,0x6f,0x75,0x74,0x28,0x6c,0x6f,0x63,0x61,0x74,0x69,0x6f,0x6e,0x20,0x3d,
    0x20,0x30,0x29,0x20,0x6f,0x75,0x74,0x20,0x68,0x69,0x67,0x68,0x70,0x20,0x76,0x65,
    0x63,0x34,0x20,0x66,0x72,0x61,0x67,0x5f,0x63,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x69,
    0x6e,0x20,0x68,0x69,0x67,0x68,0x70,0x20,0x76,0x65,0x63,0x34,0x20,0x63,0x6f,0x6c,
    0x6f,0x72,0x3b,0x0a,0x0a,0x76,0x6f,0x69,0x64,0x20,0x6d,0x61,0x69,0x6e,0x28,0x29,
    0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x66,0x72,0x61,0x67,0x5f,0x63,0x6f,0x6c,0x6f,
    0x72,0x20,0x3d,0x20,0x63,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x7d,0x0a,0x0a,0x00,
];
/*
    cbuffer vs_params : register(b0)
    {
        row_major float4x4 _19_mvp : packoffset(c0);
    };


    static float4 gl_Position;
    static float4 position;
    static float4 color;
    static float4 color0;

    struct SPIRV_Cross_Input
    {
        float4 position : TEXCOORD0;
        float4 color0 : TEXCOORD1;
    };

    struct SPIRV_Cross_Output
    {
        float4 color : TEXCOORD0;
        float4 gl_Position : SV_Position;
    };

    void vert_main()
    {
        gl_Position = mul(position, _19_mvp);
        color = color0;
    }

    SPIRV_Cross_Output main(SPIRV_Cross_Input stage_input)
    {
        position = stage_input.position;
        color0 = stage_input.color0;
        vert_main();
        SPIRV_Cross_Output stage_output;
        stage_output.gl_Position = gl_Position;
        stage_output.color = color;
        return stage_output;
    }
*/
__gshared char[748] VS_SOURCE_HLSL4 = [
    0x63,0x62,0x75,0x66,0x66,0x65,0x72,0x20,0x76,0x73,0x5f,0x70,0x61,0x72,0x61,0x6d,
    0x73,0x20,0x3a,0x20,0x72,0x65,0x67,0x69,0x73,0x74,0x65,0x72,0x28,0x62,0x30,0x29,
    0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x72,0x6f,0x77,0x5f,0x6d,0x61,0x6a,0x6f,0x72,
    0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x78,0x34,0x20,0x5f,0x31,0x39,0x5f,0x6d,0x76,
    0x70,0x20,0x3a,0x20,0x70,0x61,0x63,0x6b,0x6f,0x66,0x66,0x73,0x65,0x74,0x28,0x63,
    0x30,0x29,0x3b,0x0a,0x7d,0x3b,0x0a,0x0a,0x0a,0x73,0x74,0x61,0x74,0x69,0x63,0x20,
    0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,0x67,0x6c,0x5f,0x50,0x6f,0x73,0x69,0x74,0x69,
    0x6f,0x6e,0x3b,0x0a,0x73,0x74,0x61,0x74,0x69,0x63,0x20,0x66,0x6c,0x6f,0x61,0x74,
    0x34,0x20,0x70,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x3b,0x0a,0x73,0x74,0x61,0x74,
    0x69,0x63,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,0x63,0x6f,0x6c,0x6f,0x72,0x3b,
    0x0a,0x73,0x74,0x61,0x74,0x69,0x63,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,0x63,
    0x6f,0x6c,0x6f,0x72,0x30,0x3b,0x0a,0x0a,0x73,0x74,0x72,0x75,0x63,0x74,0x20,0x53,
    0x50,0x49,0x52,0x56,0x5f,0x43,0x72,0x6f,0x73,0x73,0x5f,0x49,0x6e,0x70,0x75,0x74,
    0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,0x70,0x6f,
    0x73,0x69,0x74,0x69,0x6f,0x6e,0x20,0x3a,0x20,0x54,0x45,0x58,0x43,0x4f,0x4f,0x52,
    0x44,0x30,0x3b,0x0a,0x20,0x20,0x20,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,0x63,
    0x6f,0x6c,0x6f,0x72,0x30,0x20,0x3a,0x20,0x54,0x45,0x58,0x43,0x4f,0x4f,0x52,0x44,
    0x31,0x3b,0x0a,0x7d,0x3b,0x0a,0x0a,0x73,0x74,0x72,0x75,0x63,0x74,0x20,0x53,0x50,
    0x49,0x52,0x56,0x5f,0x43,0x72,0x6f,0x73,0x73,0x5f,0x4f,0x75,0x74,0x70,0x75,0x74,
    0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,0x63,0x6f,
    0x6c,0x6f,0x72,0x20,0x3a,0x20,0x54,0x45,0x58,0x43,0x4f,0x4f,0x52,0x44,0x30,0x3b,
    0x0a,0x20,0x20,0x20,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,0x67,0x6c,0x5f,0x50,
    0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x20,0x3a,0x20,0x53,0x56,0x5f,0x50,0x6f,0x73,
    0x69,0x74,0x69,0x6f,0x6e,0x3b,0x0a,0x7d,0x3b,0x0a,0x0a,0x76,0x6f,0x69,0x64,0x20,
    0x76,0x65,0x72,0x74,0x5f,0x6d,0x61,0x69,0x6e,0x28,0x29,0x0a,0x7b,0x0a,0x20,0x20,
    0x20,0x20,0x67,0x6c,0x5f,0x50,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x20,0x3d,0x20,
    0x6d,0x75,0x6c,0x28,0x70,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x2c,0x20,0x5f,0x31,
    0x39,0x5f,0x6d,0x76,0x70,0x29,0x3b,0x0a,0x20,0x20,0x20,0x20,0x63,0x6f,0x6c,0x6f,
    0x72,0x20,0x3d,0x20,0x63,0x6f,0x6c,0x6f,0x72,0x30,0x3b,0x0a,0x7d,0x0a,0x0a,0x53,
    0x50,0x49,0x52,0x56,0x5f,0x43,0x72,0x6f,0x73,0x73,0x5f,0x4f,0x75,0x74,0x70,0x75,
    0x74,0x20,0x6d,0x61,0x69,0x6e,0x28,0x53,0x50,0x49,0x52,0x56,0x5f,0x43,0x72,0x6f,
    0x73,0x73,0x5f,0x49,0x6e,0x70,0x75,0x74,0x20,0x73,0x74,0x61,0x67,0x65,0x5f,0x69,
    0x6e,0x70,0x75,0x74,0x29,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x70,0x6f,0x73,0x69,
    0x74,0x69,0x6f,0x6e,0x20,0x3d,0x20,0x73,0x74,0x61,0x67,0x65,0x5f,0x69,0x6e,0x70,
    0x75,0x74,0x2e,0x70,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x3b,0x0a,0x20,0x20,0x20,
    0x20,0x63,0x6f,0x6c,0x6f,0x72,0x30,0x20,0x3d,0x20,0x73,0x74,0x61,0x67,0x65,0x5f,
    0x69,0x6e,0x70,0x75,0x74,0x2e,0x63,0x6f,0x6c,0x6f,0x72,0x30,0x3b,0x0a,0x20,0x20,
    0x20,0x20,0x76,0x65,0x72,0x74,0x5f,0x6d,0x61,0x69,0x6e,0x28,0x29,0x3b,0x0a,0x20,
    0x20,0x20,0x20,0x53,0x50,0x49,0x52,0x56,0x5f,0x43,0x72,0x6f,0x73,0x73,0x5f,0x4f,
    0x75,0x74,0x70,0x75,0x74,0x20,0x73,0x74,0x61,0x67,0x65,0x5f,0x6f,0x75,0x74,0x70,
    0x75,0x74,0x3b,0x0a,0x20,0x20,0x20,0x20,0x73,0x74,0x61,0x67,0x65,0x5f,0x6f,0x75,
    0x74,0x70,0x75,0x74,0x2e,0x67,0x6c,0x5f,0x50,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,
    0x20,0x3d,0x20,0x67,0x6c,0x5f,0x50,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x3b,0x0a,
    0x20,0x20,0x20,0x20,0x73,0x74,0x61,0x67,0x65,0x5f,0x6f,0x75,0x74,0x70,0x75,0x74,
    0x2e,0x63,0x6f,0x6c,0x6f,0x72,0x20,0x3d,0x20,0x63,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,
    0x20,0x20,0x20,0x20,0x72,0x65,0x74,0x75,0x72,0x6e,0x20,0x73,0x74,0x61,0x67,0x65,
    0x5f,0x6f,0x75,0x74,0x70,0x75,0x74,0x3b,0x0a,0x7d,0x0a,0x00,
];
/*
    static float4 frag_color;
    static float4 color;

    struct SPIRV_Cross_Input
    {
        float4 color : TEXCOORD0;
    };

    struct SPIRV_Cross_Output
    {
        float4 frag_color : SV_Target0;
    };

    void frag_main()
    {
        frag_color = color;
    }

    SPIRV_Cross_Output main(SPIRV_Cross_Input stage_input)
    {
        color = stage_input.color;
        frag_main();
        SPIRV_Cross_Output stage_output;
        stage_output.frag_color = frag_color;
        return stage_output;
    }
*/
__gshared char[435] FS_SOURCE_HLSL4 = [
    0x73,0x74,0x61,0x74,0x69,0x63,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,0x66,0x72,
    0x61,0x67,0x5f,0x63,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x73,0x74,0x61,0x74,0x69,0x63,
    0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,0x63,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x0a,
    0x73,0x74,0x72,0x75,0x63,0x74,0x20,0x53,0x50,0x49,0x52,0x56,0x5f,0x43,0x72,0x6f,
    0x73,0x73,0x5f,0x49,0x6e,0x70,0x75,0x74,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x66,
    0x6c,0x6f,0x61,0x74,0x34,0x20,0x63,0x6f,0x6c,0x6f,0x72,0x20,0x3a,0x20,0x54,0x45,
    0x58,0x43,0x4f,0x4f,0x52,0x44,0x30,0x3b,0x0a,0x7d,0x3b,0x0a,0x0a,0x73,0x74,0x72,
    0x75,0x63,0x74,0x20,0x53,0x50,0x49,0x52,0x56,0x5f,0x43,0x72,0x6f,0x73,0x73,0x5f,
    0x4f,0x75,0x74,0x70,0x75,0x74,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x66,0x6c,0x6f,
    0x61,0x74,0x34,0x20,0x66,0x72,0x61,0x67,0x5f,0x63,0x6f,0x6c,0x6f,0x72,0x20,0x3a,
    0x20,0x53,0x56,0x5f,0x54,0x61,0x72,0x67,0x65,0x74,0x30,0x3b,0x0a,0x7d,0x3b,0x0a,
    0x0a,0x76,0x6f,0x69,0x64,0x20,0x66,0x72,0x61,0x67,0x5f,0x6d,0x61,0x69,0x6e,0x28,
    0x29,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x66,0x72,0x61,0x67,0x5f,0x63,0x6f,0x6c,
    0x6f,0x72,0x20,0x3d,0x20,0x63,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x7d,0x0a,0x0a,0x53,
    0x50,0x49,0x52,0x56,0x5f,0x43,0x72,0x6f,0x73,0x73,0x5f,0x4f,0x75,0x74,0x70,0x75,
    0x74,0x20,0x6d,0x61,0x69,0x6e,0x28,0x53,0x50,0x49,0x52,0x56,0x5f,0x43,0x72,0x6f,
    0x73,0x73,0x5f,0x49,0x6e,0x70,0x75,0x74,0x20,0x73,0x74,0x61,0x67,0x65,0x5f,0x69,
    0x6e,0x70,0x75,0x74,0x29,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x63,0x6f,0x6c,0x6f,
    0x72,0x20,0x3d,0x20,0x73,0x74,0x61,0x67,0x65,0x5f,0x69,0x6e,0x70,0x75,0x74,0x2e,
    0x63,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x20,0x20,0x20,0x20,0x66,0x72,0x61,0x67,0x5f,
    0x6d,0x61,0x69,0x6e,0x28,0x29,0x3b,0x0a,0x20,0x20,0x20,0x20,0x53,0x50,0x49,0x52,
    0x56,0x5f,0x43,0x72,0x6f,0x73,0x73,0x5f,0x4f,0x75,0x74,0x70,0x75,0x74,0x20,0x73,
    0x74,0x61,0x67,0x65,0x5f,0x6f,0x75,0x74,0x70,0x75,0x74,0x3b,0x0a,0x20,0x20,0x20,
    0x20,0x73,0x74,0x61,0x67,0x65,0x5f,0x6f,0x75,0x74,0x70,0x75,0x74,0x2e,0x66,0x72,
    0x61,0x67,0x5f,0x63,0x6f,0x6c,0x6f,0x72,0x20,0x3d,0x20,0x66,0x72,0x61,0x67,0x5f,
    0x63,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x20,0x20,0x20,0x20,0x72,0x65,0x74,0x75,0x72,
    0x6e,0x20,0x73,0x74,0x61,0x67,0x65,0x5f,0x6f,0x75,0x74,0x70,0x75,0x74,0x3b,0x0a,
    0x7d,0x0a,0x00,
];
/*
    #include <metal_stdlib>
    #include <simd/simd.h>

    using namespace metal;

    struct vs_params
    {
        float4x4 mvp;
    };

    struct main0_out
    {
        float4 color [[user(locn0)]];
        float4 gl_Position [[position]];
    };

    struct main0_in
    {
        float4 position [[attribute(0)]];
        float4 color0 [[attribute(1)]];
    };

    vertex main0_out main0(main0_in in [[stage_in]], constant vs_params& _19 [[buffer(0)]])
    {
        main0_out out = {};
        out.gl_Position = _19.mvp * in.position;
        out.color = in.color0;
        return out;
    }

*/
__gshared char[509] VS_SOURCE_METAL_MACOS = [
    0x23,0x69,0x6e,0x63,0x6c,0x75,0x64,0x65,0x20,0x3c,0x6d,0x65,0x74,0x61,0x6c,0x5f,
    0x73,0x74,0x64,0x6c,0x69,0x62,0x3e,0x0a,0x23,0x69,0x6e,0x63,0x6c,0x75,0x64,0x65,
    0x20,0x3c,0x73,0x69,0x6d,0x64,0x2f,0x73,0x69,0x6d,0x64,0x2e,0x68,0x3e,0x0a,0x0a,
    0x75,0x73,0x69,0x6e,0x67,0x20,0x6e,0x61,0x6d,0x65,0x73,0x70,0x61,0x63,0x65,0x20,
    0x6d,0x65,0x74,0x61,0x6c,0x3b,0x0a,0x0a,0x73,0x74,0x72,0x75,0x63,0x74,0x20,0x76,
    0x73,0x5f,0x70,0x61,0x72,0x61,0x6d,0x73,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x66,
    0x6c,0x6f,0x61,0x74,0x34,0x78,0x34,0x20,0x6d,0x76,0x70,0x3b,0x0a,0x7d,0x3b,0x0a,
    0x0a,0x73,0x74,0x72,0x75,0x63,0x74,0x20,0x6d,0x61,0x69,0x6e,0x30,0x5f,0x6f,0x75,
    0x74,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,0x63,
    0x6f,0x6c,0x6f,0x72,0x20,0x5b,0x5b,0x75,0x73,0x65,0x72,0x28,0x6c,0x6f,0x63,0x6e,
    0x30,0x29,0x5d,0x5d,0x3b,0x0a,0x20,0x20,0x20,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,
    0x20,0x67,0x6c,0x5f,0x50,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x20,0x5b,0x5b,0x70,
    0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x5d,0x5d,0x3b,0x0a,0x7d,0x3b,0x0a,0x0a,0x73,
    0x74,0x72,0x75,0x63,0x74,0x20,0x6d,0x61,0x69,0x6e,0x30,0x5f,0x69,0x6e,0x0a,0x7b,
    0x0a,0x20,0x20,0x20,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,0x70,0x6f,0x73,0x69,
    0x74,0x69,0x6f,0x6e,0x20,0x5b,0x5b,0x61,0x74,0x74,0x72,0x69,0x62,0x75,0x74,0x65,
    0x28,0x30,0x29,0x5d,0x5d,0x3b,0x0a,0x20,0x20,0x20,0x20,0x66,0x6c,0x6f,0x61,0x74,
    0x34,0x20,0x63,0x6f,0x6c,0x6f,0x72,0x30,0x20,0x5b,0x5b,0x61,0x74,0x74,0x72,0x69,
    0x62,0x75,0x74,0x65,0x28,0x31,0x29,0x5d,0x5d,0x3b,0x0a,0x7d,0x3b,0x0a,0x0a,0x76,
    0x65,0x72,0x74,0x65,0x78,0x20,0x6d,0x61,0x69,0x6e,0x30,0x5f,0x6f,0x75,0x74,0x20,
    0x6d,0x61,0x69,0x6e,0x30,0x28,0x6d,0x61,0x69,0x6e,0x30,0x5f,0x69,0x6e,0x20,0x69,
    0x6e,0x20,0x5b,0x5b,0x73,0x74,0x61,0x67,0x65,0x5f,0x69,0x6e,0x5d,0x5d,0x2c,0x20,
    0x63,0x6f,0x6e,0x73,0x74,0x61,0x6e,0x74,0x20,0x76,0x73,0x5f,0x70,0x61,0x72,0x61,
    0x6d,0x73,0x26,0x20,0x5f,0x31,0x39,0x20,0x5b,0x5b,0x62,0x75,0x66,0x66,0x65,0x72,
    0x28,0x30,0x29,0x5d,0x5d,0x29,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x6d,0x61,0x69,
    0x6e,0x30,0x5f,0x6f,0x75,0x74,0x20,0x6f,0x75,0x74,0x20,0x3d,0x20,0x7b,0x7d,0x3b,
    0x0a,0x20,0x20,0x20,0x20,0x6f,0x75,0x74,0x2e,0x67,0x6c,0x5f,0x50,0x6f,0x73,0x69,
    0x74,0x69,0x6f,0x6e,0x20,0x3d,0x20,0x5f,0x31,0x39,0x2e,0x6d,0x76,0x70,0x20,0x2a,
    0x20,0x69,0x6e,0x2e,0x70,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x3b,0x0a,0x20,0x20,
    0x20,0x20,0x6f,0x75,0x74,0x2e,0x63,0x6f,0x6c,0x6f,0x72,0x20,0x3d,0x20,0x69,0x6e,
    0x2e,0x63,0x6f,0x6c,0x6f,0x72,0x30,0x3b,0x0a,0x20,0x20,0x20,0x20,0x72,0x65,0x74,
    0x75,0x72,0x6e,0x20,0x6f,0x75,0x74,0x3b,0x0a,0x7d,0x0a,0x0a,0x00,
];
/*
    #include <metal_stdlib>
    #include <simd/simd.h>

    using namespace metal;

    struct main0_out
    {
        float4 frag_color [[color(0)]];
    };

    struct main0_in
    {
        float4 color [[user(locn0)]];
    };

    fragment main0_out main0(main0_in in [[stage_in]])
    {
        main0_out out = {};
        out.frag_color = in.color;
        return out;
    }

*/
__gshared char[315] FS_SOURCE_METAL_MACOS = [
    0x23,0x69,0x6e,0x63,0x6c,0x75,0x64,0x65,0x20,0x3c,0x6d,0x65,0x74,0x61,0x6c,0x5f,
    0x73,0x74,0x64,0x6c,0x69,0x62,0x3e,0x0a,0x23,0x69,0x6e,0x63,0x6c,0x75,0x64,0x65,
    0x20,0x3c,0x73,0x69,0x6d,0x64,0x2f,0x73,0x69,0x6d,0x64,0x2e,0x68,0x3e,0x0a,0x0a,
    0x75,0x73,0x69,0x6e,0x67,0x20,0x6e,0x61,0x6d,0x65,0x73,0x70,0x61,0x63,0x65,0x20,
    0x6d,0x65,0x74,0x61,0x6c,0x3b,0x0a,0x0a,0x73,0x74,0x72,0x75,0x63,0x74,0x20,0x6d,
    0x61,0x69,0x6e,0x30,0x5f,0x6f,0x75,0x74,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x66,
    0x6c,0x6f,0x61,0x74,0x34,0x20,0x66,0x72,0x61,0x67,0x5f,0x63,0x6f,0x6c,0x6f,0x72,
    0x20,0x5b,0x5b,0x63,0x6f,0x6c,0x6f,0x72,0x28,0x30,0x29,0x5d,0x5d,0x3b,0x0a,0x7d,
    0x3b,0x0a,0x0a,0x73,0x74,0x72,0x75,0x63,0x74,0x20,0x6d,0x61,0x69,0x6e,0x30,0x5f,
    0x69,0x6e,0x0a,0x7b,0x0a,0x20,0x20,0x20,0x20,0x66,0x6c,0x6f,0x61,0x74,0x34,0x20,
    0x63,0x6f,0x6c,0x6f,0x72,0x20,0x5b,0x5b,0x75,0x73,0x65,0x72,0x28,0x6c,0x6f,0x63,
    0x6e,0x30,0x29,0x5d,0x5d,0x3b,0x0a,0x7d,0x3b,0x0a,0x0a,0x66,0x72,0x61,0x67,0x6d,
    0x65,0x6e,0x74,0x20,0x6d,0x61,0x69,0x6e,0x30,0x5f,0x6f,0x75,0x74,0x20,0x6d,0x61,
    0x69,0x6e,0x30,0x28,0x6d,0x61,0x69,0x6e,0x30,0x5f,0x69,0x6e,0x20,0x69,0x6e,0x20,
    0x5b,0x5b,0x73,0x74,0x61,0x67,0x65,0x5f,0x69,0x6e,0x5d,0x5d,0x29,0x0a,0x7b,0x0a,
    0x20,0x20,0x20,0x20,0x6d,0x61,0x69,0x6e,0x30,0x5f,0x6f,0x75,0x74,0x20,0x6f,0x75,
    0x74,0x20,0x3d,0x20,0x7b,0x7d,0x3b,0x0a,0x20,0x20,0x20,0x20,0x6f,0x75,0x74,0x2e,
    0x66,0x72,0x61,0x67,0x5f,0x63,0x6f,0x6c,0x6f,0x72,0x20,0x3d,0x20,0x69,0x6e,0x2e,
    0x63,0x6f,0x6c,0x6f,0x72,0x3b,0x0a,0x20,0x20,0x20,0x20,0x72,0x65,0x74,0x75,0x72,
    0x6e,0x20,0x6f,0x75,0x74,0x3b,0x0a,0x7d,0x0a,0x0a,0x00,
];
/*
    diagnostic(off, derivative_uniformity);

    struct vs_params {
      /_ @offset(0) _/
      mvp : mat4x4f,
    }

    @group(0) @binding(0) var<uniform> x_19 : vs_params;

    var<private> position_1 : vec4f;

    var<private> color : vec4f;

    var<private> color0 : vec4f;

    var<private> gl_Position : vec4f;

    fn main_1() {
      let x_22 : mat4x4f = x_19.mvp;
      let x_25 : vec4f = position_1;
      gl_Position = (x_22 * x_25);
      let x_31 : vec4f = color0;
      color = x_31;
      return;
    }

    struct main_out {
      @builtin(position)
      gl_Position : vec4f,
      @location(0)
      color_1 : vec4f,
    }

    @vertex
    fn main(@location(0) position_1_param : vec4f, @location(1) color0_param : vec4f) -> main_out {
      position_1 = position_1_param;
      color0 = color0_param;
      main_1();
      return main_out(gl_Position, color);
    }

*/
__gshared char[766] VS_SOURCE_WGSL = [
    0x64,0x69,0x61,0x67,0x6e,0x6f,0x73,0x74,0x69,0x63,0x28,0x6f,0x66,0x66,0x2c,0x20,
    0x64,0x65,0x72,0x69,0x76,0x61,0x74,0x69,0x76,0x65,0x5f,0x75,0x6e,0x69,0x66,0x6f,
    0x72,0x6d,0x69,0x74,0x79,0x29,0x3b,0x0a,0x0a,0x73,0x74,0x72,0x75,0x63,0x74,0x20,
    0x76,0x73,0x5f,0x70,0x61,0x72,0x61,0x6d,0x73,0x20,0x7b,0x0a,0x20,0x20,0x2f,0x2a,
    0x20,0x40,0x6f,0x66,0x66,0x73,0x65,0x74,0x28,0x30,0x29,0x20,0x2a,0x2f,0x0a,0x20,
    0x20,0x6d,0x76,0x70,0x20,0x3a,0x20,0x6d,0x61,0x74,0x34,0x78,0x34,0x66,0x2c,0x0a,
    0x7d,0x0a,0x0a,0x40,0x67,0x72,0x6f,0x75,0x70,0x28,0x30,0x29,0x20,0x40,0x62,0x69,
    0x6e,0x64,0x69,0x6e,0x67,0x28,0x30,0x29,0x20,0x76,0x61,0x72,0x3c,0x75,0x6e,0x69,
    0x66,0x6f,0x72,0x6d,0x3e,0x20,0x78,0x5f,0x31,0x39,0x20,0x3a,0x20,0x76,0x73,0x5f,
    0x70,0x61,0x72,0x61,0x6d,0x73,0x3b,0x0a,0x0a,0x76,0x61,0x72,0x3c,0x70,0x72,0x69,
    0x76,0x61,0x74,0x65,0x3e,0x20,0x70,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x5f,0x31,
    0x20,0x3a,0x20,0x76,0x65,0x63,0x34,0x66,0x3b,0x0a,0x0a,0x76,0x61,0x72,0x3c,0x70,
    0x72,0x69,0x76,0x61,0x74,0x65,0x3e,0x20,0x63,0x6f,0x6c,0x6f,0x72,0x20,0x3a,0x20,
    0x76,0x65,0x63,0x34,0x66,0x3b,0x0a,0x0a,0x76,0x61,0x72,0x3c,0x70,0x72,0x69,0x76,
    0x61,0x74,0x65,0x3e,0x20,0x63,0x6f,0x6c,0x6f,0x72,0x30,0x20,0x3a,0x20,0x76,0x65,
    0x63,0x34,0x66,0x3b,0x0a,0x0a,0x76,0x61,0x72,0x3c,0x70,0x72,0x69,0x76,0x61,0x74,
    0x65,0x3e,0x20,0x67,0x6c,0x5f,0x50,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x20,0x3a,
    0x20,0x76,0x65,0x63,0x34,0x66,0x3b,0x0a,0x0a,0x66,0x6e,0x20,0x6d,0x61,0x69,0x6e,
    0x5f,0x31,0x28,0x29,0x20,0x7b,0x0a,0x20,0x20,0x6c,0x65,0x74,0x20,0x78,0x5f,0x32,
    0x32,0x20,0x3a,0x20,0x6d,0x61,0x74,0x34,0x78,0x34,0x66,0x20,0x3d,0x20,0x78,0x5f,
    0x31,0x39,0x2e,0x6d,0x76,0x70,0x3b,0x0a,0x20,0x20,0x6c,0x65,0x74,0x20,0x78,0x5f,
    0x32,0x35,0x20,0x3a,0x20,0x76,0x65,0x63,0x34,0x66,0x20,0x3d,0x20,0x70,0x6f,0x73,
    0x69,0x74,0x69,0x6f,0x6e,0x5f,0x31,0x3b,0x0a,0x20,0x20,0x67,0x6c,0x5f,0x50,0x6f,
    0x73,0x69,0x74,0x69,0x6f,0x6e,0x20,0x3d,0x20,0x28,0x78,0x5f,0x32,0x32,0x20,0x2a,
    0x20,0x78,0x5f,0x32,0x35,0x29,0x3b,0x0a,0x20,0x20,0x6c,0x65,0x74,0x20,0x78,0x5f,
    0x33,0x31,0x20,0x3a,0x20,0x76,0x65,0x63,0x34,0x66,0x20,0x3d,0x20,0x63,0x6f,0x6c,
    0x6f,0x72,0x30,0x3b,0x0a,0x20,0x20,0x63,0x6f,0x6c,0x6f,0x72,0x20,0x3d,0x20,0x78,
    0x5f,0x33,0x31,0x3b,0x0a,0x20,0x20,0x72,0x65,0x74,0x75,0x72,0x6e,0x3b,0x0a,0x7d,
    0x0a,0x0a,0x73,0x74,0x72,0x75,0x63,0x74,0x20,0x6d,0x61,0x69,0x6e,0x5f,0x6f,0x75,
    0x74,0x20,0x7b,0x0a,0x20,0x20,0x40,0x62,0x75,0x69,0x6c,0x74,0x69,0x6e,0x28,0x70,
    0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x29,0x0a,0x20,0x20,0x67,0x6c,0x5f,0x50,0x6f,
    0x73,0x69,0x74,0x69,0x6f,0x6e,0x20,0x3a,0x20,0x76,0x65,0x63,0x34,0x66,0x2c,0x0a,
    0x20,0x20,0x40,0x6c,0x6f,0x63,0x61,0x74,0x69,0x6f,0x6e,0x28,0x30,0x29,0x0a,0x20,
    0x20,0x63,0x6f,0x6c,0x6f,0x72,0x5f,0x31,0x20,0x3a,0x20,0x76,0x65,0x63,0x34,0x66,
    0x2c,0x0a,0x7d,0x0a,0x0a,0x40,0x76,0x65,0x72,0x74,0x65,0x78,0x0a,0x66,0x6e,0x20,
    0x6d,0x61,0x69,0x6e,0x28,0x40,0x6c,0x6f,0x63,0x61,0x74,0x69,0x6f,0x6e,0x28,0x30,
    0x29,0x20,0x70,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x5f,0x31,0x5f,0x70,0x61,0x72,
    0x61,0x6d,0x20,0x3a,0x20,0x76,0x65,0x63,0x34,0x66,0x2c,0x20,0x40,0x6c,0x6f,0x63,
    0x61,0x74,0x69,0x6f,0x6e,0x28,0x31,0x29,0x20,0x63,0x6f,0x6c,0x6f,0x72,0x30,0x5f,
    0x70,0x61,0x72,0x61,0x6d,0x20,0x3a,0x20,0x76,0x65,0x63,0x34,0x66,0x29,0x20,0x2d,
    0x3e,0x20,0x6d,0x61,0x69,0x6e,0x5f,0x6f,0x75,0x74,0x20,0x7b,0x0a,0x20,0x20,0x70,
    0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,0x5f,0x31,0x20,0x3d,0x20,0x70,0x6f,0x73,0x69,
    0x74,0x69,0x6f,0x6e,0x5f,0x31,0x5f,0x70,0x61,0x72,0x61,0x6d,0x3b,0x0a,0x20,0x20,
    0x63,0x6f,0x6c,0x6f,0x72,0x30,0x20,0x3d,0x20,0x63,0x6f,0x6c,0x6f,0x72,0x30,0x5f,
    0x70,0x61,0x72,0x61,0x6d,0x3b,0x0a,0x20,0x20,0x6d,0x61,0x69,0x6e,0x5f,0x31,0x28,
    0x29,0x3b,0x0a,0x20,0x20,0x72,0x65,0x74,0x75,0x72,0x6e,0x20,0x6d,0x61,0x69,0x6e,
    0x5f,0x6f,0x75,0x74,0x28,0x67,0x6c,0x5f,0x50,0x6f,0x73,0x69,0x74,0x69,0x6f,0x6e,
    0x2c,0x20,0x63,0x6f,0x6c,0x6f,0x72,0x29,0x3b,0x0a,0x7d,0x0a,0x0a,0x00,
];
/*
    diagnostic(off, derivative_uniformity);

    var<private> frag_color : vec4f;

    var<private> color : vec4f;

    fn main_1() {
      let x_12 : vec4f = color;
      frag_color = x_12;
      return;
    }

    struct main_out {
      @location(0)
      frag_color_1 : vec4f,
    }

    @fragment
    fn main(@location(0) color_param : vec4f) -> main_out {
      color = color_param;
      main_1();
      return main_out(frag_color);
    }

*/
__gshared char[376] FS_SOURCE_WGSL = [
    0x64,0x69,0x61,0x67,0x6e,0x6f,0x73,0x74,0x69,0x63,0x28,0x6f,0x66,0x66,0x2c,0x20,
    0x64,0x65,0x72,0x69,0x76,0x61,0x74,0x69,0x76,0x65,0x5f,0x75,0x6e,0x69,0x66,0x6f,
    0x72,0x6d,0x69,0x74,0x79,0x29,0x3b,0x0a,0x0a,0x76,0x61,0x72,0x3c,0x70,0x72,0x69,
    0x76,0x61,0x74,0x65,0x3e,0x20,0x66,0x72,0x61,0x67,0x5f,0x63,0x6f,0x6c,0x6f,0x72,
    0x20,0x3a,0x20,0x76,0x65,0x63,0x34,0x66,0x3b,0x0a,0x0a,0x76,0x61,0x72,0x3c,0x70,
    0x72,0x69,0x76,0x61,0x74,0x65,0x3e,0x20,0x63,0x6f,0x6c,0x6f,0x72,0x20,0x3a,0x20,
    0x76,0x65,0x63,0x34,0x66,0x3b,0x0a,0x0a,0x66,0x6e,0x20,0x6d,0x61,0x69,0x6e,0x5f,
    0x31,0x28,0x29,0x20,0x7b,0x0a,0x20,0x20,0x6c,0x65,0x74,0x20,0x78,0x5f,0x31,0x32,
    0x20,0x3a,0x20,0x76,0x65,0x63,0x34,0x66,0x20,0x3d,0x20,0x63,0x6f,0x6c,0x6f,0x72,
    0x3b,0x0a,0x20,0x20,0x66,0x72,0x61,0x67,0x5f,0x63,0x6f,0x6c,0x6f,0x72,0x20,0x3d,
    0x20,0x78,0x5f,0x31,0x32,0x3b,0x0a,0x20,0x20,0x72,0x65,0x74,0x75,0x72,0x6e,0x3b,
    0x0a,0x7d,0x0a,0x0a,0x73,0x74,0x72,0x75,0x63,0x74,0x20,0x6d,0x61,0x69,0x6e,0x5f,
    0x6f,0x75,0x74,0x20,0x7b,0x0a,0x20,0x20,0x40,0x6c,0x6f,0x63,0x61,0x74,0x69,0x6f,
    0x6e,0x28,0x30,0x29,0x0a,0x20,0x20,0x66,0x72,0x61,0x67,0x5f,0x63,0x6f,0x6c,0x6f,
    0x72,0x5f,0x31,0x20,0x3a,0x20,0x76,0x65,0x63,0x34,0x66,0x2c,0x0a,0x7d,0x0a,0x0a,
    0x40,0x66,0x72,0x61,0x67,0x6d,0x65,0x6e,0x74,0x0a,0x66,0x6e,0x20,0x6d,0x61,0x69,
    0x6e,0x28,0x40,0x6c,0x6f,0x63,0x61,0x74,0x69,0x6f,0x6e,0x28,0x30,0x29,0x20,0x63,
    0x6f,0x6c,0x6f,0x72,0x5f,0x70,0x61,0x72,0x61,0x6d,0x20,0x3a,0x20,0x76,0x65,0x63,
    0x34,0x66,0x29,0x20,0x2d,0x3e,0x20,0x6d,0x61,0x69,0x6e,0x5f,0x6f,0x75,0x74,0x20,
    0x7b,0x0a,0x20,0x20,0x63,0x6f,0x6c,0x6f,0x72,0x20,0x3d,0x20,0x63,0x6f,0x6c,0x6f,
    0x72,0x5f,0x70,0x61,0x72,0x61,0x6d,0x3b,0x0a,0x20,0x20,0x6d,0x61,0x69,0x6e,0x5f,
    0x31,0x28,0x29,0x3b,0x0a,0x20,0x20,0x72,0x65,0x74,0x75,0x72,0x6e,0x20,0x6d,0x61,
    0x69,0x6e,0x5f,0x6f,0x75,0x74,0x28,0x66,0x72,0x61,0x67,0x5f,0x63,0x6f,0x6c,0x6f,
    0x72,0x29,0x3b,0x0a,0x7d,0x0a,0x0a,0x00,
];
sg.ShaderDesc noninterleavedShaderDesc(sg.Backend backend) @trusted @nogc nothrow {
    sg.ShaderDesc desc;
    desc.label = "noninterleaved_shader";
    switch (backend) {
        case sg.Backend.Glcore:
            desc.attrs[0].name = "position";
            desc.attrs[1].name = "color0";
            desc.vs.source = &VS_SOURCE_GLSL430[0];
            desc.vs.entry = "main";
            desc.vs.uniform_blocks[0].size = 64;
            desc.vs.uniform_blocks[0].layout = sg.UniformLayout.Std140;
            desc.vs.uniform_blocks[0].uniforms[0].name = "vs_params";
            desc.vs.uniform_blocks[0].uniforms[0].type = sg.UniformType.Float4;
            desc.vs.uniform_blocks[0].uniforms[0].array_count = 4;
            desc.fs.source = &FS_SOURCE_GLSL430[0];
            desc.fs.entry = "main";
            break;
        case sg.Backend.Gles3:
            desc.attrs[0].name = "position";
            desc.attrs[1].name = "color0";
            desc.vs.source = &VS_SOURCE_GLSL300ES[0];
            desc.vs.entry = "main";
            desc.vs.uniform_blocks[0].size = 64;
            desc.vs.uniform_blocks[0].layout = sg.UniformLayout.Std140;
            desc.vs.uniform_blocks[0].uniforms[0].name = "vs_params";
            desc.vs.uniform_blocks[0].uniforms[0].type = sg.UniformType.Float4;
            desc.vs.uniform_blocks[0].uniforms[0].array_count = 4;
            desc.fs.source = &FS_SOURCE_GLSL300ES[0];
            desc.fs.entry = "main";
            break;
        case sg.Backend.D3d11:
            desc.attrs[0].sem_name = "TEXCOORD";
            desc.attrs[0].sem_index = 0;
            desc.attrs[1].sem_name = "TEXCOORD";
            desc.attrs[1].sem_index = 1;
            desc.vs.source = &VS_SOURCE_HLSL4[0];
            desc.vs.d3d11_target = "vs_4_0";
            desc.vs.entry = "main";
            desc.vs.uniform_blocks[0].size = 64;
            desc.vs.uniform_blocks[0].layout = sg.UniformLayout.Std140;
            desc.fs.source = &FS_SOURCE_HLSL4[0];
            desc.fs.d3d11_target = "ps_4_0";
            desc.fs.entry = "main";
            break;
        case sg.Backend.Metal_macos:
            desc.vs.source = &VS_SOURCE_METAL_MACOS[0];
            desc.vs.entry = "main0";
            desc.vs.uniform_blocks[0].size = 64;
            desc.vs.uniform_blocks[0].layout = sg.UniformLayout.Std140;
            desc.fs.source = &FS_SOURCE_METAL_MACOS[0];
            desc.fs.entry = "main0";
            break;
        case sg.Backend.Wgpu:
            desc.vs.source = &VS_SOURCE_WGSL[0];
            desc.vs.entry = "main";
            desc.vs.uniform_blocks[0].size = 64;
            desc.vs.uniform_blocks[0].layout = sg.UniformLayout.Std140;
            desc.fs.source = &FS_SOURCE_WGSL[0];
            desc.fs.entry = "main";
            break;
        default: break;
    }
    return desc;
}
