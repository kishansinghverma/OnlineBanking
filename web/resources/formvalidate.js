    var password = document.getElementById("password"), confirm_password = document.getElementById("confirm_password");
    var amount = document.getElementById("amount")
function validatePassword(){
  if(password.value != confirm_password.value) 
  {
    confirm_password.setCustomValidity("Passwords Don't Match");
  } else 
  {
    confirm_password.setCustomValidity('');
  }
}
function amountcheck()
{
    if(amount.value<500)
    {
       amount.setCustomValidity("Amount Should Be More Than 500!"); 
    }
    else
    {
        amount.setCustomValidity('');
    }
}
password.onchange = validatePassword;
confirm_password.onkeyup = validatePassword;
amount.onchange = amountcheck;
amount.onkeyup = amountcheck;