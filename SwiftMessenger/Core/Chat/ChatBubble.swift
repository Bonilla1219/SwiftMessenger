//
//  ChatBubble.swift
//  SwiftMessenger
//
//  Created by Javier Bonilla on 12/18/23.
//

import SwiftUI

struct ChatBubble: Shape {
    let isFromCurrentUser: Bool
    
    func path(in rect: CGRect) -> Path {
        //UIBezierPath lets you choose what corners of a rectange are rounded
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, . topRight, isFromCurrentUser ? .bottomLeft : .bottomRight], cornerRadii: CGSize(width: 16, height: 16))
        
        return Path(path.cgPath)
    }
}

#Preview {
    ChatBubble(isFromCurrentUser: true)
}
