//
//  ViewController.swift
//  pageToScroll
//
//  Created by Jiashan Wu on 4/3/17.
//  Copyright © 2017 Jiashan Wu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    var images = [UIImageView]()
    
    @IBOutlet weak var statusLabel: UILabel!
    
    var scrollOffset: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func swipedRight(_ sender: UISwipeGestureRecognizer) {
        statusLabel.text = "swipe right"
        
        scrollOffset -= CGFloat(220.0)
        scrollView.setContentOffset(CGPoint(x: scrollOffset, y: 0), animated: true)
            
    }

    @IBAction func swipedLeft(_ sender: UISwipeGestureRecognizer) {
        statusLabel.text = "swipe left"
        scrollOffset += CGFloat(220.0)
        scrollView.setContentOffset(CGPoint(x: scrollOffset, y: 0), animated: true)
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        var contentWidth: CGFloat = 0.0
        
        let scrollViewWidth = scrollView.frame.size.width
        let scrollViewHeight = scrollView.frame.size.height
        
        for x in 0...2 {
            let image = UIImage(named: "icon\(x).png")
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
            var newX: CGFloat = 0.0
            newX = scrollViewWidth / 2 + scrollViewWidth * CGFloat(x)
            
            contentWidth += newX
            
            scrollView.addSubview(imageView)
            
            imageView.frame = CGRect(x: newX - 75, y: (scrollViewHeight / 2) - 75, width: 150, height: 150)
        }
        
        print("image count: \(images.count)")
        scrollView.clipsToBounds = false
        scrollView.contentSize = CGSize(width: contentWidth, height: scrollViewHeight)
        
    }

    
    

}

