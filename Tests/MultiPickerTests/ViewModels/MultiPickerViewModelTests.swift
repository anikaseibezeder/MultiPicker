//
//  MultiPickerViewModelTests.swift
//
//
//  Created by Anika Seibezeder on 13.05.21.
//

import XCTest
@testable import MultiPicker

class MultiPickerViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: - Test functions

    func testSelectedOptionsTextEmpty() throws {
        let selection = Set<String>()

        let viewModel = MultiPickerViewModel(selection: selection,
                                              optionToString: { $0 })

        XCTAssertEqual("", viewModel.selectedOptionsText)
    }
    
    func testSelectedOptionsTextOneItem() throws {
        let selection: Set<String> = ["Option 1"]

        let viewModel = MultiPickerViewModel(selection: selection,
                                              optionToString: { $0 })

        XCTAssertEqual("Option 1", viewModel.selectedOptionsText)
    }
    
    func testSelectedOptionsTextTwoItems() throws {
        let selection: Set<String> = ["Option 1", "Option 2"]

        let viewModel = MultiPickerViewModel(selection: selection,
                                              optionToString: { $0 })

        XCTAssertEqual("2 Selected", viewModel.selectedOptionsText)
    }
}

