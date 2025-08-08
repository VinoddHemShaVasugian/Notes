import { test, expect } from '@playwright/test';

test('Search for t shirts and verify Faded Short Sleeve T-shirts', async ({ page }) => {
  // Navigate to the Magento T-shirts page
  await page.goto('https://magento.softwaretestingboard.com/men/tops-men/tshirts.php');

  // Locate the search input and type "t shirts"
  await page.fill('input[name="q"]', 't shirts');
  await page.press('input[name="q"]', 'Enter');

  // Wait for results to load
  await page.waitForLoadState('networkidle');

  // Verify "Faded Short Sleeve T-shirts" is present in the results
  const fadedTShirt = page.locator('text=Faded Short Sleeve T-shirts');
  await expect(fadedTShirt).toBeVisible();
});
