//
//  ViewController.swift
//  drunk_Rick
//
//  Created by Akerke on 28.07.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Он не пьет:"
        label.textColor = .white
        label.font = UIFont.monospacedSystemFont(ofSize: 34, weight: .bold)
        return label
    }()
    
    let backImage: UIImageView = {
        let image = UIImageView(frame: UIScreen.main.bounds)
        image.image = UIImage(named: "RickMorty")
        image.contentMode = .scaleToFill
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        setupScene()
        makeConstraints()
    }


}

private extension ViewController {
    func setupScene(){
        view.addSubview(mainLabel)
        self.view.insertSubview(backImage, at: 0)
    }
    func makeConstraints(){
        mainLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-300)
        }
    }
}

