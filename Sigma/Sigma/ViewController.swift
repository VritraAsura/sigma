//
//  ViewController.swift
//  Sigma
//
//  Created by Jezreel Barbosa on 25/10/24.
//

import UIKit
import Stevia

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel()
        view.subviews(label)
        label.centerInContainer()
        label.style { s in
            s.text = "Sigma"
            s.textColor = .label
        }
    }
}
