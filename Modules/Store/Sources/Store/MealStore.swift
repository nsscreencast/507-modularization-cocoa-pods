//
//  MealStore.swift
//  DinnerTime
//
//  Created by Ben Scheirman on 6/4/21.
//

import Foundation
import Core

public extension Notification.Name {
    static let mealsChanged = NSNotification.Name("mealsChanged")
}

public class MealStore {
    public private(set) var meals: [Meal] {
        didSet {
            mealsChanged()
        }
    }
    
    private let storage: Storage<[Meal]>
    private let calendar: Calendar
    private let sendNotification: (Notification.Name, AnyObject?) -> Void
    
    public init(storage: Storage<[Meal]>, calendar: Calendar, sendNotification: @escaping (Notification.Name, AnyObject?) -> Void) {
        self.storage = storage
        meals = []
        self.calendar = calendar
        self.sendNotification = sendNotification
    }
    
    public func meals(on date: Date) -> [Meal] {
        let components = calendar.dateComponents([.day, .month, .year], from: date)
        return meals.filter { meal in
            let mealComponents = calendar.dateComponents([.day, .month, .year], from: meal.date)
            return mealComponents == components
        }
    }
    
    public func update(_ meal: Meal) {
        guard let existingIndex = meals.firstIndex(where: { $0.identifier == meal.identifier }) else {
             fatalError("This meal doesn't exist in the store. Call add instead.")
        }
        meals[existingIndex] = meal
    }
    
    public func add(_ meal: Meal) {
        guard !meals.contains(where: { $0.identifier == meal.identifier }) else {
            fatalError("This meal already exists in the store")
        }
        meals.append(meal)
    }
    
    public func remove(_ meal: Meal) {
        meals.removeAll(where: { $0.identifier == meal.identifier })
    }
    
    private func mealsChanged() {
        do {
            print("Saving meals")
            try save()
        } catch {
            print("Error saving meals: \(error)")
        }
        sendNotification(.mealsChanged, self)
    }

    public func load() throws {
        meals = try storage.load() ?? []
    }
    
    public func save() throws {
        try storage.save(meals)
    }
    
    public func clear() throws {
        try storage.removeAllData()
    }
}
