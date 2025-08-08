const {test,expect}=require('@playwright/test');

test("Take Screenshots",async({page})=>{
    await page.goto("https://rahulshettyacademy.com/AutomationPractice/");
    await expect(page.locator("#displayed-text")).toBeVisible();
    await page.locator("#displayed-text").screenshot({path:'screenshots/paticalScreenshot.png'});
    await page.locator('#hide-textbox').click();
    await page.screenshot({path:'screenshots/screenshot.png'});
    await expect(page.locator("#displayed-text")).toBeHidden();
});

test("Visual Testing", async({page})=>{
    await page.goto("https://www.flightaware.com");
    expect(await page.screenshot()).toMatchSnapshot('landing.png');
});