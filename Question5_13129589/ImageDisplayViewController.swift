//
//  ImageDisplayViewController.swift
//  Question1_13129589
//
//  Created by Osaretin Igbinosun on 16/08/2017.
//  Copyright © 2017 Osaretin Igbinosun. All rights reserved.
//


import UIKit

class ImageDisplayViewController: UIViewController, UIScrollViewDelegate  {

    var pictures : Pictures = .pic1
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var scrollview: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        switch pictures {
            
        case .pic1:
            self.imageView.image = UIImage(named: "photo1.png")
    
        case .pic2:
            self.imageView.image = UIImage(named: "photo2.png")
            setZoomScale()
        case .pic3:
            self.imageView.image = UIImage(named: "photo3.png")
        case .pic4:
            self.imageView.image = UIImage(named: "photo4.png")
        case .pic5:
            self.imageView.image = UIImage(named: "photo5.png")
        default:
                self.imageView.image = UIImage(named: "photo6.png")
            
        }
        setZoomScale()
        // Do any additional setup after loading the view.
    }
   
    
    //(UIView *)viewForZoomingInScrollView: (UIScrollView *)scrollView{
      //  return imageView
    //}
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func setZoomScale() {
        let imageViewSize = imageView.bounds.size
        let scrollViewSize = scrollview.bounds.size
        let widthScale = scrollViewSize.width / imageViewSize.width
        let heightScale = scrollViewSize.height / imageViewSize.height
        
        scrollview.minimumZoomScale = min(widthScale, heightScale)
        scrollview.zoomScale = 2.0
    }
    
    override func viewWillLayoutSubviews() {
        setZoomScale()
    }
    @IBAction func done(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func handlePinch(_ sender: UIPinchGestureRecognizer) {
        if let view = sender.view {
            view.transform = view.transform.scaledBy(x: sender.scale, y: sender.scale)
            sender.scale = 1;
        }
    }
    
    @IBAction func handleRotate(_ sender: UIRotationGestureRecognizer) {
        if let view = sender.view {
            view.transform = view.transform.rotated(by: sender.rotation);
            sender.rotation = 0;
        }
    }


    
    @IBAction func handlePan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view)
        if let view = sender.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y + translation.y)
        }
        sender.setTranslation(CGPoint.zero, in: self.view)
        
    }

   

}
