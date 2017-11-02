//
//  UILable+Animation.swift
//  CodingStandard
//
//  Created by Amit Pawar
//  Copyright © 2017 Amit Pawar. All rights reserved.
//

import Foundation
import UIKit
import EFCountingLabel

extension EFCountingLabel {
    
    func loadLable(value : Int, suffix : String){
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatBlock = {
            (value) in
            return "" + (formatter.string(from: NSNumber(value: Int(value))) ?? "")+suffix
        }
        method = .easeOut
        countFrom(0, to: CGFloat(value), withDuration: 1)
    }
}
