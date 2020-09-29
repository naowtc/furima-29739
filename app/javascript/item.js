function price() {
  // 画面が読み込まれたときに実行
  const itemPrice = document.getElementById("item-price");
  const addTax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  // 数字入力時に非同期通信を実行.価格入力時に手数料、利益計算
  itemPrice.addEventListener('keyup',() =>{
    // valueプロパティを使ってitempriceから値を取得
     const value = itemPrice.value;
    //  手数料と利益を計算
   if(value >= 300 && value <=9999999){
       let  fee = value * 0.1
      //  手数料feeをinnerHTMLでaddTAXに置き換える
       addTax.innerHTML = fee

       let  gains = value - fee
       //  手数料gainsをinnerHTMLでprofitに置き換える
       profit.innerHTML = gains
       console.log(gains)
      } 
     })
 }
     window.addEventListener("load", price);
       
      







