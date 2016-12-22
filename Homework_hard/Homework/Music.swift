//
//  Music.swift
//  Homework
//
//  Created by Tacademy-Mac on 2016. 12. 21..
//  Copyright © 2016년 Tacademy-Mac. All rights reserved.
//

import Foundation

class Music : Playable{
    var title : String?
    var artist : String?
    var count : Int
    var track : Int?
    
    func play(){
        //콘솔에 제목과 가수 출력, 재생 회수 증가
        if let t = title, let a = artist{
            count += 1
            print("🎧재생중 : \(t) - \(a) \t(재생횟수 : \(count))")
        }else{
            print("\n음악 재생 실패 : 음악 제목과 가수를 입력해주세요")
        }
    }
    
    init() {
        self.count = 0
    }
    
    convenience init(title: String, artist: String){
        self.init()
        self.title = title
        self.artist = artist
    }
    
    convenience init?(_ t: String, _ a: String, _ c: Int){
        self.init(title : t, artist : a)
        
        if c < 0{
            print("\n음악 설정 실패 : 들은 횟수는 0보다 작을 수 없습니다")
            return nil
        }
        self.count = c
    }
}
