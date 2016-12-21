/*
 * 타입 알리아스
 * 별칭을 설정하는 것, 클로저 함수 타입 알리아스로 정의하는 경우 주로 사용
 */

// 정수형 타입을 Century 타입으로 타입 알리아스
typealias Century = Int

var thisEra : Century
thisEra = 21


// 클로저 타입 알리아스
typealias ResultHandler = (Int) -> Void

func add(_ i : Int, _ j : Int, _ resultHandler : ResultHandler ) {
   let sum = i + j
   resultHandler(sum)
}

add(1, 2) {
   ret in
      print(ret)
}
