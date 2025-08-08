import { test } from '@playwright/test';
import { HomePage } from './HomePage';
import { SearchResultsPage } from './SearchResultsPage';

test('Search for T-shirts and verify Faded Short Sleeve T-shirts in the list', async ({ page }) => {
  const homePage = new HomePage(page);
  const searchResultsPage = new SearchResultsPage(page);

  await homePage.goto();
  await homePage.searchFor('T-shirts');
  await searchResultsPage.verifyProductVisible('Faded Short Sleeve T-shirts');
});
