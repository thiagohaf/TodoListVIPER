//
//  TodoDetailRouter.swift
//  TodoListVIPER
//
//  Created by Thiago Henrique Alves Ferreira on 09/02/22.
//

import UIKit

final class TodoDetailRouter: TodoDetailRouterProtocol {
    static func createTodoDetailRouterModule(with todo: TodoItem) -> UIViewController {
        let viewController = TodoDetailViewController()
        
        let presenter: TodoDetailPresenter & TodoDetailInteractorOutputProtocol = TodoDetailPresenter()
        viewController.presenter = presenter
        presenter.view = viewController
        
        let interactor: TodoDetailInteractorInputProtocol = TodoDetailInteractor()
        interactor.todoItem = todo
        interactor.presenter = presenter
        presenter.interactor = interactor
        let router: TodoDetailRouterProtocol = TodoDetailRouter()
        presenter.router = router
        
        return viewController
    }
    
    func navigationBackToListViewController(from view: TodoDetailViewProtocol) {
        guard let viewController = view as? UIViewController else { fatalError("Invalid view protocol type") }
        viewController.navigationController?.popViewController(animated: true)
    }
    
    
}
