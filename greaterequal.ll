; declare void @.greaterequal.int.int(i32*, i32*, i8*)
; declare void @.greaterequal.uint.uint(i32*, i32*, i8*)
; declare void @.greaterequal.float.float(float*, float*, i8*)

define void @.greaterequal.int.int(i32*, i32*, i8*) {
  %4 = alloca i32*, align 8
  %5 = alloca i32*, align 8
  %6 = alloca i8*, align 8
  store i32* %0, i32** %4, align 8
  store i32* %1, i32** %5, align 8
  store i8* %2, i8** %6, align 8
  %7 = load i32*, i32** %4, align 8
  %8 = load i32, i32* %7, align 4
  %9 = load i32*, i32** %5, align 8
  %10 = load i32, i32* %9, align 4
  %11 = icmp sge i32 %8, %10
  %12 = zext i1 %11 to i32
  %13 = trunc i32 %12 to i8
  %14 = load i8*, i8** %6, align 8
  store i8 %13, i8* %14, align 1
  ret void
}

define void @.greaterequal.uint.uint(i32*, i32*, i8*) {
  %4 = alloca i32*, align 8
  %5 = alloca i32*, align 8
  %6 = alloca i8*, align 8
  store i32* %0, i32** %4, align 8
  store i32* %1, i32** %5, align 8
  store i8* %2, i8** %6, align 8
  %7 = load i32*, i32** %4, align 8
  %8 = load i32, i32* %7, align 4
  %9 = load i32*, i32** %5, align 8
  %10 = load i32, i32* %9, align 4
  %11 = icmp uge i32 %8, %10
  %12 = zext i1 %11 to i32
  %13 = trunc i32 %12 to i8
  %14 = load i8*, i8** %6, align 8
  store i8 %13, i8* %14, align 1
  ret void
}

define void @.greaterequal.float.float(float*, float*, i8*) {
  %4 = alloca float*, align 8
  %5 = alloca float*, align 8
  %6 = alloca i8*, align 8
  store float* %0, float** %4, align 8
  store float* %1, float** %5, align 8
  store i8* %2, i8** %6, align 8
  %7 = load float*, float** %4, align 8
  %8 = load float, float* %7, align 4
  %9 = load float*, float** %5, align 8
  %10 = load float, float* %9, align 4
  %11 = fcmp oge float %8, %10
  %12 = zext i1 %11 to i32
  %13 = trunc i32 %12 to i8
  %14 = load i8*, i8** %6, align 8
  store i8 %13, i8* %14, align 1
  ret void
}