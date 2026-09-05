# Publishing the site

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
