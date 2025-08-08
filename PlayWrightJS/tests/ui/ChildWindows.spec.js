const {test, expect}= require('@playwright/test');

test('Handling Child Window', async ({browser})=>
{
    const context = await browser.newContext();
    const page = await context.newPage();

    const emailField = page.locator("#username");
    const accessLink = page.locator("[href*='documents-request']");

    await page.goto("https://rahulshettyacademy.com/loginpagePractise/");

    const [newPage] = await Promise.all(
    [
        context.waitForEvent('page'),
        accessLink.click(),
    ]);

    await newPage.waitForLoadState('networkidle');
    await newPage.waitForLoadState('load');

    await newPage.locator(".red").waitFor();
    const email = await newPage.locator(".red").textContent();
    const emailArray = email.split('@');
    const domain = emailArray[1].split(" ")[0];

    await emailField.fill(domain);
    const inputValue = await emailField.inputValue();
    console.log("inputValue: "+inputValue);

    await page.waitForTimeout(10000);
});