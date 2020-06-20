//
//  StorageSevice.swift
//  Your Coffee
//
//  Created by Илья Бочков  on 6/20/20.
//  Copyright © 2020 Илья Бочков . All rights reserved.
//

import UIKit
import CoreData

class StorageService: StorageServiceProtocol {
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private let entityName = "CoffeeModel"
    
    lazy var timeLimits: (begin: Date, end: Date) = {
        let now = Date()
        let calendar = Calendar(identifier: .gregorian)
        let begin = calendar.startOfDay(for: now)
        guard let end = calendar.date(byAdding: .day, value: 1, to: begin) else {
            return (begin, now)
        }
        return (begin, end)
    }()
    
    
    func todayCoffeeList(completion: @escaping (Result<Array<Coffee>, Error>) -> ()) {
        let fetchRequest: NSFetchRequest<CoffeeModel> = NSFetchRequest(entityName: entityName)
        let predicate = NSPredicate(format:"%@ <= date AND %@ >= date", timeLimits.begin as CVarArg, timeLimits.end as CVarArg)
        fetchRequest.predicate = predicate
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                let todayCoffeeModelList = try self.context.fetch(fetchRequest)
                let todayCoffeeList = todayCoffeeModelList.map({
                    (coffeeModel) -> Coffee in
                    let type = CoffeeType(rawValue: coffeeModel.type!)!
                    let volume = Int(coffeeModel.volume)
                    let beans = CoffeeBeans(rawValue: coffeeModel.beans!)!
                    return CoffeeFactory.coffee(with: type,
                                                volume: volume,
                                                beans: beans)
                })
                DispatchQueue.main.async {
                    completion(.success(todayCoffeeList))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
