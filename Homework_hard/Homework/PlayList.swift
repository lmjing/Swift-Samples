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
    
    func deleteMusic(_ title : String) -> ((_ want_d : Int) -> ())? {
        let indexs = findMusicIndex(title: title)
        switch indexs.count {
        case 0:
            print("\n음악 삭제 실패 : 앨범에 음악이 없습니다. 음악을 추가해주세요.")
            return nil
        case 1:
            delete(indexs[0])
            return nil
        case 2..<playlist.count:
            print("\n아래의 목록 중 삭제를 원하는 트랙 번호를 입력해주세요")
            return delete
        default:
            return nil
        }
        /* original
        if let i = findMusicIndex(title: title){
            playlist[i].count = 0
            playlist.remove(at: i)
            return true
        }else{
            return false
        }
 */
    }
    
    func delete(_ index : Int){
        let value : Music? = playlist[index]
        if let music = value{
            print("\n'\(music.title) - \(music.artist)'를 삭제하였습니다.")
            playlist[index].count = 0
            playlist.remove(at: index)
        }else{
            print("\n음악 삭제 실패 : 트랙번호를 잘못 입력하셨습니다.")
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
    
    func findMusicIndex(title : String) -> [Int]{
        var result : [Int] = []
        for index in 0..<playlist.count {
            if playlist[index].title == title{
                result.append(index)
            }
        }
        return result
    }
    
    func play() {
        print("\n--'\(title)'앨범 모든 수록곡 재생중--")
        for music in playlist {
            music.play()
        }
    }
}
