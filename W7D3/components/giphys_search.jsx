import React from 'react';
import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Container {
  constructor(props) {
    super(props);
    this.state = {searchTerm: ""};
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event) {
    this.setState({searchTerm: event.target.value});
  }

  handleSubmit(event) {
    event.preventDefault();
    let searchTerm = this.state.searchTerm.split(" ").join("+");
    this.props.fetchSearchGiphys(searchTerm);
  }

  render() {
      return (
        <div>
          <form>
            <label>
              Search:
              <input
                type="text"
                name="search"
                value={this.state.searchTerm}
                onChange={this.handleChange}/>
            </label>
            <input type="submit" value="Submit" />
          </form>
        </div>
      );
  }
}

export default GiphysSearch;
