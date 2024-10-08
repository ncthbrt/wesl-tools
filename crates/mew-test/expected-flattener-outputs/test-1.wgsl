

@binding(0) @group(0)
var<uniform> uniforms: Types_Uniforms;

@binding(1) @group(0)
var<uniform> camera: Types_Camera;

@vertex
fn main(@builtin(instance_index) instanceIdx: u32, @location(0) position: vec4f, @location(1) color: vec4f) -> Types_VertexOutput {
    let uni = Types_Uniforms();
    var output: Types_VertexOutput;
    output.Position = camera.viewProjectionMatrix * uniforms.modelMatrix[instanceIdx] * position;
    output.fragColor = color / vec4<f32>(My__Lib_x);
    return output;
}

const y: f32 = 0f;

const My__Lib_x: My__Lib_VertexShader_Types_Camera = VertexShader_Types_Camera();

struct My__Lib_VertexShader_Types_VertexOutput {
    @builtin(position)
    Position: vec4f,
    @location(0)
    fragColor: vec4f
}

struct My__Lib_VertexShader_Types_Uniforms {
    modelMatrix: array<mat4x4f, 5>
}

struct My__Lib_VertexShader_Types_Camera {
    viewProjectionMatrix: mat4x4f
}

const My__Lib_VertexShader_Frog_y: f32 = 0f;

@binding(0) @group(0)
var<uniform> My__Lib_VertexShader_uniforms: My__Lib_VertexShader_Types_Uniforms;

@binding(1) @group(0)
var<uniform> My__Lib_VertexShader_camera: My__Lib_VertexShader_Types_Camera;

@vertex
fn My__Lib_VertexShader_main(@builtin(instance_index) instanceIdx: u32, @location(0) position: vec4f, @location(1) color: vec4f) -> My__Lib_VertexShader_Types_VertexOutput {
    let uni = My__Lib_VertexShader_Types_Uniforms();
    var output: My__Lib_VertexShader_Types_VertexOutput;
    output.Position = My__Lib_VertexShader_camera.viewProjectionMatrix * My__Lib_VertexShader_uniforms.modelMatrix[instanceIdx] * position;
    output.fragColor = color / vec4<f32>(My__Lib_x);
    return output;
}

const My__Lib_VertexShader_y: f32 = 0f;

struct Types_VertexOutput {
    @builtin(position)
    Position: vec4f,
    @location(0)
    fragColor: vec4f
}

struct Types_Uniforms {
    modelMatrix: array<mat4x4f, 5>
}

struct Types_Camera {
    viewProjectionMatrix: mat4x4f
}

const Frog_y: f32 = 0f;
