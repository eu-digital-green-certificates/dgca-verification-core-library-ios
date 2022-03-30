//
//  File.swift
//  
//
//  Created by Igor Khomiak on 30.03.2022.
//

#if os(iOS)
import UIKit

extension String {
    func convertBase64StringToImage () -> UIImage? {
        guard let imageData = Data.init(base64Encoded: self, options: .init(rawValue: 0)) else { return nil }
        let image = UIImage(data: imageData)
        return image
    }
}
#endif
