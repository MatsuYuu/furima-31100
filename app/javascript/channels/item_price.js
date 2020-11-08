window.addEventListener('load', function(){

const priceInput = document.getElementById("item-price");
const addTaxDom = document.getElementById("add-tax-price");
const profitDom = document.getElementById("profit");

priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  addTaxDom.innerHTML = Math.floor(inputValue / 10); 
  profitDom.innerHTML = Math.floor(inputValue - addTaxDom.innerHTML);

  console.log(addTaxDom.innerHTML);
  console.log(profitDom.innerHTML);
  
})

})