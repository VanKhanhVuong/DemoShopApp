//
//  DataAPIClient.swift
//  DemoShopApp
//
//  Created by Văn Khánh Vương on 29/12/2022.
//

import Foundation

class DataAPIClient {
    func getData() async -> Datas? {
        let data = await APIManager.shared.request(request: "http://dev.sale.api.around-u.vn/api/category/list", dataModel: DataProduct.self)
        switch data {
        case .success(let success):
            return success.data
        case .failure(_):
            return nil
        }
    }
}
