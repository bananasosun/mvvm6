import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TaskViewModel()
    @State private var newTaskTitle = ""
    @State private var selectedBackgroundColor = Color.white

    var body: some View {
        NavigationView {
            VStack {
                TextField("Введите название задачи", text: $newTaskTitle)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                ColorPicker("Выберите цвет фона", selection: $selectedBackgroundColor)
                    .padding()
                
                Button("Добавить задачу") {
                    if !newTaskTitle.isEmpty {
                        viewModel.addTask(title: newTaskTitle, backgroundColor: selectedBackgroundColor)
                        newTaskTitle = ""
                    }
                }
                .padding()
                
                List {
                    ForEach(viewModel.tasks) { task in
                        HStack {
                            Text(task.title)
                                .padding()
                            Spacer()
                        }
                        .background(task.backgroundColor)
                        .cornerRadius(8)
                    }
                    .onDelete(perform: viewModel.deleteTask)
                    .onTapGesture {
                        // Логика для редактирования задачи
                    }
                }
            }
            .navigationTitle("Управление задачами")
            .navigationBarItems(trailing: EditButton())
        }
    }
}

#Preview {
    ContentView()
}
