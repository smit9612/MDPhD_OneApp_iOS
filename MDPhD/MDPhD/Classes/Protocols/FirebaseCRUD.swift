//
//  FirebaeseCRUD.swift
//  MDPhD
//
//  Created by Smitesh Patel on 2018-09-19.
//  Copyright © 2018 Smitesh Patel. All rights reserved.
//

import Foundation
import FirebaseDatabase
import RxSwift
import RxCocoa

protocol FirebaseCRUD { }

extension FirebaseCRUD {

    /** Database root's reference. */
    var rootReference: DatabaseReference {
        return Database.database().reference()
    }

    /** Gets all elements of a given reference.
     - parameter reference: Reference from Firebase's table
     - returns: An observable containing the element's snapshot data.
     */
    func getAll(from reference: DatabaseReference) -> Single<DataSnapshot> {
        return Single.create { single in
            reference.observeSingleEvent(of: .value, with: { snapshot in
                single(.success(snapshot))
            }, withCancel: { fireBaseError in
                single(.error(fireBaseError))
            })
            return Disposables.create()
        }
    }

    /** Gets the element from a given reference that matches a specified key.
     - parameters:
     - key: the object's key.
     - reference: Reference from Firebase's table.
     - returns: An observable containing the element's snapshot data.
     */
    func get(objectWithKey key: String, from reference: DatabaseReference) -> Single<DataSnapshot> {
        return Single.create { single in
            reference.child(key).observeSingleEvent(of: .value, with: { snapshot in
                single(.success(snapshot))
            }, withCancel: { fireBaseError in
                single(.error(fireBaseError))
            })
            return Disposables.create()
        }
    }

    /** Inserts a new item on a given reference.
     - parameters:
     - data: The item's data.
     - reference: Reference from Firebase's table.
     - returns: An empty observable.
     */
    func insert(data: [String: Any], at reference: DatabaseReference) -> Completable {
        return Completable.create { completable in
            reference.setValue(data, withCompletionBlock: { error, snapshot in
                if let error = error {
                    completable(.error(error))
                } else {
                    completable(.completed)
                }
            })
            return Disposables.create {}
        }
    }

    /** Updates a item on a given reference.
     - parameters:
     - data: The item's data.
     - reference: Reference from Firebase's table.
     - returns: An empty observable.
     */
    func update(data: [String: Any], on reference: DatabaseReference) -> Completable {
        return Completable.create { completable in
            reference.updateChildValues(data, withCompletionBlock: { error, snapshot in
                if let error = error {
                    completable(.error(error))
                } else {
                    completable(.completed)
                }
            })
            return Disposables.create()
        }
    }

    /** Sets a listener on a given reference.
     - parameters:
     - reference: Reference from Firebase's table.
     - returns: An observable containing the element's snapshot data.
     */
    func listen(reference: DatabaseReference) -> Single<DataSnapshot>  {
        return Single.create { single in
            let handle = reference.observe(.value, with: { snapshot in
                single(.success(snapshot))
            })
            return Disposables.create {
                reference.removeObserver(withHandle: handle)
            }
        }
    }

    /** Deletes all data on a given reference.
     - parameters:
     - reference: Reference from Firebase's table.
     - returns: An empty observable.
     */
    func delete(reference: DatabaseReference) -> Completable {
        return Completable.create { completable in
            reference.removeValue(completionBlock: { error, snapshot in
                if let error = error {
                    completable(.error(error))
                } else {
                    completable(.completed)
                }
            })
            return Disposables.create()
        }
    }
}
