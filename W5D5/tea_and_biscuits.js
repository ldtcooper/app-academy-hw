const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits(){
  let first;
  let second = 'no';

  reader.question("Would you like some tea?\n", (res1) =>{
    first = res1;
    console.log(`You replied ${res1}`);
    if (first === "yes") {
      reader.question("Would you like some biscuits?\n", (res2) =>{
        second = res2;
        console.log(`You replied ${res2}`);
      });
    }
  });

  const firstResponse = (first === 'yes') ? 'do' : "don't";
  const secondResponse = (second === 'yes') ? 'do' : "don't";
  console.log(`So you ${firstResponse} want tea and ${secondResponse} want buscuits?`)
}


teaAndBiscuits();
