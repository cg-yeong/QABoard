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
