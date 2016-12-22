//
//  PlayList.swift
//  Homework
//
//  Created by Tacademy-Mac on 2016. 12. 21..
//  Copyright © 2016년 Tacademy-Mac. All rights reserved.
//

import Foundation

class PlayList : Playable{
    
    var title : String
    var playlist : [Music] = []
    
    
    init(_ title : String){
        self.title = title
        print("\n'\(self.title)'앨범을 생성하였습니다")
    }
    
    func addMusic(_ music : Music?) throws {
         if let check = music {
            if let m_title = check.title, let m_artist = check.artist{
                    playlist.append(check)
                    print("\n'\(self.title)'앨범에 '\(m_title) - \(m_artist)'(이)가 추가되었습니다")
            }else{
                    print("\n음악 등록 실패 : 음악 정보가 정확하지 않습니다.")
            }
            return
         }
         throw CustomError.M_Set_Fail

    }
    
    /* title에 국한되지 말고 가수까지 검색할 수 있도록 하고 결과 값 여러개 도출되도록 구현 할 것 */
    
    func deleteMusic(_ title : String) -> Bool {
        if let i = findMusicIndex(title: title){
            playlist[i].count = 0
            playlist.remove(at: i)
            return true
        }else{
            return false
        }
    }
    
    func search(_ title : String ) -> Music? {
        print("\n<'\(self.title)'앨범 내 '\(title)' 검색 결과 >")
        if let i = findMusicIndex(title: title){
            return playlist[i]
        }else{
            return nil
        }
    }
    
    func findMusicIndex(title : String) -> Int?{
        for index in 0..<playlist.count {
            if playlist[index].title == title{
                return index
            }
        }
        return nil
    }
    
    func play() {
        print("\n--'\(title)'앨범 모든 수록곡 재생중--")
        for music in playlist {
            music.play()
        }
    }
}
