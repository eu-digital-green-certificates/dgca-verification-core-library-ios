//
//  File.swift
//  
//
//  Created by Igor Khomiak on 30.03.2022.
//

import Foundation
#if os(iOS)
import UIKit

public extension String {
    func convertBase64StringToImage () -> UIImage? {
        guard let imageData = Data.init(base64Encoded: self, options: .init(rawValue: 0)) else { return nil }
        let image = UIImage(data: imageData)
        return image
    }
}
#endif

public extension String {
    func base64UrlToBase64() -> String {
        var str = self
            .replacingOccurrences(of: "-", with: "+")
            .replacingOccurrences(of: "_", with: "/")
        if str.count % 4 != 0 {
            str.append(String(repeating: "=", count: 4 - str.count % 4))
        }
        return str
    }
    
    func base64UrlDecoded() -> String? {
        var str = self
            .replacingOccurrences(of: "-", with: "+")
            .replacingOccurrences(of: "_", with: "/")
        if str.count % 4 != 0 {
            str.append(String(repeating: "=", count: 4 - str.count % 4))
        }
        if let data = Data(base64Encoded: str, options: .ignoreUnknownCharacters) {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }
}
