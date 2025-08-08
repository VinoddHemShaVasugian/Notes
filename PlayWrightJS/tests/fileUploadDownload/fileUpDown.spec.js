const {test,expect}=require('@playwright/test');

test('Upload download excel validation',async ({page})=>
{
  const textSearch = 'Mango';
  const updateValue = '350';
  await page.goto("https://rahulshettyacademy.com/upload-download-test/index.html");
  const downloadPromise = page.waitForEvent('download');
  await page.getByRole('button',{name:'Download'}).click();
  await downloadPromise;
//   writeExcelTest(textSearch,updateValue,{rowChange:0,colChange:2},"/Users/rahulshetty/downloads/download.xlsx");
  await page.locator("#fileinput").click();
  await page.locator("#fileinput").setInputFiles("/Users/rahulshetty/downloads/download.xlsx");
  const textlocator = page.getByText(textSearch);
  const desiredRow = await page.getByRole('row').filter({has :textlocator });
  await expect(desiredRow.locator("#cell-4-undefined")).toContainText(updateValue);
})