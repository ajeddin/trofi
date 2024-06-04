//import SwiftUI
//import SwiftData
//
//struct MealDetailView: View {
////    var namespace: Namespace.ID
//    let meal: LoggedMeals
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 16) {
//            if let imageData = meal.imageData, let image = UIImage(data: imageData) {
//                Image(uiImage: image)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(maxWidth: 200, maxHeight: 200)
////                    .matchedGeometryEffect(id: "mealImage", in: namespace)
//
//            }
//            
//            Text("Title: \(meal.title)")
//                .font(.title2)
//                .fontWeight(.bold)
//
//            Text("Recipe/Link: \(meal.recipeLink)")
//                .font(.body)
//
//            Text("Notes: \(meal.descriptionMeal)")
//                .font(.body)
//
//            Text("Rating: \(meal.rating, specifier: "%.1f")")
//                .font(.body)
//
//            Spacer()
//        }
//        .padding()
//        .navigationTitle("Meal Details")
////        .matchedGeometryEffect(id: "mealDetails", in: namespace)
//    }
//}
//
//struct MealDetailView_Previews: PreviewProvider {
////    @Namespace static var namespace
//    
//    static var previews: some View {
//        MealDetailView(meal: LoggedMeals(type: "h", price: 10, title: "Sample Meal", descriptionMeal: "This is a sample meal.", recipeLink: "http://example.com", rating: 4.5))
//    }
//}
