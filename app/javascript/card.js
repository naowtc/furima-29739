const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);// PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");
  //  charge-form内のsubmitが実行されるとイベントが発火します。
  // preventDefault();メソッドを用いて、Railsのフォーム送信処理をキャンセルします。
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
//  入力された、カードの情報を変数に代入します。
    const card = {
      number: formData.get("number"),
      cvc: formData.get("cvc"),
      exp_month: formData.get("exp_month"),
      exp_year: `20${formData.get("exp_year")}`,
    };
    
    // PAY.JPにアクセスして、トークンを作成しています。20行目に記述されている、status == 200は、HTTPステータスコードが正常だった場合の分岐です。つまり、PAY.JP側の処理でトークンの生成に成功した場合に、if文の中のコードが実行されます。
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      // 入力された各カード情報がパラメーターとして送られないように、値を削除しています。
      document.getElementById("number").removeAttribute("name");
      document.getElementById("cvc").removeAttribute("name");
      document.getElementById("exp_month").removeAttribute("name");
      document.getElementById("exp_year").removeAttribute("name");
//  フォームに記載されている情報を、サーバーサイドへ送信します。
      document.getElementById("charge-form").submit();
      document.getElementById("charge-form").reset();
    });
  });
 };
// ページがロードされるとpayという関数が呼び出されます。
 window.addEventListener("load", pay);

//  上記JavaScriptでは以下の処理を行っています。
//  Payjp.setPublicKey("pk_test_XXXXXXXX"); // PAY.JPテスト公開鍵