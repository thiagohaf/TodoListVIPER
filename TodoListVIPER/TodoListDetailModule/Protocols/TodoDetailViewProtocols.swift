//
//  TodoDetailViewProtocols.swift
//  TodoListVIPER
//
//  Created by Thiago Henrique Alves Ferreira on 07/02/22.
//

import Foundation
import UIKit

protocol TodoDetailViewProtocol: AnyObject {
    var presenter: TodoDetailPresenterProtocol? { get set }
    
    // MARK: Presenter -> View
    func showTodo(_ todo: TodoItem)
}

protocol TodoDetailPresenterProtocol: AnyObject {
    var view: TodoDetailViewProtocol? { get set }
    var interactor: TodoDetailInteractorInputProtocol? { get set }
    var router: TodoDetailRouterProtocol? { get set }
    
    // MARK: View -> Presenter
    func viewDidLoad()
    func editTodo(title: String, content: String)
    func deleteTodo()
}

protocol TodoDetailInteractorInputProtocol: AnyObject {
    var presenter: TodoDetailInteractorOutputProtocol? { get set }
    var todoItem: TodoItem? { get set }
    
    // MARK: Presenter -> Interactor
    func deleteTodo()
    func editTodo(title: String, content: String)
}

protocol TodoDetailInteractorOutputProtocol: AnyObject {
    // MARK: Interactor -> Presenter
    func didDeleteTodo()
    func didEditTodo(_ todo: TodoItem)
}

protocol TodoDetailRouterProtocol: AnyObject {
    static func createTodoDetailRouterModule(with todo: TodoItem) -> UIViewController
    
    // MARK: Presenter -> Router
    func navigationBackToListViewController(from view: TodoDetailViewProtocol)
}
