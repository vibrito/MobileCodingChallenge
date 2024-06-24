//
//  Node.swift
//  Bipa Challenge
//
//  Created by Vinicius Brito on 6/24/24.
//

// MARK: - Welcome
struct Node: Codable {
    let publicKey, alias: String?
    let channels, capacity: Int?
    let firstSeen, updatedAt: Double?
    let city, country: Place?
}

// MARK: - City
struct Place: Codable {
    let de, en, es, fr: String?
    let ja, ptBR, ru: String?
    let zhCN: String?

    enum CodingKeys: String, CodingKey {
        case de, en, es, fr, ja
        case ptBR = "pt-BR"
        case ru
        case zhCN = "zh-CN"
    }
}
