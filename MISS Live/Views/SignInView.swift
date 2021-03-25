//
//  SignInView.swift
//  MISS Live
//
//  Created by yushi kida on 2021/03/14.
//

import SwiftUI

struct SignInView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var coordinator: SignInWithAppleCoordinator?
    
    var body: some View {
        SignInWithAppleButton()
            .frame(width: 280, height: 45)
            .onTapGesture {
                self.coordinator = SignInWithAppleCoordinator()
                if let coordinator = self.coordinator {
                    coordinator.startSignInWithAppleFlow {
                        print("You successfully signed in")
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
