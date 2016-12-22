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
    
    func getMusicInfo(_ music : Music) -> String?{
        if let m_title = music.title, let m_artist = music.artist{
            return "\(m_title) - \(m_artist)"
        }else{
            return nil
        }
    }
    
    func addMusic(_ music : Music?) throws {
         if let check = music {
            if let info = getMusicInfo(check){
                playlist.append(check)
                playlist[playlist.count-1].track = playlist.count-1
                print("\n'\(self.title)'앨범에 '\(info)'(이)가 추가되었습니다")
            }else{
                print("\n음악 등록 실패 : 음악 정보가 정확하지 않습니다.")
            }
            return
         }
         throw CustomError.M_Set_Fail

    }
    
    /* title에 국한되지 말고 가수까지 검색할 수 있도록 하고 결과 값 여러개 도출되도록 구현 할 것 */
    
    func deleteMusic(_ title : String) -> ((Int) -> ())? {
        let indexs = findMusicIndex(title: title)
        switch indexs.count {
        case 0:
            print("\n음악 삭제 실패 : 해당하는 음악이 앨범에 존재하지 않습니다.")
            return nil
        case 1:
            delete(indexs[0])
            return nil
        case 2..<playlist.count:
            print("\n아래의 목록 중 삭제를 원하는 트랙 번호를 입력해주세요")
            for i in indexs{
                if let info = getMusicInfo(playlist[i]){
                    print("\(i)번 트랙 : \(info)")
                }
            }
            return delete
        default:
            return nil
        }
    }
    
    func delete(_ index : Int){
        if let info = getMusicInfo(playlist[index]){
            print("\n'\(info)'를 삭제하였습니다.")
            playlist[index].count = 0
            playlist.remove(at: index)
        }else{
            print("\n음악 등록 실패 : 음악 정보가 정확하지 않습니다.")
        }
    }
    
    func search(){
        print("\n----------------<\(self.title) 앨범 수록곡 목록>--------------------")
        for i in 0..<playlist.count{
            if let info = getMusicInfo(playlist[i]){
                print("\(i)번 트랙 : \(info)")
            }
        }
        print("------------------------------------------------------")
    }

    func search(_ title : String ) -> ((Int, Int) -> ())? {
        let indexs = findMusicIndex(title: title)
        switch indexs.count {
            case 0:
                print("\n음악 검색 실패 : 해당하는 음악이 앨범에 존재하지 않습니다.")
                return nil
            case 1..<playlist.count:
                print("\n-------------------------<검색 결과>-------------------------")
                print("아래의 목록중 원하는 트랙의 번호와 작업 번호를 입력하세요")
                print("작업 번호 - 1 : 해당 음악 재생, 2 : 해당 음악 삭제, 3 : 추가 작업 없음")
                print("-----------------------------------------------------------")
                for i in indexs{
                    if let info = getMusicInfo(playlist[i]){
                        print("\(i)번 트랙 : \(info)")
                    }
                }
                print("-----------------------------------------------------------")
                return nextWork
            default:
                return nil
        }
    }
    
    func nextWork(_ track : Int, _ work : Int) {
        switch work {
        case 1:
            play(track)
        case 2:
            delete(track)
        case 3:
            return
        default:
            return
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
    
    func play(_ track : Int) {
        playlist[track].play()
    }

}
