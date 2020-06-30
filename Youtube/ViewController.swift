//
//  ViewController.swift
//  Youtube
//
//  Created by Erdem Koçer on 30.06.2020.
//

import UIKit

class ViewController: UIViewController {

    
    var model = Model()
    var videos = [Video]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        model.delegate = self
        
        model.getVideos()
        
        
    }


}

extension ViewController: UITableViewDelegate{
    
    
    
}

extension ViewController: UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath)
        let title = self.videos[indexPath.row].title
        cell.textLabel?.text = title
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//    }
    
    
}

extension ViewController: ModelDelegate {
    
    func videosFetched(_ videos: [Video]) {
        
        self.videos = videos
        
        tableView.reloadData()
        
        
    }
    
    
}
