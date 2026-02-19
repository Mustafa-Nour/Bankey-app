# Bankey — iOS Banking App

A professional iOS banking application built with **UIKit**, following modern engineering principles including **MVVM architecture**, **Unit Testing**, and **Clean Code** practices. Built as part of a hands-on UIKit professional iOS course.

---

## Features

| Feature | Description |
|---|---|
| **Login** | Secure login screen with custom-built `LoginView` and validation logic |
| **Onboarding** | Multi-page onboarding flow with a swipeable `ContainerViewController` |
| **Account Summary** | Dynamic account list driven by live API data fetched via `URLSession` |
| **Logout** | System-wide logout via `NotificationCenter` |
| **Unit Tests** | JSON parsing and networking tests with `XCTestCase` |

---

## Architecture

The app follows the **MVVM (Model-View-ViewModel)** pattern to ensure a clean separation of concerns.

### Key MVVM Principles Applied
- **ViewModel** handles all networking, state management, and data transformation.
- **ViewController** is purely responsible for UI presentation and layout.
- **Data Binding** is achieved via lightweight **Closures** (`reloadView`, `showError`).

---

## Tech Stack

- **Language**: Swift 5
- **UI Framework**: UIKit (100% Programmatic — No Storyboards)
- **Networking**: `URLSession` + `JSONDecoder`
- **Concurrency**: `DispatchGroup` + `DispatchQueue`
- **Testing**: `XCTest` / `XCTestCase`
- **Pattern**: MVVM
- **Design**: Auto Layout with `NSLayoutConstraint`

---

---

## Unit Testing

Tests are written using **XCTestCase** and cover critical networking and data parsing logic.

```swift
func testCanParse() throws {
    // Given: a JSON response from the API
    let result = try! decoder.decode([Account].self, from: data)
    
    // Then: the model is correctly parsed
    XCTAssertEqual(account1.id, "1")
    XCTAssertEqual(account1.amount, 929466.23)
    XCTAssertEqual(account1.name, "Basic Savings")
}
```

---

## Getting Started

1. Clone the repository:
```bash
git clone https://github.com/YOUR_USERNAME/Bankey-app.git
```
2. Open `Bankey App.xcodeproj` in Xcode 14+.
3. Select a simulator (iPhone 14 or later).
4. Build and Run: `Cmd + R`

> ⚠️ The app connects to a live Heroku API. You need an internet connection to load account data.

---

## What I Learned

- Building 100% programmatic UI with **Auto Layout**
- Implementing **MVVM** architecture from scratch
- Handling asynchronous network calls with `DispatchGroup`
- Data Binding between ViewModel and ViewController using **Closures**
- Writing meaningful **Unit Tests** with XCTestCase
- Using `@testable import` to test internal app components

---

## Author

**Mustafa Nour**  
iOS Developer  
[![GitHub](https://img.shields.io/badge/GitHub-MustafaNour-black?logo=github)](https://github.com/YOUR_USERNAME)
