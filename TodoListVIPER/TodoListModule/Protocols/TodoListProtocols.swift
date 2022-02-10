//
//  TodoListProtocols.swift
//  TodoListVIPER
//
//  Created by Thiago Henrique Alves Ferreira on 07/02/22.
//

import UIKit

protocol TodoListViewProtocol: AnyObject {
    var presenter: TodoListPresenterProtocol? { get set }
    
    // MARK: Presenter -> View
    func showTodos(_ todos: [TodoItem])
    func showErrorMessage(_ message: String)
}

protocol TodoListPresenterProtocol: AnyObject {
    var view: TodoListViewProtocol? { get set }
    var interactor: TodoListInteractorInputProtocol? { get set }
    var router: TodoListRouterProtocol? { get set }
    
    // MARK: View -> Presenter
    func viewWillAppear()
    func showTodoDetail(_ todo: TodoItem)
    func addTodo(_ todo: TodoItem)
    func removeTodo(_ todo: TodoItem)
}

protocol TodoListInteractorInputProtocol: AnyObject {
    var presenter: TodoListInteractorOutputProtocol? { get set }
    
    // MARK: Presenter -> Interactor
    func retrieveTodos()
    func saveTodo(_ todo: TodoItem)
    func deleteTodo(_ todo: TodoItem)
}

protocol TodoListInteractorOutputProtocol: AnyObject {
    // MARK: Interactor -> Presenter
    func didAddTodo(_ todo: TodoItem)
    func didRemoveTodo(_ todo: TodoItem)
    func didRetrieveTodos(_ todos: [TodoItem])
    func onError(message: String)
}

protocol TodoListRouterProtocol: AnyObject {
    static func createTodoListModule() -> UIViewController
    
    // MARK: Presenter -> Router
    func presentTodoDetailScreen(from view: TodoListViewProtocol, for todo: TodoItem)
    
}

