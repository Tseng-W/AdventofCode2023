//
//  Array+Extension.swift
//  
//
//  Created by 曾問 on 2023/12/4.
//

import Foundation

extension Array {
    subscript(safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
