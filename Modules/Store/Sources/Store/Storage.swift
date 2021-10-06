//
//  Storage.swift
//  DinnerTime
//
//  Created by Ben Scheirman on 6/5/21.
//

import Foundation

public struct Storage<T> {
    var load: () throws -> T?
    var save: (_ object: T) throws -> Void
    var removeAllData: () throws -> Void
}

public extension Storage {
    static var inMemory: Self {
        var cached: T?
        return .init(
            load: { cached },
            save: { cached = $0 },
            removeAllData: { cached = nil }
        )
    }
}

public extension Storage where T: Codable {
    static func filename(_ filename: String) -> Self {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        
        let storageURL = storageURL(filename: filename)
        
        return .init(
            load: {
                guard FileManager.default.fileExists(atPath: storageURL.path) else { return nil }
                let data = try Data(contentsOf: storageURL)
                return try decoder.decode(T.self, from: data)
            },
            save: { object in
                try ensureDirectoryExists(storageURL: storageURL)
                let data = try encoder.encode(object)
                try data.write(to: storageURL)
            },
            removeAllData: {
                try FileManager.default.removeItem(at: storageURL)
            })
    }
    
    private static func storageURL(filename: String) -> URL {
        let appSupport = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first!
        return URL(fileURLWithPath: appSupport).appendingPathComponent(filename)
    }
    
    private static func ensureDirectoryExists(storageURL: URL) throws {
        // ensure directory exists
        let dir = storageURL.deletingLastPathComponent()
        
        if !FileManager.default.fileExists(atPath: dir.path) {
            try FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true, attributes: nil)
        }
    }
}
