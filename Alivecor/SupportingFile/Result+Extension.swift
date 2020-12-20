//
//  Result+Extension.swift
//  Alivecor
//
//  Created by Toyaj Nigam on 20/12/20.
//

import Foundation
import RealmSwift

extension Results {

    func toArray() -> [Element] {
        return self.map{$0}
    }
}

extension RealmSwift.List {

    func toArray() -> [Element] {
        return self.map{$0}
    }
}

