/* 
 * 에러 정의와 발생 시키기
 * Error 프로토콜이나 파운데이션 프레임워크의 NSError로 정의함
 * 에러를 발생시킬 때는 throw 사용
 */

// Enum을 이용한 여러종류의 오류 처리하기 ( Error 프로토콜 채택 )
enum CustomError : Error {
   case MyFault
   case YourFault
}

do {
   throw CustomError.MyFault
}
catch {
   print("에러 발생")
}

do {
   throw CustomError.YourFault
}
catch let error {
   print("Error :", error)
}

do {
   throw CustomError.YourFault
}
catch CustomError.MyFault {
   print("내탓")
}
catch CustomError.YourFault {
   print("남탓")
}

// 구조체로 에러 정의
struct CustomErrorStruct : Error {
   var msg : String!
}

// 클래스로 에러 정의
class CustomErrorClass : Error {
}


do {
   let error = CustomErrorStruct(msg:"Oooops!")
   throw error
}
catch let error {
   print("Error occure")
}

// 구조체나 클래스로 작성한 에러를 구분하려면 where을 이용해서 타입 검사를 작성한다.
do {
   let error = CustomErrorStruct(msg:"Oooops!")
   throw error
}
catch let error where error is CustomErrorStruct {
   print("구조체로 작성한 에러 발생")
}
catch let error where error is CustomErrorClass {
   print("클래스로 작성한 에러 발생")
}
catch let error {
   print("그외 에러 발생", error)
}


