# SDD — Skills Page / Professional Journey Timeline

## 1. Overview

This document defines the implementation specification for the **Skills Page** of the Flutter Web portfolio, with emphasis on the **Professional Journey timeline**.

The goal is to refactor the current implementation into reusable widgets, preserve the existing visual language of the portfolio, support responsive layouts, and fix the layout exceptions caused by the current timeline structure.

The implementation must remain compatible with the existing project architecture and design system.

---

## 2. Context

The current `SkillsPage` contains:

- Page title and description.
- Strongest skills cards.
- Technical skills section.
- Professional Journey section.
- Footer.
- Responsive detection through `LayoutBuilder`.
- A `SingleChildScrollView` wrapping the page content.

The Professional Journey currently uses:

- `JourneyItem`
- `_TimelineIndicator`
- `_Header`
- `_JourneyTag`
- `ExperienceEntity`

The current timeline implementation uses `IntrinsicHeight` together with an `Expanded` inside a vertical `Column` in `_TimelineIndicator`.

This causes layout failures when the widget is rendered inside `SingleChildScrollView`, because the scroll view provides an unbounded vertical constraint.

Observed errors include:

```text
RenderBox was not laid out
hasSize
size: MISSING
BoxConstraints(... 0.0<=h<=Infinity)
RenderRepaintBoundary does not meet its constraints
_RenderSingleChildViewport NEEDS-PAINT
```

---

## 3. Goals

### Functional goals

1. Render a Professional Journey timeline containing a list of professional experiences.
2. Each experience must display:
   - Role/title.
   - Company.
   - Period.
   - Description.
   - Tags.
3. Highlight the most recent experience.
4. Render a timeline indicator with:
   - Circular marker.
   - Vertical connecting line.
5. Avoid showing the vertical line after the final item.
6. Support dynamic content height.
7. Support desktop and mobile layouts.
8. Use the project's design system whenever possible.

### Technical goals

1. Remove the invalid vertical `Expanded` usage inside an unbounded scroll context.
2. Keep page scrolling controlled by the parent `SingleChildScrollView`.
3. Extract Professional Journey into reusable widgets.
4. Pass the complete `ExperienceEntity` to `JourneyItem` rather than multiple primitive parameters.
5. Avoid duplicated design values when equivalents exist in:
   - `AppColors`
   - `AppSpacing`
   - `AppTypography`
   - `AppText`
6. Keep mock data outside presentation widgets.

---

## 4. Non-goals

Do not:

- Change the routing architecture.
- Replace `go_router`.
- Introduce Riverpod state management for static mock data.
- Add animations unless they already exist in the design.
- Introduce third-party timeline packages.
- Add another vertical scrollable widget inside the current page scroll.
- Add fixed heights to experience cards merely to solve the layout issue.
- Rewrite unrelated Skills Page components.

---

## 5. Target structure

Recommended structure:

```text
lib/src/skills/
├── domain/
│   ├── experience_entity.dart
│   └── mocked_lists.dart
│
└── presentation/
    ├── skills_page.dart
    │
    └── widgets/
        ├── experience_widget.dart
        ├── tech_skills.dart
        └── professional_journey/
            ├── professional_journey.dart
            ├── journey_item.dart
            ├── journey_indicator.dart
            ├── journey_header.dart
            └── journey_tag.dart
```

Private widgets may remain in the same file when their reuse is unlikely, but `ProfessionalJourney` and `JourneyItem` should be separate reusable widgets.

---

## 6. Data model

Use the following entity or preserve an equivalent existing version:

```dart
class ExperienceEntity {
  const ExperienceEntity({
    required this.role,
    required this.company,
    required this.period,
    required this.description,
    required this.tags,
  });

  final String role;
  final String company;
  final String period;
  final String description;
  final List<String> tags;
}
```

Presentation-only values such as `highlighted` and `isLast` must **not** be stored in the entity.

They are derived from the item position in the UI.

---

## 7. Mock data

Use four fictional entries for local development.

Example:

```dart
final experiences = [
  ExperienceEntity(
    role: 'Lead Mobile Developer',
    company: 'Nexora Technologies | São Paulo, BR',
    period: '2024 — PRESENT',
    description:
        'Leading the development of cross-platform mobile applications using Flutter, focusing on scalable architecture, performance, code quality, and continuous delivery.',
    tags: [
      'Flutter',
      'Architecture',
      'Leadership',
    ],
  ),
  ExperienceEntity(
    role: 'Senior Flutter Developer',
    company: 'Orbit Systems | Curitiba, BR',
    period: '2022 — 2024',
    description:
        'Developed and maintained mobile applications for thousands of users, integrating REST APIs, Firebase services, automated tests, and CI/CD pipelines.',
    tags: [
      'Flutter',
      'Firebase',
      'CI/CD',
    ],
  ),
  ExperienceEntity(
    role: 'Mobile Developer',
    company: 'BluePeak Digital | Florianópolis, BR',
    period: '2020 — 2022',
    description:
        'Built responsive mobile interfaces and reusable components while collaborating with designers and backend developers to deliver new product features.',
    tags: [
      'Mobile',
      'REST API',
      'UI/UX',
    ],
  ),
  ExperienceEntity(
    role: 'Software Developer',
    company: 'CodeWave Solutions | Campinas, BR',
    period: '2018 — 2020',
    description:
        'Worked on web and mobile solutions, implementing new features, fixing production issues, and improving application maintainability through code refactoring.',
    tags: [
      'Development',
      'Git',
      'Agile',
    ],
  ),
];
```

---

## 8. Skills Page layout

### Desktop

On desktop, the main content section must be presented in two columns.

```text
┌────────────────────────────┬────────────────────────────┐
│                            │                            │
│ Strongest Skills           │ Professional Journey       │
│                            │                            │
│ Technical Skills           │ Timeline                   │
│                            │                            │
└────────────────────────────┴────────────────────────────┘
```

Recommended implementation:

```dart
Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  spacing: AppSpacing.lg,
  children: [
    Expanded(
      child: skillsContent,
    ),
    Expanded(
      child: ProfessionalJourney(
        experiences: experiences,
      ),
    ),
  ],
)
```

### Mobile

Below the existing mobile breakpoint (`550px` unless the project defines a shared breakpoint), the layout must change to a vertical flow:

```text
Strongest Skills

Technical Skills

Professional Journey
```

Recommended implementation:

```dart
Column(
  children: [
    skillsContent,
    SizedBox(height: AppSpacing.lg),
    ProfessionalJourney(
      experiences: experiences,
    ),
  ],
)
```

Do not keep the two-column `Row` on mobile.

---

## 9. Strongest Skills responsiveness

The current strongest-skills implementation must not rely on a single `Row` that forces every card onto the same line on narrow screens.

Prefer `Wrap`.

Example:

```dart
Wrap(
  spacing: AppSpacing.md,
  runSpacing: AppSpacing.md,
  children: strongestSkill.map((item) {
    return SizedBox(
      width: isMobile ? double.infinity : 220,
      child: experienceWidget(
        icon: item.icon,
        title: item.title,
        text: item.text,
      ),
    );
  }).toList(),
)
```

The exact desktop width may be adjusted to match the existing layout.

---

## 10. ProfessionalJourney widget

Create a `ProfessionalJourney` widget responsible for:

- The `GradientContainer`.
- Section title.
- Spacing.
- Rendering the experience list.
- Deriving `highlighted`.
- Deriving `isLast`.

Suggested API:

```dart
class ProfessionalJourney extends StatelessWidget {
  const ProfessionalJourney({
    super.key,
    required this.experiences,
  });

  final List<ExperienceEntity> experiences;
}
```

Suggested implementation:

```dart
class ProfessionalJourney extends StatelessWidget {
  const ProfessionalJourney({
    super.key,
    required this.experiences,
  });

  final List<ExperienceEntity> experiences;

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              'Professional Journey',
              color: AppColors.inversePrimary,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: AppSpacing.lg),
            ...List.generate(
              experiences.length,
              (index) {
                final experience = experiences[index];

                return JourneyItem(
                  experience: experience,
                  highlighted: index == 0,
                  isLast: index == experiences.length - 1,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## 11. JourneyItem widget

`JourneyItem` must receive the domain entity directly.

Suggested API:

```dart
class JourneyItem extends StatelessWidget {
  const JourneyItem({
    super.key,
    required this.experience,
    required this.isLast,
    required this.highlighted,
  });

  final ExperienceEntity experience;
  final bool isLast;
  final bool highlighted;
}
```

The content area must contain:

1. Header.
2. Company.
3. Description.
4. Tags.

The item height must be determined by its content.

Do not assign a hard-coded total item height.

---

## 12. Timeline layout fix

### Problem

Do not use this structure:

```dart
Column(
  children: [
    marker,
    Expanded(
      child: verticalLine,
    ),
  ],
)
```

when the timeline is rendered inside the page `SingleChildScrollView`.

The page's scrollable content receives an unbounded vertical constraint, so the vertical `Expanded` cannot determine a valid remaining height.

### Required solution

Use:

- `IntrinsicHeight` on the whole item.
- `Row(crossAxisAlignment: CrossAxisAlignment.stretch)`.
- A fixed-width timeline column.
- `Stack`.
- `Positioned(top: ..., bottom: ...)` for the line.

Example:

```dart
IntrinsicHeight(
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      JourneyIndicator(
        isLast: isLast,
        highlighted: highlighted,
      ),
      SizedBox(width: AppSpacing.md),
      Expanded(
        child: content,
      ),
    ],
  ),
)
```

---

## 13. JourneyIndicator

Suggested implementation:

```dart
class JourneyIndicator extends StatelessWidget {
  const JourneyIndicator({
    super.key,
    required this.isLast,
    required this.highlighted,
  });

  final bool isLast;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          if (!isLast)
            Positioned(
              top: 14,
              bottom: 0,
              child: Container(
                width: 2,
                color: Colors.blueGrey.shade700,
              ),
            ),
          Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: highlighted
                  ? Colors.cyanAccent
                  : Colors.blueGrey.shade200,
            ),
          ),
        ],
      ),
    );
  }
}
```

Prefer replacing raw colors with project design tokens where equivalents are available.

---

## 14. Journey header

Desktop:

```text
Lead Mobile Developer                        2024 — PRESENT
```

Mobile:

```text
Lead Mobile Developer
2024 — PRESENT
```

A local `LayoutBuilder` may be used to switch header layout based on available width.

Do not assume the page breakpoint is enough, because the Journey column can become narrow even on desktop.

---

## 15. Tags

Tags must use `Wrap` rather than `Row`.

Required behavior:

- Horizontal spacing between tags.
- Vertical spacing when wrapping.
- Dynamic number of tags.
- No horizontal overflow.

Example:

```dart
Wrap(
  spacing: AppSpacing.sm,
  runSpacing: AppSpacing.sm,
  children: experience.tags.map(
    (tag) {
      return JourneyTag(
        label: tag,
        highlighted: highlighted,
      );
    },
  ).toList(),
)
```

---

## 16. Scrolling rules

There must be only one vertical page scroll owner.

Current intended hierarchy:

```text
SkillsPage
└── Column
    ├── Expanded
    │   └── Padding
    │       └── SingleChildScrollView
    │           └── page content
    └── Footer
```

Do not add inside `ProfessionalJourney`:

- `ListView`
- `GridView`
- another vertical `SingleChildScrollView`

The timeline should render as normal children of the parent `Column`.

---

## 17. Footer behavior

Preserve the current footer arrangement:

```dart
Column(
  children: [
    Expanded(
      child: pageScrollableContent,
    ),
    Footer(),
  ],
)
```

The footer should remain outside the main `SingleChildScrollView` unless there is an explicit design change.

---

## 18. Design system

Use existing project tokens instead of new hard-coded values when possible.

Relevant imports include:

```dart
AppColors
AppSpacing
AppTypography
AppText
GradientContainer
```

Examples:

```dart
SizedBox(height: AppSpacing.lg)
```

instead of:

```dart
SizedBox(height: 24)
```

when the spacing token represents the intended value.

Avoid introducing new global design constants as part of this task.

---

## 19. Acceptance criteria

The task is complete when all conditions below are satisfied.

### Layout

- [ ] Skills Page renders without layout exceptions.
- [ ] No `RenderBox was not laid out` errors.
- [ ] No `hasSize` assertion errors.
- [ ] No `size: MISSING` cascade caused by the Professional Journey.
- [ ] No vertical overflow in Professional Journey.
- [ ] Timeline line follows the height of dynamic content.
- [ ] Final experience does not render a trailing line.
- [ ] First/current experience is visually highlighted.

### Responsiveness

- [ ] Desktop shows Skills and Professional Journey side-by-side.
- [ ] Mobile stacks the main sections vertically.
- [ ] Strongest Skills cards wrap correctly.
- [ ] Tags wrap correctly.
- [ ] Role and period remain readable at narrow widths.
- [ ] Page remains usable when browser size changes dynamically.

### Architecture

- [ ] `ExperienceEntity` remains presentation-agnostic.
- [ ] `ProfessionalJourney` is extracted from `SkillsPage`.
- [ ] `JourneyItem` receives `ExperienceEntity`.
- [ ] Mock data remains outside presentation widgets.
- [ ] No third-party timeline package is added.

### Code quality

- [ ] Existing project naming conventions are respected.
- [ ] Existing design tokens are reused.
- [ ] No unnecessary fixed heights are introduced.
- [ ] No nested vertical scrolling is introduced.
- [ ] No unrelated routing code is changed.

---

## 20. Validation steps

After implementation:

1. Run:

```bash
flutter analyze
```

2. Start the web project.

3. Navigate to the Skills page.

4. Test widths approximately:

```text
1440px
1100px
900px
700px
550px
430px
375px
```

5. Resize the browser continuously and confirm no exception is thrown.

6. Verify timeline entries with:
   - Short descriptions.
   - Long descriptions.
   - One tag.
   - Multiple tags.
   - Long role names.

7. Perform a **hot restart** after replacing the timeline layout, rather than relying only on hot reload.

---

## 21. Codex implementation instructions

Implement this specification incrementally.

### Priority 1

Fix the Professional Journey layout exception.

Do not modify routing or `go_router` unless the error remains reproducible after the timeline layout is corrected.

### Priority 2

Extract the Professional Journey presentation into reusable widgets.

### Priority 3

Make the Skills Page responsive.

### Priority 4

Clean up hard-coded styling using existing design tokens.

Before introducing a new abstraction, inspect the project for an existing equivalent.

Do not change unrelated files.

Preserve the current visual identity of the portfolio.

---

## 22. Expected final hierarchy

```text
SkillsPage
│
├── Header
├── Description
├── Responsive main content
│   │
│   ├── Skills content
│   │   ├── Strongest Skills
│   │   └── Technical Skills
│   │
│   └── ProfessionalJourney
│       ├── JourneyItem
│       │   ├── JourneyIndicator
│       │   ├── JourneyHeader
│       │   └── JourneyTag(s)
│       ├── JourneyItem
│       ├── JourneyItem
│       └── JourneyItem
│
└── Footer
```

---

## 23. Key constraint

The most important technical constraint for this task is:

> Never place a vertical `Expanded` or `Flexible` that depends on remaining height inside the unbounded vertical content of the page `SingleChildScrollView`.

The timeline line must derive its height from the rendered `JourneyItem`, not from an unbounded parent.
