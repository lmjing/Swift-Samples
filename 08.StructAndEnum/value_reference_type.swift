/*
 * 클래스(레퍼런스 타입)과 구조체(밸류 타입) 비교
 */

//클래스(레퍼런스 타입)은 대입하여도 같은 객체를 참조하는 포인터가 하나 더 생기는 것이기 때문에 한쪽 값을 변경해도 다른 쪽의 값도 변경된다.
class MyClass {
   var value = 0
}

var obj1 = MyClass()
var obj2 = obj1

obj1.value = 10
print(obj2.value)     // 10

//구조체,배열 등(밸류 타입)은 복사가 되어 서로 다른 객체에 영향을 주지 않게 된다.
struct MyStruct {
   var value = 0
}

var obj3 = MyStruct()
var obj4 = obj3	// 객체 복사

obj3.value = 10
print(obj4.value)	    // 0


var array1 = [1, 2, 3]
var array2 = array1	// 복사

// 하나의 배열의 값 변경
array1.append(4)

print(array1)  	// [1,2,3,4]
print(array2)  	// [1,2,3]

