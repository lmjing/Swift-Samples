//
//  Playable.swift
//  Homework
//
//  Created by Tacademy-Mac on 2016. 12. 22..
//  Copyright © 2016년 Tacademy-Mac. All rights reserved.
//

import Foundation

protocol Playable {
    func play()
}

enum CustomError : Error {
    case M_Set_Fail
}
