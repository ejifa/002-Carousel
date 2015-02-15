//
//  TutorialScreensViewController.swift
//  002-Carousel
//
//  Created by Jakub Burkot on 2/13/15.
//  Copyright (c) 2015 Jakub Burkot. All rights reserved.
//

import UIKit

class TutorialScreensViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var spinView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: 1280, height: 568)
        spinView.hidden = true
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView){
        var page = Int(scrollView.contentOffset.x / 320)
        pageControl.currentPage = page
        
        if (page == 3){
            delay(1, { () -> () in
                self.spinView.hidden = false
                self.pageControl.hidden = true
                
            })
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


    }