## Moist Crumb — Flutter Weather App

A simple, clean weather app that fetches and displays current weather for a user-provided city using the OpenWeather API.

### Demo
#### Video
https://github.com/user-attachments/assets/331d55f5-a6fa-4e1e-b651-9a9736215974

#### Screenshots
<img src="https://github.com/user-attachments/assets/d961330c-688d-4cea-9411-8ddcb21ebe4b" alt="iPhone SE screenshot 1" width="250" />
<img src="https://github.com/user-attachments/assets/bd4679f7-d3bb-4e50-8be4-64eb61b9b2ac" alt="iPhone SE screenshot 2" width="250" />
<img src="https://github.com/user-attachments/assets/dde093b9-1dff-48c3-b1ab-190eb3d46769" alt="iPhone SE screenshot 3" width="250" />
<img src="https://github.com/user-attachments/assets/ab3518a2-7a98-463f-a2fc-08f0c4f23d2e" alt="iPhone SE screenshot 4" width="250" />
<img src="https://github.com/user-attachments/assets/f0e3ed62-b483-4f52-862a-07fba865e5e4" alt="iPhone SE screenshot 5" width="250" />

## Features
- Input to search for a city
- Displays:
  - City name
  - Temperature (°C)
  - Weather condition (e.g., “scattered clouds”)
  - Weather icon based on the condition
- Loading state while fetching
- Robust error handling (city not found, network errors, rate limit, invalid config)
- Responsive layout and polished UI
- Dark mode support
- Caches last searched city and restores it on launch (using `shared_preferences`)
- Basic tests (unit/widget)
- State management: `flutter_bloc`


## Getting Started

### Prerequisites
- Latest stable Flutter (built and tested with Flutter 3.35.0 stable)
- An OpenWeather API key (`https://openweathermap.org/api`)

This repo uses FVM (`https://fvm.app`)

### 1) Clone
```bash
git clone https://github.com/oltea-negru/moist-crumb
cd moist-crumb
```

### 2) Configure environment
Create a `.env` file at the project root:
```bash
cp .env.example .env  
```


Minimal required keys:
```bash
OPEN_WEATHER_API_BASE_URL=https://api.openweathermap.org/data/2.5/weather
OPEN_WEATHER_API_KEY=YOUR_API_KEY_HERE
```

### 3) Install dependencies

```bash
dart pub global activate fvm
fvm install
fvm flutter pub get
```


### 4) Run

```bash
fvm flutter run
```

## Run tests

```bash
fvm flutter test
```


## Assumptions and notes
- Units are metric (°C).
- City search is by name (no geocoding or country scoping).
- Network timeout is 10 seconds; shows a friendly network error UI on failure.
- Last city is cached under key `last_city` and auto-fetched on app launch.

## What I’d do with more time
- Typeahead suggestions and debounce for search input
- Consistent animations for transitions and weather effects
- Better empty state on first launch 
- (Goes wihout saying but) More test coverage
- Create a more cohesive theme and extract hard coded values of color and padding into a centralised format 

#### Additional functionalities
- OpenWheather provides a lot more data that the few fields shown above. It could be extended to show country, wind speed etc.
- A personal favourite would be allowing the app to access location and get the wheather forecast of the user's location automatically.
