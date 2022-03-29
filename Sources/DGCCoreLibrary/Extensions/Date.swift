//
//  File.swift
//  
//
//  Created by Igor Khomiak on 15.12.2021.
//

import Foundation

extension Date {
    static func formatter(for locale: String, utcPosix: Bool = true, utc: Bool = false) -> DateFormatter {
        let dateTimeFormatter = DateFormatter()
        dateTimeFormatter.dateFormat = locale
        dateTimeFormatter.timeZone = TimeZone.current
        dateTimeFormatter.locale = Locale.current
        
        if utcPosix || utc {
            dateTimeFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        }
        
        if utcPosix {
            dateTimeFormatter.locale = Locale(identifier: "en_US_POSIX")
        }
        
        return dateTimeFormatter
    }
      
    static let isoFormatter = formatter(for: "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
    static let dateFormatter = formatter(for: "yyyy-MM-dd")
    static let dateFormatterYM = formatter(for: "yyyy-MM")
    static let dateFormatterY = formatter(for: "yyyy")
    static let dateFormatterFull = formatter(for: "yyyy-MM-dd'T'HH:mm:ss")
    static let dateTimeFormatter = formatter(for: "yyyy-MM-dd HH:mm", utcPosix: false)
    static let dateFormatterOffset = formatter(for: "yyyy-MM-dd'T'HH:mm:ssZZZZZ")
    static let dateFormatterFractional = formatter(for: "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX")

    public var isoString: String {
        Date.isoFormatter.string(from: self)
    }
    
    public var dateString: String {
      Date.dateFormatter.string(from: self)
    }
    
    public var dateTimeString: String {
      Date.dateTimeFormatter.string(from: self)
    }

    public init?(isoString: String) {
      guard let date = Date.isoFormatter.date(from: isoString) else {
        return nil
      }
      self = date
    }
    
    public init?(dateString: String) {
      if let date = Date.dateFormatter.date(from: dateString) {
        self = date
      } else if let date = Date.dateFormatterYM.date(from: dateString) {
        self = date
      } else if let date = Date.dateFormatterY.date(from: dateString) {
        self = date
      } else if let date = Date.dateFormatterFull.date(from: dateString) {
        self = date
      } else if let date = Date.dateFormatterOffset.date(from: dateString) {
        self = date
      } else if let date = Date.dateFormatterFractional.date(from: dateString) {
          self = date
      } else {
        return nil
      }
    }
    
    public init?(rfc3339DateTimeString str: String) {
      var str = str
      let rfc3339DateTimeFormatter = DateFormatter()

      if (try? NSRegularExpression(
        pattern: "\\.[0-9]{6}Z?$", options: []
      ).matches(
        in: str, options: [], range: NSRange(
          str.startIndex..<str.endIndex,
          in: str
        )
      ))?.isEmpty == false {
        str = str.trimmingCharacters(in: ["Z"])
        str = String(str.prefix(str.count - 3)) + "Z"
      }

      for fmt in [
        "yyyy-MM-dd'T'HH:mm:ssZZZZZ", "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ",
        "yyyy-MM-dd't'HH:mm:ss'z'", "yyyy-MM-dd't'HH:mm:ss.SSS'z'"
      ] {
        rfc3339DateTimeFormatter.dateFormat = fmt
        if let date = rfc3339DateTimeFormatter.date(from: str) {
          self = date
          return
        }
      }
      return nil
    }

    public var localDateString: String {
      let formatter = DateFormatter()
      formatter.locale = .current
      formatter.timeStyle = .none
      formatter.dateStyle = .medium
      return formatter.string(from: self)
    }
    
    public var dateTimeStringUtc: String {
      let formatter = DateFormatter()
      formatter.locale = .current
      formatter.timeStyle = .medium
      formatter.dateStyle = .medium
      formatter.timeZone = .init(secondsFromGMT: 0)
      return formatter.string(from: self) + " (UTC)"
    }

}
