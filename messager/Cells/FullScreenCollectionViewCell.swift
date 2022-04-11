//
//  FullScreenCollectionViewCell.swift
//  messager
//
//  Created by Антон on 14.03.2022.
//

import UIKit

class FullScreenCollectionViewCell: UICollectionViewCell, UIScrollViewDelegate {
    @IBOutlet weak var ScrollView: UIScrollView!
    
    @IBOutlet weak var photoView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.ScrollView.delegate = self
        self.ScrollView.minimumZoomScale = 1.0
        self.ScrollView.maximumZoomScale = 3.5
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return photoView
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        scrollView.zoomScale = 1.0
    }
}
