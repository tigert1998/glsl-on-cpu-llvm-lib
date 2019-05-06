# glsl-on-cpu-llvm-lib

| operator     | todo             | assigned to | remark                                                      |
| ------------ | ---------------- | ----------- | ----------------------------------------------------------- |
| BitwiseAnd   |                  |             |                                                             |
| BitwiseNot   |                  |             |                                                             |
| BitwiseOr    |                  |             |                                                             |
| BitwiseXor   |                  |             |                                                             |
| Div          |                  |             |                                                             |
| Equal        | struct and array |             |                                                             |
| Greater      |                  |             |                                                             |
| GreaterEqual |                  |             |                                                             |
| Less         |                  |             |                                                             |
| LessEqual    |                  |             |                                                             |
| LogicalAnd   |                  |             |                                                             |
| LogicalNot   |                  |             |                                                             |
| LogicalOr    |                  |             |                                                             |
| LogicalXor   |                  |             |                                                             |
| Minus        |                  | zq          |                                                             |
| Mod          |                  |             |                                                             |
| Mult         |                  |             |                                                             |
| NotEqual     |                  |             | no need to implement cuz it would be compiled to `(!).(==)` |
| Plus         |                  | zq          |                                                             |
| Shl          |                  |             |                                                             |
| Shr          |                  |             |                                                             |

## type in llvm

| glsl   | reference           | type              |
| ------ | ------------------- | ----------------- |
| int    | `i32*`              | `i32`             |
| uint   | `i32*`              | `i32`             |
| float  | `float*`            | `float`           |
| bool   | `char*`             | `char`            |
| ivecn  | `[n x i32*]*`       | `[n x i32]`       |
| uvecn  | `[n x i32*]*`       | `[n x i32]`       |
| vecn   | `[n x float*]*`     | `[n x float]`     |
| bvecn  | `[n x char*]*`      | `[n x char]`      |
| matnxm | `[(n*m) x float*]*` | `[(n*m) x float]` |
| struct |                     |                   |
| array  |                     |                   |

