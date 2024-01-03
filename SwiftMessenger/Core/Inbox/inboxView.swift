//
//  inboxView.swift
//  SwiftMessenger
//
//  Created by Javier Bonilla on 7/29/23.
//

import SwiftUI

struct inboxView: View {
    @State private var showNewMessageView = false
    @State private var user = User.MOCK_USER
    var body: some View {
        NavigationStack{
            ScrollView{
                ActiveNowView()
                
                List{
                    ForEach(0 ... 10, id: \.self){ message in
                        InboxRowView()
                    }
                }
                .listStyle(PlainListStyle())
                .frame(height: UIScreen.main.bounds.height - 120)
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            //when doing a full screen cover it does not present it as a navigation stack so we have to embedd the view in a navigation stack
            .fullScreenCover(isPresented: $showNewMessageView, content: {
                NewMessageView()
            })
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack{
                        NavigationLink(value: user) {
                            CircularProfileImageView(user: user, size: .xSmall)
                        }
                        
                        Text("Chats")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                }
                
                //button for starting a new message
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showNewMessageView.toggle()
                    } label: {
                        Image(systemName: "square.and.pencil.circle.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundStyle(.black, Color(.systemGray5))
                    }

                }
            }
        }
    }
}

struct inboxView_Previews: PreviewProvider {
    static var previews: some View {
        inboxView()
    }
}
