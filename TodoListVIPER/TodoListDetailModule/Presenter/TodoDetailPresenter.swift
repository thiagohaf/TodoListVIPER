//
//  TodoDetailPresenter.swift
//  TodoListVIPER
//
//  Created by Thiago Henrique Alves Ferreira on 09/02/22.
//

import Foundation

final class TodoDetailPresenter: TodoDetailPresenterProtocol {
    var view: TodoDetailViewProtocol?
    var interactor: TodoDetailInteractorInputProtocol?
    var router: TodoDetailRouterProtocol?
    
    func viewDidLoad() {
        if let todoItem = interactor?.todoItem {
            view?.showTodo(todoItem)
        }
    }
    
    func editTodo(title: String, content: String) {
        interactor?.editTodo(title: title, content: content)
    }
    
    func deleteTodo() {
        interactor?.deleteTodo()
    }
}

extension TodoDetailPresenter: TodoDetailInteractorOutputProtocol {
    func didDeleteTodo() {
        if let view = view {
            router?.navigationBackToListViewController(from: view)
        }
    }
    
    func didEditTodo(_ todo: TodoItem) {
        view?.showTodo(todo)
    }
}
