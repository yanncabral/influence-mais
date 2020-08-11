//
//  Page4.swift
//  Influence+
//
//  Created by Mariana Resende de Paiva on 05/08/20.
//  Copyright © 2020 Yann Cabral. All rights reserved.
//

import SwiftUI

struct Contacts: View {
    
    var tutors: [Tutor] = []
    
    var body: some View {
        NavigationView {
            List(tutors) {tutor in
                TutorCell(tutor: tutor)
            }
            .navigationBarTitle(Text("Contatos"))
        }
    }
}

#if DEBUG
struct Page3_Previews: PreviewProvider {
    static var previews: some View {
        Contacts(tutors: testData)
    }
}

#endif


struct TutorCell: View {
    let tutor: Tutor
    var body: some View {
        
        return NavigationLink(destination: Contactsinfo(name: tutor.name, headline: tutor.headline, bio: tutor.bio)) {
            Image(tutor.imageName)
                .cornerRadius(40)
            VStack(alignment: .leading) {
                Text(tutor.name)
                Text(tutor.headline)
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
            }
            
        }
    }
    
    
}

