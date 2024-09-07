//
//  HomeScreen.swift
//  little-lemon-final-assigment
//
//  Created by Nguyen Ngoc Binh on 9/4/24.
//

import SwiftUI
import CoreData
struct HomeScreen: View {
    @StateObject private var viewModel = ViewModel()
    @State var searchText : String = ""

    @State var startersIsEnabled = true
    @State var mainsIsEnabled = true
    @State var dessertsIsEnabled = true
    @State var drinksIsEnabled = true

    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HomeHeader()
                OBHeroSection()
                SearchBar(searchText: $searchText)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        Toggle("Starters", isOn: $startersIsEnabled)
                        Toggle("Mains", isOn: $mainsIsEnabled)
                        Toggle("Desserts", isOn: $dessertsIsEnabled)
                        Toggle("Drinks", isOn: $drinksIsEnabled)
                    }
                    .toggleStyle(LiLeToggleStyle())
                    .padding()
                }
                FetchedObjects(predicate: buildPredicate(),
                               sortDescriptors: buildSortDescriptors()) {
                    (dishes: [Dish]) in
                    List(dishes) { dish in
                        NavigationLink(destination: DetailItem(dish: dish)) {
                            FoodItem(dish: dish)
                        }
                    }
                    .listStyle(.plain)
                }
            }
        }
        .frame(alignment: .top)
        .navigationBarBackButtonHidden()
        .onAppear {
            viewModel.getMenuData(viewContext: viewContext)
        }
    }

    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title",
                                 ascending: true,
                                 selector:
                                    #selector(NSString.localizedStandardCompare))]
    }

    func buildPredicate() -> NSCompoundPredicate {
        print("buildPredicate \(startersIsEnabled)")
        let search = searchText == "" ? NSPredicate(value: true) : NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        let starters = !startersIsEnabled ? NSPredicate(format: "category != %@", "starters") : NSPredicate(value: true)
        let mains = !mainsIsEnabled ? NSPredicate(format: "category != %@", "mains") : NSPredicate(value: true)
        let desserts = !dessertsIsEnabled ? NSPredicate(format: "category != %@", "desserts") : NSPredicate(value: true)
        let drinks = !drinksIsEnabled ? NSPredicate(format: "category != %@", "drinks") : NSPredicate(value: true)

        let compoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [search, starters, mains, desserts, drinks])
        return compoundPredicate
    }
}

#Preview {
    HomeScreen()
}
