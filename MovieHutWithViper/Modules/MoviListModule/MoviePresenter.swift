//
//  MoviePresenter.swift
//  MovieHutWithViper
//
//  Created by Faizul Karim on 20/3/22.
//

import Foundation
import UIKit

class MoviePresenter : ViewToPresenterProtocol {
    var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    func startFactingMovieList() {
        interactor?.fetchMovie()
    }
    
    func showDetailsController(navigationController: UINavigationController) {
        router?.pushToMovieDetails(navigationController: navigationController)
    }
}

extension MoviePresenter : InteractorToPresenterProtocol {
    func movieFetchSuccess(movieModelArray: Array<movieModel>) {
        view?.showMovieList(MovieList: movieModelArray)
    }
    func movieFetchFailed() {
        view?.showError()
    }
    
    
}
