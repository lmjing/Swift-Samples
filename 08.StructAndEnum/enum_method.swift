/*
 * Enum에 프로퍼티와 메소드 작성
 */

enum Pet : Int {
   case Cat = 0
   case Dog
   case Other
   
    // 계산 프로퍼티만 사용 가능 ( get만 가능 set은 불가능 )
   var name : String {
      switch self {
      case .Cat:
         return "고양이"
      case .Dog:
         return "강아지"
      default:
         return "기타"
      }
   }
   
    //메소드 작성 가능
   func description() -> String {
      return self.name
   }
}

// 프로퍼티와 메소드 사용

// 객체를 호출하는 방식이 아니라 특정 값을 가져오는 형식으로 사용하나봄
var raz = Pet.Cat
print(raz.name)
print(raz.description())
