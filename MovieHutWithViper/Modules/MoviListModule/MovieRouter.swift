//
//  MovieRouter.swift
//  MovieHutWithViper
//
//  Created by Faizul Karim on 20/3/22.
//

import Foundation
import UIKit

class MovieRouter : PresenterToRouterProtocol{
    static func createModule() -> UIViewController {
        
        let view = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MovieList") as! MovieListViewController
        let presenter : ViewToPresenterProtocol & InteractorToPresenterProtocol = MoviePresenter()
        let interactor : PresenterToInteractorProtocol = MovieInteractor()
        let router : PresenterToRouterProtocol = MovieRouter()
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func pushToMovieDetails(navigationController: UINavigationController) {
        let movieDetailsModule =  MovieRouter.createModule()
        navigationController.pushViewController(movieDetailsModule, animated: true)
    }
    
    
}

