# Voiceflow Music

An installable music-discovery PWA built with React, TypeScript, Vite and PrimeReact 10.

## Stack

- React 18 + TypeScript
- Vite 7
- PrimeReact 10.9.9 + PrimeIcons
- Tabler Icons
- Vite PWA plugin
- YouTube Data API v3 search adapter (requires an API key)

## Requirements

- Node.js 20.19+
- npm 10+

## Getting started

```bash
npm install
cp .env.example .env
npm run dev
```

Add a YouTube Data API v3 key to `.env`:

```env
VITE_YOUTUBE_API_KEY=your_api_key
```

Restrict the API key in Google Cloud Console to the app's HTTP referrers and enable YouTube Data API v3.

## Available scripts

- `npm run dev` - start the local development server
- `npm run typecheck` - run TypeScript checks
- `npm run build` - typecheck and create the production build
- `npm run preview` - preview the production build

## YouTube integration architecture

This project uses the official YouTube Data API v3 for video discovery and metadata. Playback will use the official YouTube IFrame Player API. There is no official public YouTube Music API; the Data API and embedded player are the supported integration path.

Important: the browser API key is visible to users, so it must be restricted by HTTP referrer and API scope. YouTube playback, branding, attribution, and player requirements must be respected. Do not extract audio streams or bypass the YouTube player.

## Persistence

No Supabase or remote database is configured. Local preferences and library persistence can be designed separately using browser storage after the core playback flow is validated.

## PWA notes

The app shell and static assets are precached. YouTube API responses and YouTube media are intentionally not cached by the service worker.
