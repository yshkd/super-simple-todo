//
//  TaskListViewModel.swift
//  MISS Live
//
//  Created by yushi kida on 2021/03/13.
//

import Foundation
import Combine

class TaskListViewModel: ObservableObject {
    @Published var taskRepository = TaskRepository()
    @Published var taskCellViewModels = [TaskCellViewModel]()
    @Published var completedTaskCellViewModels = [TaskCellViewModel]()
    @Published var unCompletedTRaskCellViewModels = [TaskCellViewModel]()
    
    private var cancellables = Set<AnyCancellable>()
    
    
    
    init() {
        taskRepository.$tasks
            .map { tasks in
                tasks.map { task in
                    TaskCellViewModel(task: task)
                }
            }
            .assign(to: \.taskCellViewModels, on: self)
            .store(in: &cancellables)
    }
    
    func addTask(task: Task) {
        taskRepository.addTask(task)
//        let taskVM = TaskCellViewModel(task: task)
//        self.taskCellViewModels.append(taskVM)
    }
}
