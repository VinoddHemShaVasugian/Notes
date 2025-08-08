const {test, expect}=require('@playwright/test');

test('Hadling alerts and Mousehover', async ({page})=>{
await page.goto("https://rahulshettyacademy.com/AutomationPractice/");

page.on('dialog', dialog => dialog.accept());

await expect(page.locator("#displayed-text")).toBeVisible();
await page.pause();
await page.locator('#hide-textbox').click();
await expect(page.locator("#displayed-text")).toBeHidden();

await page.locator("#mousehover").hover();
});

test('Handling frames', async ({page}) =>{
await page.goto("https://rahulshettyacademy.com/AutomationPractice/");

const framePage = page.frameLocator('#courses-iframe');
await framePage.locator(".clearfix li a[href*='lifetime-access']:visible").click();
const textCheck = await framePage.locator(".text h2").textContent();

console.log("textCheck: "+textCheck.split(" ")[1]);
});