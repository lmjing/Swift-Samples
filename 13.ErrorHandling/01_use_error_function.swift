//
//  에러 다루기
//

import Foundation

let str = "Hello Swift"

// 파일로 저장
let filePath = "/Users/wannabewize/Projects/Lecture/Swift-Samples/Sandbox/str.txt"
// 그냥 함수 실행시 오류 발생 : throw로 선언된 함수이기 때문에
// str.write(toFile: filePath, atomically: true, encoding: String.Encoding.utf8)

// try를 이용한 호출
// *tip : encoding에서 .입력하면 자동완성 뜨는거 활용
try str.write(toFile: filePath, atomically: true, encoding: .utf8)



// 잘못된 경로로 에러가 발생
let wrongFilePath = "/Users/wannabewize/Projects/Lecture/Swift-Samples/Sandbox/"
//에러를 다루지 않아 런타임 에러가 발생한다.
//try str.write(toFile: wrongFilePath, atomically: true, encoding: .utf8)

// 잘못된 경로로 에러가 발생 - do-catch로 에러 처리
do {
    try str.write(toFile: wrongFilePath, atomically: true, encoding: .utf8)
}
catch {
    print("에러 발생")
}

// 잘못된 경로로 에러가 발생 - do-catch로 에러 처리
do {
    try str.write(toFile: wrongFilePath, atomically: true, encoding: .utf8)
}
catch let error {
    print("에러 발생 ", error)
}


/*
 * 반환값이 있는 메소드 호출
 * 1)do - catch 문 이용하여 try로 받아오기
 * 2)try?로 바로 받되 반환값은 옵셔널 타입
 * 3)try!로 바로 받되 에러있을 경우 그대로 발생
 */
 
//오류 발생
let str2 = try String(contentsOfFile: filePath)
print(str2)


// 반환값이 있는 메소드에서 발생하는 에러 다루기
do {
    let str3 = try String(contentsOfFile: wrongFilePath)
}
catch let error {
    print("파일 읽기 에러", error)
}

// try?를 이용해서 반환값이 있는 메소드에서 발생하는 에러 다루기
// 에러 발생시 nil / 에러가 발생하지 않을 때 반환 값은 옵셔널 타입
let str4 = try? String(contentsOfFile: wrongFilePath)
if str4 == nil  {
    print("파일 읽기 에러 발생")
}

// 에러 발생 - 애플리케이션 크래쉬
// try! 이용 -> 에러가 그대로 발생, 발생되지 않으면 정상적인 객체 반환
//let str5 = try! String(contentsOfFile: wrongFilePath)
//print(str5)

