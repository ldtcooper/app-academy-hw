const selectCurrency = function selectCurrency(baseCurrency, rates) {
  const currencyResponse = {
    type: "SWITCH_CURRENCY",
    baseCurrency,
    rates
  };
  return currencyResponse;
};

export default selectCurrency;
