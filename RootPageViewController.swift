//
//  RootPageViewController.swift
//  MyMooBan
//
//  Created by Globaltium on 26/03/2018.
//  Copyright © 2018 Megat. All rights reserved.
//

import UIKit

class RootPageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    lazy var viewControllerList:[UIViewController] = {
        
        let sb = UIStoryboard(name: "Main", bundle : nil)
        
        let vcPage1 = sb.instantiateViewController(withIdentifier: "viewPage1")
        let vcPage2 = sb.instantiateViewController(withIdentifier: "viewPage2")
        let vcPage3 = sb.instantiateViewController(withIdentifier: "viewPage3")
        let vcPage4 = sb.instantiateViewController(withIdentifier: "viewPage4")
        let vcPage5 = sb.instantiateViewController(withIdentifier: "viewPage5")
        
        return [vcPage1, vcPage2, vcPage3, vcPage4, vcPage5]
    }()
    
    // Page Control
    
    var pageControl = UIPageControl()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        
        if let firstViewController = viewControllerList.first {
            self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        
        self.delegate = self
        configurePageControl()
    }
    
    
    func configurePageControl() {
        pageControl = UIPageControl (frame: CGRect(x: 0, y: UIScreen.main.bounds.maxY - 100, width: UIScreen.main.bounds.width, height: 50))
        pageControl.numberOfPages = viewControllerList.count
        pageControl.currentPage = 0
        pageControl.tintColor = UIColor.black
        pageControl.pageIndicatorTintColor = UIColor.white
        pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
    }
    
    
    
    //stub
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = viewControllerList.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = vcIndex - 1
        
        guard previousIndex >= 0  else
        {
            return nil
            
        }
        
        guard viewControllerList.count > previousIndex else
        {
            return nil
        }
        
        return viewControllerList[previousIndex]
        
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = viewControllerList.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = vcIndex + 1
        
        guard viewControllerList.count != nextIndex else
        {
            return nil
        }
        
        guard viewControllerList.count > nextIndex else
        {
            return nil
        }
        
        return viewControllerList[nextIndex]
        
        
        
        
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = viewControllerList.index(of: pageContentViewController)!
    }

    

}
