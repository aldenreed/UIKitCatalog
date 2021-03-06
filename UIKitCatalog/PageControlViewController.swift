/*
    Copyright (C) 2016 Apple Inc. All Rights Reserved.
    See LICENSE.txt for this sample’s licensing information
    
    Abstract:
    A view controller that demonstrates how to use UIPageControl.
*/

import UIKit

class PageControlViewController: UIViewController, UIScrollViewDelegate {
    // MARK: - Properties

    @IBOutlet weak var pageControl: UIPageControl!

    @IBOutlet weak var colorView: UIScrollView!
    /// Colors that correspond to the selected page. Used as the background color for `colorView`.
    let colors = [
        UIColor.black,
        UIColor.gray,
        UIColor.red,
        UIColor.green,
        UIColor.blue,
        UIColor.cyan,
        UIColor.yellow,
        UIColor.magenta,
        UIColor.orange,
        UIColor.purple
    ]

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        colorView.delegate = self
        super.viewDidLoad()

        configurePageControl()
        pageControlValueDidChange()
        colorView.isPagingEnabled = true
    }

    // MARK: - Configuration

    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        pageControl.numberOfPages = colors.count
        pageControl.currentPage = 2

        pageControl.tintColor = UIColor.applicationBlueColor
        pageControl.pageIndicatorTintColor = UIColor.applicationGreenColor
        pageControl.currentPageIndicatorTintColor = UIColor.applicationPurpleColor

        pageControl.addTarget(self, action: #selector(PageControlViewController.pageControlValueDidChange), for: .valueChanged)
    }

    @IBAction func changeValue(_ sender: UIPageControl) {
        pageControlValueDidChange()
    }
    
    // MARK: - Actions

    func pageControlValueDidChange() {
        NSLog("The page control changed its current page to \(pageControl.currentPage).")

        colorView.backgroundColor = colors[pageControl.currentPage]
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        pageControlValueDidChange()
    }
}
