//
//  UnitTestingBootcampViewModel_Tests.swift
//  SwiftUIAdvancedLearning_Tests
//
//  Created by rafiul hasan on 8/2/24.
//

import XCTest
@testable import SwiftUIAdvancedLearning

// Naming Structure: test_unitOfWork_stateUnderTest_expectedBehavior
// Naming Structure: test_[struct or class]_[variable or function]_[expected results]
// Testing Structure: Given, When, Then

final class UnitTestingBootcampViewModel_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func test_UnitTestingBootcampViewModel_isPremium_shouldBeTrue() {
        //Given
        let userIsPremium: Bool = true
        
        //When
        let vm = UnitTestingBootcampViewModel(isPremium: userIsPremium)
        
        //Then
        XCTAssertTrue(vm.isPremium)
    }
    
    func test_UnitTestingBootcampViewModel_isPremium_shouldBeFalse() {
        //Given
        let userIsPremium: Bool = false
        
        //When
        let vm = UnitTestingBootcampViewModel(isPremium: userIsPremium)
        
        //Then
        XCTAssertFalse(vm.isPremium)
    }
    
    func test_UnitTestingBootcampViewModel_isPremium_shouldBeInjectedValues() {
        //Given
        let userIsPremium: Bool = Bool.random()
        
        //When
        let vm = UnitTestingBootcampViewModel(isPremium: userIsPremium)
        
        //Then
        XCTAssertEqual(vm.isPremium, userIsPremium)
    }
    
    func test_UnitTestingBootcampViewModel_isPremium_shouldBeInjectedValues_stress() {
        for _ in 0 ..< 100 {
            //Given
            let userIsPremium: Bool = Bool.random()
            
            //When
            let vm = UnitTestingBootcampViewModel(isPremium: userIsPremium)
            
            //Then
            XCTAssertEqual(vm.isPremium, userIsPremium)
        }
    }
    
    func test_UnitTestingBootcampViewModel_dataArray_shouldBeEmpty() {
        //Given
        
        //When
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        //Then
        XCTAssertTrue(vm.dataArray.isEmpty)
        XCTAssertEqual(vm.dataArray.count, 0)
    }
    
    func test_UnitTestingBootcampViewModel_dataArray_shouldBeAddItem() {
        //Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        //When
        //vm.addItem(item: "Rafi")
        
        let loopCount: Int = Int.random(in: 1..<100)
        for _ in 0..<loopCount {
            vm.addItem(item: UUID().uuidString)
        }
        
        //Then
        XCTAssertTrue(!vm.dataArray.isEmpty)
        XCTAssertFalse(vm.dataArray.isEmpty)
        XCTAssertEqual(vm.dataArray.count, loopCount)
        XCTAssertNotEqual(vm.dataArray.count, 0)
        XCTAssertGreaterThan(vm.dataArray.count, 0)
        //XCTAssertGreaterThanOrEqual
        //XCTAssertLessThan
        //XCTAssertLessThanOrEqual
    }
    
    func test_UnitTestingBootcampViewModel_dataArray_shouldBeNotAddBlankString() {
        //Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        //When
        vm.addItem(item: "")
        
        //Then
        XCTAssertTrue(vm.dataArray.isEmpty)
    }
    
    func test_UnitTestingBootcampViewModel_selectedItem_shouldStartAsNil() {
        //Given
        
        //When
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
                
        //Then
        XCTAssertTrue(vm.selectedItem == nil)
        XCTAssertNil(vm.selectedItem)
    }
    
    func test_UnitTestingBootcampViewModel_selectedItem_shouldBeNilWhenSelectedingInvalidItem() {
        //Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        //When
        vm.selectItem(item: UUID().uuidString)
                
        //Then
        XCTAssertNil(vm.selectedItem)
    }
    
    func test_UnitTestingBootcampViewModel_selectedItem_shouldBeSelected() {
        //Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        //When
        let newItem = UUID().uuidString
        vm.addItem(item: newItem)
        vm.selectItem(item: newItem)
                
        //Then
        XCTAssertNotNil(vm.selectedItem)
        XCTAssertEqual(vm.selectedItem, newItem)
    }
}
