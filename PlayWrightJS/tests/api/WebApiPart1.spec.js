const {test, expect, request} = require('@playwright/test');
const loginPayLoad =  {userEmail:"vinoinfotechs@gmail.com",userPassword:"Test@123"};
const orderPayload = {orders:[{country:"India",productOrderedId:"67a8df1ac0d3e6622a297ccb"}]};
let token;
let orderId;

test.beforeAll(async()=>{
    //Login API
const apiContext = await request.newContext();
const loginResponse = await apiContext.post("https://rahulshettyacademy.com/api/ecom/auth/login",
    {
        data:loginPayLoad
    }
    );
    expect(loginResponse.ok()).toBeTruthy();
    const jsonResponse=await loginResponse.json();
    token = jsonResponse.token;
    console.log("Token: "+token);

    //Create order API
    const orderResponse=await apiContext.post("https://rahulshettyacademy.com/api/ecom/order/create-order",
        {
            data:orderPayload,
            headers:{
                'Authorization': token,
                'Content-Type': 'application/json'
            }
        })
        expect(orderResponse.ok()).toBeTruthy();
        const orderResponseJson=await orderResponse.json();
        console.log("orderResponseJson: "+orderResponseJson);
        orderId = orderResponseJson.orders[0];
        
});

test.beforeEach(async()=>{

});

test('Login using API call', async({page})=>{
    page.addInitScript(value => {
        window.localStorage.setItem('token', value);
    },
    token
);

const email = "";
const productName = "Zara Coat 4";

await page.goto("https://rahulshettyacademy.com/client/");
const products = page.locator(".card-body");
const titles = await page.locator(".card-body b").allTextContents();
console.log("Titles: "+titles);
const count = await products.count();
for(let i=0;i< count;i++)
{
    if(await products.nth(i).locator("b").textContent() === productName){
        //add to cart
        await products.nth(i).locator("text= Add To Cart").click();
        break;
    }
}
await page.locator("[routerlink*='cart']").click();

});

test('Login and Create order using API call', async({page})=>
{
    page.addInitScript(value =>
    {
        window.localStorage.setItem('token', value);
    },
    token
);
await page.goto("https://rahulshettyacademy.com/client/");
await page.locator("button[routerlink*='myorders']").click();
await page.locator("tbody").waitFor();
const rows = await page.locator("tbody tr");

for(let i=0;i<await rows.count();++i)
{
    const rowOrderId = await rows.nth(i).locator("th").textContent();
    if(orderId.includes(rowOrderId))
    {
        await rows.nth(i).locator("button").first().click();
        break;
    }
}
});