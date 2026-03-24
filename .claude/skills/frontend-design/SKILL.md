---
name: frontend-design
description: Create distinctive, production-grade React interfaces with high design quality. Use this skill when the user asks to build React components, pages, or applications (examples include landing pages, dashboards, component libraries, or when styling/beautifying any React UI). Generates creative, polished JSX/TSX code that avoids generic AI aesthetics.
allowed-tools: Read, Glob, Grep
---

This skill guides creation of distinctive, production-grade React interfaces that avoid generic "AI slop" aesthetics. Implement real working React code with exceptional attention to aesthetic details and creative choices.

The user provides frontend requirements: a component, page, or application to build. They may include context about the purpose, audience, or technical constraints.

## Design Thinking

Before coding, understand the context and commit to a BOLD aesthetic direction:

- **Purpose**: What problem does this interface solve? Who uses it?
- **Tone**: Pick an extreme: brutally minimal, maximalist chaos, retro-futuristic, organic/natural, luxury/refined, playful/toy-like, editorial/magazine, brutalist/raw, art deco/geometric, soft/pastel, industrial/utilitarian, etc.
- **Constraints**: Technical requirements (React version, Tailwind, CSS modules, accessibility, performance).
- **Differentiation**: What makes this UNFORGETTABLE? What's the one thing someone will remember?

**CRITICAL**: Choose a clear conceptual direction and execute it with precision. Bold maximalism and refined minimalism both work — the key is intentionality, not intensity.

## React Implementation Guidelines

Always produce working React code:

- **Components**: Functional components with hooks. TypeScript (`tsx`) when the project uses it.
- **Styling**: Match the project's convention — Tailwind classes, CSS modules (`styles.module.css`), or styled-components. If unclear, default to Tailwind.
- **Animations**: Use Framer Motion for choreographed sequences and page transitions. CSS transitions/keyframes for simple hover states and micro-interactions. Focus on high-impact moments: a well-orchestrated mount animation with staggered children creates more delight than scattered effects.
- **State**: Keep state local unless the component clearly needs to be controlled. Don't over-engineer.
- **Composition**: Break large components into smaller focused ones. Name them clearly.

## Frontend Aesthetics Guidelines

Focus on:

- **Typography**: Choose fonts that are beautiful, unique, and interesting. Import from Google Fonts or use `@fontsource`. Avoid Inter, Roboto, Arial, and Space Grotesk — opt for distinctive choices that elevate aesthetics. Pair a display font with a refined body font.
- **Color & Theme**: Define a color palette with CSS variables or a Tailwind theme extension. Dominant colors with sharp accents outperform timid, evenly-distributed palettes.
- **Spatial Composition**: Unexpected layouts. Asymmetry. Overlap. Grid-breaking elements. Generous negative space OR controlled density.
- **Backgrounds & Visual Details**: Create atmosphere and depth. Apply gradient meshes, noise textures, geometric patterns, layered transparencies, dramatic shadows, and grain overlays where appropriate.
- **Motion**: Every animation must have purpose — reveal, guide attention, or provide feedback. No animation for its own sake.

NEVER use generic AI-generated aesthetics: overused font families (Inter, Roboto, Arial, system fonts), clichéd color schemes (purple gradients on white backgrounds), predictable layouts, or cookie-cutter components that lack context-specific character.

No two designs should look the same. Vary between light and dark themes, different fonts, different aesthetics. NEVER converge on the same defaults across generations.

**IMPORTANT**: Match implementation complexity to the aesthetic vision. Maximalist designs need elaborate JSX with extensive Framer Motion sequences and visual layers. Minimalist designs need restraint, precision, careful spacing, and subtle details. Elegance comes from executing the vision well, not from adding more.
