//
//  PersonViewModel.swift
//  SesacWeek9
//
//  Created by Kim TaeSoo on 2022/08/31.
//

import Foundation

class TMDBPersonViewModel {
    var list: Observable<Person> = Observable(Person(page: 0, totalPages: 0, totalResults: 0, results: []))
    
    func fetchPerson(query: String) {
        TMDBPersonAPIManager.requestPerson(query: query) { person, error in
            guard let person else { return }
            self.list.value = person
        }
    }
    
    var numberOfRowsInSection: Int {
        return list.value.results.count
    }
    func cellForRowAt(at indexPath: IndexPath) -> Result {
        return list.value.results[indexPath.row]
    }
}
