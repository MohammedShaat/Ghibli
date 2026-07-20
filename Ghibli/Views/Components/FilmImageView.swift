//
//  FilmImageView.swift
//  Ghibli
//
//  Created by Mohammed on 7/19/26.
//

import SwiftUI

struct FilmImageView: View {
    let urlString: String
    
    var body: some View {
        AsyncImage(url: URL(string: urlString)) { phase in
            Group {
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                default:
                    Image(systemName: "photo.slash")
                }
            }
        }
    }
}

#Preview {
    VStack {
        FilmImageView(urlString: UIImage.urlOf("poster")!.absoluteString)
            .frame(width: 100, height: 200)
        
        FilmImageView(urlString: UIImage.urlOf("banner")!.absoluteString)
            .frame(height: 200)
    }
}
