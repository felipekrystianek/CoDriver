//
//  LocationSearchView.swift
//  co-driver
//
//  Created by Krystian Filipek on 23/12/2022.
//

import SwiftUI

struct LocationSearchView: View {
    @State private var startLocationText = ""
    @Binding var mapState: MapViewState
    @EnvironmentObject var viewModel: LocationSearchViewModel
    
    var body: some View {
        VStack {
            //header view
            HStack {
                VStack {
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 6, height: 6)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 24)
                    
                    Circle()
                        .fill(.black)
                        .frame(width: 6, height: 6)
                }
                VStack {
                    TextField("Aktualna lokalizacja", text:
                        $startLocationText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.trailing)
                    
                    TextField("Dokąd to?", text:
                        $viewModel.queryFragment)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.trailing)

                }
            }
            .padding(.horizontal)
            .padding(.top, 64)
            
            Divider()
                .padding(.vertical)
            
            
            //list view
            
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(viewModel.results, id: \.self) { result in
                        
                        LocationSearchResultCell(title:
                            result.title, subtitle:
                            result.subtitle)
                        .onTapGesture {
                            viewModel.selectLocation(result)
                            mapState = .locationSelected
                            
                        }
                    }
                }
            }
        }
        .background(.white)
    }
}

struct LocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchView(mapState: .constant(.searchingForLocation))
    }
}
