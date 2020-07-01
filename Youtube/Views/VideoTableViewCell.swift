//
//  VideoTableViewCell.swift
//  Youtube
//
//  Created by Erdem Koçer on 1.07.2020.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var thumbnailImageVide: UIImageView!
    @IBOutlet weak var datelabel: UILabel!
    
    var video:Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setCell(_ v: Video){
        self.video = v
        guard self.video != nil else { return }
        //Set title and datelabel
        
        
        self.titleLabel.text = video?.title
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.datelabel.text = df.string(from: video!.published)
        
        //Set the thumbnail
        guard self.video?.thumbnail != "" else {
            return
        }
        
        //Download the thumbnail data
        //Check cache before downloading the data
        
        if let cachedData =   CacheManager.getVideoCache(self.video!.thumbnail) {
            
            //Set the video thumbnail
            
            self.thumbnailImageVide.image = UIImage(data: cachedData)
            return
        }
        
        
        
        let url = URL(string: self.video!.thumbnail)
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if let error = error {
                print(error)
            } else {
                
                //Set the data to the cache
                
                CacheManager.setVideoCache(url!.absoluteString, data)
                //Check that the downloaded url matches the video thumbnail url. Recycling cell issue!
                
                if url?.absoluteString != self.video?.thumbnail{
                    //Videocell has been recycled for another video and no longer matches the thumbnail that was downloaded.
                    return
                }
                
                
                
                //Create the image object
                
                let image = UIImage(data: data!)
                
                //Set the imageview
                
                DispatchQueue.main.async {
                    self.thumbnailImageVide.image = image
                }
            }
        }
        dataTask.resume()
    }
}
