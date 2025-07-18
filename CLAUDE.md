# Python Project Guide

## Build/Test/Lint Commands
- Install deps: `uv install`
- Run all formatting and tests: `docker compose exec django poe autoformat`
- Run specific test: `docker compose exec django poe test tests/path/to/test_file.py::test_function_name -v`

## Code Style Guidelines
- Python 3.9+ compatible code
- Type hints required for all functions and methods. Try to avoid Any
- Classes: PascalCase with descriptive names
- Functions/Variables: snake_case
- Constants: UPPERCASE_WITH_UNDERSCORES
- Imports organization:
  1. Standard library imports
  2. Third-party imports
  3. Local application imports
- Error handling: Use specific exception types
- Logging: Use the logging module with appropriate levels

## Project Conventions
- Use UV for dependency management
- Add tests for all new functionality