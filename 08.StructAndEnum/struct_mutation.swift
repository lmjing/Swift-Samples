/*
 * 구조체 - mutation
 */

struct Point {
    var x = 0
    var y = 0
    
    // 구조체는 내부에서 상태 변경 불가
    func change(x : Int) {
        // self.x = x // 에러
    }
    
    // 상태를 변경하려면 mutating을 붙여 사용해야 한다.
    mutating func moveTo(x : Int, y : Int) {
        self.x = x
        self.y = y
        print("")
    }
    
}


var p = Point()
print("객체만 생성할 경우 초기 값 -> x : \(p.x), y : \(p.y)")
p.x = 1
p.y = 2
print("외부에서 객체를 이용해 프로퍼티 값 변경 가능 -> x : \(p.x), y : \(p.y)")

p.change(x:10)
print("내부에서는 프로퍼티 값 변경 불가 -> x : \(p.x), y : \(p.y)")

p.moveTo(x:10, y: 20)
print("내부에서는 mutating 사용하여 변경 가능 -> x : \(p.x), y : \(p.y)")

