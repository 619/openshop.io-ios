import SwiftUI

struct FoodDeliveryHomeView: View {
    @State private var searchText = ""
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.white.ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 0) {
                        // Status Bar Spacer
                        Rectangle()
                            .fill(Color.clear)
                            .frame(height: geometry.safeAreaInsets.top)
                        
                        // Header Section
                        headerSection
                        
                        // Search Bar
                        searchBar
                        
                        // Food Categories
                        foodCategories
                        
                        // Filter Options
                        filterOptions
                        
                        // Only Available Here Section
                        onlyAvailableHereSection
                        
                        // Featured Section
                        featuredSection
                        
                        Spacer(minLength: 100) // Space for tab bar
                    }
                }
                .ignoresSafeArea(edges: .top)
                
                // Bottom Tab Bar
                VStack {
                    Spacer()
                    bottomTabBar
                }
            }
        }
    }
    
    // MARK: - Header Section
    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text("Deliver now")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    
                    HStack(spacing: 4) {
                        Text("633 Rose Ave")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.black)
                        
                        Image(systemName: "chevron.down")
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                    }
                }
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "bell")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 15)
        }
    }
    
    // MARK: - Search Bar
    private var searchBar: some View {
        HStack(spacing: 12) {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .font(.system(size: 16))
            
            TextField("Search Postmates", text: $searchText)
                .font(.system(size: 16))
                .foregroundColor(.gray)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        .background(Color(UIColor.systemGray6))
        .cornerRadius(12)
        .padding(.horizontal, 20)
        .padding(.top, 25)
    }
    
    // MARK: - Food Categories
    private var foodCategories: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 40) {
                ForEach(foodCategoryData, id: \.name) { category in
                    VStack(spacing: 12) {
                        Text(category.emoji)
                            .font(.system(size: 45))
                        
                        Text(category.name)
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(.black)
                    }
                }
            }
            .padding(.horizontal, 20)
        }
        .padding(.top, 35)
    }
    
    // MARK: - Filter Options
    private var filterOptions: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                FilterChip(icon: "figure.walk", text: "PICKUP", isSelected: false)
                FilterChip(icon: "tag", text: "OFFERS", isSelected: false)
                FilterChip(text: "DELIVERY FEE", hasDropdown: true, isSelected: false)
                FilterChip(text: "UNDER 30 MIN", isSelected: false)
            }
            .padding(.horizontal, 20)
        }
        .padding(.top, 25)
    }
    
    // MARK: - Only Available Here Section
    private var onlyAvailableHereSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("Only available here")
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(.black)
                
                Spacer()
                
                Image(systemName: "arrow.right")
                    .foregroundColor(.gray)
                    .font(.system(size: 16))
            }
            .padding(.horizontal, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    RestaurantCard(
                        imageName: "sushi_image",
                        restaurantName: "SUGARFISH",
                        benefits: "Uber One benefits apply",
                        rating: "Best Overall",
                        deliveryTime: "20 min",
                        isFavorited: false,
                        backgroundColor: Color.pink.opacity(0.3)
                    )
                    
                    RestaurantCard(
                        imageName: "pasta_image",
                        restaurantName: "Uovo",
                        benefits: "Uber One benefits apply",
                        rating: "Best Overall",
                        deliveryTime: "40 min",
                        isFavorited: true,
                        backgroundColor: Color.yellow.opacity(0.4)
                    )
                }
                .padding(.horizontal, 20)
            }
        }
        .padding(.top, 35)
    }
    
    // MARK: - Featured Section
    private var featuredSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("Featured on Postmates")
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(.black)
                
                Spacer()
                
                Image(systemName: "arrow.right")
                    .foregroundColor(.gray)
                    .font(.system(size: 16))
            }
            .padding(.horizontal, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    FeaturedRestaurantCard(
                        imageName: "goop_kitchen",
                        restaurantName: "goop\nkitchen",
                        backgroundColor: Color.green.opacity(0.2)
                    )
                    
                    FeaturedRestaurantCard(
                        imageName: "healthy_food",
                        restaurantName: "Fresh Bowl",
                        backgroundColor: Color.orange.opacity(0.2)
                    )
                }
                .padding(.horizontal, 20)
            }
        }
        .padding(.top, 35)
    }
    
    // MARK: - Bottom Tab Bar
    private var bottomTabBar: some View {
        HStack(spacing: 0) {
            TabBarItem(icon: "house.fill", text: "Home", isSelected: true)
            TabBarItem(icon: "bag", text: "Shop", isSelected: false)
            TabBarItem(icon: "safari", text: "Browse", isSelected: false)
            TabBarItem(icon: "cart", text: "Carts", isSelected: false)
            TabBarItem(icon: "person.circle", text: "Account", isSelected: false)
        }
        .padding(.vertical, 12)
        .background(Color.white)
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: -5)
    }
}

// MARK: - Supporting Views

struct FilterChip: View {
    let icon: String?
    let text: String
    let hasDropdown: Bool
    let isSelected: Bool
    
    init(icon: String? = nil, text: String, hasDropdown: Bool = false, isSelected: Bool = false) {
        self.icon = icon
        self.text = text
        self.hasDropdown = hasDropdown
        self.isSelected = isSelected
    }
    
    var body: some View {
        HStack(spacing: 6) {
            if let icon = icon {
                Image(systemName: icon)
                    .font(.system(size: 12))
                    .foregroundColor(.black)
            }
            
            Text(text)
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(.black)
            
            if hasDropdown {
                Image(systemName: "chevron.down")
                    .font(.system(size: 10))
                    .foregroundColor(.black)
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(Color(UIColor.systemGray6))
        .cornerRadius(20)
    }
}

struct RestaurantCard: View {
    let imageName: String
    let restaurantName: String
    let benefits: String
    let rating: String
    let deliveryTime: String
    let isFavorited: Bool
    let backgroundColor: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            ZStack(alignment: .topTrailing) {
                // Restaurant image placeholder
                Rectangle()
                    .fill(backgroundColor)
                    .frame(width: 300, height: 180)
                    .cornerRadius(12)
                    .overlay(
                        // Simulate food image with emoji
                        Group {
                            if restaurantName == "SUGARFISH" {
                                Text("🍣")
                                    .font(.system(size: 80))
                            } else {
                                Text("🍝")
                                    .font(.system(size: 80))
                            }
                        }
                    )
                
                if isFavorited {
                    Button(action: {}) {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.gray)
                            .font(.system(size: 18))
                            .padding(12)
                    }
                }
            }
            
            VStack(alignment: .leading, spacing: 6) {
                Text(restaurantName)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)
                
                HStack(spacing: 4) {
                    Image(systemName: "crown.fill")
                        .foregroundColor(.orange)
                        .font(.system(size: 12))
                    
                    Text(benefits)
                        .font(.system(size: 13))
                        .foregroundColor(.orange)
                }
                
                HStack(spacing: 4) {
                    Image(systemName: "trophy.fill")
                        .foregroundColor(.black)
                        .font(.system(size: 12))
                    
                    Text(rating)
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(.black)
                    
                    Text("•")
                        .font(.system(size: 13))
                        .foregroundColor(.gray)
                    
                    Text(deliveryTime)
                        .font(.system(size: 13))
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal, 4)
        }
        .frame(width: 300)
    }
}

struct FeaturedRestaurantCard: View {
    let imageName: String
    let restaurantName: String
    let backgroundColor: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Restaurant image placeholder
            Rectangle()
                .fill(backgroundColor)
                .frame(width: 300, height: 180)
                .cornerRadius(12)
                .overlay(
                    VStack {
                        Text("🥗")
                            .font(.system(size: 80))
                        
                        // Simulate "goop kitchen" logo
                        if restaurantName.contains("goop") {
                            Text("goop\nkitchen")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.green)
                                .multilineTextAlignment(.leading)
                                .padding(.top, 10)
                        }
                    }
                )
        }
        .frame(width: 300)
    }
}

struct TabBarItem: View {
    let icon: String
    let text: String
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.system(size: 22))
                .foregroundColor(isSelected ? .black : .gray)
            
            Text(text)
                .font(.system(size: 11))
                .foregroundColor(isSelected ? .black : .gray)
        }
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Data Models

struct FoodCategory {
    let name: String
    let emoji: String
}

let foodCategoryData = [
    FoodCategory(name: "Pizza", emoji: "🍕"),
    FoodCategory(name: "Sushi", emoji: "🍣"),
    FoodCategory(name: "Sandwich", emoji: "🥪"),
    FoodCategory(name: "Grocery", emoji: "🍌"),
    FoodCategory(name: "Healthy", emoji: "🥗")
]

// MARK: - Preview

struct FoodDeliveryHomeView_Previews: PreviewProvider {
    static var previews: some View {
        FoodDeliveryHomeView()
    }
}
