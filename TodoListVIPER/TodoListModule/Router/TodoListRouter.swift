//
//  TodoListRouter.swift
//  TodoListVIPER
//
//  Created by Thiago Henrique Alves Ferreira on 07/02/22.
//

import UIKit

final class TodoListRouter: TodoListRouterProtocol {
    static func createTodoListModule() -> UIViewController {
        let todoListViewController = TodoListViewController()
        let presenter: TodoListPresenterProtocol & TodoListInteractorOutputProtocol = TodoListPresenter()
        let interactor: TodoListInteractorInputProtocol = TodoListInteractor()
        let router = TodoListRouter()
        
        todoListViewController.presenter = presenter
        presenter.view = todoListViewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter  = presenter
        
        let navigationController: UINavigationController = UINavigationController(rootViewController: todoListViewController)
        return navigationController
    }
    
    func presentTodoDetailScreen(from view: TodoListViewProtocol, for todo: TodoItem) {
        let todoDetailViewController = TodoDetailRouter.createTodoDetailRouterModule(with: todo)

        guard let viewController = view as? UIViewController else { fatalError("Invalid View Protocol Type") }

        viewController.navigationController?.pushViewController(todoDetailViewController, animated: true)
    }
    
    
}
