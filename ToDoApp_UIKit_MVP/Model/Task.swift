//
//  Task.swift
//  ToDoApp_UIKit_MVP
//
//  Created by Juan Pablo Lasprilla Correa on 27/11/24.
//

import Foundation

struct Task {
    let id: UUID = UUID()
    let text: String
    var isFavorite: Bool
}
