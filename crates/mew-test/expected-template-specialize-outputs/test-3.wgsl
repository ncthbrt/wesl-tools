

@compute @workgroup_size(workgroupThreads, 1, 1)
fn test__3_ReduceBuffer_main__test____95____3____58____58____SumBinaryOp____60____test____95____95____3____95____SumBinaryOp____95____N____61____test____95____3____58____58____F32____62__test____95____3____58____58____BlockArea__test____95____3____58____58____WorkSize__test____95____3____58____58____Threads(@builtin(global_invocation_id) grid: vec3<u32>, @builtin(local_invocation_index) localIndex: u32, @builtin(num_workgroups) numWorkgroups: vec3<u32>, @builtin(workgroup_id) workgroupId: vec3<u32>) {
    test__3_ReduceBuffer_reduceBufferToWork__test____95____3____58____58____SumBinaryOp____60____test____95____95____3____95____SumBinaryOp____95____N____61____test____95____3____58____58____F32____62__test____95____3____58____58____BlockArea__test____95____3____58____58____WorkSize__test____95____3____58____58____Threads(grid.xy, localIndex);
    let outDex = workgroupId.x + test__3_ReduceBuffer_u__test____95____3____58____58____SumBinaryOp____60____test____95____95____3____95____SumBinaryOp____95____N____61____test____95____3____58____58____F32____62__test____95____3____58____58____BlockArea__test____95____3____58____58____WorkSize__test____95____3____58____58____Threads.resultOffset;
    test__3_ReduceWorkgroup_reduceWorkgroup__test____95____3____58____58____SumBinaryOp____60____test____95____95____3____95____SumBinaryOp____95____N____61____test____95____3____58____58____F32____62__test____95____3____58____58____WorkSize__test____95____3____58____58____Threads(localIndex);
    if localIndex == 0u {
        test__3_ReduceBuffer_out__test____95____3____58____58____SumBinaryOp____60____test____95____95____3____95____SumBinaryOp____95____N____61____test____95____3____58____58____F32____62__test____95____3____58____58____BlockArea__test____95____3____58____58____WorkSize__test____95____3____58____58____Threads[outDex] = test__3_ReduceWorkgroup_work__test____95____3____58____58____SumBinaryOp____60____test____95____95____3____95____SumBinaryOp____95____N____61____test____95____3____58____58____F32____62__test____95____3____58____58____WorkSize[0];
    }
}

@group(0) @binding(2)
var<storage, read_write> test__3_ReduceBuffer_out__test____95____3____58____58____SumBinaryOp____60____test____95____95____3____95____SumBinaryOp____95____N____61____test____95____3____58____58____F32____62__test____95____3____58____58____BlockArea__test____95____3____58____58____WorkSize__test____95____3____58____58____Threads: array<test__3_Sum_T__test____95____3____58____58____F32>;

@group(0) @binding(0)
var<uniform> test__3_ReduceBuffer_u__test____95____3____58____58____SumBinaryOp____60____test____95____95____3____95____SumBinaryOp____95____N____61____test____95____3____58____58____F32____62__test____95____3____58____58____BlockArea__test____95____3____58____58____WorkSize__test____95____3____58____58____Threads: test__3_ReduceBuffer_Uniforms;

struct test__3_ReduceBuffer_Uniforms {
    sourceOffset: u32,
    resultOffset: u32
}

fn test__3_ReduceBuffer_reduceBufferToWork__test____95____3____58____58____SumBinaryOp____60____test____95____95____3____95____SumBinaryOp____95____N____61____test____95____3____58____58____F32____62__test____95____3____58____58____BlockArea__test____95____3____58____58____WorkSize__test____95____3____58____58____Threads(grid: vec2<u32>, localId: u32) {
    var values = test__3_ReduceBuffer_fetchSrcBuffer__test____95____3____58____58____SumBinaryOp____60____test____95____95____3____95____SumBinaryOp____95____N____61____test____95____3____58____58____F32____62__test____95____3____58____58____BlockArea__test____95____3____58____58____WorkSize__test____95____3____58____58____Threads(grid.x);
    var v = test__3_ReduceBuffer_reduceSrcBlock__test____95____3____58____58____SumBinaryOp____60____test____95____95____3____95____SumBinaryOp____95____N____61____test____95____3____58____58____F32____62__test____95____3____58____58____BlockArea__test____95____3____58____58____WorkSize__test____95____3____58____58____Threads(values);
    test__3_ReduceWorkgroup_work__test____95____3____58____58____SumBinaryOp____60____test____95____95____3____95____SumBinaryOp____95____N____61____test____95____3____58____58____F32____62__test____95____3____58____58____WorkSize[localId] = v;
}

fn test__3_ReduceBuffer_reduceSrcBlock__test____95____3____58____58____SumBinaryOp____60____test____95____95____3____95____SumBinaryOp____95____N____61____test____95____3____58____58____F32____62__test____95____3____58____58____BlockArea__test____95____3____58____58____WorkSize__test____95____3____58____58____Threads(a: array<test__3_Sum_T__test____95____3____58____58____F32, test__3_BlockArea_value>) -> test__3_Sum_T__test____95____3____58____58____F32 {
    var v = a[0];
    for (var i = 1u; i < test__3_BlockArea_value; i = i + 1u) {
        v = test__3_SumBinaryOp_binaryOp__test____95____3____58____58____F32(v, a[i]);
    }
    return v;
}

fn test__3_ReduceBuffer_fetchSrcBuffer__test____95____3____58____58____SumBinaryOp____60____test____95____95____3____95____SumBinaryOp____95____N____61____test____95____3____58____58____F32____62__test____95____3____58____58____BlockArea__test____95____3____58____58____WorkSize__test____95____3____58____58____Threads(gridX: u32) -> array<test__3_Sum_T__test____95____3____58____58____F32, test__3_BlockArea_value> {
    let start = test__3_ReduceBuffer_u__test____95____3____58____58____SumBinaryOp____60____test____95____95____3____95____SumBinaryOp____95____N____61____test____95____3____58____58____F32____62__test____95____3____58____58____BlockArea__test____95____3____58____58____WorkSize__test____95____3____58____58____Threads.sourceOffset + (gridX * test__3_BlockArea_value);
    let end = arrayLength(&test__3_ReduceBuffer_src__test____95____3____58____58____SumBinaryOp____60____test____95____95____3____95____SumBinaryOp____95____N____61____test____95____3____58____58____F32____62__test____95____3____58____58____BlockArea__test____95____3____58____58____WorkSize__test____95____3____58____58____Threads);
    var a = array<test__3_Sum_T__test____95____3____58____58____F32, test__3_BlockArea_value>();
    for (var i = 0u; i < test__3_BlockArea_value; i = i + 1u) {
        var idx = i + start;
        if idx < end {
            a[i] = test__3_SumBinaryOp_loadOp__test____95____3____58____58____F32(test__3_ReduceBuffer_src__test____95____3____58____58____SumBinaryOp____60____test____95____95____3____95____SumBinaryOp____95____N____61____test____95____3____58____58____F32____62__test____95____3____58____58____BlockArea__test____95____3____58____58____WorkSize__test____95____3____58____58____Threads[idx]);
        }
        else {
            a[i] = test__3_SumBinaryOp_identityOp__test____95____3____58____58____F32();
        }
    }
    return a;
}

@group(0) @binding(1)
var<storage, read> test__3_ReduceBuffer_src__test____95____3____58____58____SumBinaryOp____60____test____95____95____3____95____SumBinaryOp____95____N____61____test____95____3____58____58____F32____62__test____95____3____58____58____BlockArea__test____95____3____58____58____WorkSize__test____95____3____58____58____Threads: array<test__3_Sum_T__test____95____3____58____58____F32>;

var<workgroup> test__3_ReduceWorkgroup_work__test____95____3____58____58____SumBinaryOp____60____test____95____95____3____95____SumBinaryOp____95____N____61____test____95____3____58____58____F32____62__test____95____3____58____58____WorkSize: array<test__3_Sum_T__test____95____3____58____58____F32, test__3_WorkSize_value>;

fn test__3_ReduceWorkgroup_reduceWorkgroup__test____95____3____58____58____SumBinaryOp____60____test____95____95____3____95____SumBinaryOp____95____N____61____test____95____3____58____58____F32____62__test____95____3____58____58____WorkSize__test____95____3____58____58____Threads(localId: u32) {
    let workDex = localId << 1u;
    for (var step = 1u; step < test__3_Threads_value; step <<= 1u) {
        workgroupBarrier();
        if localId % step == 0u {
            test__3_ReduceWorkgroup_work__test____95____3____58____58____SumBinaryOp____60____test____95____95____3____95____SumBinaryOp____95____N____61____test____95____3____58____58____F32____62__test____95____3____58____58____WorkSize[workDex] = test__3_SumBinaryOp_binaryOp__test____95____3____58____58____F32(test__3_ReduceWorkgroup_work__test____95____3____58____58____SumBinaryOp____60____test____95____95____3____95____SumBinaryOp____95____N____61____test____95____3____58____58____F32____62__test____95____3____58____58____WorkSize[workDex], test__3_ReduceWorkgroup_work__test____95____3____58____58____SumBinaryOp____60____test____95____95____3____95____SumBinaryOp____95____N____61____test____95____3____58____58____F32____62__test____95____3____58____58____WorkSize[workDex + step]);
        }
    }
}

const test__3_WorkSize_value: u32 = 18u;

fn test__3_SumBinaryOp_binaryOp__test____95____3____58____58____F32(a: test__3_Sum_T__test____95____3____58____58____F32, b: test__3_Sum_T__test____95____3____58____58____F32) -> test__3_Sum_T__test____95____3____58____58____F32 {
    return test__3_Sum_T__test____95____3____58____58____F32(test__3_F32_add(a.sum, b.sum));
}

fn test__3_SumBinaryOp_identityOp__test____95____3____58____58____F32() -> test__3_Sum_T__test____95____3____58____58____F32 {
    return test__3_Sum_T__test____95____3____58____58____F32();
}

fn test__3_SumBinaryOp_loadOp__test____95____3____58____58____F32(a: test__3_Sum_T__test____95____3____58____58____F32) -> test__3_Sum_T__test____95____3____58____58____F32 {
    return test__3_Sum_T__test____95____3____58____58____F32(a.sum);
}

struct test__3_Sum_T__test____95____3____58____58____F32 {
    sum: f32
}

fn test__3_F32_add(a: f32, b: f32) -> f32 {
    return a + b;
}

const test__3_Threads_value: u32 = 10u;

const test__3_BlockArea_value: u32 = 4u;
