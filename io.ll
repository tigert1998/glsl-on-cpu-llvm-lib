; void print(int)
; void print(uint)
; void print(float)
; void print(bool)

@print.int.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define void @print.int(i32*) {
  %2 = alloca i32*, align 8
  store i32* %0, i32** %2, align 8
  %3 = load i32*, i32** %2, align 8
  %4 = load i32, i32* %3, align 4
  %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @print.int.str, i32 0, i32 0), i32 %4)
  ret void
}

@print.uint.str = private unnamed_addr constant [5 x i8] c"%uu\0A\00", align 1

define void @print.uint(i32*) {
  %2 = alloca i32*, align 8
  store i32* %0, i32** %2, align 8
  %3 = load i32*, i32** %2, align 8
  %4 = load i32, i32* %3, align 4
  %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @print.uint.str, i32 0, i32 0), i32 %4)
  ret void
}

@print.float.str = private unnamed_addr constant [6 x i8] c"%.6f\0A\00", align 1

define void @print.float(float*) {
  %2 = alloca float*, align 8
  store float* %0, float** %2, align 8
  %3 = load float*, float** %2, align 8
  %4 = load float, float* %3, align 4
  %5 = fpext float %4 to double
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @print.float.str, i32 0, i32 0), double %5)
  ret void
}

@print.bool.str = private unnamed_addr constant [6 x i8] c"true\0A\00", align 1
@print.bool.str.1 = private unnamed_addr constant [7 x i8] c"false\0A\00", align 1

define void @print.bool(i8*) {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  %3 = load i8*, i8** %2, align 8
  %4 = load i8, i8* %3, align 1
  %5 = sext i8 %4 to i32
  %6 = icmp ne i32 %5, 0
  %7 = zext i1 %6 to i64
  %8 = select i1 %6, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @print.bool.str, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @print.bool.str.1, i32 0, i32 0)
  %9 = call i32 (i8*, ...) @printf(i8* %8)
  ret void
}

; void read(out int)
; void read(out uint)
; void read(out float)
; void read(out bool)

@read.int.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1

define void @read.int(i32*) {
  %2 = alloca i32*, align 8
  store i32* %0, i32** %2, align 8
  %3 = load i32*, i32** %2, align 8
  %4 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @read.int.str, i32 0, i32 0), i32* %3)
  ret void
}

@read.uint.str = private unnamed_addr constant [4 x i8] c"%ud\00", align 1

define void @read.uint(i32*) {
  %2 = alloca i32*, align 8
  store i32* %0, i32** %2, align 8
  %3 = load i32*, i32** %2, align 8
  %4 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @read.uint.str, i32 0, i32 0), i32* %3)
  ret void
}

@read.float.str = private unnamed_addr constant [3 x i8] c"%f\00", align 1

define void @read.float(float*) {
  %2 = alloca float*, align 8
  store float* %0, float** %2, align 8
  %3 = load float*, float** %2, align 8
  %4 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @read.float.str, i32 0, i32 0), float* %3)
  ret void
}

@read.bool.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1

define void @read.bool(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  %4 = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @read.bool.str, i32 0, i32 0), i32* %3)
  %5 = load i32, i32* %3, align 4
  %6 = icmp ne i32 %5, 0
  %7 = zext i1 %6 to i32
  %8 = trunc i32 %7 to i8
  %9 = load i8*, i8** %2, align 8
  store i8 %8, i8* %9, align 1
  ret void
}

declare i32 @printf(i8*, ...)

declare i32 @scanf(i8*, ...)
