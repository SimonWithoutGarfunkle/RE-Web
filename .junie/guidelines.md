# Junie Guidelines – RE Web Presentation Site

## Project goal

This project is a Flutter Web website built to present the mobile application "RE".

This website is:
- A marketing and presentation website
- Mostly static
- NOT a web version of the mobile application
- In French

Its purpose is to:
- Present the RE mobile app
- Present the authors/team
- Provide a contact form
- Allow users to log in / subscribe to manage the same account used in the mobile app

The website must remain simple, readable, and focused on presentation, not features.

---

## Global rules

- NEVER treat this project as a web version of the mobile app.
- NEVER reuse mobile app architecture patterns that are not relevant to a website.
- NEVER add unnecessary complexity.
- NEVER introduce new packages unless explicitly requested.
- NEVER add tests (unit, widget, or integration).
- NEVER propose or execute git commands.
- NEVER refactor unrelated files.

- ALWAYS keep changes scoped to the current task.
- ALWAYS explain what files were modified and why.
- ALWAYS prefer simple solutions over clever ones.
- ALWAYS optimize for readability and maintainability.

---

## Platform and layout rules

- This is a Flutter Web project.
- The website must be designed primarily with a vertical scrolling layout.
- The layout must naturally work on:
    - Desktop screens
    - Mobile screens
- The site is vertical-first, not desktop-first.

Rules:
- Use scrolling pages, not complex multi-column layouts.
- Do not build separate mobile/desktop versions.
- Responsive behavior must stay simple and predictable.

---

## Pages and content scope

The website contains the following main pages/sections:

- Home page  
  Presents the RE mobile app, its vision, and main features.

- Authors / Team page  
  Presents the creators and contributors of the project.

- Contact page  
  Contains a contact form (UI only, no backend logic).

- Authentication pages  
  Login / Subscribe pages for managing the same account used in the mobile app.
  These pages are limited to UI and basic flow only.

No other pages or features should be introduced without explicit request.

---

## Architecture and project structure

Follow a clear and predictable structure.

High-level rules:
- main.dart must remain minimal.
- No business logic inside widgets.
- UI only.

Recommended structure:

lib/
├─ main.dart                  # Entry point only
├─ app/
│   ├─ app_widget.dart        # MaterialApp configuration
│   └─ app_shell.dart         # Global Scaffold, navigation, layout
├─ pages/
│   ├─ home_page.dart
│   ├─ authors_page.dart
│   ├─ contact_page.dart
│   ├─ login_page.dart
│   └─ subscribe_page.dart
├─ widgets/
│   ├─ layout/
│   ├─ sections/
│   └─ ui/
└─ theme/
└─ app_theme.dart

Do not invent alternative structures unless explicitly requested.

---

## Widget design rules

- Widgets must be small and focused.
- Widgets must be as independent as possible.
- Prefer composition over large widgets.
- Avoid deeply nested widget trees.
- Extract widgets aggressively when UI grows.

Rules:
- Prefer StatelessWidget.
- Use StatefulWidget only when strictly required.
- Use const constructors whenever possible.
- Keep build methods short and readable.

---

## Styling and design system (DA)

The website design must strictly match the RE mobile application identity.

### Color palette

Use a dark, neon-themed palette with strong contrast.

Main colors:

- Background: `#050014`  
  Dark purple/blue used as the main page background.

- Surface / Card background: `#0B0720`  
  Slightly lighter dark surface for cards, sections, and containers.

- Primary neon (magenta): `#FF2ED1`  
  Main accent color for primary buttons, key highlights, links, and important UI elements.

- Secondary neon (cyan): `#2EF2FF`  
  Secondary accent color for secondary buttons, decorative borders, icons, and highlights.

- Accent (yellow): `#FFE45C`  
  Occasional accent for small elements like tags, chips, or subtle emphasis.

- Text primary: `#F5F5FF`  
  Main text color on dark background.

- Text secondary: `#B0A8D9`  
  For less important text, subtitles, descriptions.

- Error: `#FF4C4C`  
  For error messages, invalid fields, etc.

The website must feel like:
"RE — the official website", not a separate product.

---

## Navigation rules

- Use MaterialApp with named routes.
- Do not use go_router.
- Define routes in a single place.
- Navigation must stay simple and predictable.

---

## Forms and interactions

- Forms are UI-focused.
- Validation must be minimal and clear.
- No backend communication unless explicitly requested.
- No advanced state management libraries.

---

## Static analysis

- Use flutter_lints for static analysis.
- Respect lint rules.
- Do not disable lint rules without explanation and approval.

---

## What NOT to do

- Do not add analytics.
- Do not introduce state management libraries.
- Do not optimize prematurely.
- Do not over-engineer.

---

## Interaction rules with the user

- Work incrementally.
- Explain each step.
- Ask for confirmation before:
    - Large structural changes
    - Introducing new architectural concepts
    - Adding new dependencies

You are acting as a disciplined developer, not an experimenter.
