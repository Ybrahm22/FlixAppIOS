//
//  MovieDetailsViewController.swift
//  FlixAPPUnit1
//
//  Created by yug brahmbhatt on 3/2/22.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var releaseYearLabel: UILabel!
    @IBOutlet var tapPosterGuesture: UITapGestureRecognizer!
    
    var movie: [String:Any]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let rating = movie["vote_average"] as! Double
        
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        synopsisLabel.text = movie["overview"] as? String
        synopsisLabel.sizeToFit()
        ratingLabel.text = "Score: \(rating)/10"
        ratingLabel.sizeToFit()
       
        
        let release = movie["release_date"] as! String
        let endOfYear = release.firstIndex(of: "-")!
        let year = release[..<endOfYear]
        releaseYearLabel.text = "(\(year))"
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)!
        
        
        posterView.af.setImage(withURL: posterUrl)
        
        let backdropPath = movie["backdrop_path"] as! String
        let backdropUrl = URL(string: "https://image.tmdb.org/t/p/w780" + backdropPath)!
        
        
        backdropView.af.setImage(withURL: backdropUrl)
    
    
// poster tap
    
    //poster tap
    
    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapPoster(sender:)))
                                                      
    tapGestureRecognizer.numberOfTapsRequired = 1
    posterView.isUserInteractionEnabled = true
    posterView.addGestureRecognizer(tapGestureRecognizer)
}

//perform modal segue when tapped
@objc func didTapPoster(sender: UITapGestureRecognizer) {
    performSegue(withIdentifier: "webViewSegue", sender: nil)
}

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        print("opening modal transition")
    
        //Pass the selected movie to the web view controller
        let webViewController = segue.destination as! movieTrailerViewController
        webViewController.movie = movie
    
    
}

}




