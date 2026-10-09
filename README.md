# LÖYLY — Nordic Wellness Journal

A mobile-friendly, offline-capable-after-first-load (excluding Google Fonts) single-page spa journal. No build tools or server required.

## Run locally

Open `index.html` in your browser, or serve the folder with `python3 -m http.server 8000` and open http://localhost:8000.

## Publish on GitHub Pages

1. Add `index.html` at the root of your GitHub repository.
2. Go to **Settings → Pages**.
3. Under **Build and deployment**, choose **Deploy from a branch**, select `main` and `/ (root)`, then save.
4. Open the Pages URL provided by GitHub once deployment completes.

## Data & privacy

Data is stored in `localStorage` *on the browser/device where it's entered*. Different browsers and devices won't sync automatically. Use **Profile → Export backup** and **Import backup** to move or restore entries. Private/incognito modes and clearing browsing data can remove entries.

This is a journal, not a medical device. The app does not estimate clinical health benefits.
