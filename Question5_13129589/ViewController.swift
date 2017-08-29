//
//  ViewController.swift
//  Question1_13129589
//
//  Created by Osaretin Igbinosun on 16/08/2017.
//  Copyright © 2017 Osaretin Igbinosun. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var photo1: UIButton!

    @IBOutlet weak var photo2: UIButton!
    
    @IBOutlet weak var photo4: UIButton!
    @IBOutlet weak var photo6: UIButton!
    
    @IBOutlet weak var photo5: UIButton!
    @IBOutlet weak var photo3: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //
        let dvc = segue.destination as! ImageDisplayViewController
        if let button = sender as? UIButton{
            
            if button == photo1{
                dvc.pictures = .pic1
            } else if button == photo2 {
                dvc.pictures = .pic2
            }else if button == photo3{
                dvc.pictures = .pic3
            }else if button == photo4{
                dvc.pictures = .pic4
            }
            else if button == photo5{
                dvc.pictures = .pic5
            }
            else if button == photo6{
                dvc.pictures = .pic6
            }
        }
    }
}




