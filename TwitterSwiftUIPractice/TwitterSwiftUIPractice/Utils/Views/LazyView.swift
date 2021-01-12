//
//  LazyView.swift
//  TwitterSwiftUIPractice
//
//  Created by jb on 2021/01/12.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let build: ()->Content
    init(_ build: @autoclosure @escaping() -> Content){
        self.build=build
    }
    var body: some View {
        build()
    }
}
