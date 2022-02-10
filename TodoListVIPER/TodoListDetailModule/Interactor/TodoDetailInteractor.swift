//
//  TodoDetailInteractor.swift
//  TodoListVIPER
//
//  Created by Thiago Henrique Alves Ferreira on 09/02/22.
//

import Foundation

final class TodoDetailInteractor: TodoDetailInteractorInputProtocol {
    var presenter: TodoDetailInteractorOutputProtocol?
    var todoItem: TodoItem?
    var todoStore: TodoStore = TodoStore.shared
    
    func deleteTodo() {
        guard let todoItem = todoItem else { return }
        todoStore.removeTodo(todoItem)
        presenter?.didDeleteTodo()
    }
    
    func editTodo(title: String, content: String) {
        guard let todoItem = todoItem else { return }
        todoItem.title = title
        todoItem.content = content
        presenter?.didEditTodo(todoItem)
    }
}
