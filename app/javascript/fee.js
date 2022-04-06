function calcfee(){
  const fee = document.getElementById("item-price");
  fee.addEventListener("keyup", () => {
    const tax = document.getElementById("add-tax-price");
    tax.innerHTML = Math.floor(fee.value * 0.1);
    const profit = document.getElementById("profit");
    profit.innerHTML = Math.floor(fee.value - Math.floor(fee.value * 0.1));
  });
};

window.addEventListener('load', calcfee);
