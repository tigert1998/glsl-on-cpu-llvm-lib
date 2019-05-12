# glsl-on-cpu-llvm-lib

| operator     | todo                                                | remark                                                      |
| ------------ | --------------------------------------------------- | ----------------------------------------------------------- |
| BitwiseAnd   |                                                     |                                                             |
| BitwiseNot   |                                                     |                                                             |
| BitwiseOr    |                                                     |                                                             |
| BitwiseXor   |                                                     |                                                             |
| Div          |                                                     |                                                             |
| Equal        | <del>struct and array</del> (not supported anymore) |                                                             |
| Greater      |                                                     |                                                             |
| GreaterEqual |                                                     |                                                             |
| Less         |                                                     |                                                             |
| LessEqual    |                                                     |                                                             |
| LogicalAnd   |                                                     |                                                             |
| LogicalNot   |                                                     |                                                             |
| LogicalOr    |                                                     |                                                             |
| LogicalXor   |                                                     |                                                             |
| Minus        |                                                     |                                                             |
| Mod          |                                                     |                                                             |
| Mult         |                                                     |                                                             |
| NotEqual     |                                                     | no need to implement cuz it would be compiled to `(!).(==)` |
| Plus         |                                                     |                                                             |
| Shl          |                                                     |                                                             |
| Shr          |                                                     |                                                             |

## type in llvm

| glsl   | reference           | type              |
| ------ | ------------------- | ----------------- |
| int    | `i32*`              | `i32`             |
| uint   | `i32*`              | `i32`             |
| float  | `float*`            | `float`           |
| bool   | `i8*`               | `i8`              |
| ivecn  | `[n x i32*]*`       | `[n x i32]`       |
| uvecn  | `[n x i32*]*`       | `[n x i32]`       |
| vecn   | `[n x float*]*`     | `[n x float]`     |
| bvecn  | `[n x i8*]*`        | `[n x i8]`        |
| matnxm | `[(n*m) x float*]*` | `[(n*m) x float]` |
| struct |                     |                   |
| array  |                     |                   |

