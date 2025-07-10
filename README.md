# MovieApp
A simple movie app using Clean Architecture + MVVM
# ✨ Features

- Displays a grid of popular movies (poster + title).
- Navigates to a detailed screen with:
   Poster image
Movie title
Release date
Overview
Favorite button to toggle state (stored in-memory/UserDefaults).
Handles loading and error states gracefully.
🏗️ Architecture

🔷 Clean Architecture Layers
Presentation Layer
MoviesListViewController, MovieDetailsViewController
ViewModels: MoviesListViewModel, MovieDetailsViewModel
Coordinator: MoviesCoordinator
Domain Layer
UseCases: FetchMoviesUseCase, FetchMovieDetailsUseCase
Data Layer
Repository protocols + implementations: MoviesRepository, MoviesRepositoryImpl
Remote Data Sources using APIClient
Core Layer
APIClient: generic network layer using URLSession
Endpoints: constructs TMDB API requests
🔷 Design Patterns Used
MVVM for separation of UI logic and business logic.
Coordinator Pattern for navigation handling.
Dependency Injection using AppDIContainer.
SPM (Swift Package Manager) for external dependencies management.
🔌 Third-party Dependencies

Alamofire for networking. (Bonus point)
Kingfisher for asynchronous image loading.
🚀 Setup & Run

Clone the repository:
git clone https://github.com/yourusername/MovieExplorerApp.git
cd MovieExplorerApp
Install dependencies via SPM (already configured in Xcode).
Build & run on iOS Simulator or device.


🎯 Trade-offs & Notes


Coordinator Pattern was used for navigation to decouple ViewControllers.
Error Handling and Loading States are implemented via closures in ViewModels for clean UI binding.
Used UIKit as per requirement. SwiftUI can be integrated in future for previews and composability.
👨‍💻 Author

Name: Mina Ead
LinkedIn: www.linkedin.com/in/mina-eid-254bb0177
