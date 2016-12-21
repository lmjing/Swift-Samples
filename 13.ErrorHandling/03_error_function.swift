/*
 * 에러 발생 가능한 함수 ( 에러주의 api )
 * 에러가 발생할 수 있는 함수는 throws 키워드를 추가 명시
 */

enum CustomError : Error {
   case MyFault
   case YourFault
}

func inputPositive(_ val : Int) throws {
   guard val > 0 else {
      throw CustomError.YourFault
   }
   
   print("정상 수행")
}

// throws 함수 실행하기. try
try inputPositive(1)

// 에러 발생 - 비정상 종료
//try inputPositive(0)


// 위의 경우, 해당 함수 내에서 특별한 조치를 취하지 않았으므로 호출 할 때 에러처리를 해주어야 한다.
// throws 함수의 에러 처리 : do - catch ( let error ) 사용
do {
   try inputPositive(-1)
} catch let error {
   print("에러 발생. 에러 정보 얻기 : \(error)")
}


//
// 반환 타입이 있는 함수
// 기존의 방식대로 반환값 명시 이전에 선언
// return 이전에 처리한다.
//

func incresePositive(num : Int) throws -> Int {
    guard num > 0 else {
        throw CustomError.YourFault
    }
    return num + 1
}

do {
    let ret = try incresePositive(num: 1)
}
catch let error {
    print("Error 발생", error)
}

// 자세한 내용을 보려면 01번으로
let ret1 = try? incresePositive(num: 0) // 옵셔널, nil
print("try? 호출. 에러 발생 : ",ret1)


let ret2 = try? incresePositive(num: 1)
print("try? 호출. 에러 발생 안함 : ",ret2)

let ret3 = try! incresePositive(num: 1) // Non-optional Type
print("try! 호출. 에러 발생 안함 : ", ret3)

// try! 호출시 에러 -> 런타임 에러 발생
//let ret5 = try! incresePositive(num: 0)

if let ret4 = try? incresePositive(num: 0) {
    print("옵셔널 바인딩과 try.")
}
else {
    print("옵셔널 바인딩 - 에러 발생")
}
