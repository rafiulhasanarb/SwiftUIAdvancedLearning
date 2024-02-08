//
//  ProtocalBootcamp.swift
//  SwiftUIAdvancedLearning
//
//  Created by rafiul hasan on 8/2/24.
//

import SwiftUI

protocol ColorThemeProtocal {
    var primary: Color { get }
    var secondary: Color { get }
    var tertiary: Color { get }
}

class DefaultColorTheme: ColorThemeProtocal {
    var primary: Color = .blue
    var secondary: Color = .white
    var tertiary: Color = .orange
}

class AlternativeColorTheme: ColorThemeProtocal {
    var primary: Color = .red
    var secondary: Color = .white
    var tertiary: Color = .green
}

class AnotherColorTheme: ColorThemeProtocal {
    var primary: Color = .blue
    var secondary: Color = .white
    var tertiary: Color = .purple
}

protocol ButtonTextProtocal {
    var buttonText: String { get }
}

protocol ButtonPressedProtocal {
    func buttonPressed()
}

// protocal compositions
protocol ButtonDataSourceProtocal: ButtonTextProtocal, ButtonPressedProtocal {
    
}

class DefaultDataSource: ButtonDataSourceProtocal {
    var buttonText: String = "Protocals are awesome!!!"
    
    func buttonPressed() {
        print("Button was pressed!")
    }
}

class AlternativeDataSource: ButtonTextProtocal {
    var buttonText: String = "Protocals are lame"
}

struct ProtocalBootcamp: View {
    let colorTheme: ColorThemeProtocal
    let dataSource: ButtonDataSourceProtocal
    
    var body: some View {
        ZStack {
            colorTheme.tertiary
                .ignoresSafeArea()
            
            Text(dataSource.buttonText)
                .font(.headline)
                .foregroundColor(colorTheme.secondary)
                .padding()
                .background(colorTheme.primary)
                .cornerRadius(10)
                .onTapGesture {
                    dataSource.buttonPressed()
                }
        }
    }
}

struct ProtocalBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ProtocalBootcamp(colorTheme: DefaultColorTheme(), dataSource: DefaultDataSource())
    }
}
