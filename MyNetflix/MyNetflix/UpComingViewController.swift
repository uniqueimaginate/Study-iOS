//
//  UpComingViewController.swift
//  MyNetflix
//
//  Created by Peter on 2021/11/15.
//  Copyright © 2021 com.joonwon. All rights reserved.
//

import UIKit

class UpComingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    var awardRecommendListViewController: RecommendListViewController!
    var hotRecommendListViewController: RecommendListViewController!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "award" {
            let destinationVC = segue.destination as? RecommendListViewController
            awardRecommendListViewController = destinationVC
            awardRecommendListViewController.viewModel.updateType(.award)
            awardRecommendListViewController.viewModel.fetchItems()
        } else if segue.identifier == "hot" {
            let destinationVC = segue.destination as? RecommendListViewController
            hotRecommendListViewController = destinationVC
            hotRecommendListViewController.viewModel.updateType(.hot)
            hotRecommendListViewController.viewModel.fetchItems()
        }
    }
    

}
