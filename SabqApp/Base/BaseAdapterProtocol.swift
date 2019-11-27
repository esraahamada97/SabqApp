//
//  BaseAdapterProtocol.swift
//  sab2
//
//  Created by user on 10/21/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import Foundation

protocol BaseAdapterProtocal: class {
    associatedtype DataType
    //    associatedtype AdapterDelegate where AdapterDelegate:listAdapterDelegate
    var list: [DataType]? { get set }
    
    //    var delegate:AdapterDelegate? { get set }
    
    var reloadData:(() -> Void)? { get set }
    
    var showEmptyState: ((Bool) -> Void)? { get set }
    
    func add(item: DataType)
    func add(items: [DataType])
    func update(item: DataType)
    func count() -> Int
    func isLastIndex(index: IndexPath) -> Bool
    func clear(reload: Bool)
}
