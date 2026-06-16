# Finndemy Learner Dashboard — UI Prototype

A standalone redesign of the Finndemy learner dashboard.

**Live demo:** after deploy → `https://<your-github-username>.github.io/finndemy-dashboard-prototype/`

## View locally

**Option 1 — double-click**

Open `index.html` in Chrome or Edge.

**Option 2 — local server**

```bash
cd dashboard-prototype
python -m http.server 3456
```

Then open http://localhost:3456

## What's improved vs. the current page

| Current | Prototype |
|---------|-----------|
| Flat "My Dashboard" heading + emoji buttons | Sidebar navigation + top search bar |
| LearnDash accordion list (expand to see progress) | Course rows with inline progress bars |
| Stats buried in profile card | Prominent stat cards (courses, completed, certificates, points) |
| Suggested courses in a plain right column | Polished cards with ribbons + achievements panel |
| No "continue learning" focus | Horizontal strip highlighting next courses |

## Brand

Uses Finndemy colors from the live site: green `#1eba15`, navy `#0f3758`, dark `#021e40`, Open Sans.

## Files

- `index.html` — layout + sample data (11 courses from your account)
- `styles.css` — all styling
- `assets/` — logo, avatar, course thumbnails

Interactive: search courses, filter by status (All / In Progress / Completed / Not Started), filter by learning path, responsive mobile sidebar.

## Deploy to GitHub Pages

1. Log in to GitHub (one time):
   ```powershell
   gh auth login
   ```
2. From this folder, run:
   ```powershell
   .\deploy.ps1
   ```

This creates the public repo, pushes the code, and enables GitHub Pages. Your demo URL will be printed when it finishes.
