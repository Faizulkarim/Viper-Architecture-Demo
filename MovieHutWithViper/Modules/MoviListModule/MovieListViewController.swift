//
//  MovieListViewController.swift
//  MovieHutWithViper
//
//  Created by Faizul Karim on 20/3/22.
//

import UIKit

class TrandingMovieCollectionCell : UICollectionViewCell{
    @IBOutlet weak var coverPhoto: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var popularity: UILabel!
    
    
}

class trandingMovieTableViewCell : UITableViewCell {
    @IBOutlet weak var coverPhoto: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var popularity: UILabel!
    
    @IBOutlet weak var rating: UILabel!
}


class MovieListViewController: UIViewController {
    var presenter : ViewToPresenterProtocol?
    @IBOutlet weak var trandingTableView: UITableView!
    @IBOutlet weak var trandingCollectionView: UICollectionView!
    
    var Movies : Array<movieModel> = Array()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.trandingCollectionView.delegate = self
        self.trandingCollectionView.dataSource = self
        let flowLayout : UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
          flowLayout.scrollDirection = UICollectionView.ScrollDirection.vertical
          flowLayout.sectionInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        self.trandingCollectionView.collectionViewLayout = flowLayout
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.startFactingMovieList()
    }
    


}
extension MovieListViewController:PresenterToViewProtocol{
    func showMovieList(MovieList: Array<movieModel>) {
      
        self.Movies = MovieList
       self.trandingTableView.reloadData()
        
    }
    
    func showError() {
        let alert = UIAlertController(title: "error", message: "Problem Fetching Notice", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension MovieListViewController : UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        

        
        return Movies.count
        
     
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "trandingCell", for: indexPath) as! TrandingMovieCollectionCell
            

//            if let url = URL(string: (Movies[indexPath.row].posterPath)) {
//                cell.coverPhoto.setImageWithDownload(url, withIndicator: true)
//            }
            cell.name.text = "Movies[indexPath.row].title"
            cell.popularity.text = "test"
            
            //"popularity: \(String(describing: Movies[indexPath.row].popularity)) "
            
            return cell
            

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let xPadding = 10
            let spacing = 10
            let rightPadding = 10
            let width = (CGFloat(UIScreen.main.bounds.size.width) - CGFloat(xPadding + spacing + rightPadding))/2
            let height = CGFloat(215)

            return CGSize(width: width, height: height)
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
     }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return 10
       }

    
}

extension MovieListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        print(Movies.count)
        return Movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tranndingTableCell", for: indexPath) as! trandingMovieTableViewCell
        cell.name.text = "Movies[indexPath.row].title"
        cell.popularity.text = "test"
        return cell
    }
    
    
}
