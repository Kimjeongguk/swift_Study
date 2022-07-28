//
//  MyView.swift
//  SwiftUIPractice
//
//  Created by jeongguk on 2022/07/28.
//

import SwiftUI

struct MyView: View {
    let helloFont: Font
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(helloFont)
            Text("SwiftUI!~~")
        }
    }
}

struct MyView_Previews: PreviewProvider {
    static var previews: some View {
        MyView(helloFont: .title)
    }
}
