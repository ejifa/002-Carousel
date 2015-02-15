//
//  IntroScreenViewController.swift
//  002-Carousel
//
//  Created by Jakub Burkot on 2/13/15.
//  Copyright (c) 2015 Jakub Burkot. All rights reserved.
//

import UIKit

class IntroScreenViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var introImageView: UIImageView!
    @IBOutlet weak var introScrollView: UIScrollView!
    
    @IBOutlet weak var tileView1: UIImageView!
    @IBOutlet weak var tileView2: UIImageView!
    @IBOutlet weak var tileView3: UIImageView!
    @IBOutlet weak var tileView4: UIImageView!
    @IBOutlet weak var tileView5: UIImageView!
    @IBOutlet weak var tileView6: UIImageView!
    
    var yOffsets : [Float] = [-285, -240, -350, -408, -420, -400]
    var xOffsets : [Float] = [-30, 75, -90, 10, -180, -15]
    var scales : [Float] = [0.7, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [Float] = [-20, -10, 10, 10, 10, -10]
    var tileViews: [UIImageView] = []
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        introScrollView.contentSize = introImageView.frame.size
        introScrollView.delegate = self
        
        tileViews = [tileView1, tileView2, tileView3, tileView4, tileView5, tileView6]
        for (i,tileView) in enumerate(tileViews) {
            
            var tx = convertValue(0, 0, 568, xOffsets[i], 0)
            var ty = convertValue(0, 0, 568, yOffsets[i], 0)
            var ts = convertValue(0, 0, 568, scales[i], 1)
            var tr = convertValue(0, 0, 568, rotations[i], 0)
            
            tileView.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
            tileView.transform = CGAffineTransformScale(tileView.transform, CGFloat(ts), CGFloat(ts))
            tileView.transform = CGAffineTransformRotate(tileView.transform, CGFloat(Double(tr) * M_PI / 180))
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        var offset = Float(scrollView.contentOffset.y)
        
        for (i,tileView) in enumerate(tileViews) {
            
            var tx = convertValue(offset, 0, 568, xOffsets[i], 0)
            var ty = convertValue(offset, 0, 568, yOffsets[i], 0)
            var ts = convertValue(offset, 0, 568, scales[i], 1)
            var tr = convertValue(offset, 0, 568, rotations[i], 0)
            
            tileView.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
            tileView.transform = CGAffineTransformScale(tileView.transform, CGFloat(ts), CGFloat(ts))
            tileView.transform = CGAffineTransformRotate(tileView.transform, CGFloat(Double(tr) * M_PI / 180))
        }
        
    }
    
}
