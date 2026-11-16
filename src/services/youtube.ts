const YOUTUBE_API_BASE = 'https://www.googleapis.com/youtube/v3';

export interface YouTubeSearchItem {
  id: { videoId?: string };
  snippet: {
    title: string;
    description: string;
    channelTitle: string;
    thumbnails: {
      medium?: { url: string };
      high?: { url: string };
    };
    publishedAt: string;
  };
}

interface YouTubeSearchResponse {
  items: YouTubeSearchItem[];
  nextPageToken?: string;
}

export async function searchYouTubeVideos(
  query: string,
  pageToken?: string
): Promise<YouTubeSearchResponse> {
  const apiKey = import.meta.env.VITE_YOUTUBE_API_KEY;

  if (!apiKey) {
    throw new Error('Add VITE_YOUTUBE_API_KEY to your local .env file to enable YouTube search.');
  }

  const params = new URLSearchParams({
    part: 'snippet',
    type: 'video',
    videoCategoryId: '10',
    maxResults: '20',
    q: query,
    key: apiKey
  });

  if (pageToken) params.set('pageToken', pageToken);

  const response = await fetch(`${YOUTUBE_API_BASE}/search?${params.toString()}`);

  if (!response.ok) {
    const payload = await response.json().catch(() => null);
    throw new Error(payload?.error?.message ?? 'YouTube search failed.');
  }

  return response.json() as Promise<YouTubeSearchResponse>;
}
