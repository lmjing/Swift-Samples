//
//  main.swift
//  Homework
//
//  Created by Tacademy-Mac on 2016. 12. 21..
//  Copyright © 2016년 Tacademy-Mac. All rights reserved.
//

import Foundation

/*
 *과제1 : 음악 생성하기
 */

print("* 과제1 : Music 생성 부분 *")

//예제1 : 파라매터 없는 init으로 객체 생성 후, title, artist에 직접 입력
let ballad1 = Music()
ballad1.play()
ballad1.title = "이 소설의 끝을 다시 써보려 해"
ballad1.artist = "한동근"
ballad1.play()

//예제2 : 파라매터 있는 init으로 객체 생성(제목, 가수 셋팅)
let ballad2 = Music(title: "광화문연가", artist: "규현")
ballad2.play()
ballad2.play()

//예제3 : 파라매터 있는 init으로 객체 생성(제목, 가수, 재생 횟수 셋팅)
let hiphop1 = Music("우산", "에픽하이", 10)!
//예제4 : 파라매터 있는 init으로 객체 생성(재생횟수 음수일 경우 문제제기)
let hiphop2 = Music("에라 모르겠다", "빅뱅", -3)
//과제2를 위한 음악 객체들 생성
let hiphop3 = Music(title: "Solo", artist: "다이나믹 듀오")
let hiphop4 = Music(title: "땡땡땡", artist: "Supereme Team")
let hiphop5 = Music(title: "죽일 놈", artist: "다이나믹 듀오")
let hiphop6 = Music(title: "고백", artist: "다이나믹 듀오")
let hiphop7 = Music()
hiphop7.title = "안될걸"
let ballad3 = Music(title: "사랑이었다", artist: "루나")
let ballad4 = Music(title: "사랑이었다", artist: "태일")



/*
 *과제2
 */

print("\n\n* 과제2 : Music 및 PlayList(앨범) 생성 부분 *")

//앨범 1 - 발라드 앨범 생성
let playlist1 = PlayList("발라드")
try playlist1.addMusic(ballad1)
try playlist1.addMusic(ballad2)
try playlist1.addMusic(ballad3)
try playlist1.addMusic(ballad4)

//발라드 앨범 전체 재생
playlist1.play()
//발라드 앨범 전체 수록곡 조회
playlist1.search()
//클로저 이용 - "사랑이었다"가 제목인 모든 음악들 검색 후 해당 음악 재생
if let result = playlist1.search(title:"사랑이었다"){
    result(0,1)
}
//클로저 이용 - "규현"이 가수인 음악삭제 ( 하나만 있을 경우 바로 삭제 )
if let result = playlist1.deleteMusic(artist:"규현"){
    result(0)
}
//삭제성공했는지 전체 조회할 것
playlist1.search()



//앨범 2 - 힙합 앨범 생성
let playlist2 = PlayList("힙합")
//잘못된 음악 정보를 가진 경우 등록 실패 => 해당 예제는 재생횟수가 마이너스인 음악
do{
    try playlist2.addMusic(hiphop2)
}catch let error{
    print("\n음악 등록 실패 : 음악 정보가 정확하지 않습니다.")
}
//잘못된 음악 정보를 가진 경우 등록 실패 => 제목만 있는 음악인 경우
try playlist2.addMusic(hiphop7)
//힙합 앨범에 음악들 등록
try playlist2.addMusic(hiphop3)
try playlist2.addMusic(hiphop4)
try playlist2.addMusic(hiphop5)
try playlist2.addMusic(hiphop6)

//클로저 이용 - "다이나믹 듀오"가 가수인 모든 음악들 검색
if let result = playlist2.search(title:"땡땡땡"){
    result(0,3)
}
//클로저 이용 - "Solo"가 제목인 모든 음악들 조회 후 원하는 트랙 삭제
if let result = playlist2.deleteMusic(artist:"다이나믹 듀오"){
    result(1)
}
//힙합앨범2 모두 재생
playlist2.play()

