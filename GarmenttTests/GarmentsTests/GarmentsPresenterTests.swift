//
//  GarmentsPresenterTests.swift
//  GarmenttTests
//
//  Created by Sanith Gelli on 26/06/22.
//

import XCTest
@testable import Garmentt

class GarmentsPresenterTests: XCTestCase {
    
    var sut: GarmentsPresenter!
    var mockGarentsRouter = MockGarmentsRouter()
    var mockGarmentsInteractor = MockGarmentsInteractor()
    var mockGrmentsDisplay = MockGarmentsDisplay()
    
    override func setUp() {
        sut = GarmentsPresenter()
        sut.interactor = mockGarmentsInteractor
        sut.router = mockGarentsRouter
        sut.view = mockGrmentsDisplay
    }
    
    func test_setup_ui_on_view_did_load() {
        //Arrange
        
        //Act
        sut.viewDidLoad()
        
        //Assert
        XCTAssertEqual(mockGrmentsDisplay.setUpNavUICallCount, 1)
    }
    
    func test_load_data_on_view_did_appear_and_reload_ui_in_view() {
        //Arrange
        
        //Act
        sut.viewDidAppear()
        let expectations = expectation(description: "reload")
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(2)) {
            expectations.fulfill()
            XCTAssertEqual(self.mockGarmentsInteractor.loadGarmentsCallCount, 1)
            XCTAssertEqual(self.mockGrmentsDisplay.reloadCallCount, 1)
        }
        //Assert
        waitForExpectations(timeout: 3, handler: nil)
    }
    
    func test_sorting_in_alphabet_order() {
        //Arrange
        let names = ["Newyork", "Paris", "Japan", "South Korea"]
        var garments: [GarmentViewModel] = []
        for name in names {
            var garment = GarmentViewModel()
            garment.name = name
            garments.append(garment)
        }
        mockGarmentsInteractor.garments = garments
        sut.viewDidAppear()
        
        //Act
        sut.didChangedSortType(sortType: .alphabet)
        
        //Assert
        let first = sut.titleForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertEqual(first, names[2])
    }
    
    func test_sorting_in_created_order() {
        //Arrange
        let names = ["Newyork", "Paris", "Japan", "South Korea"]
        var garments: [GarmentViewModel] = []
        for (index, name) in names.enumerated() {
            var garment = GarmentViewModel()
            garment.name = name
            garment.createdDate = Calendar.current.date(byAdding: .day, value: index % 2 == 0 ? index : -index, to: Date())
            garments.append(garment)
        }
        mockGarmentsInteractor.garments = garments
        sut.viewDidAppear()

        //Act
        sut.didChangedSortType(sortType: .alphabet)
        
        //Assert
        let first = sut.titleForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertEqual(first, names[2])
    }
}
