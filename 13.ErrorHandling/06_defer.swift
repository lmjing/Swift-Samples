/*
 * Clean up. try-catch-"final"
 * 기존 finally와 비슷한 역할 -> 성공,실패 여부를 떠나 무조건 실행된다.
 * 하지만 함수내에서 throw로 처리 되기 이전에 선언해주어야 한다.
 */

enum MyError : Error {
   case error
}

func dangerousFunction(_ fire : Bool) throws {
   defer {
      print("동작 마무리")
   }
   
   if fire {
      throw MyError.error
   }
}

// 예외 발생
try? dangerousFunction(true)

// 예외 발생 안함
try? dangerousFunction(false)
