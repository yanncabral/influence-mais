//
//  ProgressBarView.swift
//  Influence+
//
//  Created by Mariana Resende de Paiva on 11/08/20.
//  Copyright © 2020 Yann Cabral. All rights reserved.
//

import SwiftUI

struct ProgressBar: View {
    
    var currentStep: Int;
    var progressMax: Int;
    
    var body: some View {
        VStack {
            
            Text("Passo \(self.currentStep) de 7")
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.gray)
                    .frame(width: 300, height: 10)
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.purple)
                    .frame(width: CGFloat(300*currentStep/progressMax), height: 10)
            }
        }
    }
}

struct ProgressBarView_Previews: PreviewProvider {
    
    static var previews: some View {
        ProgressBar(currentStep: 1, progressMax: 7)
    }
}

