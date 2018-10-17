//
//  DataModel.swift
//  Test_wipro
//
//  Created by Amit on 16/10/18.
//  Copyright © 2018 Asti Infotech. All rights reserved.
//

import Foundation

struct Images: Decodable {
    let title: String?
    let rows: [Row]?
}

struct Row: Decodable {
    let title, description: String?
    let imageHref: String?
}
