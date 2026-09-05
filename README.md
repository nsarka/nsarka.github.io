# Nick Sarkauskas's blog

This repository contains the source for [nsarka.com](https://nsarka.com/),
Nick Sarkauskas's personal blog about systems, networking, and AI. Posts
include technical walkthroughs, diagrams, and notes from learning how things work.

Read the posts on the [website](https://nsarka.com/posts/), or explore their
Markdown source and accompanying images in `nsarka/content/posts/`.
The `sources/` folder holds editable Excalidraw drawings and other source
materials used to create posts.

The site is built with Hugo and the Congo theme, and hosted on GitHub Pages.
`nsarka/` contains the Hugo project; `docs/` contains the generated website.

## Publishing the site

Personal notes for maintaining and publishing this blog.

The `master` branch contains the Hugo source in `nsarka/` and the generated
website in `docs/`. Install Hugo Extended and Go before building.

Run from this folder:

```sh
./publish.sh "Describe your update"
```

This builds the site, replaces `docs/` after a successful build, commits all
repository changes (including new posts), and pushes `master` to GitHub.
Review your local changes first. Mark unfinished posts `draft: true` to exclude
them from the generated site; their source files are still committed and public.
If the push fails, resolve the Git/network issue and rerun the script.

To build without committing or pushing:

```sh
./publish.sh --build-only
```

In GitHub **Settings → Pages**, select **Deploy from a branch**, branch
**master**, folder **/docs**, and save. Keep the custom domain **nsarka.com**.
The script includes `CNAME` and `.nojekyll` in the generated site.

For local previews, run `hugo server --source nsarka`.
