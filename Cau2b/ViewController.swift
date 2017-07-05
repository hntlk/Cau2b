//
//  ViewController.swift
//  Cau2
//
//  Created by Cntt22 on 7/5/17.
//  Copyright © 2017 Cntt22. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var url1: UITextField!
    @IBOutlet weak var url2: UITextField!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func fetchImage1(_url : String)
    {
        let url = URL(string: _url)
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            
            //download hit an error so lets return out
            if let error = error {
                print(error)
                return
            }
            
            DispatchQueue.main.async(execute: {
                
                if let downloadedImage = UIImage(data: data!) {
                    self.image1.image = downloadedImage
                }
            })
            
        }).resume()
        
    }
    func fetchImage2(_url : String)
    {
        let url = URL(string: _url)
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            
            //download hit an error so lets return out
            if let error = error {
                print(error)
                return
            }
            
            DispatchQueue.main.async(execute: {
                
                if let downloadedImage = UIImage(data: data!) {
                    self.image2.image = downloadedImage
                }
            })
            
        }).resume()
        
    }
    @IBAction func loadImage(_ sender: UIButton) {
        
        if url1.text != "" || url2.text != "" {
            fetchImage1(_url: url1.text!)
            fetchImage2(_url: url2.text!)
        }
        else{
            let alert = UIAlertController(title: "Alert", message: "Please insert your image url!!!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}

