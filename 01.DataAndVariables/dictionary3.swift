/*
 * 딕셔너리 타입
 * swift3
 */

// 타입 선언 생략
var dic = ["1월":"January", "2월":"February", "3월":"March"]
// Dictionary 객체 생성
var dic2 : Dictionary<Int, String> = [1 : "One", 2 : "Two", 3 : "Three"]
// Shorthand
var dic3 : [String: Int] = ["일" : 1, "이" : 2, "삼" : 3]
// 빈 Dictionary 객체
var emptyDic = [Int: Int]()

print("dic : ", dic)
print("dic2 : ", dic2)
print("dic3 : ", dic3)

print("dic.count : ", dic.count)
print("emptyDic.count : ", emptyDic.count)

// 딕셔너리 항목 접근. 배열처럼 보일 수도 있다.
print("dic[1월] : ", dic["1월"]) // "January"
print("dic2[1] : ", dic2[1]) // "One"
// 없는 키에 접근
print("dic[사] : ", dic3["사"]) // nil


dic["4월"] = "april"
dic["5월"] = "May"

dic["4월"] = "잔인한 달"
dic.updateValue("계절의 여왕", forKey: "5월")

print("dic : ", dic)

dic.removeValue(forKey:"2월")
dic["3월"] = nil
print("dic[3월] = nil : ", dic)
