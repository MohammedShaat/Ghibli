//
//  GhibliTests.swift
//  GhibliTests
//
//  Created by Mohammed on 7/18/26.
//

import Testing
import Foundation
@testable import Ghibli

@MainActor
struct GhibliTests {

    @Test func example() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        // Swift Testing Documentation
        // https://developer.apple.com/documentation/testing
    }
    
    let service = TestGhibliService()

    
    @Test func initialStateIsCorrect() {
        let viewModel = SearchViewModel(service: service)
        
        #expect(viewModel.state == .idle)
    }
    
    @Test func stateWithVaildQuery() async {
        let viewModel = SearchViewModel(service: service)
        
        viewModel.searchText = "castle"
        await viewModel.search()
        
        if case .loaded(let films) = viewModel.state {
            #expect(films.count > 0)
        } else {
            Issue.record("Expected state to be .loaded with films")
        }
    }
    
    @Test func stateWithInVaildQuery() async {
        let viewModel = SearchViewModel(service: service)
        
        viewModel.searchText = "unknown"
        await viewModel.search()
        
        if case .loaded(let films) = viewModel.state {
            #expect(films.isEmpty)
        } else {
            Issue.record("Expected state to be .loaded with empty array")
        }
    }

    @Test func searchIsDelayed() async {
        let viewModel = SearchViewModel(service: service)

        viewModel.searchText = "castle"
        
        async let fetch = viewModel.search()
        async let check = {
            try? await Task.sleep(for: .seconds(0.3))
            await MainActor.run {
                #expect(viewModel.state == .idle)
            }
        }()
        _ = await (fetch, check)
    }
    
    @Test func searchIsCancelled() async {
        let viewModel = SearchViewModel(service: service)

        viewModel.searchText = "castle"

        let fetch = Task {
            await viewModel.search()
        }
        
        let cancellation = Task {
            try? await Task.sleep(for: .seconds(0.3))
            fetch.cancel()
            try? await Task.sleep(for: .seconds(1))
            #expect(viewModel.state == .idle)
        }
        _ = await (fetch.value, cancellation.value)
        
    }
    
    @Test func searchNotRepeated() async {
        let service = TestGhibliService(duration: .seconds(1))
        let viewModel = SearchViewModel(service: service)

        viewModel.searchText = "castle"

        async let fetch = {
            await viewModel.search()    // Finishes in 1.5
            await viewModel.search()    // Finishes in 3
        }()
        
        async let checkRepetition = {
            try? await Task.sleep(for: .seconds(1.5 + 0.5 + 0.1))
            await MainActor.run {
                #expect(viewModel.state != .loading)
            }
        }()
        _ = await (fetch, checkRepetition)
        
    }
}
