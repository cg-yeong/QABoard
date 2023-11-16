//
//  QuizDB.swift
//  Data
//
//  Created by root0 on 2023/11/15.
//

import Foundation
import RealmSwift
import Combine
import OSLog

enum DBError: Error {
    case alreadyExist
    case failUpdatedObject
    case failedDeleteAll
}

struct DBHelper<T: Object> {
    private var realm: Realm {
        let container = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.com.root0.QABoard")
        let realmURL = container?.appending(pathComponent: "default.realm")
        let config = Realm.Configuration(fileURL: realmURL, schemaVersion: 1)
        return try! Realm(configuration: config)
    }
    
    init() {}
    
    func add(_ object: T) -> Future<T, Error> {
        return Future { promise in
            do {
                try realm.write {
                    realm.add(object)
                }
                promise(.success(object))
            } catch {
                promise(.failure(DBError.alreadyExist))
            }
        }
    }
    
    func update(_ object: T) -> Future<T, Error> {
        return Future { promise in
            do {
                try realm.write {
                    realm.add(object, update: .modified)
                }
                promise(.success(object))
            } catch {
                promise(.failure(DBError.failUpdatedObject))
            }
        }
    }
    
    /// DELETE ALL MY QUIZZES -> Empty DataBase
    func deleteAll() -> Future<Void, Error> {
        return Future { promise in
            do {
                try realm.write {
                    realm.deleteAll()
                }
                promise(.success(()))
            } catch {
                promise(.failure(DBError.failedDeleteAll))
            }
        }
    }
    
    /// Delete Specific Quiz(QnA...)
    func delete(_ object: T) -> Future<Bool, Error> {
        return Future { promise in
            do {
                try realm.write {
                    realm.delete(object)
                }
                promise(.success(true))
            } catch {
                promise(.failure(DBError.failUpdatedObject))
            }
        }
    }
    
    func read() -> Future<[T], Never> {
        return Future { promise in
            let objects = realm.objects(T.self)
            
            os_log(.debug, "Realm Read; Objects: %@", objects.description)
            promise(.success(Array(objects)))
        }
    }
    
    /// Query: <#T##isIncluded: ((Query<T>) -> Query<Bool>)##((Query<T>) -> Query<Bool>)##(Query<T>) -> Query<Bool>#>)
    func read(query: @escaping (Query<T>) -> Query<Bool>) -> Future<[T], Never> {
        
        return Future { promise in
            let objects = realm.objects(T.self).where(query)
            
            os_log(.debug, "Realm Read With Query; Objects: %@", objects.description)
            promise(.success(Array(objects)))
        }
    }
    
    func lastID() -> Int {
        let objects = realm.objects(T.self)
        return objects.count
    }
}
