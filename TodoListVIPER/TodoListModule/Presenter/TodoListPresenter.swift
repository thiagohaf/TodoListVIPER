//
//  TodoListPresenter.swift
//  TodoListVIPER
//
//  Created by Thiago Henrique Alves Ferreira on 07/02/22.
//

import UIKit

final class TodoListPresenter: TodoListPresenterProtocol {
    weak var view: TodoListViewProtocol?
    var interactor: TodoListInteractorInputProtocol?
    var router: TodoListRouterProtocol?
    
    func viewWillAppear() {
        interactor?.retrieveTodos()
    }
    
    func showTodoDetail(_ todo: TodoItem) {
        guard let view = view else { return }
        router?.presentTodoDetailScreen(from: view, for: todo)
    }
    
    func addTodo(_ todo: TodoItem) {
        interactor?.saveTodo(todo)
    }
    
    func removeTodo(_ todo: TodoItem) {
        interactor?.deleteTodo(todo)
    }
}


extension TodoListPresenter: TodoListInteractorOutputProtocol {
    func didAddTodo(_ todo: TodoItem) {
        interactor?.retrieveTodos()
    }
    
    func didRemoveTodo(_ todo: TodoItem) {
        interactor?.retrieveTodos()
    }
    
    func didRetrieveTodos(_ todos: [TodoItem]) {
        view?.showTodos(todos)
    }
    
    func onError(message: String) {
        view?.showErrorMessage(message)
    }
    
    
}
