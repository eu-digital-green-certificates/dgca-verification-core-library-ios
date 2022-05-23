//
//  File.swift
//  
//
//  Created by Igor Khomiak on 23.05.2022.
//

import Foundation

public protocol UserActivityDelegate: AnyObject {
    func userDidDissmis(_ controller: AnyObject)
    func userOpensSettings(from controller: AnyObject)
}
