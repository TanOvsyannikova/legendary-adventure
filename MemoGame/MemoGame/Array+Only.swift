//
//  Array+Only.swift
//  MemoGame
//
//  Created by Татьяна Овсянникова on 05.03.2021.
//

import Foundation

extension Array {
    var only : Element? {
        count == 1 ? first : nil
    }
    
}
