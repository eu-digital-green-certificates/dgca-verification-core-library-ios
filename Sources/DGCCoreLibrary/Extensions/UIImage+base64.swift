//
//  File.swift
//  
//
//  Created by Igor Khomiak on 30.03.2022.
//

#if os(iOS)
import UIKit

public extension UIImage {
    func qrCodeString() -> String? {
        var qrAsString = ""
        guard let detector = CIDetector(ofType: CIDetectorTypeQRCode,
            context: nil, options: [CIDetectorAccuracy: CIDetectorAccuracyHigh]),
            let ciImage = CIImage(image: self),
            let features = detector.features(in: ciImage) as? [CIQRCodeFeature] else {
          return qrAsString
      }
        
      for feature in features {
          guard let indeedMessageString = feature.messageString else { continue }
          qrAsString += indeedMessageString
      }
      return qrAsString.isEmpty ? nil : qrAsString
    }
    
    func convertImageToBase64String () -> String {
        return self.jpegData(compressionQuality: 1)?.base64EncodedString() ?? ""
    }
}
#endif
