//
//  ImageViewerView.swift
//  B-Spoke
//
//  Created by katagaki on 2019/11/13.
//  Copyright © 2019 B-Spoke. All rights reserved.
//

import UIKit

class ImageViewerView: UIViewController {
    
   @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func pinchImage(_ sender: UIPinchGestureRecognizer) {
        if sender.state == .began || sender.state == .changed {
            imageView.transform = imageView.transform.scaledBy(x: sender.scale, y: sender.scale)
            sender.scale = 1
        }
    }
    
}
