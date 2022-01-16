//
//  OnboardingCell.swift
//  DoRe
//
//  Created by Praveen Nirmal on 16/1/22.
//

import UIKit

class OnboardingCell: UICollectionViewCell {
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLbl: UILabel!
    @IBOutlet weak var slideDescriptionLbl: UILabel!
    
    static let identifier = String(describing: OnboardingCell.self)
    
    func setup(_ slide: OnboardingSlide) {
        slideImageView.image = slide.image
        slideTitleLbl.text = slide.title
        slideDescriptionLbl.text = slide.description
    }
}
