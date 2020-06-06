//
//  DetailViewController.swift
//  Project1v2
//
//  Created by Romeno Wenogk Fernando on 06/06/2020.
//  Copyright © 2020 Romeno Wenogk Fernando. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var ImageView: UIImageView!
    var selectedImage: String?;
    var imageCount: Int?;
    var imageIndex: Int?;
    override func viewDidLoad() {
        super.viewDidLoad()
        if let imgCount = imageCount, let imgIndex = imageIndex {
        title = "Picture \(imageIndex! + 1) of \(imageCount!)" ;
        }
        navigationItem.largeTitleDisplayMode = .never
        if let img = selectedImage {
            ImageView.image = UIImage(named: img)
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        navigationController?.hidesBarsOnTap = true;
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated);
        navigationController?.hidesBarsOnTap = false;
    }
    
    @objc func shareTapped() {
        guard let image = ImageView.image?.jpegData(compressionQuality: 1) else {
            print("error");
            return;
        }
        let vc = UIActivityViewController(activityItems: [image, selectedImage!], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem;
        present(vc,animated: true)
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
