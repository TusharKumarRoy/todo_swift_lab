//
//  ContentView.swift
//  todolist
//
//  Created by macos on 28/3/26.
//

import SwiftUI

class ListItemViewModel: ObservableObject {
    @Published var text: String = ""
}

struct ListItemView: View {
    let name: String
    @StateObject var viewModel = ListItemViewModel()
    
    var body: some View {
        HStack {
            Text(name)
                .padding(.trailing, 64)
            TextField("add/edit description", text: $viewModel.text)
            Button("Save") {}
        }
    }
}

struct ListView: View {
    @State private var text: String = ""
    private let contacts: [String] = ["Todo1", "Todo2", "Todo3","Todo4","Todo5"]
    
    
    var body: some View {
        VStack {
            TextField("Search", text: $text)
            List {
                ForEach(contacts, id: \.self) { contact in
                    if contact.contains(text) || text.isEmpty {
                        ListItemView(name: contact)
                    }
                }
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        ListView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
