//
//  ContentView.swift
//  Ghibli
//
//  Created by Mohammed on 7/18/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        FilmsListView(service: ApiGhibliService())
    }
}

#Preview {
    ContentView()
}
