// @ts-check
import { defineConfig, devices } from '@playwright/test';
import { trace } from 'console';

/**
 * @see https://playwright.dev/docs/test-configuration
 */
// export default defineConfig({
//   testDir: './tests',
//   timeout: 40*1000,
//   expect:{
//     timeout: 40*1000,
//   },
//   reporter:'html',
//   use: {
//     browserName:'chromium'

//     /* Collect trace when retrying the failed test. See https://playwright.dev/docs/trace-viewer */
//   },
// });

const config = ({
  testDir: './tests',
  retries: 1,
  workers: 3,
  //
  timeout: 40*1000,
  expect:{
    timeout: 5000,
  },
  reporter:'html',
  use: {
    browserName:'chromium',
    headless:false,
    sceenshot:'on',
    trace:'on'  // off, on , retain-on-failure
  },
});
module.exports = config