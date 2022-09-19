//
//  NewsFeedInteractor.swift
//  VkNewsFeed
//
//  Created by Macbook on 16.09.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NewsFeedBusinessLogic {
  func makeRequest(request: NewsFeed.Model.Request.RequestType)
}

class NewsFeedInteractor: NewsFeedBusinessLogic {

  var presenter: NewsFeedPresentationLogic?
  var service: NewsFeedService?
    
    private var revealedPostIds = [Int]()
    private var feedResponse: FeedResponse?
    
    private var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())
  
  func makeRequest(request: NewsFeed.Model.Request.RequestType) {
    if service == nil {
      service = NewsFeedService()
    }
      switch request {
      case .getNewsFeed:
          fetcher.getFeed { [weak self] feedResponse in
              self?.feedResponse = feedResponse
              self?.presentFeed()
          }
      case .revealPostId(postId: let postId):
          revealedPostIds.append(postId)
          
          presentFeed()
      }
  }
    
    private func presentFeed() {
        guard let feedResponse = feedResponse else {return}
        presenter?.presentData(response: NewsFeed.Model.Response.ResponseType.presentNewsFeed(feed: feedResponse, revealedPostIds: revealedPostIds))
    }
  
}
