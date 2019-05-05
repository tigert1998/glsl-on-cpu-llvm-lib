; int * int
define void @.mult.int.int(i32*, i32*, i32*) {
  %4 = alloca i32*, align 8
  %5 = alloca i32*, align 8
  %6 = alloca i32*, align 8
  store i32* %0, i32** %4, align 8
  store i32* %1, i32** %5, align 8
  store i32* %2, i32** %6, align 8
  %7 = load i32*, i32** %4, align 8
  %8 = load i32, i32* %7, align 4
  %9 = load i32*, i32** %5, align 8
  %10 = load i32, i32* %9, align 4
  %11 = mul nsw i32 %8, %10
  %12 = load i32*, i32** %6, align 8
  store i32 %11, i32* %12, align 4
  ret void
}

; uint * uint
define void @.mult.uint.uint(i32*, i32*, i32*) {
  %4 = alloca i32*, align 8
  %5 = alloca i32*, align 8
  %6 = alloca i32*, align 8
  store i32* %0, i32** %4, align 8
  store i32* %1, i32** %5, align 8
  store i32* %2, i32** %6, align 8
  %7 = load i32*, i32** %4, align 8
  %8 = load i32, i32* %7, align 4
  %9 = load i32*, i32** %5, align 8
  %10 = load i32, i32* %9, align 4
  %11 = mul i32 %8, %10
  %12 = load i32*, i32** %6, align 8
  store i32 %11, i32* %12, align 4
  ret void
}

; float * float
define void @.mult.float.float(float*, float*, float*) {
  %4 = alloca float*, align 8
  %5 = alloca float*, align 8
  %6 = alloca float*, align 8
  store float* %0, float** %4, align 8
  store float* %1, float** %5, align 8
  store float* %2, float** %6, align 8
  %7 = load float*, float** %4, align 8
  %8 = load float, float* %7, align 4
  %9 = load float*, float** %5, align 8
  %10 = load float, float* %9, align 4
  %11 = fmul float %8, %10
  %12 = load float*, float** %6, align 8
  store float %11, float* %12, align 4
  ret void
}

; ivecn * ivecn
define void @.mult.ivecn.ivecn(i32*, i32, i32*, i32, i32*) {
  %6 = alloca i32*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32*, align 8
  %11 = alloca i32, align 4
  store i32* %0, i32** %6, align 8
  store i32 %1, i32* %7, align 4
  store i32* %2, i32** %8, align 8
  store i32 %3, i32* %9, align 4
  store i32* %4, i32** %10, align 8
  store i32 0, i32* %11, align 4
  br label %12

; <label>:12:                                     ; preds = %32, %5
  %13 = load i32, i32* %11, align 4
  %14 = load i32, i32* %7, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %35

; <label>:16:                                     ; preds = %12
  %17 = load i32*, i32** %6, align 8
  %18 = load i32, i32* %11, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i32, i32* %17, i64 %19
  %21 = load i32, i32* %20, align 4
  %22 = load i32*, i32** %8, align 8
  %23 = load i32, i32* %11, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i32, i32* %22, i64 %24
  %26 = load i32, i32* %25, align 4
  %27 = mul nsw i32 %21, %26
  %28 = load i32*, i32** %10, align 8
  %29 = load i32, i32* %11, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32* %28, i64 %30
  store i32 %27, i32* %31, align 4
  br label %32

; <label>:32:                                     ; preds = %16
  %33 = load i32, i32* %11, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, i32* %11, align 4
  br label %12

; <label>:35:                                     ; preds = %12
  ret void
}

; int * ivecn
define void @.mult.int.ivecn(i32*, i32*, i32, i32*) {
  %5 = alloca i32*, align 8
  %6 = alloca i32*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32*, align 8
  %9 = alloca i32, align 4
  store i32* %0, i32** %5, align 8
  store i32* %1, i32** %6, align 8
  store i32 %2, i32* %7, align 4
  store i32* %3, i32** %8, align 8
  store i32 0, i32* %9, align 4
  br label %10

; <label>:10:                                     ; preds = %27, %4
  %11 = load i32, i32* %9, align 4
  %12 = load i32, i32* %7, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %30

; <label>:14:                                     ; preds = %10
  %15 = load i32*, i32** %5, align 8
  %16 = load i32, i32* %15, align 4
  %17 = load i32*, i32** %6, align 8
  %18 = load i32, i32* %9, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i32, i32* %17, i64 %19
  %21 = load i32, i32* %20, align 4
  %22 = mul nsw i32 %16, %21
  %23 = load i32*, i32** %8, align 8
  %24 = load i32, i32* %9, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i32, i32* %23, i64 %25
  store i32 %22, i32* %26, align 4
  br label %27

; <label>:27:                                     ; preds = %14
  %28 = load i32, i32* %9, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, i32* %9, align 4
  br label %10

; <label>:30:                                     ; preds = %10
  ret void
}

; ivecn * int
define void @.mult.ivecn.int(i32*, i32, i32*, i32*) {
  %5 = alloca i32*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32*, align 8
  %8 = alloca i32*, align 8
  %9 = alloca i32, align 4
  store i32* %0, i32** %5, align 8
  store i32 %1, i32* %6, align 4
  store i32* %2, i32** %7, align 8
  store i32* %3, i32** %8, align 8
  store i32 0, i32* %9, align 4
  br label %10

; <label>:10:                                     ; preds = %27, %4
  %11 = load i32, i32* %9, align 4
  %12 = load i32, i32* %6, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %30

; <label>:14:                                     ; preds = %10
  %15 = load i32*, i32** %5, align 8
  %16 = load i32, i32* %9, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i32, i32* %15, i64 %17
  %19 = load i32, i32* %18, align 4
  %20 = load i32*, i32** %7, align 8
  %21 = load i32, i32* %20, align 4
  %22 = mul nsw i32 %19, %21
  %23 = load i32*, i32** %8, align 8
  %24 = load i32, i32* %9, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i32, i32* %23, i64 %25
  store i32 %22, i32* %26, align 4
  br label %27

; <label>:27:                                     ; preds = %14
  %28 = load i32, i32* %9, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, i32* %9, align 4
  br label %10

; <label>:30:                                     ; preds = %10
  ret void
}

; uvecn * uvecn
define void @.mult.uvecn.uvecn(i32*, i32, i32*, i32, i32*) {
  %6 = alloca i32*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32*, align 8
  %11 = alloca i32, align 4
  store i32* %0, i32** %6, align 8
  store i32 %1, i32* %7, align 4
  store i32* %2, i32** %8, align 8
  store i32 %3, i32* %9, align 4
  store i32* %4, i32** %10, align 8
  store i32 0, i32* %11, align 4
  br label %12

; <label>:12:                                     ; preds = %32, %5
  %13 = load i32, i32* %11, align 4
  %14 = load i32, i32* %7, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %35

; <label>:16:                                     ; preds = %12
  %17 = load i32*, i32** %6, align 8
  %18 = load i32, i32* %11, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i32, i32* %17, i64 %19
  %21 = load i32, i32* %20, align 4
  %22 = load i32*, i32** %8, align 8
  %23 = load i32, i32* %11, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i32, i32* %22, i64 %24
  %26 = load i32, i32* %25, align 4
  %27 = mul i32 %21, %26
  %28 = load i32*, i32** %10, align 8
  %29 = load i32, i32* %11, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32* %28, i64 %30
  store i32 %27, i32* %31, align 4
  br label %32

; <label>:32:                                     ; preds = %16
  %33 = load i32, i32* %11, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, i32* %11, align 4
  br label %12

; <label>:35:                                     ; preds = %12
  ret void
}

; uint * uvecn
define void @.mult.uint.uvecn(i32*, i32*, i32, i32*) {
  %5 = alloca i32*, align 8
  %6 = alloca i32*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32*, align 8
  %9 = alloca i32, align 4
  store i32* %0, i32** %5, align 8
  store i32* %1, i32** %6, align 8
  store i32 %2, i32* %7, align 4
  store i32* %3, i32** %8, align 8
  store i32 0, i32* %9, align 4
  br label %10

; <label>:10:                                     ; preds = %27, %4
  %11 = load i32, i32* %9, align 4
  %12 = load i32, i32* %7, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %30

; <label>:14:                                     ; preds = %10
  %15 = load i32*, i32** %5, align 8
  %16 = load i32, i32* %15, align 4
  %17 = load i32*, i32** %6, align 8
  %18 = load i32, i32* %9, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i32, i32* %17, i64 %19
  %21 = load i32, i32* %20, align 4
  %22 = mul i32 %16, %21
  %23 = load i32*, i32** %8, align 8
  %24 = load i32, i32* %9, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i32, i32* %23, i64 %25
  store i32 %22, i32* %26, align 4
  br label %27

; <label>:27:                                     ; preds = %14
  %28 = load i32, i32* %9, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, i32* %9, align 4
  br label %10

; <label>:30:                                     ; preds = %10
  ret void
}

; uvecn * uint
define void @.mult.uvecn.uint(i32*, i32, i32*, i32*) {
  %5 = alloca i32*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32*, align 8
  %8 = alloca i32*, align 8
  %9 = alloca i32, align 4
  store i32* %0, i32** %5, align 8
  store i32 %1, i32* %6, align 4
  store i32* %2, i32** %7, align 8
  store i32* %3, i32** %8, align 8
  store i32 0, i32* %9, align 4
  br label %10

; <label>:10:                                     ; preds = %27, %4
  %11 = load i32, i32* %9, align 4
  %12 = load i32, i32* %6, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %30

; <label>:14:                                     ; preds = %10
  %15 = load i32*, i32** %5, align 8
  %16 = load i32, i32* %9, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i32, i32* %15, i64 %17
  %19 = load i32, i32* %18, align 4
  %20 = load i32*, i32** %7, align 8
  %21 = load i32, i32* %20, align 4
  %22 = mul i32 %19, %21
  %23 = load i32*, i32** %8, align 8
  %24 = load i32, i32* %9, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i32, i32* %23, i64 %25
  store i32 %22, i32* %26, align 4
  br label %27

; <label>:27:                                     ; preds = %14
  %28 = load i32, i32* %9, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, i32* %9, align 4
  br label %10

; <label>:30:                                     ; preds = %10
  ret void
}

; vecn * vecn
define void @.mult.vecn.vecn(float*, i32, float*, i32, float*) {
  %6 = alloca float*, align 8
  %7 = alloca i32, align 4
  %8 = alloca float*, align 8
  %9 = alloca i32, align 4
  %10 = alloca float*, align 8
  %11 = alloca i32, align 4
  store float* %0, float** %6, align 8
  store i32 %1, i32* %7, align 4
  store float* %2, float** %8, align 8
  store i32 %3, i32* %9, align 4
  store float* %4, float** %10, align 8
  store i32 0, i32* %11, align 4
  br label %12

; <label>:12:                                     ; preds = %32, %5
  %13 = load i32, i32* %11, align 4
  %14 = load i32, i32* %7, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %35

; <label>:16:                                     ; preds = %12
  %17 = load float*, float** %6, align 8
  %18 = load i32, i32* %11, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds float, float* %17, i64 %19
  %21 = load float, float* %20, align 4
  %22 = load float*, float** %8, align 8
  %23 = load i32, i32* %11, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds float, float* %22, i64 %24
  %26 = load float, float* %25, align 4
  %27 = fmul float %21, %26
  %28 = load float*, float** %10, align 8
  %29 = load i32, i32* %11, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds float, float* %28, i64 %30
  store float %27, float* %31, align 4
  br label %32

; <label>:32:                                     ; preds = %16
  %33 = load i32, i32* %11, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, i32* %11, align 4
  br label %12

; <label>:35:                                     ; preds = %12
  ret void
}

; float * vecn
define void @.mult.float.vecn(float*, float*, i32, float*) {
  %5 = alloca float*, align 8
  %6 = alloca float*, align 8
  %7 = alloca i32, align 4
  %8 = alloca float*, align 8
  %9 = alloca i32, align 4
  store float* %0, float** %5, align 8
  store float* %1, float** %6, align 8
  store i32 %2, i32* %7, align 4
  store float* %3, float** %8, align 8
  store i32 0, i32* %9, align 4
  br label %10

; <label>:10:                                     ; preds = %27, %4
  %11 = load i32, i32* %9, align 4
  %12 = load i32, i32* %7, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %30

; <label>:14:                                     ; preds = %10
  %15 = load float*, float** %5, align 8
  %16 = load float, float* %15, align 4
  %17 = load float*, float** %6, align 8
  %18 = load i32, i32* %9, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds float, float* %17, i64 %19
  %21 = load float, float* %20, align 4
  %22 = fmul float %16, %21
  %23 = load float*, float** %8, align 8
  %24 = load i32, i32* %9, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds float, float* %23, i64 %25
  store float %22, float* %26, align 4
  br label %27

; <label>:27:                                     ; preds = %14
  %28 = load i32, i32* %9, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, i32* %9, align 4
  br label %10

; <label>:30:                                     ; preds = %10
  ret void
}

; vecn * float
define void @.mult.vecn.float(float*, i32, float*, float*) {
  %5 = alloca float*, align 8
  %6 = alloca i32, align 4
  %7 = alloca float*, align 8
  %8 = alloca float*, align 8
  %9 = alloca i32, align 4
  store float* %0, float** %5, align 8
  store i32 %1, i32* %6, align 4
  store float* %2, float** %7, align 8
  store float* %3, float** %8, align 8
  store i32 0, i32* %9, align 4
  br label %10

; <label>:10:                                     ; preds = %27, %4
  %11 = load i32, i32* %9, align 4
  %12 = load i32, i32* %6, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %30

; <label>:14:                                     ; preds = %10
  %15 = load float*, float** %5, align 8
  %16 = load i32, i32* %9, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds float, float* %15, i64 %17
  %19 = load float, float* %18, align 4
  %20 = load float*, float** %7, align 8
  %21 = load float, float* %20, align 4
  %22 = fmul float %19, %21
  %23 = load float*, float** %8, align 8
  %24 = load i32, i32* %9, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds float, float* %23, i64 %25
  store float %22, float* %26, align 4
  br label %27

; <label>:27:                                     ; preds = %14
  %28 = load i32, i32* %9, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, i32* %9, align 4
  br label %10

; <label>:30:                                     ; preds = %10
  ret void
}

; float * matnxm
define void @.mult.float.matnxm(float*, float*, i32, i32, float*) {
  %6 = alloca float*, align 8
  %7 = alloca float*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca float*, align 8
  %11 = alloca i32, align 4
  store float* %0, float** %6, align 8
  store float* %1, float** %7, align 8
  store i32 %2, i32* %8, align 4
  store i32 %3, i32* %9, align 4
  store float* %4, float** %10, align 8
  store i32 0, i32* %11, align 4
  br label %12

; <label>:12:                                     ; preds = %31, %5
  %13 = load i32, i32* %11, align 4
  %14 = load i32, i32* %8, align 4
  %15 = load i32, i32* %9, align 4
  %16 = mul nsw i32 %14, %15
  %17 = icmp slt i32 %13, %16
  br i1 %17, label %18, label %34

; <label>:18:                                     ; preds = %12
  %19 = load float*, float** %6, align 8
  %20 = load float, float* %19, align 4
  %21 = load float*, float** %7, align 8
  %22 = load i32, i32* %11, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds float, float* %21, i64 %23
  %25 = load float, float* %24, align 4
  %26 = fmul float %20, %25
  %27 = load float*, float** %10, align 8
  %28 = load i32, i32* %11, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds float, float* %27, i64 %29
  store float %26, float* %30, align 4
  br label %31

; <label>:31:                                     ; preds = %18
  %32 = load i32, i32* %11, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %11, align 4
  br label %12

; <label>:34:                                     ; preds = %12
  ret void
}

; matnxm * float
define void @.mult.matnxm.float(float*, i32, i32, float*, float*) {
  %6 = alloca float*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca float*, align 8
  %10 = alloca float*, align 8
  %11 = alloca i32, align 4
  store float* %0, float** %6, align 8
  store i32 %1, i32* %7, align 4
  store i32 %2, i32* %8, align 4
  store float* %3, float** %9, align 8
  store float* %4, float** %10, align 8
  store i32 0, i32* %11, align 4
  br label %12

; <label>:12:                                     ; preds = %31, %5
  %13 = load i32, i32* %11, align 4
  %14 = load i32, i32* %7, align 4
  %15 = load i32, i32* %8, align 4
  %16 = mul nsw i32 %14, %15
  %17 = icmp slt i32 %13, %16
  br i1 %17, label %18, label %34

; <label>:18:                                     ; preds = %12
  %19 = load float*, float** %6, align 8
  %20 = load i32, i32* %11, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds float, float* %19, i64 %21
  %23 = load float, float* %22, align 4
  %24 = load float*, float** %9, align 8
  %25 = load float, float* %24, align 4
  %26 = fmul float %23, %25
  %27 = load float*, float** %10, align 8
  %28 = load i32, i32* %11, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds float, float* %27, i64 %29
  store float %26, float* %30, align 4
  br label %31

; <label>:31:                                     ; preds = %18
  %32 = load i32, i32* %11, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %11, align 4
  br label %12

; <label>:34:                                     ; preds = %12
  ret void
}

; vecn * matnxm
define void @.mult.vecn.matnxm(float*, i32, float*, i32, i32, float*) {
  %7 = alloca float*, align 8
  %8 = alloca i32, align 4
  %9 = alloca float*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca float*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store float* %0, float** %7, align 8
  store i32 %1, i32* %8, align 4
  store float* %2, float** %9, align 8
  store i32 %3, i32* %10, align 4
  store i32 %4, i32* %11, align 4
  store float* %5, float** %12, align 8
  store i32 0, i32* %13, align 4
  br label %15

; <label>:15:                                     ; preds = %54, %6
  %16 = load i32, i32* %13, align 4
  %17 = load i32, i32* %10, align 4
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %19, label %57

; <label>:19:                                     ; preds = %15
  %20 = load float*, float** %12, align 8
  %21 = load i32, i32* %13, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds float, float* %20, i64 %22
  store float 0.000000e+00, float* %23, align 4
  store i32 0, i32* %14, align 4
  br label %24

; <label>:24:                                     ; preds = %50, %19
  %25 = load i32, i32* %14, align 4
  %26 = load i32, i32* %11, align 4
  %27 = icmp slt i32 %25, %26
  br i1 %27, label %28, label %53

; <label>:28:                                     ; preds = %24
  %29 = load float*, float** %7, align 8
  %30 = load i32, i32* %14, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds float, float* %29, i64 %31
  %33 = load float, float* %32, align 4
  %34 = load float*, float** %9, align 8
  %35 = load i32, i32* %13, align 4
  %36 = load i32, i32* %11, align 4
  %37 = mul nsw i32 %35, %36
  %38 = load i32, i32* %14, align 4
  %39 = add nsw i32 %37, %38
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds float, float* %34, i64 %40
  %42 = load float, float* %41, align 4
  %43 = fmul float %33, %42
  %44 = load float*, float** %12, align 8
  %45 = load i32, i32* %13, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float* %44, i64 %46
  %48 = load float, float* %47, align 4
  %49 = fadd float %48, %43
  store float %49, float* %47, align 4
  br label %50

; <label>:50:                                     ; preds = %28
  %51 = load i32, i32* %14, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %14, align 4
  br label %24

; <label>:53:                                     ; preds = %24
  br label %54

; <label>:54:                                     ; preds = %53
  %55 = load i32, i32* %13, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, i32* %13, align 4
  br label %15

; <label>:57:                                     ; preds = %15
  ret void
}

; matnxm * vecn
define void @.mult.matnxm.vecn(float*, i32, i32, float*, i32, float*) {
  %7 = alloca float*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca float*, align 8
  %11 = alloca i32, align 4
  %12 = alloca float*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store float* %0, float** %7, align 8
  store i32 %1, i32* %8, align 4
  store i32 %2, i32* %9, align 4
  store float* %3, float** %10, align 8
  store i32 %4, i32* %11, align 4
  store float* %5, float** %12, align 8
  store i32 0, i32* %13, align 4
  br label %15

; <label>:15:                                     ; preds = %54, %6
  %16 = load i32, i32* %13, align 4
  %17 = load i32, i32* %9, align 4
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %19, label %57

; <label>:19:                                     ; preds = %15
  %20 = load float*, float** %12, align 8
  %21 = load i32, i32* %13, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds float, float* %20, i64 %22
  store float 0.000000e+00, float* %23, align 4
  store i32 0, i32* %14, align 4
  br label %24

; <label>:24:                                     ; preds = %50, %19
  %25 = load i32, i32* %14, align 4
  %26 = load i32, i32* %8, align 4
  %27 = icmp slt i32 %25, %26
  br i1 %27, label %28, label %53

; <label>:28:                                     ; preds = %24
  %29 = load float*, float** %7, align 8
  %30 = load i32, i32* %14, align 4
  %31 = load i32, i32* %9, align 4
  %32 = mul nsw i32 %30, %31
  %33 = load i32, i32* %13, align 4
  %34 = add nsw i32 %32, %33
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds float, float* %29, i64 %35
  %37 = load float, float* %36, align 4
  %38 = load float*, float** %10, align 8
  %39 = load i32, i32* %14, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds float, float* %38, i64 %40
  %42 = load float, float* %41, align 4
  %43 = fmul float %37, %42
  %44 = load float*, float** %12, align 8
  %45 = load i32, i32* %13, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float* %44, i64 %46
  %48 = load float, float* %47, align 4
  %49 = fadd float %48, %43
  store float %49, float* %47, align 4
  br label %50

; <label>:50:                                     ; preds = %28
  %51 = load i32, i32* %14, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %14, align 4
  br label %24

; <label>:53:                                     ; preds = %24
  br label %54

; <label>:54:                                     ; preds = %53
  %55 = load i32, i32* %13, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, i32* %13, align 4
  br label %15

; <label>:57:                                     ; preds = %15
  ret void
}

; matnxm * matnxm
define void @.mult.matnxm.matnxm(float*, i32, i32, float*, i32, i32, float*) {
  %8 = alloca float*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca float*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca float*, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  store float* %0, float** %8, align 8
  store i32 %1, i32* %9, align 4
  store i32 %2, i32* %10, align 4
  store float* %3, float** %11, align 8
  store i32 %4, i32* %12, align 4
  store i32 %5, i32* %13, align 4
  store float* %6, float** %14, align 8
  store i32 0, i32* %15, align 4
  br label %18

; <label>:18:                                     ; preds = %78, %7
  %19 = load i32, i32* %15, align 4
  %20 = load i32, i32* %12, align 4
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %81

; <label>:22:                                     ; preds = %18
  store i32 0, i32* %16, align 4
  br label %23

; <label>:23:                                     ; preds = %74, %22
  %24 = load i32, i32* %16, align 4
  %25 = load i32, i32* %10, align 4
  %26 = icmp slt i32 %24, %25
  br i1 %26, label %27, label %77

; <label>:27:                                     ; preds = %23
  %28 = load float*, float** %14, align 8
  %29 = load i32, i32* %15, align 4
  %30 = load i32, i32* %10, align 4
  %31 = mul nsw i32 %29, %30
  %32 = load i32, i32* %16, align 4
  %33 = add nsw i32 %31, %32
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds float, float* %28, i64 %34
  store float 0.000000e+00, float* %35, align 4
  store i32 0, i32* %17, align 4
  br label %36

; <label>:36:                                     ; preds = %70, %27
  %37 = load i32, i32* %17, align 4
  %38 = load i32, i32* %9, align 4
  %39 = icmp slt i32 %37, %38
  br i1 %39, label %40, label %73

; <label>:40:                                     ; preds = %36
  %41 = load float*, float** %8, align 8
  %42 = load i32, i32* %17, align 4
  %43 = load i32, i32* %10, align 4
  %44 = mul nsw i32 %42, %43
  %45 = load i32, i32* %16, align 4
  %46 = add nsw i32 %44, %45
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds float, float* %41, i64 %47
  %49 = load float, float* %48, align 4
  %50 = load float*, float** %11, align 8
  %51 = load i32, i32* %15, align 4
  %52 = load i32, i32* %13, align 4
  %53 = mul nsw i32 %51, %52
  %54 = load i32, i32* %17, align 4
  %55 = add nsw i32 %53, %54
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float* %50, i64 %56
  %58 = load float, float* %57, align 4
  %59 = fmul float %49, %58
  %60 = load float*, float** %14, align 8
  %61 = load i32, i32* %15, align 4
  %62 = load i32, i32* %10, align 4
  %63 = mul nsw i32 %61, %62
  %64 = load i32, i32* %16, align 4
  %65 = add nsw i32 %63, %64
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float* %60, i64 %66
  %68 = load float, float* %67, align 4
  %69 = fadd float %68, %59
  store float %69, float* %67, align 4
  br label %70

; <label>:70:                                     ; preds = %40
  %71 = load i32, i32* %17, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, i32* %17, align 4
  br label %36

; <label>:73:                                     ; preds = %36
  br label %74

; <label>:74:                                     ; preds = %73
  %75 = load i32, i32* %16, align 4
  %76 = add nsw i32 %75, 1
  store i32 %76, i32* %16, align 4
  br label %23

; <label>:77:                                     ; preds = %23
  br label %78

; <label>:78:                                     ; preds = %77
  %79 = load i32, i32* %15, align 4
  %80 = add nsw i32 %79, 1
  store i32 %80, i32* %15, align 4
  br label %18

; <label>:81:                                     ; preds = %18
  ret void
}