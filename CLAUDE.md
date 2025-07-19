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

# JavaScript / TypeScript Project Guide

## Preferred Tech Stack
- **Package Manager**: Yarn
- **Framework**: React Native with Expo
- **Language**: TypeScript (strict mode enabled)
- **Router**: Expo Router (file-based routing)
- **UI Library**: Tamagui
- **State Management**: React Query
- **Form Handling**: React Hook Form
- **API Client**: Generated typescript client from OpenAPI spec
- **Testing**: Jest with jest-expo preset
- **Code Quality**: Biome for linting and formatting
- **Analytics**: Sentry, Vexo Analytics

## Coding Conventions

### Import Structure
- Group imports: external packages, then workspace packages, then local imports

### TypeScript
- Strict mode is enabled
- Use `type` imports for type-only imports
- Define types/interfaces for all component props
- Use generics for reusable components
- Avoid using any

### Component Structure
- Functional components with hooks
- Export default for components named after their file
- Named exports for utility components

### State Management
- Use React Query
- Custom hooks in `queries/` directory for API calls
- Follow naming convention: `use[Resource][Action]` (e.g., `useJobs`, `useLoginMutation`)

### Styling
- Use Tamagui's design tokens (e.g., `$background`, `$borderColor`, `$2`)
- Prefer Tamagui components over custom styles
- Use responsive values when needed

### Code Formatting (Biome)
- 2 spaces indentation
- Single quotes for strings
- Double quotes for JSX attributes
- Trailing commas (ES5)
- Semicolons: only when needed
- Line width: 90 characters

### File Naming
- Components: PascalCase (e.g., `Form.tsx`, `ListItem.tsx`)
- Hooks: camelCase starting with 'use' (e.g., `useJobs.ts`)
- Route files: kebab-case or [param].tsx for dynamic routes

### Testing
- Use Jest
- Mock external dependencies in `__mocks__/` directory

## Best Practices
- Always run `yarn test` before committing
- Keep components small and focused
- Extract complex logic to custom hooks
- Use TypeScript types from generated API client
- Handle loading and error states in UI components
- Use React Query for data fetching and caching
- Follow Expo best practices for navigation and deep linking