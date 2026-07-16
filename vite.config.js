import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

// Vite configuration replacing Create React App toolchain.
export default defineConfig({
  plugins: [react()],
  server: {
    port: 3000,
  },
  test: {
    globals: true,
    environment: 'jsdom',
    setupFiles: './src/setupTests.js',
  },
});
