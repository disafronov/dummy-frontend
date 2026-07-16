import { render, screen } from '@testing-library/react';
import { vi } from 'vitest';
import App from './App.jsx';

test('renders users fetched from the api', async () => {
  global.fetch = vi.fn(() =>
    Promise.resolve({
      json: () => Promise.resolve([{ id: 1, title: 'Test user' }]),
    })
  );

  render(<App />);

  expect(await screen.findByText(/Id:1/)).toBeInTheDocument();
  expect(screen.getByText(/Title:Test user/)).toBeInTheDocument();
});
