window.addEventListener('input', () => {
  const priceInput = document.getElementById('item-price');
  const taxArea = document.getElementById('add-tax-price');
  const profitArea = document.getElementById('profit');
  const inputValue = priceInput.value;
  
  taxArea.innerHTML = Math.floor(inputValue * 0.1);
  profitArea.innerHTML = inputValue - Math.floor(inputValue * 0.1);
});