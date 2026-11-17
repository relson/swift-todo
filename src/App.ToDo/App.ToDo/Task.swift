//
//  Task.swift
//  MyApp
//
//  Created by Sebastião Relson on 17/11/26.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool = false
}
