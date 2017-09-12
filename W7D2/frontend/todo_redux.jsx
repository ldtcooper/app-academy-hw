import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  let store = configureStore(preloadedState);
  store = applyMiddleware(store, [addLoggingToDispatch]);
  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});

const addLoggingToDispatch = store => next => action => {
  const dispatchStore = store.dispatch;
  console.log(store.getState());
  console.log(action);
  store.dispatch(action);
  console.log(store.getState());
  next(action);
};

const applyMiddleware = (store, middlewares) => {
  let dispatch = store.dispatch;
  middlewares.forEach( (middleware) => {
    dispatch = middleware(store)(dispatch);
  });
  return Object.assign({}, store, { dispatch });
};
