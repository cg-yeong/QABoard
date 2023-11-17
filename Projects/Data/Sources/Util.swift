//
//  Util.swift
//  Data
//
//  Created by root0 on 2023/11/16.
//

import Foundation

extension URL {
    public func appending<S>(pathComponent: S) -> URL where S: StringProtocol {
        if #available(iOS 16.0, *) {
            return self.appending(path: pathComponent, directoryHint: .inferFromPath)
        } else {
            return self.appendingPathComponent("\(pathComponent)")
        }
    }
}

extension String {
    func toDate() -> Date? {
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd"
        format.timeZone = .autoupdatingCurrent
        return format.date(from: self)
    }
}

extension Date {
    func toLocalize() -> Date {
        let timezone = TimeZone.autoupdatingCurrent
        let secondsFromGMT = timezone.secondsFromGMT(for: self)
        let localizedDate = self.addingTimeInterval(TimeInterval(secondsFromGMT))
        
        return localizedDate
    }
    
    func toString() -> String {
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd"
        format.timeZone = .autoupdatingCurrent
        return format.string(from: self)
    }
}
