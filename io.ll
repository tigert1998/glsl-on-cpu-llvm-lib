; declare void @print.int(i32*)
; declare void @print.uint(i32*)
; declare void @print.float(float*)
; declare void @print.bool(i8*)
; declare void @print.ivecn(i32*, i32)
; declare void @print.uvecn(i32*, i32)
; declare void @print.vecn(float*, i32)
; declare void @print.bvecn(i8*, i32)
; declare void @print.matnxm(float*, i32, i32)
; declare void @read.int(i32*)
; declare void @read.uint(i32*)
; declare void @read.float(float*)
; declare void @read.bool(i8*)
; declare void @read.ivecn(i32*, i32)
; declare void @read.uvecn(i32*, i32)
; declare void @read.vecn(float*, i32)
; declare void @read.bvecn(i8*, i32)
; declare void @read.matnxm(float*, i32, i32)

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

@print.ivecn.str.0 = private unnamed_addr constant [4 x i8] c"(%d\00", align 1
@print.ivecn.str.1 = private unnamed_addr constant [5 x i8] c", %d\00", align 1
@print.ivecn.str.2 = private unnamed_addr constant [3 x i8] c")\0A\00", align 1
@print.uvecn.str.0 = private unnamed_addr constant [4 x i8] c"(%u\00", align 1
@print.uvecn.str.1 = private unnamed_addr constant [5 x i8] c", %u\00", align 1
@print.vecn.str.0 = private unnamed_addr constant [6 x i8] c"(%.6f\00", align 1
@print.vecn.str.1 = private unnamed_addr constant [7 x i8] c", %.6f\00", align 1
@print.bvecn.str.0 = private unnamed_addr constant [4 x i8] c"(%s\00", align 1
@print.bvecn.str.1 = private unnamed_addr constant [5 x i8] c"true\00", align 1
@print.bvecn.str.2 = private unnamed_addr constant [6 x i8] c"false\00", align 1
@print.bvecn.str.3 = private unnamed_addr constant [5 x i8] c", %s\00", align 1

define void @print.ivecn(i32*, i32) {
  %3 = alloca i32*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32* %0, i32** %3, align 8
  store i32 %1, i32* %4, align 4
  %6 = load i32*, i32** %3, align 8
  %7 = getelementptr inbounds i32, i32* %6, i64 0
  %8 = load i32, i32* %7, align 4
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @print.ivecn.str.0, i32 0, i32 0), i32 %8)
  store i32 1, i32* %5, align 4
  br label %10

; <label>:10:                                     ; preds = %21, %2
  %11 = load i32, i32* %5, align 4
  %12 = load i32, i32* %4, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %24

; <label>:14:                                     ; preds = %10
  %15 = load i32*, i32** %3, align 8
  %16 = load i32, i32* %5, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i32, i32* %15, i64 %17
  %19 = load i32, i32* %18, align 4
  %20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @print.ivecn.str.1, i32 0, i32 0), i32 %19)
  br label %21

; <label>:21:                                     ; preds = %14
  %22 = load i32, i32* %5, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* %5, align 4
  br label %10

; <label>:24:                                     ; preds = %10
  %25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @print.ivecn.str.2, i32 0, i32 0))
  ret void
}

define void @print.uvecn(i32*, i32) {
  %3 = alloca i32*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32* %0, i32** %3, align 8
  store i32 %1, i32* %4, align 4
  %6 = load i32*, i32** %3, align 8
  %7 = getelementptr inbounds i32, i32* %6, i64 0
  %8 = load i32, i32* %7, align 4
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @print.uvecn.str.0, i32 0, i32 0), i32 %8)
  store i32 1, i32* %5, align 4
  br label %10

; <label>:10:                                     ; preds = %21, %2
  %11 = load i32, i32* %5, align 4
  %12 = load i32, i32* %4, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %24

; <label>:14:                                     ; preds = %10
  %15 = load i32*, i32** %3, align 8
  %16 = load i32, i32* %5, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i32, i32* %15, i64 %17
  %19 = load i32, i32* %18, align 4
  %20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @print.uvecn.str.1, i32 0, i32 0), i32 %19)
  br label %21

; <label>:21:                                     ; preds = %14
  %22 = load i32, i32* %5, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* %5, align 4
  br label %10

; <label>:24:                                     ; preds = %10
  %25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @print.ivecn.str.2, i32 0, i32 0))
  ret void
}

define void @print.vecn(float*, i32) {
  %3 = alloca float*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store float* %0, float** %3, align 8
  store i32 %1, i32* %4, align 4
  %6 = load float*, float** %3, align 8
  %7 = getelementptr inbounds float, float* %6, i64 0
  %8 = load float, float* %7, align 4
  %9 = fpext float %8 to double
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @print.vecn.str.0, i32 0, i32 0), double %9)
  store i32 1, i32* %5, align 4
  br label %11

; <label>:11:                                     ; preds = %23, %2
  %12 = load i32, i32* %5, align 4
  %13 = load i32, i32* %4, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %26

; <label>:15:                                     ; preds = %11
  %16 = load float*, float** %3, align 8
  %17 = load i32, i32* %5, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds float, float* %16, i64 %18
  %20 = load float, float* %19, align 4
  %21 = fpext float %20 to double
  %22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @print.vecn.str.1, i32 0, i32 0), double %21)
  br label %23

; <label>:23:                                     ; preds = %15
  %24 = load i32, i32* %5, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* %5, align 4
  br label %11

; <label>:26:                                     ; preds = %11
  %27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @print.ivecn.str.2, i32 0, i32 0))
  ret void
}

define void @print.bvecn(i8*, i32) {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  store i32 %1, i32* %4, align 4
  %6 = load i8*, i8** %3, align 8
  %7 = getelementptr inbounds i8, i8* %6, i64 0
  %8 = load i8, i8* %7, align 1
  %9 = sext i8 %8 to i32
  %10 = icmp ne i32 %9, 0
  %11 = zext i1 %10 to i64
  %12 = select i1 %10, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @print.bvecn.str.1, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @print.bvecn.str.2, i32 0, i32 0)
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @print.bvecn.str.0, i32 0, i32 0), i8* %12)
  store i32 1, i32* %5, align 4
  br label %14

; <label>:14:                                     ; preds = %29, %2
  %15 = load i32, i32* %5, align 4
  %16 = load i32, i32* %4, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %32

; <label>:18:                                     ; preds = %14
  %19 = load i8*, i8** %3, align 8
  %20 = load i32, i32* %5, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i8, i8* %19, i64 %21
  %23 = load i8, i8* %22, align 1
  %24 = sext i8 %23 to i32
  %25 = icmp ne i32 %24, 0
  %26 = zext i1 %25 to i64
  %27 = select i1 %25, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @print.bvecn.str.1, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @print.bvecn.str.2, i32 0, i32 0)
  %28 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @print.bvecn.str.3, i32 0, i32 0), i8* %27)
  br label %29

; <label>:29:                                     ; preds = %18
  %30 = load i32, i32* %5, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, i32* %5, align 4
  br label %14

; <label>:32:                                     ; preds = %14
  %33 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @print.ivecn.str.2, i32 0, i32 0))
  ret void
}

@print.matnxm.str = private unnamed_addr constant [2 x i8] c"[\00", align 1
@print.matnxm.str.1 = private unnamed_addr constant [5 x i8] c"%.6f\00", align 1
@print.matnxm.str.2 = private unnamed_addr constant [7 x i8] c", %.6f\00", align 1
@print.matnxm.str.3 = private unnamed_addr constant [3 x i8] c"]\0A\00", align 1
@print.matnxm.str.4 = private unnamed_addr constant [3 x i8] c"; \00", align 1

define void @print.matnxm(float*, i32, i32) {
  %4 = alloca float*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store float* %0, float** %4, align 8
  store i32 %1, i32* %5, align 4
  store i32 %2, i32* %6, align 4
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @print.matnxm.str, i32 0, i32 0))
  store i32 0, i32* %7, align 4
  br label %10

; <label>:10:                                     ; preds = %49, %3
  %11 = load i32, i32* %7, align 4
  %12 = load i32, i32* %6, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %52

; <label>:14:                                     ; preds = %10
  %15 = load float*, float** %4, align 8
  %16 = load i32, i32* %7, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds float, float* %15, i64 %17
  %19 = load float, float* %18, align 4
  %20 = fpext float %19 to double
  %21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @print.matnxm.str.1, i32 0, i32 0), double %20)
  store i32 1, i32* %8, align 4
  br label %22

; <label>:22:                                     ; preds = %38, %14
  %23 = load i32, i32* %8, align 4
  %24 = load i32, i32* %5, align 4
  %25 = icmp slt i32 %23, %24
  br i1 %25, label %26, label %41

; <label>:26:                                     ; preds = %22
  %27 = load float*, float** %4, align 8
  %28 = load i32, i32* %8, align 4
  %29 = load i32, i32* %6, align 4
  %30 = mul nsw i32 %28, %29
  %31 = load i32, i32* %7, align 4
  %32 = add nsw i32 %30, %31
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float* %27, i64 %33
  %35 = load float, float* %34, align 4
  %36 = fpext float %35 to double
  %37 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @print.matnxm.str.2, i32 0, i32 0), double %36)
  br label %38

; <label>:38:                                     ; preds = %26
  %39 = load i32, i32* %8, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, i32* %8, align 4
  br label %22

; <label>:41:                                     ; preds = %22
  %42 = load i32, i32* %7, align 4
  %43 = load i32, i32* %6, align 4
  %44 = sub nsw i32 %43, 1
  %45 = icmp eq i32 %42, %44
  %46 = zext i1 %45 to i64
  %47 = select i1 %45, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @print.matnxm.str.3, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @print.matnxm.str.4, i32 0, i32 0)
  %48 = call i32 (i8*, ...) @printf(i8* %47)
  br label %49

; <label>:49:                                     ; preds = %41
  %50 = load i32, i32* %7, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, i32* %7, align 4
  br label %10

; <label>:52:                                     ; preds = %10
  ret void
}

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

define void @read.bool(i8*) {
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

define void @read.ivecn(i32*, i32) {
  %3 = alloca i32*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32* %0, i32** %3, align 8
  store i32 %1, i32* %4, align 4
  store i32 0, i32* %5, align 4
  br label %6

; <label>:6:                                      ; preds = %15, %2
  %7 = load i32, i32* %5, align 4
  %8 = load i32, i32* %4, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %18

; <label>:10:                                     ; preds = %6
  %11 = load i32*, i32** %3, align 8
  %12 = load i32, i32* %5, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i32, i32* %11, i64 %13
  call void @read.int(i32* %14)
  br label %15

; <label>:15:                                     ; preds = %10
  %16 = load i32, i32* %5, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, i32* %5, align 4
  br label %6

; <label>:18:                                     ; preds = %6
  ret void
}

define void @read.uvecn(i32*, i32) {
  %3 = alloca i32*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32* %0, i32** %3, align 8
  store i32 %1, i32* %4, align 4
  store i32 0, i32* %5, align 4
  br label %6

; <label>:6:                                      ; preds = %15, %2
  %7 = load i32, i32* %5, align 4
  %8 = load i32, i32* %4, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %18

; <label>:10:                                     ; preds = %6
  %11 = load i32*, i32** %3, align 8
  %12 = load i32, i32* %5, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i32, i32* %11, i64 %13
  call void @read.uint(i32* %14)
  br label %15

; <label>:15:                                     ; preds = %10
  %16 = load i32, i32* %5, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, i32* %5, align 4
  br label %6

; <label>:18:                                     ; preds = %6
  ret void
}

define void @read.vecn(float*, i32) {
  %3 = alloca float*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store float* %0, float** %3, align 8
  store i32 %1, i32* %4, align 4
  store i32 0, i32* %5, align 4
  br label %6

; <label>:6:                                      ; preds = %15, %2
  %7 = load i32, i32* %5, align 4
  %8 = load i32, i32* %4, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %18

; <label>:10:                                     ; preds = %6
  %11 = load float*, float** %3, align 8
  %12 = load i32, i32* %5, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds float, float* %11, i64 %13
  call void @read.float(float* %14)
  br label %15

; <label>:15:                                     ; preds = %10
  %16 = load i32, i32* %5, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, i32* %5, align 4
  br label %6

; <label>:18:                                     ; preds = %6
  ret void
}

define void @read.bvecn(i8*, i32) {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  store i32 %1, i32* %4, align 4
  store i32 0, i32* %5, align 4
  br label %6

; <label>:6:                                      ; preds = %15, %2
  %7 = load i32, i32* %5, align 4
  %8 = load i32, i32* %4, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %18

; <label>:10:                                     ; preds = %6
  %11 = load i8*, i8** %3, align 8
  %12 = load i32, i32* %5, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i8, i8* %11, i64 %13
  call void @read.bool(i8* %14)
  br label %15

; <label>:15:                                     ; preds = %10
  %16 = load i32, i32* %5, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, i32* %5, align 4
  br label %6

; <label>:18:                                     ; preds = %6
  ret void
}

define void @read.matnxm(float*, i32, i32) {
  %4 = alloca float*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store float* %0, float** %4, align 8
  store i32 %1, i32* %5, align 4
  store i32 %2, i32* %6, align 4
  store i32 0, i32* %7, align 4
  br label %8

; <label>:8:                                      ; preds = %19, %3
  %9 = load i32, i32* %7, align 4
  %10 = load i32, i32* %5, align 4
  %11 = load i32, i32* %6, align 4
  %12 = mul nsw i32 %10, %11
  %13 = icmp slt i32 %9, %12
  br i1 %13, label %14, label %22

; <label>:14:                                     ; preds = %8
  %15 = load float*, float** %4, align 8
  %16 = load i32, i32* %7, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds float, float* %15, i64 %17
  call void @read.float(float* %18)
  br label %19

; <label>:19:                                     ; preds = %14
  %20 = load i32, i32* %7, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %7, align 4
  br label %8

; <label>:22:                                     ; preds = %8
  ret void
}

declare i32 @printf(i8*, ...)

declare i32 @scanf(i8*, ...)
