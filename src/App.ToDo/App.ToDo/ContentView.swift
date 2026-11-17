import SwiftUI
import Playgrounds

struct ContentView: View {
    @State private var tasks: [Task] = []
    @State private var newTaskTitle: String = ""

    var body: some View {
        NavigationView {
            VStack {
                // Campo para adicionar nova tarefa
                HStack {
                    TextField("Nova tarefa...", text: $newTaskTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    Button(action: addTask) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                            .padding(.trailing)
                    }
                    .disabled(newTaskTitle.isEmpty)
                }

                // Lista de tarefas
                List {
                    ForEach(tasks) { task in
                        HStack {
                            Text(task.title)
                                .strikethrough(task.isCompleted, color: .black)
                            Spacer()
                            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(task.isCompleted ? .green : .gray)
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            toggleCompletion(for: task)
                        }
                    }
                    .onDelete(perform: deleteTask)
                }
            }
            .navigationTitle("Tarefas")
        }
    }

    private func addTask() {
        let newTask = Task(title: newTaskTitle)
        tasks.append(newTask)
        newTaskTitle = ""
    }

    private func toggleCompletion(for task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }

    private func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}

#Playground {
    _ = 1 + 2
}
