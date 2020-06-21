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
    
//    lazy var calendar: Calendar = {
//        let calendar = Calendar(identifier: .gregorian)
//        calendar.locale = Locale(identifier: "ru_RU")
//    }()
    
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
                    let date = coffeeModel.date!
                    return CoffeeFactory.coffee(with: type,
                                                volume: volume,
                                                beans: beans,
                                                date: date)
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
    
    func addNewCoffee(type: CoffeeType, beans: CoffeeBeans, size: Size, completion: @escaping (Result<Coffee, Error>) -> ()) {
        DispatchQueue.global(qos: .userInitiated).async {
            let coffeeModel = CoffeeModel(context: self.context)
            coffeeModel.beans = beans.rawValue
            let now = Date()
            coffeeModel.date = now
            coffeeModel.volume = Int16(size.rawValue)
            coffeeModel.type = type.rawValue
            do {
                try self.context.save()
                DispatchQueue.main.async {
                    completion(.success(CoffeeFactory.coffee(with: type,
                                                             size: size,
                                                             beans: beans,
                                                             date: now)))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
