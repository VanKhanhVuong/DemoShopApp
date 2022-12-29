//
//  DataModel.swift
//  DemoShopApp
//
//  Created by Văn Khánh Vương on 29/12/2022.
//

import Foundation

struct DataProduct: Codable {
    var status: Bool?
    var message: String?
    var data: Datas?
    
    private enum CodingKeys: String, CodingKey {
        case status = "Success"
        case message = "Message"
        case data = "Data"
    }
}

struct Datas: Codable {
    var categorys : [Categorys]?
    var banners : [Banner]?
    var categoryMenu : [CategoryMenu]?
    
    private enum CodingKeys: String, CodingKey {
        case categorys = "Categorys"
        case banners = "Banners"
        case categoryMenu = "CategoryMenu"
    }
}

struct Categorys: Codable {
    var category: Category?
    var items: [Items]?

    private enum CodingKeys: String, CodingKey {
        case category = "category"
        case items = "items"
    }
}

struct Category: Codable {
    var categoryId: Int?
    var categoryImage: String?
    var categoryName: String?

    private enum CodingKeys: String, CodingKey {
        case categoryId = "category_id"
        case categoryImage = "category_image"
        case categoryName = "category_name"
    }
}

struct Items: Codable {
    var itemId: Int?
    var itemImage: String?
    var itemName: String?

    private enum CodingKeys: String, CodingKey {
        case itemId = "item_id"
        case itemImage = "item_image"
        case itemName = "item_name"
    }
}

struct Banner: Codable {
    var bannerImage: String?
    
    private enum CodingKeys: String, CodingKey {
        case bannerImage = "banner_image"
    }
}


struct CategoryMenu: Codable {
    var categoryId: Int?
    var categoryName: String?
    var categorylvl: [CategoryLVL]?

    private enum CodingKeys: String, CodingKey {
        case categoryId = "category_id"
        case categoryName = "category_name"
        case categorylvl = "category_lvI"
    }
}

struct CategoryLVL: Codable {
    var categoryId: Int?
    var categorylvlID: Int?
    var categoryNamelvl: String?

    private enum CodingKeys: String, CodingKey {
        case categoryId = "category_id"
        case categorylvlID = "category_lvI_id"
        case categoryNamelvl = "category_name_lvI"
    }
}









