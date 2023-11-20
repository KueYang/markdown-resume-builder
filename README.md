# markdown-resume-builder
Markdown resume builder using `pandoc` &amp; `wkhtmltopdf` in `Docker`. Includes sample resume &amp; cover letter templates with sample styling.

#### Project layout:
- The resume and cover letters should be in the root directory whereever the `pandoc_scripts` file is located.
- The assets (i.e. images) are located under the `assets` directory.
- The stylesheets are located under the `styles` directory.
  - The script expects the stylesheet's name to match that of the resume or cover letter file names.

#### To Build the image.
Run `docker build . --tag pandoc-wkhtmltopdf`.

#### To convert `.md` files over to `.pdf` or other supported `pandoc` files.
Run `.\pandoc_scripts.ps1` using PowerShell or Windows Terminal.
