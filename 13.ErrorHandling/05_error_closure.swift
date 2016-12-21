/*
 * 에러 발생 클로저
 * () throws -> () 형식으로 명시해주어야 한다
 */

enum CustomError : Error {
   case MyFault
   case YourFault
}

// 예외가 발생하는 함수
func dangerousFunction() throws {
   throw CustomError.YourFault
}

//////////////////////////////
// 예외가 발생하는 함수를 파라미터 선언
//////////////////////////////
func doIt(_ arg : () throws -> () ) {
   do {
      try arg()
   }
   catch let error {
      print("클로저 실행시 발생한 에러 ", error)
   }
}

doIt(dangerousFunction)


// inline 방식
doIt { 
   throw CustomError.MyFault
}

//////////////////////////////
// 예외가 발생하는 함수를 반환 타입으로
//////////////////////////////
func doIt2() -> () throws -> () {
   return dangerousFunction
}

let fn = doIt2()
do {
   try fn()
}
catch let error {
   print("반환값으로 얻은 클로저에서 발생한 에러 ", error)
}

//
// 클로저 에러 전파
// 파라미터로 전달받은 클로저에 한에서만 사용 가능
// rethrows 키워드 명시
//

func doIt3(_ arg : () throws -> () ) rethrows {
   try arg()
}

do {
   try doIt3 {
      throw CustomError.MyFault
   }
}
catch let error {
   print("클로저에서 발생한 에러가 전파됨 : ", error)
}
