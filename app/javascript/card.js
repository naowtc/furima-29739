const pay = ()=> {
  Payjp.setPublicKey("pk_test_a740ad236ff4d75c9885eaac");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    // console.log("イベント発火");
    e.preventDefault();
  })
}



window.addEventListener("load", pay);
