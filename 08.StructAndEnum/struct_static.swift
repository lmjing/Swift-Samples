/*
 * 구조체 - 정적 메소드와 프로퍼티
 * 객체를 생성하지 않고 사용하는 메소드 및 프로퍼티 작성시
 * static을 붙여준다.
 */

struct MyStruct {
   // 정적 메소드 정의
   static func staticFunc() {
      print("정적 메소드")
   }
   
   // 정적 프로퍼티
   static var staticProperty : Int!
}

// 정적 메소드 실행
MyStruct.staticFunc()
// 정적 프로퍼티 접근
MyStruct.staticProperty = 10
