import React from 'react';

class Calculator extends React.Component{
  constructor(props){
    super(props);
    this.state = { num1: "", num2: "", result: 0 };
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum1.bind(this);
    this.addNums = this.addNums.bind(this);
    this.subtractNums = this.addNums.bind(this);
    this.multiplyNums = this.addNums.bind(this);
    this.divideNums = this.addNums.bind(this);
  }

  setNum1(event) {
    this.setState({num1: parseInt(event.target.value, 10)});
  }

  setNum2(event) {
    this.setState({num2: parseInt(event.target.value, 10)});
  }

  addNums(event) {
    event.preventDefault();
    if (this.state.num1 === "" && this.state.num2 === "") {
      this.setState({result: 0});
    } else {
      this.setState({result: (this.state.num1 + this.state.num2) });
    }
  }

  subtractNums(event) {
    event.preventDefault();
    if (this.state.num1 === "" && this.state.num2 === "") {
      this.setState({result: 0});
    } else {
      this.setState({result: (this.state.num1 - this.state.num2) });
    }
  }

  multiplyNums(event) {
    event.preventDefault();
    if (this.state.num1 === "" && this.state.num2 === "") {
      this.setState({result: 0});
    } else {
      this.setState({result: (this.state.num1 * this.state.num2) });
    }
  }

  divideNums(event) {
    event.preventDefault();
    if (this.state.num1 === "" && this.state.num2 === "") {
      this.setState({result: 0});
    } else {
      this.setState({result: (this.state.num1 / this.state.num2) });
    }
  }



  render(){
    return (
      <div>
        <h1>{this.state.result}</h1>
        <input type="text" onChange={this.setNum1}></input>
        <input type="text" onChange={this.setNum2}></input>
      </div>
    );
  }
}

export default Calculator;
