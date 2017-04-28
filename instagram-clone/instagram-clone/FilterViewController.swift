//
//  FilterViewController.swift
//  instagram-clone
//
//  Created by Scott on 28/4/17.
//  Copyright © 2017 Scott. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var image: UIImage?
    let context = CIContext(options: nil)
    var filterIndex = 0
    
    fileprivate let filterNameList = [
        "No Filter",
        "CIPhotoEffectChrome",
        "CIPhotoEffectFade",
        "CIPhotoEffectInstant",
        "CIPhotoEffectMono",
        "CIPhotoEffectNoir",
        "CIPhotoEffectProcess",
        "CIPhotoEffectTonal",
        "CIPhotoEffectTransfer",
        "CILinearToSRGBToneCurve",
        "CISRGBToneCurveToLinear",
    ]
    
    fileprivate let filterDisplayNameList = [
        "Normal",
        "Chrome",
        "Fade",
        "Instant",
        "Mono",
        "Noir",
        "Process",
        "Tonal",
        "Transfer",
        "Tone",
        "Linear",
      ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image!
        collectionView.dataSource = self
        collectionView.delegate = self
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 11
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // let cell = UICollectionViewCell()
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterCell", for: indexPath) as! FilterCell
        
        var filteredImage = image
        if indexPath.row != 0 {
            filteredImage = createFilteredImage(filterName: filterNameList[indexPath.row], image: image!)
        }

        cell.filterImage.image = filteredImage
        cell.filterLabel.text = filterDisplayNameList[indexPath.row]
        
        // Configure the cell
        
        return cell
    }
    
    
    func createFilteredImage(filterName: String, image: UIImage) -> UIImage {
        // 1 - create source image
        let sourceImage = CIImage(image: image)
        
        // 2 - create filter using name
        let filter = CIFilter(name: filterName)
        filter?.setDefaults()
        
        // 3 - set source image
        filter?.setValue(sourceImage, forKey: kCIInputImageKey)
        
        // 4 - output filtered image as cgImage with dimension.
        let outputCGImage = context.createCGImage((filter?.outputImage!)!, from: (filter?.outputImage!.extent)!)
        
        // 5 - convert filtered CGImage to UIImage
        let filteredImage = UIImage(cgImage: outputCGImage!)
        
        return filteredImage
    }

    
    // MARK: UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        filterIndex = indexPath.row
        if filterIndex != 0 {
            imageView.image = createFilteredImage(filterName: filterNameList[indexPath.row], image: image!)
        } else {
            imageView.image = image
        }
    }
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    


}
