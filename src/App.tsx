import { Button } from 'primereact/button';
import { IconBrandYoutube } from '@tabler/icons-react';

function App() {
  const hasYouTubeKey = Boolean(import.meta.env.VITE_YOUTUBE_API_KEY);

  return (
    <main className="app-shell">
      <header className="topbar">
        <a className="brand" href="/" aria-label="Voiceflow Music home">
          <span className="brand-mark"><i className="pi pi-wave-pulse" /></span>
          <span>voiceflow<span className="brand-muted"> music</span></span>
        </a>
        <span className="topbar-caption">A personal music space</span>
      </header>

      <section className="welcome">
        <div className="welcome-icon"><IconBrandYoutube size={28} stroke={1.8} /></div>
        <p className="eyebrow">THE FOUNDATION IS READY</p>
        <h1>Your music starts here.</h1>
        <p className="welcome-copy">
          The app shell is in place. Next we'll connect YouTube search and the
          official YouTube embedded player, then build the listening experience.
        </p>

        <div className="setup-status" role="status">
          <span className={hasYouTubeKey ? 'status-dot status-ready' : 'status-dot'} />
          <span>{hasYouTubeKey ? 'YouTube API key detected' : 'YouTube API key not configured yet'}</span>
        </div>

        <Button
          label="Explore the next steps"
          icon="pi pi-arrow-right"
          iconPos="right"
          onClick={() => window.open('https://developers.google.com/youtube/v3/getting-started', '_blank', 'noopener,noreferrer')}
        />
      </section>

      <footer className="app-footer">
        <span>Voiceflow Music</span>
        <span>Built as an installable PWA</span>
      </footer>
    </main>
  );
}

export default App;
