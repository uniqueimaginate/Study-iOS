//
//  HomeViewController.swift
//  MyNetflix
//
//  Created by joonwon lee on 2020/04/01.
//  Copyright © 2020 com.joonwon. All rights reserved.
//

import UIKit
import AVFoundation

class HomeViewController: UIViewController {

    var awardRecommendListViewController: RecommendListViewController!
    var hotRecommendListViewController: RecommendListViewController!
    var myRecommendListViewController: RecommendListViewController!
    
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
        } else if segue.identifier == "my" {
            let destinationVC = segue.destination as? RecommendListViewController
            myRecommendListViewController = destinationVC
            myRecommendListViewController.viewModel.updateType(.my)
            myRecommendListViewController.viewModel.fetchItems()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func playButtonTapped(_ sender: Any) {
        // [x] Interstellar 에 대한 정보를 검색 API로 가져온다.
        // [x] 거기서 interstellar 객체 하나를 가져온다.
        // [x] 그 객체를 이용해서 PlayerViewController 를 띄운다.
        
        SearchAPI.search("interstellar") { movies in
            guard let interstellar = movies.first else { return }
            DispatchQueue.main.async {
                let url = URL(string: interstellar.previewURL)!
                let item = AVPlayerItem(url: url)
                
                let sb = UIStoryboard(name: "Player", bundle: nil)
                let vc = sb.instantiateViewController(withIdentifier: "PlayerViewController") as! PlayerViewController
                
                vc.player.replaceCurrentItem(with: item)
                
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: false, completion: nil)
            }
        }
    
    }
}
