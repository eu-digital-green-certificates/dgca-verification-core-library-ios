//
//  File.swift
//  
//
//  Created by Igor Khomiak on 23.05.2022.
//

import Foundation

public protocol DismissControllerDelegate: AnyObject {
    func userDidDissmis(_ controller: AnyObject)
}

public protocol ShowSettingsDelegate: AnyObject {
    func userOpensSettings(from controller: AnyObject)
}
