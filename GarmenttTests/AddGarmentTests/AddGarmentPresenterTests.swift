//
//  AddGarmentPresenterTests.swift
//  GarmenttTests
//
//  Created by Sanith Gelli on 26/06/22.
//

import XCTest
@testable import Garmentt

class AddGarmentPresenterTests: XCTestCase {

    var sut: AddGarmentPresenter!
    var mockInteractor = MockAddGarmentInteractor()
    var mockRouter = MockAddGarmentRouter()
    
    override func setUp() {
        sut = AddGarmentPresenter()
        sut.router = mockRouter
        sut.interactor = mockInteractor
    }

    func test_providing_nil_name_show_invoke_router_alert() {
        //Arrange
        let name: String? = nil
        
        //Act
        sut.addGarment(name: name)
        
        //Assert
        XCTAssertEqual(mockRouter.showCancelAlertCallCount, 1)
        XCTAssertEqual(mockRouter.alertMessage, AlertMessages.emptyName.rawValue)
    }
    
    func test_providing_valid_name_show_invoke_interactor_to_save() {
        //Arrange
        let name: String? = "name"
        
        //Act
        sut.addGarment(name: name)
        
        //Assert
        XCTAssertEqual(mockRouter.showCancelAlertCallCount, 0)
        XCTAssertEqual(mockInteractor.addGarmentCallCount, 1)
    }
    
    func test_on_successful_saving_should_pop() {
        //Arrange
        let name: String? = "name"
        
        //Act
        sut.addGarment(name: name)
        
        //Assert
        XCTAssertEqual(mockRouter.showCancelAlertCallCount, 0)
        XCTAssertEqual(mockInteractor.addGarmentCallCount, 1)
        XCTAssertEqual(mockRouter.popCallCount, 1)
    }
    
    func test_on_failed_saving_should_pop() {
        //Arrange
        let name: String? = "name"
        mockInteractor.addGarmentResult = false
        
        //Act
        sut.addGarment(name: name)
        
        //Assert
        XCTAssertEqual(mockInteractor.addGarmentCallCount, 1)
        XCTAssertEqual(mockRouter.popCallCount, 0)
        XCTAssertEqual(mockRouter.showCancelAlertCallCount, 1)
        XCTAssertEqual(mockRouter.alertMessage, AlertMessages.failedToSave.rawValue)
    }
}
