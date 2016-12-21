//
//  PlayList.swift
//  Homework
//
//  Created by Tacademy-Mac on 2016. 12. 21..
//  Copyright © 2016년 Tacademy-Mac. All rights reserved.
//

import Foundation

class PlayList{
    
    var album_title : String?
    var playlist : [Music]?
    
    func addMusic(_ music : Music){
        playlist?.append(music)
    }
    
    /* title에 국한되지 말고 가수까지 검색할 수 있도록 하고 결과 값 여러개 도출되도록 구현 할 것 */
    //playlist.deleteMusic(“위 아래”)
    func deleteMusic(_ title : String) -> Bool {
        if let pl = playlist{
            for music in pl {
                if music.title == title{
                    self.playlist
                }
            }
        }else{
            print("앨범에 추가된 음악이 없습니다. 음악을 추가해주세요.")
        }
        
        return nil

    }
    
    //let music = playlist.search("위 아래”)
    func search(_ title : String ) -> Music? {
        if let pl = playlist{
            for music in pl {
                if music.title == title{
                    return music
                }
            }
        }else{
            print("앨범에 추가된 음악이 없습니다. 음악을 추가해주세요.")
        }
        
        return nil
    }
    
    func play() {
        if let pl = playlist{
            print("~~앨범 전 수록곡 재생중~~")
            for music in pl {
                music.play()
            }
        }else{
            print("앨범에 추가된 음악이 없습니다. 음악을 추가해주세요.")
        }
    }
    
    init(){
        
    }
}
