function profit (){

  const tax = 10 

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor((inputValue * tax)/100);
    console.log(addTaxDom.innerHTML);

    const profit = document.getElementById("profit");
    profit.innerHTML = Math.floor(inputValue - addTaxDom.innerHTML);
    console.log(profit.innerHTML);
  })
};

window.addEventListener('load', profit);