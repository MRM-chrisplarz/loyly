# LÖYLY — Nordic Wellness Journal with cloud sync

A standalone, mobile-friendly web application. Your journal is stored locally first. Optionally add **Supabase email/password sign-in and cloud synchronization** so your devices share the same visits and preferences.

## Upload to GitHub Pages

Upload **`index.html`** to the root of your GitHub Pages repository, replacing the old one. `supabase-setup.sql` and this README are just instructions and do **not** need to be published. You can also open `index.html` locally (cloud auth works best over HTTPS).

**Before upgrading:** Open your existing Löyly and select **Profile → Export backup** on each device containing entries. Keep those JSON backups.

## One-time Supabase cloud setup

1. Create a project at https://supabase.com/dashboard (a free project may be enough for a personal journal; check Supabase's current pricing).
2. Open your project → **SQL Editor**, paste `supabase-setup.sql` from this folder, and **Run**. This creates the journal table and row-level security rules.
3. Open project **Settings → API Keys** (or **Project Settings → Data API**) and copy the **Project URL** and **publishable/anon public key**. **NEVER** copy the service_role key, secret API key, database password, or any private credential into the web app or GitHub.
4. Publish the updated `index.html` to GitHub Pages.
5. On your **desktop**, go to **Profile → Cloud sync**, enter the project URL and publishable/anon key, click **Connect project**. Then **Create account** using an email and password. If email confirmation is enabled, open the verification email and sign in afterward.
6. Choose **Sync now**. Your desktop journal uploads to your private account.
7. On your **phone**, open the updated GitHub Pages site, go to **Profile → Cloud sync**, enter the **same URL/key** and **sign in with the same email/password**. Tap **Sync now**. Your phone will merge its existing visits with the cloud journal.
8. After setup, the app syncs automatically after saves and on app focus, plus periodic foreground checks. You can also tap **Sync now**.

## Privacy and behavior

- **Cloud sync is optional.** The app works offline with local browser storage.
- Supabase hosts the journal when cloud sync is enabled. Profile information, visit information, notes, and activity tags are stored in Supabase under the authenticated user's ID. Treat this as personal health-related data.
- Row Level Security ensures signed-in users can only access their own rows. This is not HIPAA-certified clinical record software.
- **Never publish your personal JSON export to GitHub.** The public Supabase publishable/anon key is designed for browser use *with Row Level Security enabled*.
- Cloud email/password sign-in tokens are stored in browser `localStorage` for convenience. Avoid shared/public devices. Signing out does not wipe the journal saved locally on that browser.
- Visits merge by stable ID and last-edit timestamp. Deletions are synced using tombstones. When disconnected, edits remain saved locally. For simultaneous edits of **the same visit** from different devices, last edit timestamp wins; there is no full conflict-review interface. Keep JSON backups.
- Cloud **live timer drafts remain local** to the device that started the timer. Saved completed visits sync.
- A browser's local entries remain visible after sign-out. This is designed for one private user per browser, not for switching among unrelated accounts in one browser.

## Data export

**Profile → Export backup** saves a JSON file. **Import backup** restores it into the browser and, if signed in, schedules a cloud sync. **Export CSV** exports visit intervals. Do not discard backups until you confirm both devices have the correct records.

This is a wellness journal, not a medical device, and does not calculate medical risk reductions.
