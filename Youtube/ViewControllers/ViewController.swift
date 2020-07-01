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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Get a reference to the video tapped on
        guard tableView.indexPathForSelectedRow != nil else { return }
        //Get a reference to detail view controller
        let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
        //Set the video property in detail view controller
        let VC = segue.destination as! DetailedViewController
        VC.video = selectedVideo
    }


}

extension ViewController: UITableViewDelegate{
    
    
    
}

extension ViewController: UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        cell.setCell(self.videos[indexPath.row])
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
