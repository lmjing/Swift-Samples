/*
 * 열거형(Enumeration)
 * 계산 프로퍼티와 메소드 선언이 가능 ( 저장 프로퍼티 불가 )
 */

//enum과 case를 이용해 작성
enum Day {
    case AM
    case PM
}

var now : Day
now = Day.AM

switch now {
case .AM:
    print("오전")
case .PM:
    print("오후")
    /* Day의 case를 벗어나는 값은 에러 발생
     case .Morning:
     print("에러")
     */
}

// RawValue
// 타입을 명시하지 않을 경우 자동으로 초기화되지 않는다.
// 아래와 같이 Int 타입은 따로 초기화 하지않아도 0부터 자동 초기화 되어진다.
enum Pet : Int {
    case Cat
    // 직접 초기화 할 경우 해당 수부터 1 값씩 자동으로 증가한다.
    case Dog = 2
    case Rabbit
    case Other
}

// rawValue에서 enum얻기
var ael = Pet(rawValue: 3)!
print(ael)

// enum에서 rawValue 얻기
var raz = Pet.Cat
print("Pet.cat : rawValue : ", raz.rawValue) // 0
