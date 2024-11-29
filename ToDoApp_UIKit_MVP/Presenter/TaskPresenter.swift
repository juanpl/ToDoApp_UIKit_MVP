//
//  TaskPresenter.swift
//  ToDoApp_UIKit_MVP
//
//  Created by Juan Pablo Lasprilla Correa on 28/11/24.
//

import Foundation

final class TaskPresenter {
    var tasks: [Task] = []
    
    private var taskDatabase = TaskDatabase()
    
    func create(task: String) {
        guard !task.isEmpty else {
            return
        }
        
        let newTask: Task = .init(text: task, isFavorite: false)
        tasks = taskDatabase.create(task: newTask)
    }
    
    func updateFavorite(taskId: UUID){
        tasks = taskDatabase.updateFavorite(taskId: taskId)
    }
    
    func removeTask(taskId: UUID){
        tasks = taskDatabase.remove(taskId: taskId)
    }
    
    @objc
    func removeAllTask(){
        tasks = taskDatabase.removeAll()
    }
    
}
