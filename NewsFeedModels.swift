//
//  NewsFeedModels.swift
//  VkNewsFeed
//
//  Created by Macbook on 16.09.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum NewsFeed {
   
  enum Model {
    struct Request {
      enum RequestType {
          case getNewsFeed
      }
    }
    struct Response {
      enum ResponseType {
          case presentNewsFeed(feed: FeedResponse)
      }
    }
    struct ViewModel {
      enum ViewModelData {
          case displayNewsFeed(feedViewModel: FeedViewModel)
      }
    }
  }
}

struct FeedViewModel {
    struct Cell: FeedCellViewModel {
        var imageUrlString: String
        var name: String
        var date: String
        var text: String?
        var likes: String?
        var comments: String?
        var shares: String?
        var views: String?
        var photoAttachment: FeedCellPhotoAttachmentViewModel?
        var sizes: FeedCellSizes
    }
    
    struct FeedCellPhotoAttachment: FeedCellPhotoAttachmentViewModel {
        var photoUrlString: String?
        var width: Int
        var height: Int
    }
    
    let cells: [Cell]
}
