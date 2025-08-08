import { Page, Locator, expect } from '@playwright/test';

export class SearchResultsPage {
  readonly page: Page;
  readonly productList: Locator;

  constructor(page: Page) {
    this.page = page;
    this.productList = page.locator('.product_list');
  }

  async verifyProductVisible(productName: string) {
    // Assert product list is visible
    await expect(this.productList).toBeVisible();
    // Assert at least one product is listed
    const productCount = await this.productList.locator('.product-name').count();
    expect(productCount).toBeGreaterThan(0);
    // Assert specific product is visible
    const product = this.page.locator('.product_list .product-name', { hasText: productName });
    await expect(product).toBeVisible();
  }
}
