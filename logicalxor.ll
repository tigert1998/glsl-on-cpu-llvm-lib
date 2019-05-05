; declare void @.logicalxor.bool.bool(i8*, i8*, i8*)

define void @.logicalxor.bool.bool(i8*, i8*, i8*) {
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  store i8* %1, i8** %5, align 8
  store i8* %2, i8** %6, align 8
  %7 = load i8*, i8** %4, align 8
  %8 = load i8, i8* %7, align 1
  %9 = sext i8 %8 to i32
  %10 = icmp ne i32 %9, 0
  %11 = zext i1 %10 to i32
  %12 = load i8*, i8** %5, align 8
  %13 = load i8, i8* %12, align 1
  %14 = sext i8 %13 to i32
  %15 = icmp ne i32 %14, 0
  %16 = zext i1 %15 to i32
  %17 = xor i32 %11, %16
  %18 = trunc i32 %17 to i8
  %19 = load i8*, i8** %6, align 8
  store i8 %18, i8* %19, align 1
  ret void
}
