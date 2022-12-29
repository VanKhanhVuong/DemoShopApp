//
//  ViewController.swift
//  DemoShopApp
//
//  Created by Văn Khánh Vương on 29/12/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Task {
            let api = DataAPIClient()
            let data = await api.getData()
            print(data)
        }
    }
}

