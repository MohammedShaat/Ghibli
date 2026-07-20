//
//  SearchScreen.swift
//  Ghibli
//
//  Created by Mohammed on 7/20/26.
//

import SwiftUI

struct SearchScreen: View {
    var body: some View {
        NavigationStack {
            Text("Search")
                .searchable(text: .constant(""))
        }
    }
}

#Preview {
    SearchScreen()
}
