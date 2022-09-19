//
//  NewsFeedCodeCell.swift
//  VkNewsFeed
//
//  Created by Macbook on 18.09.2022.
//

import UIKit

final class NewsFeedCodeCell: UITableViewCell {
    
    static let reuseId = "NewsFeedCodeCell"
    
    //first layer
    
    let cardView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    //second layer
    
    let topView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let postLabel: UILabel = {
       let label = UILabel()
        label.font = Constants.postLabelFont
        label.numberOfLines = 0
        label.textColor = UIColor(red: 44/255, green: 45/255, blue: 46/255, alpha: 1)
        return label
    }()
    
    let moreTextButton: UIButton = {
       let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        button.setTitleColor(UIColor(red: 102/255, green: 159/255, blue: 212/255, alpha: 1), for: .normal)
        button.contentHorizontalAlignment = .left
        button.contentVerticalAlignment = .center
        button.setTitle("Show more...", for: .normal)
        return button
    }()
    
    let postImageView: WebImageView = {
       let imageView = WebImageView() 
        imageView.backgroundColor = UIColor(red: 227/255, green: 229/255, blue: 232/255, alpha: 1)
        return imageView
    }()
    
    let bottomView: UIView = {
       let view = UIView()
        return view
    }()
    
    //third layer
    
    let iconImageView: WebImageView = {
        let imageView = WebImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor(red: 227/255, green: 229/255, blue: 232/255, alpha: 1)
        return imageView
    }()
    
    let nameLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 0
        label.textColor = UIColor(red: 44/255, green: 45/255, blue: 46/255, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(red: 129/255, green: 140/255, blue: 153/255, alpha: 1)
        return label
    }()
    
    let likesView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let commentsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let sharesView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let viewsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //forth Layer
    
    let likesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "like")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.lineBreakMode = .byClipping
        label.textColor = UIColor(red: 129/255, green: 140/255, blue: 153/255, alpha: 1)
        return label
    }()
    
    let commentsImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "comment")
        return imageView
    }()
    
    let commentsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.lineBreakMode = .byClipping
        label.textColor = UIColor(red: 129/255, green: 140/255, blue: 153/255, alpha: 1)
        return label
    }()
    
    let sharesImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "share")
        return imageView
    }()
    
    let sharesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.lineBreakMode = .byClipping
        label.textColor = UIColor(red: 129/255, green: 140/255, blue: 153/255, alpha: 1)
        return label
    }()
    
    let viewsImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "eye")
        return imageView
    }()
    
    let viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.lineBreakMode = .byClipping
        label.textColor = UIColor(red: 129/255, green: 140/255, blue: 153/255, alpha: 1)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        overlayFirstLayer()
        overlaySecondLayer()
        overlayThirdLayer()
        overlayForthLayer()
        
        backgroundColor = UIColor.gray
        
    }
    
    override func prepareForReuse() {
        iconImageView.set(imageURL: nil)
        postImageView.set(imageURL: nil)
    }
    
    func set(viewModel: FeedCellViewModel) {
        iconImageView.set(imageURL: viewModel.imageUrlString)
        iconImageView.layer.cornerRadius = Constants.topViewHeight / 2
        iconImageView.clipsToBounds = true
        nameLabel.text = viewModel.name
        dateLabel.text = viewModel.date
        postLabel.text = viewModel.text
        countNumber(label: likesLabel, number: viewModel.likes ?? "0")
        countNumber(label: commentsLabel, number: viewModel.comments ?? "0")
        countNumber(label: sharesLabel, number: viewModel.shares ?? "0")
        countNumber(label: viewsLabel, number: viewModel.views ?? "0")
        cardView.layer.cornerRadius = 10
        cardView.clipsToBounds = true
        backgroundColor = .clear
        selectionStyle = .none
        
        postLabel.frame = viewModel.sizes.postLabelFrame
        postImageView.frame = viewModel.sizes.attachmentFrame
        bottomView.frame = viewModel.sizes.bottomView
        
        if let photoAttachment = viewModel.photoAttachment {
            postImageView.set(imageURL: photoAttachment.photoUrlString)
            postImageView.isHidden = false
        } else {
            postImageView.isHidden = true
        }
    }
    
    func countNumber(label: UILabel, number: String) {
        let count = Int(number)!
        if count >= 1000 {
            label.text = "\(count / 1000)K"
        } else {
            label.text = "\(count)"
        }
    }
    
    private func helpInForthLayer(view: UIView, imageView: UIImageView, label: UILabel) {
        
        NSLayoutConstraint.activate([
        
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            imageView.heightAnchor.constraint(equalToConstant: Constants.imageHeight),
            imageView.widthAnchor.constraint(equalToConstant: Constants.imageHeight),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 4),
            label.heightAnchor.constraint(equalToConstant: Constants.labelHeight),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func overlayForthLayer () {
        likesView.addSubview(likesLabel)
        likesView.addSubview(likesImageView)
        commentsView.addSubview(commentsLabel)
        commentsView.addSubview(commentsImageView)
        sharesView.addSubview(sharesLabel)
        sharesView.addSubview(sharesImageView)
        viewsView.addSubview(viewsLabel)
        viewsView.addSubview(viewsImageView)
        
        helpInForthLayer(view: likesView, imageView: likesImageView, label: likesLabel)
        helpInForthLayer(view: commentsView, imageView: commentsImageView, label: commentsLabel)
        helpInForthLayer(view: sharesView, imageView: sharesImageView, label: sharesLabel)
        helpInForthLayer(view: viewsView, imageView: viewsImageView, label: viewsLabel)
    }
    
    private func overlayThirdLayer () {
        topView.addSubview(iconImageView)
        topView.addSubview(nameLabel)
        topView.addSubview(dateLabel)
        bottomView.addSubview(likesView)
        bottomView.addSubview(commentsView)
        bottomView.addSubview(sharesView)
        bottomView.addSubview(viewsView)
        
        NSLayoutConstraint.activate([
            
            // iconImageViewConstraints
            iconImageView.heightAnchor.constraint(equalToConstant: Constants.topViewHeight),
            iconImageView.widthAnchor.constraint(equalToConstant: Constants.topViewHeight),
            iconImageView.topAnchor.constraint(equalTo: topView.topAnchor, constant: 0),
            iconImageView.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 0),
            
            //nameLabel Constraints
            nameLabel.topAnchor.constraint(equalTo: topView.topAnchor, constant: 2),
            nameLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
            nameLabel.heightAnchor.constraint(equalToConstant: Constants.topViewHeight/2-2),
            nameLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -8),
            
            //dateLabel Constraints
            dateLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -2),
            dateLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -8),
            dateLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
            dateLabel.heightAnchor.constraint(equalToConstant: 14),
            
            //likesView Constraints
            likesView.topAnchor.constraint(equalTo: bottomView.topAnchor),
            likesView.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor),
            likesView.heightAnchor.constraint(equalToConstant: Constants.bottomViewHeight),
            likesView.widthAnchor.constraint(equalToConstant: Constants.bottomViewViewWidth ),
            
            //commentsView Constraints
            commentsView.topAnchor.constraint(equalTo: bottomView.topAnchor),
            commentsView.leadingAnchor.constraint(equalTo: likesView.trailingAnchor),
            commentsView.heightAnchor.constraint(equalToConstant: Constants.bottomViewHeight),
            commentsView.widthAnchor.constraint(equalToConstant: Constants.bottomViewViewWidth),
            
            //sharesView Constants
            sharesView.topAnchor.constraint(equalTo: bottomView.topAnchor),
            sharesView.leadingAnchor.constraint(equalTo: commentsView.trailingAnchor),
            sharesView.heightAnchor.constraint(equalToConstant: Constants.bottomViewHeight),
            sharesView.widthAnchor.constraint(equalToConstant: Constants.bottomViewViewWidth),
            
            //viewsView Constraints
            viewsView.topAnchor.constraint(equalTo: bottomView.topAnchor),
            viewsView.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor),
            viewsView.heightAnchor.constraint(equalToConstant: Constants.bottomViewHeight),
            viewsView.widthAnchor.constraint(equalToConstant: Constants.bottomViewViewWidth),
        ])
    }
    
    private func overlaySecondLayer() {
        cardView.addSubview(topView)
        cardView.addSubview(postLabel)
        cardView.addSubview(postImageView)
        cardView.addSubview(bottomView)
        cardView.addSubview(moreTextButton)
        
        NSLayoutConstraint.activate([
        
            //topView constraints
            topView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 8),
            topView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -8),
            topView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 8),
            topView.heightAnchor.constraint(equalToConstant: Constants.topViewHeight)
        ])
        
    }
    
    private func overlayFirstLayer() {
        addSubview(cardView)
        
        //cardView constraints
        cardView.fillSuperview(padding: Constants.cardInsets)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
