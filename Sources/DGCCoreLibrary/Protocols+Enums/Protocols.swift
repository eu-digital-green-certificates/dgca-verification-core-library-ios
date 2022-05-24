/*-
 * ---license-start
 * eu-digital-green-certificates / dgca-app-core-ios
 * ---
 * Copyright (C) 2021 T-Systems International GmbH and all other contributors
 * ---
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ---license-end
 */
//
//  Protocols.swift
//  
//
//  Created by Igor Khomiak on 14.03.2022.
//

import Foundation
import SwiftyJSON

public protocol CertificateInspection {
    func validateCertificate(_ certificate: CertificationProtocol) -> ValidityState
}

public protocol DataLoadingProtocol {
    var lastUpdate: Date { get }
    var downloadedDataHasExpired: Bool { get }
    func prepareLocallyStoredData(appType: AppType, completion: @escaping DataCompletionHandler)
    func updateLocallyStoredData(appType: AppType, completion: @escaping DataCompletionHandler)
}

public protocol CertificationProtocol {
    var dateOfBirth: String { get }
    
    var firstName: String { get }
    
    var firstNameStandardized: String { get }
    
    var lastName: String { get }
    
    var lastNameStandardized: String { get }

    var fullName: String { get }
    
    var cryptographicallyValid: Bool { get }
    
    var isRevoked: Bool { get set }
    var isUntrusted: Bool { get }
    
    var certTypeString: String { get }
        
    var certHash: String { get }
    
    var body: JSON { get }
    
    var uvciHash: Data? { get }
    var countryCodeUvciHash: Data? { get }
    var signatureHash: Data? { get }

    var certificateCreationDate: String { get }
    
    init(payload: String, ruleCountryCode: String?) throws
}
