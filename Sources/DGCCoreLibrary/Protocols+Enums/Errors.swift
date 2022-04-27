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
//  Errors.swift
//  
//
//  Created by Igor Khomiak on 25.04.2022.
//

import Foundation

public class ParseErrors {
  var errors: [ParseError] = []
}

public enum ParseError {
  case base45
  case prefix
  case zlib
  case cbor
  case json(error: String)
  case version(error: String)
}

public enum CertificateParsingError: Error {
    case unknown
    case invalidStructure
    case kidNotIncluded
    case kidNotFound(untrustedUrl: String)
    case issuerNotIncluded
    case timeBeforeNBF
    case credentialExpired
    case parsing(errors: [ParseError])
}
