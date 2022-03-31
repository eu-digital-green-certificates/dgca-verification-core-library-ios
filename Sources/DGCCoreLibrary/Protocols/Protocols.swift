//
//  File.swift
//  
//
//  Created by Igor Khomiak on 14.03.2022.
//

import Foundation

public protocol CertificateInspection {
    public func prepareLocallyStoredData(appType: AppType, completion: @escaping DataCompletionHandler)
    public func updateLocallyStoredData(appType: AppType, completion: @escaping DataCompletionHandler)
}
