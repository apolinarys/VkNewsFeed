//
//  FeedResponse.swift
//  VkNewsFeed
//
//  Created by Macbook on 16.09.2022.
//

import Foundation

struct FeedResponseWrapped: Decodable {
    let response: FeedResponse
}

struct FeedResponse: Decodable {
    var items: [FeedItem]
    var profiles: [Profile]
    var groups: [Group]
}

struct FeedItem: Decodable {
    let sourceId: Int
    let postId: Int
    let text: String?
    let date: Double
    let comments: CountableItem?
    let likes: CountableItem?
    let reposts: CountableItem?
    let views: CountableItem?
    let attachments: [Attachment]?
}

struct Attachment: Decodable {
    let photo: Photo?
}

struct Photo: Decodable {
    let id: Int
}

struct CountableItem: Decodable {
    let count: Int?
}

protocol ProfileRepresentable {
    var id: Int {get}
    var name: String {get}
    var photo: String {get}
}

struct Profile: Decodable, ProfileRepresentable {
    let id: Int
    let firstName: String
    let lastName: String
    let photo100: String
    
    var name: String {return firstName + " " + lastName}
    var photo: String {return photo100}
}

struct Group: Decodable, ProfileRepresentable {
    let id: Int
    let name: String
    let photo100: String
    
    var photo: String {return photo100}
}
