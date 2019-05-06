; declare void @.equal.int.int(i32*, i32*, i8*)
; declare void @.equal.uint.uint(i32*, i32*, i8*)
; declare void @.equal.float.float(float*, float*, i8*)
; declare void @.equal.bool.bool(i8*, i8*, i8*)
; declare void @.equal.ivecn.ivecn(i32*, i32, i32*, i32, i8*)
; declare void @.equal.uvecn.uvecn(i32*, i32, i32*, i32, i8*)
; declare void @.equal.vecn.vecn(float*, i32, float*, i32, i8*)
; declare void @.equal.matnxm.matnxm(float*, i32, i32, float*, i32, i32, i8*)
; declare void @.equal.bvecn.bvecn(i8*, i32, i8*, i32, i8*)

define void @.equal.int.int(i32*, i32*, i8*) {
  %4 = alloca i8*, align 8
  %5 = alloca i32*, align 8
  %6 = alloca i32*, align 8
  store i8* %2, i8** %4, align 8
  store i32* %1, i32** %5, align 8
  store i32* %0, i32** %6, align 8
  %7 = load i32*, i32** %6, align 8
  %8 = load i32, i32* %7, align 4
  %9 = load i32*, i32** %5, align 8
  %10 = load i32, i32* %9, align 4
  %11 = icmp eq i32 %8, %10
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %3
  %13 = load i8*, i8** %4, align 8
  store i8 1, i8* %13, align 1
  br label %16

; <label>:14:                                     ; preds = %3
  %15 = load i8*, i8** %4, align 8
  store i8 0, i8* %15, align 1
  br label %16

; <label>:16:                                     ; preds = %14, %12
  ret void
}

define void @.equal.uint.uint(i32*, i32*, i8*) {
  %4 = alloca i8*, align 8
  %5 = alloca i32*, align 8
  %6 = alloca i32*, align 8
  store i8* %2, i8** %4, align 8
  store i32* %1, i32** %5, align 8
  store i32* %0, i32** %6, align 8
  %7 = load i32*, i32** %6, align 8
  %8 = load i32, i32* %7, align 4
  %9 = load i32*, i32** %5, align 8
  %10 = load i32, i32* %9, align 4
  %11 = icmp eq i32 %8, %10
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %3
  %13 = load i8*, i8** %4, align 8
  store i8 1, i8* %13, align 1
  br label %16

; <label>:14:                                     ; preds = %3
  %15 = load i8*, i8** %4, align 8
  store i8 0, i8* %15, align 1
  br label %16

; <label>:16:                                     ; preds = %14, %12
  ret void
}

define void @.equal.float.float(float*, float*, i8*) {
  %4 = alloca i8*, align 8
  %5 = alloca float*, align 8
  %6 = alloca float*, align 8
  store i8* %2, i8** %4, align 8
  store float* %1, float** %5, align 8
  store float* %0, float** %6, align 8
  %7 = load float*, float** %6, align 8
  %8 = load float, float* %7, align 4
  %9 = load float*, float** %5, align 8
  %10 = load float, float* %9, align 4
  %11 = fcmp oeq float %8, %10
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %3
  %13 = load i8*, i8** %4, align 8
  store i8 1, i8* %13, align 1
  br label %16

; <label>:14:                                     ; preds = %3
  %15 = load i8*, i8** %4, align 8
  store i8 0, i8* %15, align 1
  br label %16

; <label>:16:                                     ; preds = %14, %12
  ret void
}

define void @.equal.bool.bool(i8*, i8*, i8*) {
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  store i8* %2, i8** %4, align 8
  store i8* %1, i8** %5, align 8
  store i8* %0, i8** %6, align 8
  %7 = load i8*, i8** %6, align 8
  %8 = load i8, i8* %7, align 1
  %9 = sext i8 %8 to i32
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %16

; <label>:11:                                     ; preds = %3
  %12 = load i8*, i8** %5, align 8
  %13 = load i8, i8* %12, align 1
  %14 = sext i8 %13 to i32
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %26, label %16

; <label>:16:                                     ; preds = %11, %3
  %17 = load i8*, i8** %6, align 8
  %18 = load i8, i8* %17, align 1
  %19 = sext i8 %18 to i32
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %28

; <label>:21:                                     ; preds = %16
  %22 = load i8*, i8** %5, align 8
  %23 = load i8, i8* %22, align 1
  %24 = sext i8 %23 to i32
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %28

; <label>:26:                                     ; preds = %21, %11
  %27 = load i8*, i8** %4, align 8
  store i8 1, i8* %27, align 1
  br label %30

; <label>:28:                                     ; preds = %21, %16
  %29 = load i8*, i8** %4, align 8
  store i8 0, i8* %29, align 1
  br label %30

; <label>:30:                                     ; preds = %28, %26
  ret void
}

define void @.equal.ivecn.ivecn(i32*, i32, i32*, i32, i8*) {
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32*, align 8
  %11 = alloca i32, align 4
  store i8* %4, i8** %6, align 8
  store i32 %3, i32* %7, align 4
  store i32* %2, i32** %8, align 8
  store i32 %1, i32* %9, align 4
  store i32* %0, i32** %10, align 8
  store i32 0, i32* %11, align 4
  br label %12

; <label>:12:                                     ; preds = %31, %5
  %13 = load i32, i32* %11, align 4
  %14 = load i32, i32* %9, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %34

; <label>:16:                                     ; preds = %12
  %17 = load i32*, i32** %10, align 8
  %18 = load i32, i32* %11, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i32, i32* %17, i64 %19
  %21 = load i32, i32* %20, align 4
  %22 = load i32*, i32** %8, align 8
  %23 = load i32, i32* %11, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i32, i32* %22, i64 %24
  %26 = load i32, i32* %25, align 4
  %27 = icmp ne i32 %21, %26
  br i1 %27, label %28, label %30

; <label>:28:                                     ; preds = %16
  %29 = load i8*, i8** %6, align 8
  store i8 0, i8* %29, align 1
  br label %36

; <label>:30:                                     ; preds = %16
  br label %31

; <label>:31:                                     ; preds = %30
  %32 = load i32, i32* %11, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %11, align 4
  br label %12

; <label>:34:                                     ; preds = %12
  %35 = load i8*, i8** %6, align 8
  store i8 1, i8* %35, align 1
  br label %36

; <label>:36:                                     ; preds = %34, %28
  ret void
}

define void @.equal.uvecn.uvecn(i32*, i32, i32*, i32, i8*) {
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32*, align 8
  %11 = alloca i32, align 4
  store i8* %4, i8** %6, align 8
  store i32 %3, i32* %7, align 4
  store i32* %2, i32** %8, align 8
  store i32 %1, i32* %9, align 4
  store i32* %0, i32** %10, align 8
  store i32 0, i32* %11, align 4
  br label %12

; <label>:12:                                     ; preds = %31, %5
  %13 = load i32, i32* %11, align 4
  %14 = load i32, i32* %9, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %34

; <label>:16:                                     ; preds = %12
  %17 = load i32*, i32** %10, align 8
  %18 = load i32, i32* %11, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i32, i32* %17, i64 %19
  %21 = load i32, i32* %20, align 4
  %22 = load i32*, i32** %8, align 8
  %23 = load i32, i32* %11, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i32, i32* %22, i64 %24
  %26 = load i32, i32* %25, align 4
  %27 = icmp ne i32 %21, %26
  br i1 %27, label %28, label %30

; <label>:28:                                     ; preds = %16
  %29 = load i8*, i8** %6, align 8
  store i8 0, i8* %29, align 1
  br label %36

; <label>:30:                                     ; preds = %16
  br label %31

; <label>:31:                                     ; preds = %30
  %32 = load i32, i32* %11, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %11, align 4
  br label %12

; <label>:34:                                     ; preds = %12
  %35 = load i8*, i8** %6, align 8
  store i8 1, i8* %35, align 1
  br label %36

; <label>:36:                                     ; preds = %34, %28
  ret void
}

define void @.equal.vecn.vecn(float*, i32, float*, i32, i8*) {
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca float*, align 8
  %9 = alloca i32, align 4
  %10 = alloca float*, align 8
  %11 = alloca i32, align 4
  store i8* %4, i8** %6, align 8
  store i32 %3, i32* %7, align 4
  store float* %2, float** %8, align 8
  store i32 %1, i32* %9, align 4
  store float* %0, float** %10, align 8
  store i32 0, i32* %11, align 4
  br label %12

; <label>:12:                                     ; preds = %31, %5
  %13 = load i32, i32* %11, align 4
  %14 = load i32, i32* %9, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %34

; <label>:16:                                     ; preds = %12
  %17 = load float*, float** %10, align 8
  %18 = load i32, i32* %11, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds float, float* %17, i64 %19
  %21 = load float, float* %20, align 4
  %22 = load float*, float** %8, align 8
  %23 = load i32, i32* %11, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds float, float* %22, i64 %24
  %26 = load float, float* %25, align 4
  %27 = fcmp une float %21, %26
  br i1 %27, label %28, label %30

; <label>:28:                                     ; preds = %16
  %29 = load i8*, i8** %6, align 8
  store i8 0, i8* %29, align 1
  br label %36

; <label>:30:                                     ; preds = %16
  br label %31

; <label>:31:                                     ; preds = %30
  %32 = load i32, i32* %11, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %11, align 4
  br label %12

; <label>:34:                                     ; preds = %12
  %35 = load i8*, i8** %6, align 8
  store i8 1, i8* %35, align 1
  br label %36

; <label>:36:                                     ; preds = %34, %28
  ret void
}

define void @.equal.matnxm.matnxm(float*, i32, i32, float*, i32, i32, i8*) {
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca float*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca float*, align 8
  %15 = alloca i32, align 4
  store i8* %6, i8** %8, align 8
  store i32 %5, i32* %9, align 4
  store i32 %4, i32* %10, align 4
  store float* %3, float** %11, align 8
  store i32 %2, i32* %12, align 4
  store i32 %1, i32* %13, align 4
  store float* %0, float** %14, align 8
  store i32 0, i32* %15, align 4
  br label %16

; <label>:16:                                     ; preds = %37, %7
  %17 = load i32, i32* %15, align 4
  %18 = load i32, i32* %13, align 4
  %19 = load i32, i32* %12, align 4
  %20 = mul nsw i32 %18, %19
  %21 = icmp slt i32 %17, %20
  br i1 %21, label %22, label %40

; <label>:22:                                     ; preds = %16
  %23 = load float*, float** %14, align 8
  %24 = load i32, i32* %15, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds float, float* %23, i64 %25
  %27 = load float, float* %26, align 4
  %28 = load float*, float** %11, align 8
  %29 = load i32, i32* %15, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds float, float* %28, i64 %30
  %32 = load float, float* %31, align 4
  %33 = fcmp une float %27, %32
  br i1 %33, label %34, label %36

; <label>:34:                                     ; preds = %22
  %35 = load i8*, i8** %8, align 8
  store i8 0, i8* %35, align 1
  br label %42

; <label>:36:                                     ; preds = %22
  br label %37

; <label>:37:                                     ; preds = %36
  %38 = load i32, i32* %15, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, i32* %15, align 4
  br label %16

; <label>:40:                                     ; preds = %16
  %41 = load i8*, i8** %8, align 8
  store i8 1, i8* %41, align 1
  br label %42

; <label>:42:                                     ; preds = %40, %34
  ret void
}

define void @.equal.bvecn.bvecn(i8*, i32, i8*, i32, i8*) {
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  store i8* %4, i8** %6, align 8
  store i32 %3, i32* %7, align 4
  store i8* %2, i8** %8, align 8
  store i32 %1, i32* %9, align 4
  store i8* %0, i8** %10, align 8
  store i32 0, i32* %11, align 4
  br label %12

; <label>:12:                                     ; preds = %51, %5
  %13 = load i32, i32* %11, align 4
  %14 = load i32, i32* %9, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %54

; <label>:16:                                     ; preds = %12
  %17 = load i8*, i8** %10, align 8
  %18 = load i32, i32* %11, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i8, i8* %17, i64 %19
  %21 = load i8, i8* %20, align 1
  %22 = sext i8 %21 to i32
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %32

; <label>:24:                                     ; preds = %16
  %25 = load i8*, i8** %8, align 8
  %26 = load i32, i32* %11, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i8, i8* %25, i64 %27
  %29 = load i8, i8* %28, align 1
  %30 = sext i8 %29 to i32
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %48, label %32

; <label>:32:                                     ; preds = %24, %16
  %33 = load i8*, i8** %10, align 8
  %34 = load i32, i32* %11, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i8, i8* %33, i64 %35
  %37 = load i8, i8* %36, align 1
  %38 = sext i8 %37 to i32
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %50

; <label>:40:                                     ; preds = %32
  %41 = load i8*, i8** %8, align 8
  %42 = load i32, i32* %11, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i8, i8* %41, i64 %43
  %45 = load i8, i8* %44, align 1
  %46 = sext i8 %45 to i32
  %47 = icmp eq i32 %46, 0
  br i1 %47, label %48, label %50

; <label>:48:                                     ; preds = %40, %24
  %49 = load i8*, i8** %6, align 8
  store i8 0, i8* %49, align 1
  br label %56

; <label>:50:                                     ; preds = %40, %32
  br label %51

; <label>:51:                                     ; preds = %50
  %52 = load i32, i32* %11, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, i32* %11, align 4
  br label %12

; <label>:54:                                     ; preds = %12
  %55 = load i8*, i8** %6, align 8
  store i8 1, i8* %55, align 1
  br label %56

; <label>:56:                                     ; preds = %54, %48
  ret void
}