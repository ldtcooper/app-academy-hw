const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits(){
  let first, second;

  reader.question("Would you like some tea?\n", (res) =>{
    first = res;
    console.log(`You replied ${res}`);
  });
}

teaAndBiscuits();
