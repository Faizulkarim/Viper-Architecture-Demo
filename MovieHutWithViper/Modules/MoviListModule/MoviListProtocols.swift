//
//  MoviListProtocols.swift
//  MovieHutWithViper
//
//  Created by Faizul Karim on 20/3/22.
//

import Foundation
import UIKit


protocol ViewToPresenterProtocol: AnyObject{
    var view: PresenterToViewProtocol? {get set}
    var interactor : PresenterToInteractorProtocol? {get set}
    var router : PresenterToRouterProtocol? {get set}
    func startFactingMovieList()
    func showDetailsController(navigationController: UINavigationController)
}

protocol PresenterToViewProtocol: AnyObject{
    func showMovieList(MovieList: Array<movieModel>)
    func showError()
    
}
protocol PresenterToInteractorProtocol: AnyObject{
    var presenter: InteractorToPresenterProtocol? {get set}
    func fetchMovie()
    
}

protocol PresenterToRouterProtocol: AnyObject{
    static func createModule()-> UIViewController
    func pushToMovieDetails(navigationController: UINavigationController)
    
}

protocol InteractorToPresenterProtocol: AnyObject{
    func movieFetchSuccess(movieModelArray: Array<movieModel>)
    func movieFetchFailed()
}
