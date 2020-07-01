//
//  DetailedViewController.swift
//  Youtube
//
//  Created by Erdem Koçer on 1.07.2020.
//

import UIKit
import WebKit

class DetailedViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var webView: WKWebView!
    
    
    var video:Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        guard video != nil else { return }
        
        //Clear the fields.
        
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""
        
        
        
        //Create the embed URL
        let embedUrlString = Constants.YOUTUBE_EMBED_URL + video!.videoId
        
        //Load it into webview
        let url = URL(string: embedUrlString)
        let request = URLRequest(url: url!)
        webView.load(request)
        //Set the title
        
        titleLabel.text = video!.title
        //Set the date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        dateLabel.text = df.string(from: video!.published)
        
        
        
        //Set the description.
        textView.text = video!.description
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
