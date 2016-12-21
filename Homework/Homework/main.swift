//
//  main.swift
//  Homework
//
//  Created by Tacademy-Mac on 2016. 12. 21..
//  Copyright © 2016년 Tacademy-Mac. All rights reserved.
//

import Foundation

let music1 = Music()
music1.play()
music1.title = "벚꽃 엔딩"
music1.artist = "버스커 버스커"
music1.play()

let music2 = Music(title: "위 아래", artist: "EXID")
music2.play()
music2.play()

if let music3 = Music("우산", "에픽하이", 10){
    music3.play()
}else{
    print("들은 횟수는 0보다 작을 수 없습니다")
}

if let music4 = Music("에라 모르겠다", "빅뱅", -3){
    music4.play()
}else{
    print("들은 횟수는 0보다 작을 수 없습니다")
}
