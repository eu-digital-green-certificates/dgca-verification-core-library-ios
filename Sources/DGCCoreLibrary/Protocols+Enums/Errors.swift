//
//  File.swift
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
