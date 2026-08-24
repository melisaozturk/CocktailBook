# CocktailBook

  A mobile application developed with Flutter that lists cocktail recipes and displays their details using The Cocktail DB API.

  📱 Features

  - Popular Cocktails: View the most popular cocktail recipes
  - Latest Cocktails: Browse the newest added cocktail recipes
  - Cocktail Details: View ingredients and recipe details for selected cocktails
  - Tab Navigation: Easy navigation with Cupertino tab bar
  - Device Preview: Test the app's appearance on different devices

  🏗️ Architecture

  The project is developed using the BLoC (Business Logic Component) pattern:

  - BLoC/Cubit: State management using flutter_bloc
  - Repository Pattern: Repository layer for API requests
  - Service Layer: HTTP requests with Chopper
  - Model Layer: Data modeling with JSON serialization

  🛠️ Technologies

  - Flutter SDK: >=2.12.0 <3.0.0
  - State Management: flutter_bloc ^8.0.1
  - Navigation: go_router ^3.1.0
  - HTTP Client: chopper ^4.0.1
  - Code Generation:
    - chopper_generator ^4.0.1
    - json_serializable ^6.1.3
    - build_runner ^2.0.5
  - Environment Variables: flutter_dotenv ^5.0.2
  - Device Preview: device_preview ^1.0.0
  - Testing:
    - mockito ^5.0.17
    - bloc_test ^9.0.2
