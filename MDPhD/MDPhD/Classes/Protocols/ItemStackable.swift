//
//  ItemStackable.swift
//  MDPhD
//
//  Created by Smitesh Patel on 2018-08-09.
//  Copyright © 2018 Smitesh Patel. All rights reserved.
//

import Foundation

protocol ItemStackable {

    associatedtype StackableItem

    var stackableItems: [StackableItem]! { get }
}
