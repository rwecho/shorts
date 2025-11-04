# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.1] - 2025-11-4

### Fixed

- Corrected typos in documentation

## [1.0.0] - 2025-10-31

### Added

- Initial release of HarmonyOS Faker library
- Complete ArkTS compliance and type safety
- Support for Chinese and English data generation
- Comprehensive Unsplash image integration
- Multiple data generators:
- **Name**: Chinese names, English names, titles
- **Address**: Chinese addresses, cities, districts, zip codes
- **Phone**: Mobile and landline phone numbers
- **Internet**: Email addresses, usernames, URLs, IP addresses, MAC addresses
- **Lorem**: Words, sentences, paragraphs with customizable length
- **DateTime**: Past/future dates, timestamps, date ranges
- **Numbers**: Integers, floats, percentages, currency formatting
- **Color**: Hex, RGB, RGBA color codes
- **Image**: Picsum integration and comprehensive Unsplash support
- **Commerce**: Product names, departments, pricing
- **Company**: Company names, suffixes, full company names

### Unsplash Features

- Basic image generation with categories
- Keyword-based image generation
- Multiple keyword combinations
- Collection-based images
- User-specific images
- Featured and daily images
- Orientation-specific images (landscape, portrait, squarish)
- Complete image metadata with type safety (`UnsplashImageData`)
- Support for 18 predefined categories
- Support for 26 common keywords

### Developer Experience

- Full TypeScript/ArkTS type definitions
- Deterministic results with seed support
- Modular architecture for tree-shaking
- Comprehensive documentation with examples
- Unit tests with >95% coverage
- Demo pages and usage examples

### Performance

- Lightweight library with minimal dependencies
- Optimized for mobile applications
- Efficient random number generation
- Memory-conscious data structures

### Examples and Demos

- Complete usage examples
- Interactive demo pages
- Photography portfolio generator
- Image gallery generator
- Responsive design examples
- API response mocking examples

## [Unreleased]

### Planned Features

- Video URL generation
- Audio file metadata generation
- Geographic coordinates
- Vehicle data (license plates, models)
- Financial data (credit cards, bank accounts)
- More international address formats
- Extended date/time utilities
- Performance optimizations
