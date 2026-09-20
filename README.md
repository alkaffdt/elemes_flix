<img width="1672" height="941" alt="ChatGPT Image Sep 19, 2026, 10_37_33 PM" src="https://github.com/user-attachments/assets/2f703033-7a4c-43d0-9e57-3c8bd0994238" />

<img width="280"  alt="image" src="https://github.com/user-attachments/assets/63631170-8612-4d2d-8122-6d92a773755a" />

<img width="280"  alt="image" src="https://github.com/user-attachments/assets/f30cb71d-69df-4d2d-8fff-d193e39688f0" />

<img width="280"  alt="image" src="https://github.com/user-attachments/assets/9ba48839-7f89-4c96-ad3e-e67e31f2d323" />




## 🚀 Features

### 🟢 Now Playing Movies
### 🟢 Popular Movies
### 🟢 On Airing TV Shows
### 🟢 Popular TV Shows

### Other Features
- 🟢 Search Movies/TV Show/Artist 
- 🟢 Wishlist
- 🟢 Pagination (infinite list)

## 📱 Platforms
### Android : 🟢
### iOS     : 🟢
### Web     : ❗️ 


## 🛠️ Tech Stack
* **Framework:** Flutter / Dart
* **Architecture:** Clean Architecture with Feature First Approach
* **State Management:** Riverpod (`flutter_riverpod`)
* **Networking:** Dio (`dio`)
* **Pagination:** Infinite Scroll Pagination (`infinite_scroll_pagination`)
* **Local Storage:** Shared Preferences (`shared_preferences`)

## Project Structure

```text
elemes_flix/
├── README.md
├── analysis_options.yaml
├── elemes_flix.iml
├── pubspec.lock
├── pubspec.yaml
├── assets/
│   └── images/
│       ├── app_logo.png
│       └── wordmark_logo.png
├── lib/
│   ├── main.dart
│   ├── config/
│   │   └── api_config.dart
│   ├── core/
│   │   ├── error/
│   │   ├── local_storage/
│   │   └── network/
│   ├── extensions/
│   ├── shared/
│   │   └── models/
│   │   └── widgets/
│   │   └── types/
│   ├── src/
│   │   ├── features/
│   │   │   ├── Wishlist/
│   │   │   │   ├── data/
│   │   │   │   ├── domain/
│   │   │   │   └── presentation/
│   │   │   │       ├── providers/
│   │   │   └── home/
│   │   │       ├── data/
│   │   │       │   ├── data_sources/
│   │   │       │   └── repos/
│   │   │       ├── domain/
│   │   │       │   ├── models/
│   │   │       │   └── repos/
│   │   │       └── presentation/
│   │   │           ├── providers/
│   ├── theme/
└── test/
    └── widget_test.dart
```

## 🚀 Suggestions / Potential Improvements
* OFC its Unit-test/Widget-test/integration-test
* Auto-Build & Auto-Deploy to Web using CI/CD
* Offline Mode
* Animation Implementation
* Store API keys & Endpoint into .env file


## ⚙️ How to Run the App

1. Clone this repository:

```bash
   git clone <repository-url>
```

2. Navigate to the project directory:

```bash
   cd <project-folder>
```

3. Install the dependencies:

```bash
   flutter pub get
```

4. Run the app:

```bash
   flutter run
```
