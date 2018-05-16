//
//  ViewController.swift
//  HyAlbum
//
//  Created by 장혜준 on 2018. 5. 15..
//  Copyright © 2018년 장혜준. All rights reserved.
//

import UIKit
import ImageSlideshow

class ViewController: UIViewController {

    @IBOutlet weak var slideShow: ImageSlideshow!
    
    let kingfisherSource = [KingfisherSource(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080")!, KingfisherSource(urlString: "https://images.unsplash.com/photo-1447746249824-4be4e1b76d66?w=1080")!, KingfisherSource(urlString: "https://images.unsplash.com/photo-1463595373836-6e0b0a8ee322?w=1080")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.slideShow.backgroundColor = UIColor.white
        self.slideShow.slideshowInterval = 1.0
        self.slideShow.pageControlPosition = PageControlPosition.underScrollView
        self.slideShow.pageControl.currentPageIndicatorTintColor = UIColor.lightGray
        self.slideShow.pageControl.pageIndicatorTintColor = UIColor.black
        self.slideShow.contentScaleMode = UIViewContentMode.scaleAspectFill
        
        // optional way to show activity indicator during image load (skipping the line will show no activity indicator)
        self.slideShow.activityIndicator = DefaultActivityIndicator()
        self.slideShow.currentPageChanged = { page in
            print("current page:", page)
        }
        
        // can be used with other sample sources as `afNetworkingSource`, `alamofireSource` or `sdWebImageSource` or `kingfisherSource`
        self.slideShow.setImageInputs(kingfisherSource)
    }

}

