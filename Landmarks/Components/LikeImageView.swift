//
//  LikeImageView.swift
//  Landmarks
//
//  Created by Dobrodeev Daniil on 15.11.2022.
//

import SwiftUI

struct LikeImageView: View {
    let imageType: LikeImage
    
    var body: some View {
        let sysImage = imageType == .filled ? "hand.thumbsup.fill" : "hand.thumbsup"
        return Image(systemName: sysImage)
            .resizable()
            .frame(width: likeThumbSize, height: likeThumbSize)
    }
}

enum LikeImage {
    case filled
    case outlined
}

struct LikeImageView_Previews: PreviewProvider {
    static var previews: some View {
        LikeImageView(imageType: .filled)
    }
}
