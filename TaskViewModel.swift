import SwiftUI

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    
    func addTask(title: String, backgroundColor: Color) {
        let newTask = Task(title: title, backgroundColor: backgroundColor)
        tasks.append(newTask)
    }
    
    func updateTask(task: Task, newTitle: String, newBackgroundColor: Color) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].title = newTitle
            tasks[index].backgroundColor = newBackgroundColor
        }
    }
    
    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}
