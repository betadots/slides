# betadots Conference Slides

A template for creating presentation slides using [remark.js](https://remarkjs.com/) with betadots branding and styling.

## Quick Start

### Setting Up a New Presentation

1. **Create a new folder for your slides:**

   ```bash
   mkdir -p 2025/DemoConf
   cd 2025/DemoConf
   ```

2. **Link the static assets:**

   ```bash
   ln -s ../../template/static static
   ```

3. **Copy the template files:**

   ```bash
   cp ../../template/index.html .
   cp ../../template/favicon.ico .
   cp ../../template/slides.md .
   ```

4. **Edit your content:**
   - Modify `slides.md` to add your presentation content
   - The markdown file will be automatically loaded by the HTML template

### Running the Presentation

Start a local web server in your presentation folder:

```bash
python3 -m http.server 8000
```

Then open your browser to `http://localhost:8000`

## Template Structure

```text
template/
├── index.html          # Main HTML template
├── slides.md           # Markdown content (example)
├── favicon.ico         # Site favicon
└── static/
    ├── css/
    │   └── slides.css  # Custom styling
    ├── fonts/          # Font files
    ├── images/         # Images and logos
    └── js/
        └── remark-latest.min.js  # Remark.js library
```

## Customization

- **Slides Content**: Edit `slides.md` using [remark markdown syntax](https://remarkjs.com/#1)
- **Styling**: Modify `static/css/slides.css` for custom themes
- **Images**: Add images to `static/images/` and reference them in your markdown

## Dependencies

### Remark.js Library

The template includes remark.js for rendering markdown presentations. To update or reinstall:

```bash
curl -L https://remarkjs.com/downloads/remark-latest.min.js -o remark-latest.min.js
```

## Features

- ✅ Responsive design with 16:9 aspect ratio
- ✅ betadots branding and color scheme
- ✅ Custom fonts (Yanone Kaffeesatz, Ubuntu Mono, Droid Serif, Nunito Sans)
- ✅ Markdown-based content with external file loading
- ✅ Speaker notes support
- ✅ Code syntax highlighting
- ✅ Print-ready styles
