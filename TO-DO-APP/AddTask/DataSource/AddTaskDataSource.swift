//
//  AddTaskDataSource.swift
//  TO-DO-APP
//
//  Created by Rahul on 31/05/23.
//
import Foundation

protocol AddTaskDataSource: AnyObject {
    var selectedTaskDate: Date { get set }
}
