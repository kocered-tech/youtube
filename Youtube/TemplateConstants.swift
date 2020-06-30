//
//  TemplateConstants.swift
//  Youtube
//
//  Created by Erdem Koçer on 30.06.2020.
//

import Foundation



struct Constants {
    
    static var API_KEY = ""
    static var PLAYLIST_ID = ""
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    static var VIDEOCELL_ID = "VideoCell"

}

