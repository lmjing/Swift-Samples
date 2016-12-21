/*
 * 에러 전파
 * 함수 내부에서 발생한 에러를 다루지 않고 전파한다.
 */

enum CustomError : Error {
   case MyFault
   case YourFault
}

func dangerousFunction() throws {
   throw CustomError.YourFault
}

// 예외 전파 안하기 - 함수 내부에서 do-catch로 예외 처리
func doIt() {
   do {
      try dangerousFunction()
   }
   catch let error {
      print("예외 전파 안하고 함수 내부에서 처리", error)
   }
}
doIt()


// 함수 내 발생한 에러 전파하기 - 함수 내부에서 그냥 try만 실행
func doIt2() throws {
   try dangerousFunction()
}

// 여기서 doIt2를 실행하였으므로 예외 처리를 따로 해주어야 함
do {
   try doIt2()
}
catch let error {
   print("함수에서 발생한 에러 전파",error)
}
