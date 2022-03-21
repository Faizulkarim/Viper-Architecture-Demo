//
//  MovieInteractor.swift
//  MovieHutWithViper
//
//  Created by Faizul Karim on 20/3/22.
//

import Foundation
import Alamofire
import SwiftyJSON
import ObjectMapper

class MovieInteractor : PresenterToInteractorProtocol {
    var presenter: InteractorToPresenterProtocol?
    func fetchMovie() {
        Alamofire.request(apiUrl.popularMovie).responseJSON { response in
            debugPrint(response.result)
            if let json = response.result.value as AnyObject? {
    
                   let movieData = json["results"] as! NSArray
                        let moviList =  Mapper<movieModel>().mapArray(JSONArray: movieData as! [[String : Any]])
                print(moviList)
                    self.presenter?.movieFetchSuccess(movieModelArray: moviList)
                 
            }

        }
        
    }
    
}
