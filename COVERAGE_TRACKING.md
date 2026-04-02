# Coverage Tracking - yod_presentation_travel_to_gether

## Overview
Track testing coverage for all screens and components in the travel presentation package.

## Status Legend
- ⬜ Not Started
- 🟡 In Progress
- ✅ Completed (at least 80% coverage)
- ✅✅ Completed (100% coverage)

## Coverage by Module

### Core Files
| File | Status | Notes |
|------|--------|-------|
| route.dart | ✅ | Router configuration - 11 tests, all passing |
| route_name.dart | ✅ | Route constants - 11 tests, all passing |

### Main App
| File | Status | Notes |
|------|--------|-------|
| presentation/main_app.dart | ✅ | Main app entry point - 10 tests passing |

### Home Module
| File | Status | Notes |
|------|--------|-------|
| presentation/home/home_screen.dart | ✅ | Home screen + CreateTripButton - 14 tests passing |
| presentation/home/map_screen.dart | ⬜ | Map screen UI |

### Search Module
| File | Status | Notes |
|------|--------|-------|
| presentation/search/search_screen.dart | ⬜ | Search screen UI |

### Travel Module
| File | Status | Notes |
|------|--------|-------|
| presentation/travel/search_place_screen.dart | ⬜ | Search place screen |
| presentation/travel/booking_screen.dart | ⬜ | Booking screen |

### Common Interfaces
| File | Status | Notes |
|------|--------|-------|
| presentation/common_interface/common_tabbar_interface.dart | ⬜ | Common tab bar |

### Profile Module
| File | Status | Notes |
|------|--------|-------|
| presentation/profile/profile_screen.dart | ⬜ | Profile screen |

## Coverage Summary
- Total Files: 11
- ✅ Completed: 4 (route.dart, route_name.dart, main_app.dart, home_screen.dart)
- 🟡 In Progress: 0
- ⬜ Not Started: 7
- **Overall Coverage: ~36%** (4/11 files)
- **Total Tests Passing: 45/45** ✅

---

## How to Run Coverage

### Generate Coverage Report
```bash
cd /Users/tinnakorn/Documents/yod_project/yod-presentation-travel-to-gether
flutter test --coverage
```

### View Coverage Results
```bash
# The coverage data is generated in: coverage/lcov.info
# Install lcov to visualize (macOS):
brew install lcov

# Generate HTML report
genhtml coverage/lcov.info -o coverage/html

# Open in browser
open coverage/html/index.html
```

### Or use `coverage` package
```bash
# In pubspec.yaml (dev_dependencies):
flutter pub add --dev coverage

# Run coverage
flutter test --coverage

# Generate report  
pub run coverage:format_coverage --packages=.packages --report-on=lib --in=coverage/lcov.info --out=coverage/lcov.info --lcov
```

## How to Update Status
1. Start a test file for a module
2. Mark it as 🟡 (In Progress)
3. After tests reach 80% coverage: mark as ✅
4. After tests reach 100% coverage: mark as ✅✅
5. Update the summary count at bottom
