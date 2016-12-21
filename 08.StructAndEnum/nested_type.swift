/*
 * 타입 내장 - 중첩 사용 가능
 */

struct Rectangle {
   struct Point {
      var x, y : Int
   }
   
   struct Size {
      var width, height : Int
   }
   
   var origin : Point
   var size : Size
   
   init(origin : Point, size : Size) {
      self.origin = origin
      self.size = size
   }
}

// '.'을 이용해 접근, 타입 내부 값을 먼저 생성한 후 Rectangle 생성
let point = Rectangle.Point(x: 10, y: 10)
print("Rectangle.Point : ", point)

let size = Rectangle.Size(width: 100, height: 100)
print("Rectangle.Size : ", size)

let obj = Rectangle(origin: point, size: size)
