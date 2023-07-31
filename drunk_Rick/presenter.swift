//
//  presenter.swift
//  drunk_Rick
//
//  Created by Akerke on 30.07.2023.
//

import UIKit


protocol PresenterProtocol{
    var view: ViewControllerProtocol? { get set }
    func countDays(beginDate: Date)
}

class Presenter: PresenterProtocol {
    
    weak var view: ViewControllerProtocol?
    
    let model = DateModel()
    
    func countDays(beginDate: Date) {
        let endDate = Date()
        let days = model.daysCounter(from: beginDate, to: endDate); view?.daysChange(days: days)
    }
    }
    
