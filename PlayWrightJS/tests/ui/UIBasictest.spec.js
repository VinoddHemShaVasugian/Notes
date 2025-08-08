const {test, expect} = require('@playwright/test');

test('Browser context PlayWright Test', async ({browser})=>
{
    const context = await browser.newContext();
    const page = await context.newPage();
    await page.goto("https://rahulshettyacademy.com/loginpagePractise/");
    console.log(await page.title());
    await page.locator("#username").fill("invalidUser");
    await page.locator("[name='password']").fill("invalidUser");
    await page.locator("#signInBtn").click();
    const warningMsg = await page.locator("[style*='block']").textContent();
    console.log("warningMsg: "+warningMsg);
    await expect(page.locator("[style*='block']")).toContainText('Incorrect'); // Incorrect username/password.
});

test('Page PlayWright Test', async ({page})=>
{
    await page.goto("https://www.google.com");
    console.log(await page.title());
    await expect(page).toHaveTitle("test");
});

test('PlayWright test using page object', async ({page})=>
{
    const username = page.locator("#username");
    const password = page.locator("[name='password']");
    const signInBtn = page.locator("#signInBtn");
    const warningMsgLocator = page.locator("[style*='block']");
    const productsName = page.locator(".card-body a");

    await page.goto("https://rahulshettyacademy.com/loginpagePractise/");
    console.log(await page.title());
    await username.clear();
    await username.fill("invalidUser");
    await password.fill("invalidUser");
    await signInBtn.click();
    const warningMsg = await warningMsgLocator.textContent();
    console.log("warningMsg: "+warningMsg);
    await expect(warningMsgLocator).toContainText('Incorrect'); 

    await username.clear();
    await username.fill("rahulshettyacademy");
    await password.clear();
    await password.fill("learning");
    await signInBtn.click();

    await page.waitForLoadState('networkidle');
    await productsName.first().waitFor();
    
    const allTitles = await productsName.allTextContents();
    console.log("allTitles: "+allTitles);

    console.log(await productsName.first().textContent());
    console.log(await productsName.nth(1).textContent()); 
});