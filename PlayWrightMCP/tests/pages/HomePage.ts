import { Page, Locator } from '@playwright/test';

export class HomePage {
  readonly page: Page;
  readonly searchInput: Locator;
  readonly searchButton: Locator;

  constructor(page: Page) {
    this.page = page;
    this.searchInput = page.locator('input[name="search_query"]');
    this.searchButton = page.locator('button[name="submit_search"]');
  }

  async goto() {
    await this.page.goto('http://www.automationpractice.pl/index.php');
  }

  async searchFor(query: string) {
    await this.searchInput.fill(query);
    await this.searchButton.click();
    await this.page.waitForLoadState('networkidle');
  }
}
