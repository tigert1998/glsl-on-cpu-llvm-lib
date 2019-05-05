; declare void @.logicalnot.bool(i8*, i8*)

define void @.logicalnot.bool(i8*, i8*) {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  store i8* %1, i8** %4, align 8
  %5 = load i8*, i8** %3, align 8
  %6 = load i8, i8* %5, align 1
  %7 = icmp ne i8 %6, 0
  %8 = xor i1 %7, true
  %9 = zext i1 %8 to i32
  %10 = trunc i32 %9 to i8
  %11 = load i8*, i8** %4, align 8
  store i8 %10, i8* %11, align 1
  ret void
}
