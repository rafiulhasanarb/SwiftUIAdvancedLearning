//
//  DependencyInjectionBootcamp.swift
//  SwiftUIAdvancedLearning
//
//  Created by rafiul hasan on 8/2/24.
//

import SwiftUI
import Combine

struct PostsModel: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class ProductionDataService {
    
    static let instance = ProductionDataService() //singleton
    
    let url: URL = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    
    func getData() -> AnyPublisher<[PostsModel], Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map({$0.data})
            .decode(type: [PostsModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

class DependencyInjectionViewModel: ObservableObject {
    
    @Published var dataArray: [PostsModel] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
        loadPost()
    }
    
    private func loadPost() {
        ProductionDataService.instance.getData()
            .sink { _ in
                
            } receiveValue: { [weak self] returnedPost in
                self?.dataArray = returnedPost
            }
            .store(in: &cancellables)
    }
}

struct DependencyInjectionBootcamp: View {
    
    @StateObject private var vm = DependencyInjectionViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(vm.dataArray) { post in
                    Text(post.title)
                    Text(post.body)
                }.padding()
            }
        }
    }
}

struct DependencyInjectionBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DependencyInjectionBootcamp()
    }
}
