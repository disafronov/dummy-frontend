# dummy-frontend

A sample React application built with [Vite](https://vite.dev/).

## Prerequisites

- Node.js >= 20
- npm >= 10

## Available Scripts

### `npm run dev`

Starts the Vite development server at [http://localhost:3000](http://localhost:3000).
The page reloads automatically on file changes.

### `npm run build`

Builds the app for production to the `dist/` folder.

### `npm run preview`

Serves the production build locally for preview.

### `npm test`

Runs the test suite with [Vitest](https://vitest.dev/).

## Project Structure

```
src/
  main.jsx          # Application entry point
  App.jsx           # Root component
  App.test.jsx      # Tests (Vitest + Testing Library)
  index.css         # Global styles
  setupTests.js     # Test setup (jest-dom matchers)
public/
  favicon.ico       # Favicon
  logo192.png       # PWA icon (192x192)
  logo512.png       # PWA icon (512x512)
  manifest.json     # PWA manifest
  robots.txt        # Robots configuration
```

## Docker

```bash
docker build -t dummy-frontend .
docker run -p 8080:8080 dummy-frontend
```

The multi-stage Dockerfile builds the app with Node.js and serves the static
files with [nginx-unprivileged](https://github.com/nginxinc/docker-nginx-unprivileged).

## License

[MIT](LICENSE)
