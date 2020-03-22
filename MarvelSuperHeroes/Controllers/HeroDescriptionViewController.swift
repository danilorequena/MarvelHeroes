//
//  HeroDescriptionViewController.swift
//  MarvelSuperHeroes
//
//  Created by Danilo Requena on 21/03/20.
//  Copyright © 2020 Danilo Requena. All rights reserved.
//

import UIKit

class HeroDescriptionViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var ivImage: UIImageView!
    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var btShowMarvelPage: UIButton!
    
    var name: String?
    var currentPage: Int = 0
    var total = 0
    var hero: Hero!
    var heroes: [Hero] = []
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        title = hero.name
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup()
    }
    
    func setup() {
        lbDescription.text  = hero.description
        if let url  = URL(string: hero.thumbnail.url) {
            ivImage.kf.setImage(with: url)
            ivImage.layer.cornerRadius = 6
        } else {
            ivImage.image = nil
        }
        btShowMarvelPage.layer.cornerRadius = 10
        btShowMarvelPage.clipsToBounds = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! HeroViewController
        vc.hero = hero
    }
    

}
