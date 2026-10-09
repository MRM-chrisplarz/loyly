# LÖYLY · Nordic Wellness Journal

A self-contained, mobile-first web application with zero external dependencies. All journal data stays on the device in browser `localStorage`.

## Run it

### Quick look on your computer
Open `index.html` in a browser. Most features will work without running a server, although browser policies around local-file persistence vary.

### Reliable local run
From this folder, run:

```sh
python3 -m http.server 8000
```

Then visit `http://localhost:8000` on the same machine.

### Install on an iPhone
Host the **entire folder** on an HTTPS web host (such as Netlify Drop, Cloudflare Pages, or GitHub Pages). Open the hosted URL on your iPhone in **Safari**, tap **Share**, and choose **Add to Home Screen**. The PWA is installable and caches its interface for offline use after the first visit. Hosting the HTML alone without `manifest.webmanifest`, `sw.js`, and the icons means installation/offline support may be limited.

**Important:** Browser storage is per device and per domain. If you change hosts, clear website data, or use private browsing, your saved visits may not follow you. Use **Profile → Export full journal (JSON)** for regular backups. **Import journal backup** restores that data to this or another device, replacing the journal on the destination.

## Features
- Profile: name, gender, weight, weekly visit target (1–6)
- Log, edit, and delete spa visits
- Unlimited sauna and cold plunge exposures, cycle number and activity tagging
- Start/pause/reset timers; manual minutes and Fahrenheit temperature
- Before/after mood scores and visit notes
- Dashboard day/week/month/year with charts and weekly attendance tracking
- History, trends, activity frequencies
- Local persistence and JSON/CSV export; JSON import
- Works without sign-in or external network dependencies

## Notes
- Timers measure wall-clock time; pausing or saving stops them. Only one timer runs at once. Timers continue counting while the app is backgrounded until you pause or save.
- Exports store temperatures in degrees Fahrenheit and duration in minutes (CSV) or seconds (JSON).
- A JSON import *replaces* the existing journal rather than merging visits. Back up existing data first.
- This journal is **not** a medical device. It does not estimate personal cardiovascular, dementia, hormonal, or longevity effects from self-reported exposures.
