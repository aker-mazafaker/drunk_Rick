//
//  ViewController.swift
//  drunk_Rick
//
//  Created by Akerke on 28.07.2023.
//

import UIKit
import SnapKit

protocol ViewControllerProtocol: AnyObject{
    func daysChange(days: Int)
}

class ViewController: UIViewController, ViewControllerProtocol {
    
    var presenter: PresenterProtocol!
    
    func daysChange(days: Int) {
        dayLabel.text = "\(days)"
        UserDefaults.standard.set(days, forKey: "daysCounter");
    }
    
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Ты не пьешь:"
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
    
    let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.backgroundColor = .white
        picker.datePickerMode = .date
        
        return picker
    }()
    
    let dayLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.monospacedSystemFont(ofSize: 120, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    
    let bottomLabel: UILabel = {
        let label = UILabel()
        label.text = "В ШОКЕ"
        label.font = UIFont.monospacedSystemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        setupScene()
        makeConstraints()
        presenter = Presenter()
        presenter.view = self
        if let saveDays = UserDefaults.standard.value(forKey: "daysCounter") as? Int {
            dayLabel.text = "\(saveDays)"
        }
        
    }
    
    
}

private extension ViewController {
    func setupScene(){
        view.addSubview(mainLabel)
        view.addSubview(bottomLabel)
        self.view.insertSubview(backImage, at: 0)
        view.addSubview(datePicker)
        datePicker.addTarget(self, action: #selector(changeValue), for: .valueChanged)
        view.addSubview(dayLabel)
        
    }
    func makeConstraints(){
        mainLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-300)
        }
        bottomLabel.snp.makeConstraints{
            $0.left.equalToSuperview().offset(50)
            $0.centerY.equalTo(mainLabel).offset(400)
        }
        datePicker.snp.makeConstraints{
            $0.centerX.equalTo(mainLabel)
            $0.centerY.equalTo(mainLabel).offset(70)
        }
        dayLabel.snp.makeConstraints{
            $0.centerX.equalTo(datePicker)
            $0.centerY.equalTo(datePicker).offset(100)
        }
        
    }
    @objc func changeValue(days: Int) {
        let beginDate = datePicker.date
        presenter.countDays(beginDate: beginDate)
    }
}

