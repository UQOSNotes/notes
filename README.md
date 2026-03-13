# UQ Open Source Notes: Notes repository
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Introduction
This repository is the main storage location for all notes found at [the main notes website](https://uqosnotes.github.io/). The goal of this repository is to create well formed, up to date course notes for a variety of courses at UQ. This repository relies on contributions of students, so if you have content to share, please do!

## Format
The notes in this repository are entirely written in [Typst](https://typst.app/docs/). Ideally, please do not use AI to write these notes as it can get syntax quite wrong; however, if you need to transfer notes from one format (such as LaTeX or docx) to Typst, AI is allowed for this *if you review the output thoroughly*.

## Local Setup
1. [Install Typst](https://github.com/typst/typst#installation)
2. Clone this repository
3. Compile any course using the `--root` flag so the template resolves correctly:
   ```sh
   typst compile --root . EAIT/MATH1061/main.typ
   ```
   The `--root .` flag sets the project root to the repo root, allowing `lib.typ` to be found via the `/lib.typ` import path used in each course.

## Adding a new course
Create a folder under the relevant faculty, e.g. `EAIT/MATH1002/`, with a `main.typ` that begins:
```typ
#import "/lib.typ": *

#show: notes.with(
  course: "MATH1002",
  title: "Your Course Title",
  year: "Semester 1, 2026",
  authors: ("Your Name",),
)
```
Then add chapter files and `#include` them from `main.typ`.

## Contributing
To contribute, fork the repository and create a branch for your changes. Once done, submit a pull request with a clear description. We welcome contributions that improve the content, organisation, or formatting of the notes. Please ensure your changes are consistent with the overall style and do not introduce errors. AI generated contributions are welcome, but *please* review the output thoroughly, as AI can produce inaccurate content.

## License
All content in this repository is licensed under the MIT License. You are free to use, modify, and distribute the content as long as you include the original copyright notice and license. See the LICENSE file for more information.
