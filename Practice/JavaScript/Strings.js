let day = 'tuesday '
console.log(day.length) //8
console.log(day.slice(0,4)) //tues
console.log(day[1]) //u
let splitDay = day.split("s")
console.log(splitDay[1]) //day
console.log(splitDay[1].length) //4
console.log(splitDay[1].trim().length) //3

console.log("****************************************************")
let date = '23'
let nextDate = '27'
let diff = parseInt(nextDate) - parseInt(date)
console.log(diff)
console.log("Int to String: "+diff.toString());
let val = day.indexOf("day")
console.log(val)