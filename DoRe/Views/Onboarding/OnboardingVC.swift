//
//  OnboardingVC.swift
//  DoRe
//
//  Created by Praveen Nirmal on 16/1/22.
//

import UIKit

class OnboardingVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControll: UIPageControl!
    
    var slides: [OnboardingSlide] = []
    var currentPage = 0 {
        /// A property observer
        didSet {
            /// When currentPage changes it assigns to pageControll
            pageControll.currentPage = currentPage
            /// When currentPage changes Button title changes
            if currentPage == slides.count - 1 {
                nextButton.setTitle("Get Started", for: .normal)
            } else {
                nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slides = [
            OnboardingSlide(title: "Best Online Music Services to your palms", description: "Connecting Spotify, Youtube and more with online music get aways to give you the most satisfaction.", image:#imageLiteral(resourceName: "s2") ),
            OnboardingSlide(title: "World-Class Hosts", description: "Our Hosts are Provide the best music universally.", image: #imageLiteral(resourceName: "s1")),
            OnboardingSlide(title: "Instant World-Wide", description: "Your favourites will be delivered instantly irrespective of your location around the world.", image: #imageLiteral(resourceName: "s3"))
        ]
    }
    @IBAction func nextButtonClicked(_ sender: Any) {
        
        if currentPage == slides.count - 1 {
            /// Redirecting to Main storyboard
            /// perform the segue
            performSegue(withIdentifier: "goToTabBar", sender: self)
            
        } else {
            currentPage += 1
            /// Setting an Index path
            let indexPath = IndexPath(item: currentPage, section: 0)
            /// Scroll the collection view to specific slide
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    /// Segue happen if the sugue identifier matches
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToTabBar" {
            guard segue.destination is UITabBarController else { return }
        } else {}
    }
}

extension OnboardingVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    /// Returning the number of rows should appear
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    /// Returning the cell that should appear
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        /// Getting the one cell object from the array
        /// indexpath.row = index of the array
        let slide = slides[indexPath.row]
        
        /// Configuring the collection cell view class with identifier
        /// as! OnboardingCell  => Put the cocoa touch class to here
        /// identifier = the identifier we gives to the table cell view in the storyboard
        /// Make sure to add the correct identifier to Table cell view in attribute inspecter
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell", for: indexPath) as! OnboardingCell
        
        /// Assigning data to the cell using the function implemented in the cell class
        cell.setup(slide)
        
        return cell
    }
    
    /// Assigning size to cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    /// find the page in the scroll view
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        /// Getting the width of a scroll view single frame
        let width = scrollView.frame.width
        /// Getting the page by deviding full width of the scrooll view
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
