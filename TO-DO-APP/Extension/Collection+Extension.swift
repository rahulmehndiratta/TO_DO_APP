//
//  Collection+Extension.swift
//  TO-DO-APP
//
//  Created by Rahul on 01/06/23.
//

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
