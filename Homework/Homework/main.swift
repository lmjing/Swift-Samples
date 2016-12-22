//
//  main.swift
//  Homework
//
//  Created by Tacademy-Mac on 2016. 12. 21..
//  Copyright © 2016년 Tacademy-Mac. All rights reserved.
//

import Foundation

//과제1
print("* 과제1 : Music 생성 부분 *")
let music1 = Music()
music1.play()
music1.title = "이 소설의 끝을 다시 써보려 해"
music1.artist = "한동근"
music1.play()

let music2 = Music(title: "광화문연가", artist: "규현")
music2.play()
music2.play()

let music3 = Music("우산", "에픽하이", 10)!
let music4 = Music("에라 모르겠다", "빅뱅", -3)
let music5 = Music(title: "Solo", artist: "다이나믹 듀오")
let music6 = Music(title: "땡땡땡", artist: "Supereme Team")

//과제2
print("\n\n* 과제2 : Music 및 PlayList(앨범) 생성 부분 *")

//앨범 1개 생성
let playlist1 = PlayList("발라드")
try playlist1.addMusic(music1)
try playlist1.addMusic(music2)
playlist1.play()
/*클로저 사용해보기*/
if let result = playlist1.search("광화문연가"){
    print("\(result.title) - \(result.artist)")
}else{
    
}
if playlist1.deleteMusic("광화문연가") == true{
    print("광화문연가가 성공적으로 삭제되었습니다.")
}else{
    print("\n음악 삭제 실패 : 앨범에 추가된 음악이 없습니다. 음악을 추가해주세요.")
}
try playlist1.addMusic(music2)
playlist1.play()

//앨범 2개 생성
let playlist2 = PlayList("힙합")
try playlist2.addMusic(music3)
do{
    try playlist2.addMusic(music4)
}catch let error{
    print("\n음악 등록 실패 : 음악 정보가 정확하지 않습니다.")
}
try playlist2.addMusic(music5)
try playlist2.addMusic(music6)


let music9 = Music()
music9.title = "안될걸"
try playlist2.addMusic(music9)

if let result = playlist2.search("땡땡땡"){
    print("\(result.title) - \(result.artist)")
}else{
    
}
if playlist2.deleteMusic("우산") == true{
    print("광화문연가가 성공적으로 삭제되었습니다.")
}else{
    print("\n음악 삭제 실패 : 앨범에 추가된 음악이 없습니다. 음악을 추가해주세요.")
}

playlist2.play()
