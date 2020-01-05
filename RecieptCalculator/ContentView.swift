//
//  ContentView.swift
//  RecieptCalculator
//
//  Created by Rohan Battula on 12/27/19.
//  Copyright © 2019 Rohan Battula. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
	let pplCount = [1,2,3,4,5,6,7,8,9,10]
	@State private var numStr = 0;
	@State private var total = ""
	@State private var tip = ""
	@State private var str = ["", "", "", "", "", "","","","", ""]
    var body: some View {
		NavigationView{
			Form{
				Section{
					Picker("Select # of People", selection: $numStr) {
						ForEach(0 ..< pplCount.count) {
							Text("\(self.pplCount[$0])")
								.fontWeight(.light)
						}
					}
				}
				Section{
					ForEach(0...numStr, id: \.self) { num in
						HStack(alignment: .center){
							Text("Person \(num+1):")
								.fontWeight(.light)
							TextField("Enter Here", text: self.$str[num])
							.keyboardType(.decimalPad)
							.padding(.all)
						}
						
					}
				}
				
				Section{
					HStack(alignment: .center){
						Text("Total Bill:")
							.fontWeight(.light)
						TextField("Enter Here", text: $total)
						.keyboardType(.decimalPad)
						.padding(.all)
					}
					HStack(alignment: .center){
						Text("Tip:")
							.fontWeight(.light)
						TextField("Enter Here", text: $tip)
						.keyboardType(.decimalPad)
						.padding(.all)
					}
				}
			}
			.navigationBarTitle("Venmo Requests")
		
			
		}
		
		
        
    }
	
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		ContentView()
		 .environment(\.colorScheme, .dark)
    }
}
