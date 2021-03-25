//
//  ContentView.swift
//  MISS Live
//
//  Created by yushi kida on 2021/03/12.
//

import SwiftUI

struct TaskListView: View {
    @ObservedObject var taskListVM = TaskListViewModel()
    
    @State var presentAddNewItem = false
    @State var showSignInForm = false
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
                List{
                    ForEach(taskListVM.taskCellViewModels) { taskCellVM in
                        if !taskCellVM.task.completed {
                            TaskCell(taskCellVM: taskCellVM)
                        }
                    }
                    if presentAddNewItem {
                        TaskCell(taskCellVM: TaskCellViewModel(task: Task(title: "", completed: false))) { task in
                            self.taskListVM.addTask(task: task)
                            self.presentAddNewItem.toggle()
                        }
                    }
                    Section(header: Text("Done")) {
                        ForEach(taskListVM.taskCellViewModels) { taskCellVM in
                            if taskCellVM.task.completed {
                                TaskCell(taskCellVM: taskCellVM)
                            }
                        }
                    }
                }
                Button(action: {self.presentAddNewItem.toggle()}) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Add New Task")
                    }
                }
                .padding()
            }
            .sheet(isPresented: $showSignInForm) {
                SignInView()
            }
            .navigationBarItems(trailing:
                                    Button(action: { self.showSignInForm.toggle()}) {
                                        Image(systemName: "person.circle")
                                    }
            )
            .navigationTitle("Tasks")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}

struct TaskCell: View {
    @ObservedObject var taskCellVM: TaskCellViewModel
    
    var onCommit: (Task) -> (Void) = { _ in }
    
    var body: some View {
        HStack{
            Image(systemName: taskCellVM.task.completed ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 20, height: 20)
                .onTapGesture {
                    self.taskCellVM.task.completed.toggle()
                }
            TextField("タスクを入力してください", text: $taskCellVM.task.title, onCommit: {
                self.onCommit(self.taskCellVM.task)
            })
        }
    }
}
