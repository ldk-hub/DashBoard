function fpay_submit(f, payType) {
  if(payType == 'tax') {
    alert('세금계산서 결제 form 넘겨서 결제 완료되면\n showModal 호출');
    showModal(true, 'pay_tax_complete');
  } else {
    alert('즉시 결제 form 넘겨서 결제 완료되면\n showModal 호출');
    showModal(true, 'pay_tax_complete');
  }

  document.getElementById("btn_submit").disabled = "disabled";
  return false;
}
