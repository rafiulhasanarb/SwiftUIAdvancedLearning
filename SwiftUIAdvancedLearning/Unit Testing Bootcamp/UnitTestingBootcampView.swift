//
//  UnitTestingBootcampView.swift
//  SwiftUIAdvancedLearning
//
//  Created by rafiul hasan on 8/2/24.
//

/*
 1. Unit Tests
 - Test the business logic in your app
 
 2. UI Tests
 - Test the UI of your app
 */

import SwiftUI

struct UnitTestingBootcampView: View {
    
    @StateObject private var vm: UnitTestingBootcampViewModel
    
    init(isPremium: Bool) {
        _vm = StateObject(wrappedValue: UnitTestingBootcampViewModel(isPremium: isPremium))
    }
    
    var body: some View {
        Text(vm.isPremium.description)
    }
}

struct UnitTestingBootcampView_Previews: PreviewProvider {
    static var previews: some View {
        UnitTestingBootcampView(isPremium: true)
    }
}
