//
//  CenterModifier.swift
//  Africa
//
//  Created by Patrick Habib on 8/17/21.
//

import SwiftUI

struct CenterModifier: ViewModifier{
    func body(content: Content) -> some View {
        HStack
        {
            Spacer()
            content
            Spacer()
        }
    }
}
