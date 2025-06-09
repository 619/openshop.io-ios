# Food Delivery App - iOS SwiftUI Recreation

This is a SwiftUI recreation of a food delivery app interface (similar to Postmates/Uber Eats) based on the provided screenshot.

## Features Implemented

### 🏠 Main Home Screen
- **Status Bar**: Shows time (9:41) and system indicators
- **Header Section**: 
  - "Deliver now" text with delivery address (633 Rose Ave)
  - Dropdown arrow for address selection
  - Notification bell icon
- **Search Bar**: "Search Postmates" with magnifying glass icon
- **Food Categories**: Horizontal scrolling categories with emojis
  - Pizza 🍕
  - Sushi 🍣  
  - Sandwich 🥪
  - Grocery 🍌
  - Healthy 🥗

### 🔍 Filter Options
- PICKUP (with walk icon)
- OFFERS (with tag icon)  
- DELIVERY FEE (with dropdown)
- UNDER 30 MIN

### 🏪 Restaurant Sections

#### "Only available here" Section
- **SUGARFISH**: Sushi restaurant with pink background
  - Uber One benefits apply
  - Best Overall rating
  - 20 min delivery time
  
- **Uovo**: Pasta restaurant with yellow background
  - Uber One benefits apply  
  - Best Overall rating
  - 40 min delivery time
  - Heart icon (favorited)

#### "Featured on Postmates" Section
- **goop kitchen**: Healthy food with green branding
- **Fresh Bowl**: Healthy options with orange background

### 📱 Bottom Navigation
- **Home** (selected/active)
- **Shop** 
- **Browse**
- **Carts**
- **Account**

## Technical Implementation

### SwiftUI Components Used
- `ScrollView` for main content and horizontal scrolling sections
- `VStack`/`HStack` for layout structure
- `GeometryReader` for safe area handling
- `ZStack` for overlaying elements
- Custom view components for reusability

### Key Custom Views
- `FilterChip`: Reusable filter buttons
- `RestaurantCard`: Restaurant display cards with images, ratings, and details
- `FeaturedRestaurantCard`: Simplified cards for featured section
- `TabBarItem`: Bottom navigation items

### Design Features
- Accurate spacing and typography matching the original
- Color-coded restaurant cards with emoji placeholders
- Proper safe area handling for modern iOS devices
- Shadow effects on bottom tab bar
- Rounded corners and proper padding throughout

## Files Structure
```
FoodDeliveryApp.swift          # Main app entry point
ContentView.swift              # Root content view
FoodDeliveryHomeView.swift     # Main home screen implementation
```

## Usage
1. Add these files to your Xcode project
2. Ensure you have SwiftUI enabled (iOS 13+)
3. Run the app to see the recreated interface

## Notes
- Images are represented with emojis as placeholders
- All interactive elements are set up but not fully functional (buttons, navigation)
- The design closely matches the original screenshot with proper spacing and typography
- Responsive design that works on different iOS device sizes

