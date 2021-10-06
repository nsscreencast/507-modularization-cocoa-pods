    import XCTest
    import Core
    @testable import Store

    final class MealStoreTests: XCTestCase {
        func testSavesMeals() {
            let store = Storage<[Meal]>.inMemory
        }
    }
