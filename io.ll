@print.int.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define void @print.int(i32) {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @print.int.str, i32 0, i32 0), i32 %3)
  ret void
}

@print.float.str = private unnamed_addr constant [6 x i8] c"%.6f\0A\00", align 1

define void @print.float(float) {
  %2 = alloca float, align 4
  store float %0, float* %2, align 4
  %3 = load float, float* %2, align 4
  %4 = fpext float %3 to double
  %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @print.float.str, i32 0, i32 0), double %4)
  ret void
}

@readInt.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1

define i32 @readInt() {
  %1 = alloca i32, align 4
  %2 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @readInt.str, i32 0, i32 0), i32* %1)
  %3 = load i32, i32* %1, align 4
  ret i32 %3
}

@readFloat.str = private unnamed_addr constant [3 x i8] c"%f\00", align 1

define float @readFloat() {
  %1 = alloca float, align 4
  %2 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @readFloat.str, i32 0, i32 0), float* %1)
  %3 = load float, float* %1, align 4
  ret float %3
}

declare i32 @printf(i8*, ...)

declare i32 @scanf(i8*, ...)
