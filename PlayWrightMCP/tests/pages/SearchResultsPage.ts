import { Page, Locator, expect } from '@playwright/test';

export class SearchResultsPage {
  readonly page: Page;
  readonly productList: Locator;

  constructor(page: Page) {
    this.page = page;
    this.productList = page.locator('.product_list');
  }

  async verifyProductVisible(productName: string) {
    const product = this.page.locator('.product_list .product-name', { hasText: productName });
    await expect(product).toBeVisible();
  }
}
