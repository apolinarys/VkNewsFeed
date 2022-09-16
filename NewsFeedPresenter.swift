//
//  NewsFeedPresenter.swift
//  VkNewsFeed
//
//  Created by Macbook on 16.09.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NewsFeedPresentationLogic {
  func presentData(response: NewsFeed.Model.Response.ResponseType)
}

class NewsFeedPresenter: NewsFeedPresentationLogic {
  weak var viewController: NewsFeedDisplayLogic?
  
  func presentData(response: NewsFeed.Model.Response.ResponseType) {
      switch response {
      case .presentNewsFeed(feed: let feed):
          <#code#>
      }
  }
  
}
