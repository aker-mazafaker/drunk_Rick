//
//  Model.swift
//  drunk_Rick
//
//  Created by Akerke on 30.07.2023.
//

import Foundation

class DateModel {
    func daysCounter(from beginDate: Date, to endDate: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: beginDate, to: endDate)
        return components.day ?? 0
    }
}
